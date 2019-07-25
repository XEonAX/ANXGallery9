package com.nexstreaming.kminternal.kinemaster.editorwrapper;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.util.Log;
import android.util.LruCache;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemCategory;
import com.nexstreaming.app.common.nexasset.assetpackage.ItemType;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import com.nexstreaming.nexeditorsdk.nexEngine;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.nio.IntBuffer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

/* compiled from: LookUpTable */
public class b {
    private static int a = 100;
    private static b b = null;
    private static int i = 100;
    private LruCache<String, C0005b> c;
    private Map<String, a> d = new HashMap();
    /* access modifiers changed from: private */
    public List<c> e;
    private Context f;
    private transient WeakReference<Bitmap> g;
    private boolean h;
    private Object j = new Object();
    private ArrayList<Integer> k = null;

    /* compiled from: LookUpTable */
    public class a {
        private int b;
        private C0005b c;

        public a(int i, C0005b bVar) {
            this.b = i;
            this.c = bVar;
        }

        public int a() {
            return this.b;
        }

        public C0005b b() {
            return this.c;
        }
    }

    /* renamed from: com.nexstreaming.kminternal.kinemaster.editorwrapper.b$b reason: collision with other inner class name */
    /* compiled from: LookUpTable */
    public class C0005b {
        private int b;
        private int c;
        private IntBuffer d;
        private Bitmap e;

        public C0005b(Bitmap bitmap) {
            IntBuffer allocate = IntBuffer.allocate(nexEngine.ExportHEVCMainTierLevel52);
            this.d = IntBuffer.allocate(nexEngine.ExportHEVCMainTierLevel52);
            bitmap.getPixels(allocate.array(), 0, bitmap.getWidth(), 0, 0, bitmap.getWidth(), bitmap.getHeight());
            int[] array = allocate.array();
            int[] array2 = this.d.array();
            for (int i = 0; i < 8; i++) {
                for (int i2 = 0; i2 < 8; i2++) {
                    for (int i3 = 0; i3 < 64; i3++) {
                        for (int i4 = 0; i4 < 64; i4++) {
                            array2[(i * 64) + (i2 * 512 * 64) + i3 + (i4 * 512)] = array[(((262080 - ((i * 512) * 64)) - ((i2 * 64) * 64)) + i3) - (i4 * 64)];
                        }
                    }
                }
            }
            this.e = Bitmap.createBitmap(array2, 512, 512, bitmap.getConfig());
            this.b = this.e.getWidth();
            this.c = this.e.getHeight();
        }

        public C0005b(byte[] bArr, int i, int i2, int i3) {
            if (i3 == 2) {
                int[] b2 = EditorGlobal.a().b(bArr, i, i2);
                if (b2 != null) {
                    this.e = a(b2);
                }
            } else if (i3 == 1) {
                int[] a2 = EditorGlobal.a().a(bArr, i, i2);
                if (a2 != null) {
                    this.e = a(a2);
                }
            } else if (i3 == 0) {
                BitmapFactory.decodeByteArray(bArr, i, i2);
            }
            if (this.e != null) {
                this.b = this.e.getWidth();
                this.c = this.e.getHeight();
            }
        }

        private Bitmap a(int[] iArr) {
            int[] array = IntBuffer.allocate(nexEngine.ExportHEVCMainTierLevel52).array();
            for (int i = 0; i < 8; i++) {
                for (int i2 = 0; i2 < 8; i2++) {
                    for (int i3 = 0; i3 < 64; i3++) {
                        for (int i4 = 0; i4 < 64; i4++) {
                            array[(i * 64) + (i2 * 512 * 64) + i3 + (i4 * 512)] = iArr[(((262080 - ((i * 512) * 64)) - ((i2 * 64) * 64)) + i3) - (i4 * 64)];
                        }
                    }
                }
            }
            return Bitmap.createBitmap(array, 512, 512, Config.ARGB_8888);
        }

        public int[] a() {
            return this.d.array();
        }

        public Bitmap b() {
            return this.e;
        }
    }

    /* compiled from: LookUpTable */
    public class c {
        /* access modifiers changed from: private */
        public int b;
        /* access modifiers changed from: private */
        public String c;
        /* access modifiers changed from: private */
        public String d;
        private String e;
        private boolean f;

