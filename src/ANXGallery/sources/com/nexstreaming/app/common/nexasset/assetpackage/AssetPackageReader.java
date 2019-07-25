package com.nexstreaming.app.common.nexasset.assetpackage;

import android.content.Context;
import android.content.res.AssetManager;
import android.graphics.Typeface;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.google.gson_nex.JsonSyntaxException;
import com.nexstreaming.app.common.util.i;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

public class AssetPackageReader implements Closeable {
    private static Map<String, WeakReference<AssetPackageReader>> h = new HashMap();
    private static Map<String, com.nexstreaming.app.common.nexasset.assetpackage.security.b> i = new HashMap();
    private c a;
    private final Gson b = new Gson();
    private final PackageInfoJSON c;
    private final EncryptionInfoJSON d;
    private final String e;
    private final boolean f;
    private List<f> g = null;
    private final com.nexstreaming.app.common.nexasset.assetpackage.security.a j;
    private Map<String, String> k = null;
    private Map<String, String> l = null;

    public static class EncryptedException extends IOException {
        public EncryptedException() {
        }

        public EncryptedException(String str) {
            super(str);
        }

        public EncryptedException(String str, Throwable th) {
            super(str, th);
        }

        public EncryptedException(Throwable th) {
            super(th);
        }
    }

    private static class EncryptionInfoJSON {
        public String provider;
        public String psd;

        private EncryptionInfoJSON() {
        }
    }

    private static class ItemInfoJSON {
        public String filename;
        public boolean hidden;
        public String icon;
        public String id;
        public Map<String, String> label;
        public List<String> mergePaths;
        public String sampleText;
        public String thumbnail;
        public String type;

        private ItemInfoJSON() {
        }
    }

    public static class LocalPathNotAvailableException extends IOException {
        public LocalPathNotAvailableException() {
        }

        public LocalPathNotAvailableException(String str) {
            super(str);
        }

        public LocalPathNotAvailableException(String str, Throwable th) {
            super(str, th);
        }

        public LocalPathNotAvailableException(Throwable th) {
            super(th);
        }
    }

    private static class PackageInfoJSON {
        public Map<String, String> assetName;
        public String format;
        public List<String> itemRoots;
        public int minVersionCode;
        public int packageContentVersion;
        public int targetVersionCode;

        private PackageInfoJSON() {
        }
    }

    public static class PackageReaderException extends IOException {
        PackageReaderException() {
        }