        private c(int i, String str, long j, boolean z) {
            this.b = i;
            this.c = str;
            int lastIndexOf = str.lastIndexOf(".");
            this.d = str.substring(lastIndexOf < 0 ? 0 : lastIndexOf + 1);
            this.f = z;
            f();
        }

        private void f() {
            StringBuilder sb = new StringBuilder();
            sb.append("LUT_");
            sb.append(this.d.toUpperCase());
            this.e = sb.toString();
            if (this.d.compareTo("disney") == 0) {
                this.e = "LUT_DBRIGHT";
            }
        }

        public String a() {
            return this.d;
        }

        public int b() {
            return this.b;
        }

        public boolean c() {
            return this.f;
        }

        public String d() {
            return this.e;
        }

        public String e() {
            return this.c;
        }
    }

    private b(Context context) {
        this.f = context;
    }

    private Bitmap a(Bitmap bitmap, C0005b bVar) {
        int[] a2 = bVar.a();
        int width = bitmap.getWidth();
        int height = bitmap.getHeight();
        IntBuffer allocate = IntBuffer.allocate(width * height);
        int i2 = 0;
        bitmap.getPixels(allocate.array(), 0, width, 0, 0, width, height);
        int[] array = allocate.array();
        int length = array.length;
        while (i2 < length) {
            int i3 = array[i2];
            float f2 = (((float) ((i3 >> 16) & 255)) / 256.0f) * 63.0f;
            float f3 = (((float) ((i3 >> 8) & 255)) / 256.0f) * 63.0f;
            double d2 = (double) ((((float) (i3 & 255)) / 256.0f) * 63.0f);
            int floor = (int) Math.floor(d2);
            int ceil = (int) Math.ceil(d2);
            int i4 = floor % 8;
            int i5 = ceil % 8;
            int i6 = ((floor - i4) / 8) * 64;
            int i7 = i4 * 64;
            int i8 = ((ceil - i5) / 8) * 64;
            int i9 = i5 * 64;
            double d3 = (double) f2;
            int floor2 = (int) Math.floor(d3);
            int[] iArr = array;
            int i10 = length;
            double d4 = (double) f3;
            double d5 = d2;
            int floor3 = (int) Math.floor(d4);
            int ceil2 = (int) Math.ceil(d3);
            int ceil3 = (int) Math.ceil(d4);
            int i11 = ((i7 + floor2) * 512) + i6;
            int i12 = a2[i11 + floor3];
            int i13 = a2[((i7 + ceil2) * 512) + i6 + floor3];
            int i14 = (i12 >> 16) & 255;
            int i15 = (i12 >> 8) & 255;
            int i16 = (i13 >> 16) & 255;
            int i17 = (a2[i11 + ceil3] >> 8) & 255;
            float f4 = f2 - ((float) floor2);
            float f5 = f3 - ((float) floor3);
            Math.floor(d5);
            int i18 = (int) ((((float) i14) * (1.0f - f4)) + (((float) i16) * f4));
            int i19 = (int) ((((float) i15) * (1.0f - f5)) + (((float) i17) * f5));
            int i20 = i12 & 255;
            int i21 = ((floor2 + i9) * 512) + i8;
            int i22 = a2[i21 + floor3];
            int i23 = a2[((i9 + ceil2) * 512) + i8 + floor3];
            int i24 = a2[i21 + ceil3];
            iArr[i2] = -16777216 | (i18 << 16) | (i19 << 8) | i20;
            i2++;
            array = iArr;
            length = i10;
        }
        int[] iArr2 = array;
        if (bitmap.getConfig() == null) {
            return Bitmap.createBitmap(iArr2, bitmap.getWidth(), bitmap.getHeight(), Config.ARGB_8888);
        }
        return Bitmap.createBitmap(iArr2, bitmap.getWidth(), bitmap.getHeight(), bitmap.getConfig());
    }

    public static b a(Context context) {
        Context applicationContext = context.getApplicationContext();
        if (b != null && !b.f.getPackageName().equals(applicationContext.getPackageName())) {
            b = null;
        }
        if (b == null) {
            b = new b(applicationContext);
            b.d();
        }
        return b;
    }

    private void b(int i2) {
        synchronized (this) {
            this.k.add(Integer.valueOf(i2));
        }
    }

    private int c(int i2) {
        k();
        if (this.e == null || this.e.size() == 0) {
            return -1;
        }
        for (int i3 = 0; i3 < this.e.size(); i3++) {
            if (((c) this.e.get(i3)).b == i2) {
                return i3;
            }
        }
        return -1;
    }

    public static b c() {
        return b;
    }

    /* access modifiers changed from: private */
    public int e(String str) {
        k();
        if (this.e == null || this.e.size() == 0) {
            return -1;
        }
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            if (((c) this.e.get(i2)).d.compareTo(str) == 0) {
                return i2;
            }
        }
        return -1;
    }

    private int i() {
        int intValue;
        synchronized (this) {
            if (this.k == null) {
                this.k = new ArrayList<>();
                for (int i2 = i; i2 < i + 10; i2++) {
                    this.k.add(Integer.valueOf(i2));
                }
            }
            intValue = ((Integer) this.k.get(0)).intValue();
            this.k.remove(0);
        }
        return intValue;
    }

    private void j() {
        synchronized (this.j) {
            if (this.c == null) {
                this.c = new LruCache(a) {
                    /* access modifiers changed from: protected */
                    public void entryRemoved(boolean z, Object obj, Object obj2, Object obj3) {
                        StringBuilder sb = new StringBuilder();
                        sb.append("The entry is being removed / key:");
                        String str = (String) obj;
                        sb.append(str);
                        Log.d("LookUpTable", sb.toString());
                        ((C0005b) obj2).b().recycle();
                        int a2 = b.this.e(str);
                        if (a2 < 0) {
                            Log.d("LookUpTable", "The entry is not found");
                            return;
                        }
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("The entry index =");
                        sb2.append(a2);
                        sb2.append(", id=");
                        sb2.append(((c) b.this.e.get(a2)).b);
                        Log.d("LookUpTable", sb2.toString());
                        EditorGlobal.a().m(((c) b.this.e.get(a2)).b);
                    }
                };
            }
        }
    }

    private void k() {
        if (this.h) {
            this.h = false;
            d();
        }
    }

    public int a(String str) {
        a aVar = (a) this.d.get(str);
        if (aVar != null) {
            this.d.remove(str);
            EditorGlobal.a().m(aVar.a());
            b(aVar.a());
            h();
        }
        return 0;
    }

    public int a(String str, C0005b bVar) throws Exception {
        if (this.d.size() < 10) {
            j();
            a aVar = new a(i(), bVar);
            this.d.put(str, aVar);
            h();
            return aVar.a();
        }
        throw new Exception("Exceed the capacity of custom lut - it is 10");
    }

    public Bitmap a(Bitmap bitmap, int i2) {
        C0005b a2 = a(i2);
        if (a2 == null) {
            return null;
        }
        return a(bitmap, a2);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:21:0x009f, code lost:
        r9 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x00a0, code lost:
        r2 = r4;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x00a2, code lost:
        r9 = th;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:23:0x00a2 A[ExcHandler: all (th java.lang.Throwable), Splitter:B:16:0x0078] */
    public C0005b a(int i2) {
        C0005b bVar;
        int c2 = c(i2);
        AssetPackageReader assetPackageReader = null;
        if (c2 < 0) {
            return null;
        }
        j();
        synchronized (this.j) {
            bVar = (C0005b) this.c.get(((c) this.e.get(c2)).c);
            if (bVar == null) {
                a aVar = (a) this.d.get(((c) this.e.get(c2)).c);
                if (aVar != null) {
                    bVar = aVar.b();
                } else {
                    Options options = new Options();
                    options.inScaled = false;
                    f c3 = com.nexstreaming.app.common.nexasset.assetpackage.c.a().c(((c) this.e.get(c2)).c);
                    if (c3 != null) {
                        try {
                            AssetPackageReader assetPackageReader2 = AssetPackageReader.a(com.nexstreaming.kminternal.kinemaster.config.a.a().b(), c3.getPackageURI(), c3.getAssetPackage().getAssetId());
                            if (assetPackageReader2 != null) {
                                try {
                                    InputStream a2 = assetPackageReader2.a(c3.getFilePath());
                                    Bitmap decodeStream = BitmapFactory.decodeStream(a2, null, options);
                                    a2.close();
                                    LruCache<String, C0005b> lruCache = this.c;
                                    String c4 = ((c) this.e.get(c2)).c;
                                    C0005b bVar2 = new C0005b(decodeStream);
                                    lruCache.put(c4, bVar2);
                                    bVar = bVar2;
                                } catch (IOException e2) {
                                    e = e2;
                                    assetPackageReader = assetPackageReader2;
                                    try {
                                        e.printStackTrace();
                                        com.nexstreaming.app.common.util.b.a(assetPackageReader);
                                        return bVar;
                                    } catch (Throwable th) {
                                        th = th;
                                        assetPackageReader2 = assetPackageReader;
                                        com.nexstreaming.app.common.util.b.a(assetPackageReader2);
                                        throw th;
                                    }
                                } catch (Throwable th2) {
                                }
                            }
                            com.nexstreaming.app.common.util.b.a(assetPackageReader2);
                        } catch (IOException e3) {
                            e = e3;
                            e.printStackTrace();
                            com.nexstreaming.app.common.util.b.a(assetPackageReader);
                            return bVar;
                        }
                    }
                }
            }
        }
        return bVar;
    }

    public void a() {
        Log.d("LookUpTable", "releaseResource2LookUpTable()");
        if (this.c != null) {
            this.c.evictAll();
            this.c = null;
        }
        if (this.e != null) {
            this.e.clear();
            this.e = null;
        }
        b = null;
    }

    public String[] a(boolean z) {
        k();
        ArrayList arrayList = new ArrayList();
        for (c cVar : this.e) {
            if (z) {
                arrayList.add(cVar.c);
            } else if (!cVar.c()) {
                arrayList.add(cVar.c);
            }
        }
        String[] strArr = new String[arrayList.size()];
        for (int i2 = 0; i2 < strArr.length; i2++) {
            strArr[i2] = (String) arrayList.get(i2);
        }
        return strArr;
    }

    public void b() {
        synchronized (this.j) {
            if (this.c != null && this.c.size() > 0) {
                this.c.evictAll();
            }
        }
    }

    public boolean b(String str) {
        return this.d.get(str) != null;
    }

    public int c(String str) {
        k();
        if (this.e == null || this.e.size() == 0) {
            return 0;
        }
        a aVar = (a) this.d.get(str);
        if (aVar != null) {
            return aVar.a();
        }
        for (int i2 = 0; i2 < this.e.size(); i2++) {
            if (((c) this.e.get(i2)).d.compareTo(str) == 0) {
                return ((c) this.e.get(i2)).b;
            }
        }
        return 0;
    }

    public int d() {
        if (this.e != null) {
            this.e.clear();
        } else {
            this.e = new ArrayList();
        }
        int i2 = 1;
        for (f fVar : com.nexstreaming.app.common.nexasset.assetpackage.c.a().a(ItemCategory.filter)) {
            if (fVar.getType() == ItemType.lut) {
                List<c> list = this.e;
                c cVar = new c(i2, fVar.getId(), 0, fVar.isHidden());
                list.add(cVar);
                i2++;
            }
        }
        for (Entry entry : this.d.entrySet()) {
            a aVar = (a) entry.getValue();
            List<c> list2 = this.e;
            c cVar2 = new c(aVar.a(), (String) entry.getKey(), 0, false);
            list2.add(cVar2);
            i2++;
        }
        return i2 - 1;
    }

    public c d(String str) {
        k();
        for (c cVar : this.e) {
            if (cVar.c.compareTo(str) == 0) {
                return cVar;
            }
        }
        return null;
    }

    public void e() {
        for (a aVar : this.d.values()) {
            EditorGlobal.a().m(aVar.a());
            b(aVar.a());
        }
        this.d.clear();
        h();
    }

    public List<c> f() {
        k();
        return this.e;
    }

    public final Bitmap g() {
        Bitmap bitmap = this.g != null ? (Bitmap) this.g.get() : null;
        Options options = new Options();
        options.inScaled = false;
        if (bitmap == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(EditorGlobal.f().getAbsolutePath());
            sb.append(File.separator);
            sb.append("vignette.webp");
            File file = new File(sb.toString());
            if (file.isFile()) {
                bitmap = BitmapFactory.decodeFile(file.getAbsolutePath(), options);
            } else {
                try {
                    bitmap = BitmapFactory.decodeStream(this.f.getResources().getAssets().open("vignette.webp"), null, options);
                } catch (IOException e2) {
                    e2.printStackTrace();
                    bitmap = null;
                }
            }
        }
        if (bitmap == null) {
            return null;
        }
        this.g = new WeakReference<>(bitmap);
        return bitmap;
    }

    public void h() {
        this.h = true;
    }
}