        PackageReaderException(AssetPackageReader assetPackageReader, String str) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" (in package '");
            sb.append(assetPackageReader.f());
            sb.append("' via ");
            sb.append(assetPackageReader.getClass().getSimpleName());
            sb.append(")");
            super(sb.toString());
        }

        PackageReaderException(AssetPackageReader assetPackageReader, String str, Throwable th) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(" (in package '");
            sb.append(assetPackageReader.f());
            sb.append("' via ");
            sb.append(assetPackageReader.getClass().getSimpleName());
            sb.append(")");
            super(sb.toString(), th);
        }
    }

    private static class a extends WeakReference<AssetPackageReader> {
        private static ReferenceQueue<AssetPackageReader> a = new ReferenceQueue<>();
        private c b;

        public a(AssetPackageReader assetPackageReader) {
            super(assetPackageReader, a);
            this.b = assetPackageReader.k();
        }

        /* access modifiers changed from: private */
        public static void b() {
            while (true) {
                a aVar = (a) a.poll();
                if (aVar == null) {
                    return;
                }
                if (aVar.b != null) {
                    try {
                        aVar.b.b();
                        Log.d("AssetPackageReader", "Closed cached container reader");
                    } catch (IOException e) {
                        Log.d("AssetPackageReader", "Error closing container reader", e);
                    }
                    aVar.b = null;
                }
            }
        }
    }

    private static class b implements c {
        /* access modifiers changed from: private */
        public final String a;
        /* access modifiers changed from: private */
        public AssetManager b;

        private b(AssetManager assetManager, String str) {
            if (assetManager == null) {
                throw new IllegalArgumentException();
            } else if (str != null) {
                this.a = str;
                this.b = assetManager;
                StringBuilder sb = new StringBuilder();
                sb.append("Created ACR:");
                sb.append(String.valueOf(this));
                Log.d("AssetPackageReader", sb.toString());
            } else {
                throw new IllegalArgumentException();
            }
        }

        public InputStream a(String str) throws FileNotFoundException, IOException {
            StringBuilder sb = new StringBuilder();
            sb.append("openFile:");
            sb.append(String.valueOf(this));
            Log.d("AssetPackageReader", sb.toString());
            return this.b.open(AssetPackageReader.b(this.a, str));
        }

        public Iterable<String> a() {
            return new Iterable<String>() {
                public Iterator<String> iterator() {
                    String[] strArr;
                    final ArrayList arrayList = new ArrayList();
                    try {
                        strArr = b.this.b.list(b.this.a);
                    } catch (IOException e) {
                        e.printStackTrace();
                        strArr = null;
                    }
                    if (strArr != null) {
                        for (String a2 : strArr) {
                            arrayList.add(AssetPackageReader.b(b.this.a, a2));
                        }
                    }
                    return new Iterator<String>() {
                        /* JADX WARNING: Removed duplicated region for block: B:15:0x006d A[LOOP:0: B:14:0x006b->B:15:0x006d, LOOP_END] */
                        /* JADX WARNING: Removed duplicated region for block: B:19:0x00ae  */
                        /* renamed from: a */
                        public String next() {
                            String[] strArr;
                            int length;
                            int i = 0;
                            String str = (String) arrayList.remove(0);
                            StringBuilder sb = new StringBuilder();
                            sb.append("iter:next -> ");
                            sb.append(str);
                            sb.append(" (todo list size: ");
                            sb.append(arrayList.size());
                            sb.append(")");
                            Log.d("AssetPackageReader", sb.toString());
                            try {
                                strArr = b.this.b.list(str);
                                String str2 = "AssetPackageReader";
                                try {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("Has ");
                                    sb2.append(strArr.length);
                                    sb2.append(" children.");
                                    Log.d(str2, sb2.toString());
                                } catch (IOException unused) {
                                }
                            } catch (IOException unused2) {
                                strArr = null;
                                Log.d("AssetPackageReader", "Has no children.");
                                while (r4 < r2) {
                                }
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("Added ");
                                sb3.append(strArr.length);
                                sb3.append(" children; todo list size: ");
                                sb3.append(arrayList.size());
                                Log.d("AssetPackageReader", sb3.toString());
                                length = b.this.a.length();
                                if (length > 0) {
                                }
                                return str.substring(i);
                            }
                            if (strArr != null && strArr.length > 0) {
                                for (String a2 : strArr) {
                                    arrayList.add(AssetPackageReader.b(str, a2));
                                }
                                StringBuilder sb32 = new StringBuilder();
                                sb32.append("Added ");
                                sb32.append(strArr.length);
                                sb32.append(" children; todo list size: ");
                                sb32.append(arrayList.size());
                                Log.d("AssetPackageReader", sb32.toString());
                            }
                            length = b.this.a.length();
                            if (length > 0) {
                                i = length + 1;
                            }
                            return str.substring(i);
                        }

                        public boolean hasNext() {
                            return !arrayList.isEmpty();
                        }

                        public void remove() {
                        }
                    };
                }
            };
        }

        public File b(String str) throws LocalPathNotAvailableException, FileNotFoundException, IOException {
            throw new LocalPathNotAvailableException();
        }

        public void b() throws IOException {
            this.b = null;
        }

        public Typeface c(String str) throws LocalPathNotAvailableException {
            return Typeface.createFromAsset(this.b, AssetPackageReader.b(this.a, str));
        }

        public String c() {
            StringBuilder sb = new StringBuilder();
            sb.append("assets:");
            sb.append(this.a);
            return sb.toString();
        }

        public File d() {
            return null;
        }
    }

    interface c {
        InputStream a(String str) throws FileNotFoundException, IOException;

        Iterable<String> a();

        File b(String str) throws LocalPathNotAvailableException, EncryptedException, FileNotFoundException, IOException;

        void b() throws IOException;

        Typeface c(String str) throws LocalPathNotAvailableException;

        String c();

        File d();
    }

    private static class d implements c {
        private final c a;
        private final com.nexstreaming.app.common.nexasset.assetpackage.security.a b;

        private d(c cVar, com.nexstreaming.app.common.nexasset.assetpackage.security.a aVar) {
            this.a = cVar;
            this.b = aVar;
        }

        public InputStream a(String str) throws FileNotFoundException, IOException {
            return this.b.a(this.a.a(str), str);
        }

        public Iterable<String> a() {
            return this.a.a();
        }

        public File b(String str) throws LocalPathNotAvailableException, EncryptedException, FileNotFoundException, IOException {
            if (this.b.a(str)) {
                return this.a.b(str);
            }
            throw new EncryptedException();
        }

        public void b() throws IOException {
            this.a.b();
        }

        public Typeface c(String str) throws LocalPathNotAvailableException {
            if (this.b.a(str)) {
                return this.a.c(str);
            }
            throw new LocalPathNotAvailableException();
        }

        public String c() {
            return this.a.c();
        }

        public File d() {
            return this.a.d();
        }
    }

    private static class e implements c {
        /* access modifiers changed from: private */
        public final File a;

        private e(File file) {
            this.a = file;
        }

        /* access modifiers changed from: private */
        public String a(File file) {
            String absolutePath = file.getAbsolutePath();
            String absolutePath2 = this.a.getAbsolutePath();
            if (absolutePath.startsWith(absolutePath2)) {
                return absolutePath.length() <= absolutePath2.length() ? "" : absolutePath.charAt(absolutePath2.length()) == '/' ? absolutePath.substring(absolutePath2.length() + 1) : absolutePath.substring(absolutePath2.length());
            }
            throw new IllegalStateException();
        }

        private File d(String str) {
            return new File(this.a, str);
        }

        public InputStream a(String str) throws FileNotFoundException, IOException {
            return new FileInputStream(d(str));
        }

        public Iterable<String> a() {
            return new Iterable<String>() {
                public Iterator<String> iterator() {
                    final ArrayList arrayList = new ArrayList();
                    File[] listFiles = e.this.a.listFiles();
                    if (listFiles != null) {
                        for (File add : listFiles) {
                            arrayList.add(add);
                        }
                    }
                    return new Iterator<String>() {
                        /* renamed from: a */
                        public String next() {
                            File file = (File) arrayList.remove(0);
                            if (file.isDirectory()) {
                                File[] listFiles = file.listFiles();
                                if (listFiles != null) {
                                    for (File add : listFiles) {
                                        arrayList.add(add);
                                    }
                                }
                            }
                            return e.this.a(file);
                        }

                        public boolean hasNext() {
                            return !arrayList.isEmpty();
                        }

                        public void remove() {
                        }
                    };
                }
            };
        }

        public File b(String str) throws LocalPathNotAvailableException, FileNotFoundException, IOException {
            return d(str);
        }

        public void b() throws IOException {
        }

        public Typeface c(String str) throws LocalPathNotAvailableException {
            return Typeface.createFromFile(d(str));
        }

        public String c() {
            StringBuilder sb = new StringBuilder();
            sb.append("file:");
            sb.append(this.a.getAbsolutePath());
            return sb.toString();
        }

        public File d() {
            return this.a;
        }
    }

    private static class f implements f {
        Class<? extends c> a;
        String b;
        String c;
        String d;
        String e;
        String f;
        String g;
        Map<String, String> h;
        ItemType i;
        ItemCategory j;
        boolean k;

        private f() {
        }

        public b getAssetPackage() {
            throw new UnsupportedOperationException();
        }

        public ItemCategory getCategory() {
            return this.j;
        }

        public String getFilePath() {
            return this.c;
        }

        public String getIconPath() {
            return this.d;
        }

        public String getId() {
            return this.f;
        }

        public Map<String, String> getLabel() {
            return this.h;
        }

        public String getPackageURI() {
            return this.b;
        }

        public String getSampleText() {
            return this.g;
        }

        public String getThumbPath() {
            return this.e;
        }

        public ItemType getType() {
            return this.i;
        }

        public boolean isHidden() {
            return this.k;
        }
    }

    private static class g implements c {
        /* access modifiers changed from: private */
        public final ZipFile a;
        private final File b;

        public g(File file) throws IOException {
            this.a = new ZipFile(file);
            this.b = file;
        }

        public InputStream a(String str) throws FileNotFoundException, IOException {
            ZipEntry entry = this.a.getEntry(str);
            if (entry == null) {
                entry = this.a.getEntry(i.a(i.d(str), i.c(str).toLowerCase(Locale.ENGLISH)));
                if (entry == null) {
                    StringBuilder sb = new StringBuilder();
                    sb.append("File '");
                    sb.append(str);
                    sb.append("' not found in '");
                    sb.append(this.a.getName());
                    sb.append("'");
                    throw new FileNotFoundException(sb.toString());
                }
            }
            return this.a.getInputStream(entry);
        }

        public Iterable<String> a() {
            return new Iterable<String>() {
                public Iterator<String> iterator() {
                    final Enumeration entries = g.this.a.entries();
                    return new Iterator<String>() {
                        /* renamed from: a */
                        public String next() {
                            return ((ZipEntry) entries.nextElement()).getName();
                        }

                        public boolean hasNext() {
                            return entries.hasMoreElements();
                        }

                        public void remove() {
                            throw new UnsupportedOperationException();
                        }
                    };
                }
            };
        }

        public File b(String str) throws LocalPathNotAvailableException, FileNotFoundException, IOException {
            throw new LocalPathNotAvailableException();
        }

        public void b() throws IOException {
            this.a.close();
        }

        public Typeface c(String str) throws LocalPathNotAvailableException {
            throw new LocalPathNotAvailableException();
        }

        public String c() {
            StringBuilder sb = new StringBuilder();
            sb.append("zipfile:");
            sb.append(this.a.getName());
            return sb.toString();
        }

        public File d() {
            return this.b;
        }
    }

    private AssetPackageReader(c cVar, String str, boolean z) throws IOException {
        StringBuilder sb = new StringBuilder();
        sb.append("NEW APR Instance (Container:");
        sb.append(cVar.getClass().getSimpleName());
        sb.append(") baseId=");
        sb.append(str);
        sb.append(" shared=");
        sb.append(z);
        Log.d("AssetPackageReader", sb.toString());
        this.a = cVar;
        this.e = str;
        this.f = z;
        this.d = h();
        this.j = a(this.d);
        if (this.j != null) {
            this.a = new d(cVar, this.j);
        }
        this.c = i();
    }

    public static AssetPackageReader a(Context context, String str, String str2) throws IOException {
        AssetPackageReader assetPackageReader;
        a.b();
        WeakReference weakReference = (WeakReference) h.get(str);
        if (weakReference != null) {
            AssetPackageReader assetPackageReader2 = (AssetPackageReader) weakReference.get();
            if (assetPackageReader2 != null) {
                return assetPackageReader2;
            }
        }
        String substring = str.substring(str.indexOf(58) + 1);
        if (str.startsWith("assets:")) {
            assetPackageReader = new AssetPackageReader(new b(context.getApplicationContext().getAssets(), substring), str2, true);
        } else if (str.startsWith("file:")) {
            assetPackageReader = new AssetPackageReader(new e(new File(substring)), str2, true);
        } else if (str.startsWith("zipfile:")) {
            assetPackageReader = new AssetPackageReader(new g(new File(substring)), str2, true);
        } else {
            throw new PackageReaderException();
        }
        h.put(str, new a(assetPackageReader));
        return assetPackageReader;
    }

    public static AssetPackageReader a(AssetManager assetManager, String str, String str2) throws IOException {
        return new AssetPackageReader(new b(assetManager, str), str2, false);
    }

    public static AssetPackageReader a(File file, String str) throws IOException {
        return new AssetPackageReader(new g(file), str, false);
    }

    private com.nexstreaming.app.common.nexasset.assetpackage.security.a a(EncryptionInfoJSON encryptionInfoJSON) throws PackageReaderException {
        if (encryptionInfoJSON == null || encryptionInfoJSON.provider == null || encryptionInfoJSON.provider.length() <= 0) {
            return null;
        }
        com.nexstreaming.app.common.nexasset.assetpackage.security.b bVar = (com.nexstreaming.app.common.nexasset.assetpackage.security.b) i.get(encryptionInfoJSON.provider);
        if (bVar != null) {
            return bVar.a(encryptionInfoJSON.psd);
        }
        throw new PackageReaderException(this, "invalid provider");
    }

    public static void a(com.nexstreaming.app.common.nexasset.assetpackage.security.b bVar) {
        String a2 = bVar.a();
        if (a2 == null || a2.length() < 1) {
            throw new IllegalArgumentException("id is null or empty");
        } else if (i.get(a2) != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("id already in use :");
            sb.append(i.get(a2));
            throw new IllegalStateException(sb.toString());
        } else if (!i.values().contains(bVar)) {
            i.put(a2, bVar);
        } else {
            throw new IllegalStateException("provider already registered");
        }
    }

    public static String[] a() {
        int i2;
        ArrayList<String> arrayList = new ArrayList<>();
        Iterator it = i.entrySet().iterator();
        while (true) {
            i2 = 0;
            if (!it.hasNext()) {
                break;
            }
            String[] b2 = ((com.nexstreaming.app.common.nexasset.assetpackage.security.b) ((Entry) it.next()).getValue()).b();
            int length = b2.length;
            while (i2 < length) {
                arrayList.add(b2[i2]);
                i2++;
            }
        }
        String[] strArr = new String[arrayList.size()];
        for (String str : arrayList) {
            int i3 = i2 + 1;
            strArr[i2] = str;
            i2 = i3;
        }
        return strArr;
    }

    public static AssetPackageReader b(File file, String str) throws IOException {
        return new AssetPackageReader(new e(file), str, false);
    }

    /* access modifiers changed from: private */
    public static String b(String str, String str2) {
        if (str2.startsWith("..") || str2.contains("/..")) {
            throw new SecurityException("Parent Path References Not Allowed");
        } else if (str.endsWith("/")) {
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append(str2);
            return sb.toString();
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(str);
            sb2.append("/");
            sb2.append(str2);
            return sb2.toString();
        }
    }

    public static void b(com.nexstreaming.app.common.nexasset.assetpackage.security.b bVar) {
        if (bVar != null) {
            if (i.get(bVar.a()) == bVar) {
                i.remove(bVar.a());
                return;
            }
            throw new IllegalStateException();
        }
    }

    private f e(String str) throws IOException {
        ItemCategory itemCategory;
        InputStream a2;
        if (!str.endsWith("/_info.json")) {
            return null;
        }
        int indexOf = str.indexOf(47);
        int i2 = indexOf + 1;
        int indexOf2 = str.indexOf(47, i2);
        int i3 = indexOf2 + 1;
        int indexOf3 = str.indexOf(47, i3);
        if (indexOf == -1 || indexOf2 == -1 || indexOf3 != -1) {
            Log.w("AssetPackageReader", "Malformed path");
            return null;
        } else if (str.startsWith("merge/")) {
            return null;
        } else {
            ItemCategory[] values = ItemCategory.values();
            int length = values.length;
            int i4 = 0;
            while (true) {
                if (i4 >= length) {
                    itemCategory = null;
                    break;
                }
                itemCategory = values[i4];
                String name = itemCategory.name();
                if (name.length() == indexOf && str.startsWith(name)) {
                    break;
                }
                i4++;
            }
            if (itemCategory == null) {
                Log.w("AssetPackageReader", "Unrecognized item category");
                return null;
            }
            String substring = str.substring(i2, indexOf2);
            String substring2 = str.substring(0, i3);
            try {
                a2 = this.a.a(str);
                ItemInfoJSON itemInfoJSON = (ItemInfoJSON) this.b.fromJson((Reader) new InputStreamReader(a2), ItemInfoJSON.class);
                if (!(itemInfoJSON == null || itemInfoJSON.label == null || itemInfoJSON.label.size() <= 0)) {
                    Set<String> keySet = itemInfoJSON.label.keySet();
                    HashMap hashMap = new HashMap();
                    for (String str2 : keySet) {
                        hashMap.put(str2.toLowerCase(Locale.ENGLISH), itemInfoJSON.label.get(str2));
                    }
                    itemInfoJSON.label.clear();
                    itemInfoJSON.label.putAll(hashMap);
                }
                a2.close();
                if (itemInfoJSON.filename != null) {
                    if (itemInfoJSON.icon == null) {
                        itemInfoJSON.icon = "_icon.svg";
                    }
                    if (itemInfoJSON.thumbnail == null) {
                        itemInfoJSON.thumbnail = "_thumb.jpeg";
                    }
                    if (itemInfoJSON.id == null) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(this.e);
                        sb.append(".items.");
                        sb.append(substring);
                        itemInfoJSON.id = sb.toString();
                    }
                    ItemType fromId = ItemType.fromId(itemInfoJSON.type);
                    if (fromId != null) {
                        f fVar = new f();
                        fVar.a = this.a.getClass();
                        fVar.b = this.a.c();
                        fVar.c = b(substring2, itemInfoJSON.filename);
                        fVar.d = b(substring2, itemInfoJSON.icon);
                        fVar.e = b(substring2, itemInfoJSON.thumbnail);
                        fVar.f = itemInfoJSON.id;
                        fVar.h = itemInfoJSON.label;
                        fVar.i = fromId;
                        fVar.j = itemCategory;
                        fVar.g = itemInfoJSON.sampleText;
                        fVar.k = itemInfoJSON.hidden;
                        return fVar;
                    }
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("Unrecognized item type '");
                    sb2.append(itemInfoJSON.type);
                    sb2.append("' for: ");
                    sb2.append(str);
                    throw new PackageReaderException(this, sb2.toString());
                }
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Missing base file for: ");
                sb3.append(str);
                throw new PackageReaderException(this, sb3.toString());
            } catch (JsonSyntaxException e2) {
                StringBuilder sb4 = new StringBuilder();
                sb4.append("JSON Syntax Error in: ");
                sb4.append(str);
                throw new PackageReaderException(this, sb4.toString(), e2);
            } catch (FileNotFoundException e3) {
                Log.w("AssetPackageReader", "Item in index but missing in package", e3);
                return null;
            } catch (Throwable th) {
                a2.close();
                throw th;
            }
        }
    }

    private EncryptionInfoJSON h() throws IOException {
        InputStream inputStream;
        Throwable th;
        try {
            inputStream = this.a.a("e.json");
            try {
                EncryptionInfoJSON encryptionInfoJSON = (EncryptionInfoJSON) this.b.fromJson((Reader) new InputStreamReader(inputStream), EncryptionInfoJSON.class);
                StringBuilder sb = new StringBuilder();
                sb.append("Parse e.json file! : ");
                sb.append(encryptionInfoJSON.provider.toString());
                sb.append(" / ");
                sb.append(encryptionInfoJSON.psd.toString());
                Log.d("AssetPackageReader", sb.toString());
                com.nexstreaming.app.common.util.b.a(inputStream);
                return encryptionInfoJSON;
            } catch (FileNotFoundException unused) {
                com.nexstreaming.app.common.util.b.a(inputStream);
                return null;
            } catch (Throwable th2) {
                th = th2;
                com.nexstreaming.app.common.util.b.a(inputStream);
                throw th;
            }
        } catch (FileNotFoundException unused2) {
            inputStream = null;
            com.nexstreaming.app.common.util.b.a(inputStream);
            return null;
        } catch (Throwable th3) {
            Throwable th4 = th3;
            inputStream = null;
            th = th4;
            com.nexstreaming.app.common.util.b.a(inputStream);
            throw th;
        }
    }

    private PackageInfoJSON i() throws IOException {
        InputStream a2;
        Log.d("AssetPackageReader", "readPackageInfo IN");
        try {
            a2 = this.a.a("packageinfo.json");
            PackageInfoJSON packageInfoJSON = (PackageInfoJSON) this.b.fromJson((Reader) new InputStreamReader(a2), PackageInfoJSON.class);
            StringBuilder sb = new StringBuilder();
            sb.append("readPackageInfo(), asset name: ");
            sb.append(packageInfoJSON.assetName);
            Log.d("AssetPackageReader", sb.toString());
            if (packageInfoJSON.assetName != null && packageInfoJSON.assetName.size() > 0) {
                Set<String> keySet = packageInfoJSON.assetName.keySet();
                HashMap hashMap = new HashMap();
                for (String str : keySet) {
                    hashMap.put(str.toLowerCase(Locale.ENGLISH), packageInfoJSON.assetName.get(str));
                }
                packageInfoJSON.assetName.clear();
                packageInfoJSON.assetName.putAll(hashMap);
            }
            a2.close();
            if (packageInfoJSON.minVersionCode > 6) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("Unsupported package format version: ");
                sb2.append(packageInfoJSON.minVersionCode);
                Log.w("AssetPackageReader", sb2.toString());
                throw new PackageReaderException(this, "Unsupported package format version");
            } else if (packageInfoJSON.format == null) {
                Log.w("AssetPackageReader", "Missing package format");
                throw new PackageReaderException(this, "Missing package format");
            } else if (packageInfoJSON.format.equals("com.kinemaster.assetpackage")) {
                Log.d("AssetPackageReader", "readPackageInfo OUT");
                return packageInfoJSON;
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append("Unsupported package format: ");
                sb3.append(packageInfoJSON.format);
                Log.w("AssetPackageReader", sb3.toString());
                StringBuilder sb4 = new StringBuilder();
                sb4.append("Unsupported package format: ");
                sb4.append(packageInfoJSON.format);
                throw new PackageReaderException(this, sb4.toString());
            }
        } catch (FileNotFoundException e2) {
            Log.w("AssetPackageReader", "Package missing file: packageinfo.json", e2);
            throw new PackageReaderException(this, "Package missing file: packageinfo.json", e2);
        } catch (JsonSyntaxException e3) {
            Log.w("AssetPackageReader", "PackageInfoJSON file : packageinfo.json", e3);
            throw new PackageReaderException(this, "PackageInfoJSON file: packageinfo.json", e3);
        } catch (Throwable th) {
            a2.close();
            throw th;
        }
    }

    private void j() throws IOException {
        if (this.g == null) {
            ArrayList arrayList = new ArrayList();
            if (this.c.itemRoots == null || this.c.itemRoots.size() <= 0) {
                Log.d("AssetPackageReader", "makeItemList: no root index; scanning entire package");
                for (String str : this.a.a()) {
                    if (str != null) {
                        f e2 = e(str);
                        if (e2 != null) {
                            arrayList.add(e2);
                        }
                    }
                }
            } else {
                Log.d("AssetPackageReader", "makeItemList: using root index");
                for (String str2 : this.c.itemRoots) {
                    if (str2 != null) {
                        f e3 = e(b(str2, "_info.json"));
                        if (e3 != null) {
                            arrayList.add(e3);
                        }
                    }
                }
            }
            this.g = arrayList;
        }
    }

    /* access modifiers changed from: private */
    public c k() {
        return this.a;
    }

    public InputStream a(String str) throws FileNotFoundException, IOException {
        InputStream inputStream;
        if (this.k != null) {
            String str2 = (String) this.k.get(str);
            if (str2 != null && str2.length() > 0) {
                return this.a.a(str2);
            }
        }
        try {
            return this.a.a(str);
        } catch (FileNotFoundException e2) {
            String d2 = i.d(str);
            ItemInfoJSON itemInfoJSON = null;
            while (true) {
                if (d2 == null) {
                    break;
                }
                try {
                    inputStream = this.a.a(i.b(d2, "_info.json"));
                    try {
                        ItemInfoJSON itemInfoJSON2 = (ItemInfoJSON) this.b.fromJson((Reader) new InputStreamReader(inputStream), ItemInfoJSON.class);
                        if (itemInfoJSON2 != null) {
                            com.nexstreaming.app.common.util.b.a(inputStream);
                            itemInfoJSON = itemInfoJSON2;
                            break;
                        }
                        com.nexstreaming.app.common.util.b.a(inputStream);
                        itemInfoJSON = itemInfoJSON2;
                        d2 = i.b(d2);
                    } catch (FileNotFoundException unused) {
                        com.nexstreaming.app.common.util.b.a(inputStream);
                        d2 = i.b(d2);
                    } catch (Throwable th) {
                        th = th;
                        com.nexstreaming.app.common.util.b.a(inputStream);
                        throw th;
                    }
                } catch (FileNotFoundException unused2) {
                    inputStream = null;
                    com.nexstreaming.app.common.util.b.a(inputStream);
                    d2 = i.b(d2);
                } catch (Throwable th2) {
                    th = th2;
                    inputStream = null;
                    com.nexstreaming.app.common.util.b.a(inputStream);
                    throw th;
                }
            }
            if (!(itemInfoJSON == null || itemInfoJSON.mergePaths == null)) {
                String substring = str.substring(d2.length(), str.length());
                for (String str3 : itemInfoJSON.mergePaths) {
                    if (str3 != null) {
                        String a2 = i.a("merge", str3.trim());
                        if (!a2.endsWith("/")) {
                            StringBuilder sb = new StringBuilder();
                            sb.append(a2);
                            sb.append("/");
                            a2 = sb.toString();
                        }
                        if (a2.length() > 0) {
                            String b2 = i.b(a2, substring);
                            try {
                                InputStream a3 = this.a.a(b2);
                                if (this.k == null) {
                                    this.k = new HashMap();
                                }
                                this.k.put(str, b2);
                                return a3;
                            } catch (FileNotFoundException unused3) {
                            }
                        } else {
                            continue;
                        }
                    }
                }
            }
            throw e2;
        }
    }

    public int b() {
        return this.c.packageContentVersion;
    }

    public String b(String str) {
        InputStream inputStream;
        if (this.l != null) {
            String str2 = (String) this.l.get(str);
            if (str2 != null && str2.length() > 0) {
                return str2;
            }
        }
        String d2 = i.d(str);
        ItemInfoJSON itemInfoJSON = null;
        while (true) {
            if (d2 == null) {
                break;
            }
            try {
                inputStream = this.a.a(i.b(d2, "_info.json"));
                try {
                    ItemInfoJSON itemInfoJSON2 = (ItemInfoJSON) this.b.fromJson((Reader) new InputStreamReader(inputStream), ItemInfoJSON.class);
                    if (itemInfoJSON2 != null) {
                        com.nexstreaming.app.common.util.b.a(inputStream);
                        itemInfoJSON = itemInfoJSON2;
                        break;
                    }
                    com.nexstreaming.app.common.util.b.a(inputStream);
                    itemInfoJSON = itemInfoJSON2;
                    d2 = i.b(d2);
                } catch (FileNotFoundException | IOException unused) {
                    com.nexstreaming.app.common.util.b.a(inputStream);
                    d2 = i.b(d2);
                } catch (Throwable th) {
                    th = th;
                    com.nexstreaming.app.common.util.b.a(inputStream);
                    throw th;
                }
            } catch (FileNotFoundException | IOException unused2) {
                inputStream = null;
                com.nexstreaming.app.common.util.b.a(inputStream);
                d2 = i.b(d2);
            } catch (Throwable th2) {
                th = th2;
                inputStream = null;
                com.nexstreaming.app.common.util.b.a(inputStream);
                throw th;
            }
        }
        if (!(itemInfoJSON == null || itemInfoJSON.mergePaths == null)) {
            String substring = str.substring(d2.length(), str.length());
            for (String str3 : itemInfoJSON.mergePaths) {
                if (str3 != null) {
                    String a2 = i.a("merge", str3.trim());
                    if (!a2.endsWith("/")) {
                        StringBuilder sb = new StringBuilder();
                        sb.append(a2);
                        sb.append("/");
                        a2 = sb.toString();
                    }
                    if (a2.length() > 0) {
                        String b2 = i.b(a2, substring);
                        if (this.l == null) {
                            this.l = new HashMap();
                        }
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("getFilePath mergePath : ");
                        sb2.append(b2);
                        Log.d("AssetPackageReader", sb2.toString());
                        this.l.put(str, b2);
                        return b2;
                    }
                }
            }
        }
        return null;
    }

    public int c() {
        return this.c.minVersionCode;
    }

    public File c(String str) throws IOException, LocalPathNotAvailableException {
        return this.a.b(str);
    }

    public void close() throws IOException {
        if (!this.f) {
            this.a.b();
        }
    }

    public Typeface d(String str) throws LocalPathNotAvailableException {
        return this.a.c(str);
    }

    public List<f> d() throws IOException {
        j();
        return this.g;
    }

    public Map<String, String> e() {
        return this.c.assetName;
    }

    public String f() {
        return this.a.c();
    }

    public File g() {
        return this.a.d();
    }
}
