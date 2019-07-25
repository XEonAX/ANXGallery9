package com.nexstreaming.app.common.nexasset.store;

import android.content.Context;
import android.content.res.Resources.NotFoundException;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.BitmapFactory;
import android.graphics.BitmapFactory.Options;
import android.os.AsyncTask;
import android.os.Process;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.google.gson_nex.JsonIOException;
import com.google.gson_nex.JsonSyntaxException;
import com.nexstreaming.app.common.nexasset.assetpackage.AssetPackageReader;
import com.nexstreaming.app.common.nexasset.assetpackage.InstallSourceType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.assetpackage.f;
import com.nexstreaming.app.common.nexasset.store.json.AssetStoreAPIData.AssetInfo;
import com.nexstreaming.app.common.nexasset.store.json.AssetStoreAPIData.GetNewAssetList;
import com.nexstreaming.app.common.nexasset.store.json.AssetStoreAPIData.LangString;
import com.nexstreaming.app.common.nexasset.store.json.AssetStoreAPIData.ThumbInfo;
import com.nexstreaming.app.common.task.Task;
import com.nexstreaming.app.common.task.Task.Event;
import com.nexstreaming.app.common.task.Task.TaskError;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.app.common.util.p;
import com.nexstreaming.kminternal.kinemaster.config.EditorGlobal;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.Reader;
import java.net.URI;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

public class AssetLocalInstallDB {
    public static final int ASSET_UNINSTALL_FINISHED = 1;
    public static final int ASSET_UNINSTALL_NOT_YET = 0;
    private static final String TAG = "AssetLocalInstallDB";
    /* access modifiers changed from: private */
    public static String assetStoreRootPath;
    private static final boolean commAS = false;
    private static AssetLocalInstallDB instance;
    private static String localFeaturedPath;
    private static String localRootPath;
    private static final Executor sInstallThreadPool = Executors.newSingleThreadExecutor();
    private static int supportedMimeType;
    /* access modifiers changed from: private */
    public boolean installing = false;
    private Context mContext = null;
    private Map<Integer, ArrayList<remoteAssetItem>> mFeaturedList = new HashMap();
    private Object m_assetdbLock = new Object();
    private List<String> readyToDeletePackages;
    private List<String> readyToInstallPackages;
    private List<String> readyToLoadPackages;

    public static final class InstallTaskError implements TaskError {
        final Exception exception;
        private final String message;

        public InstallTaskError(String str) {
            this.message = str;
            this.exception = null;
        }

        public InstallTaskError(String str, Exception exc) {
            this.message = str;
            this.exception = exc;
        }

        public Exception getException() {
            return this.exception;
        }

        public String getLocalizedMessage(Context context) {
            return this.message;
        }

        public String getMessage() {
            return this.message;
        }
    }

    public static class internalStoreAssetInfo implements StoreAssetInfo {
        private AssetInfo info;

        public internalStoreAssetInfo(AssetInfo assetInfo) {
            this.info = assetInfo;
        }

        public String getAssetDescription() {
            return this.info.description;
        }

        public Map<String, String> getAssetDescriptionMap() {
            return null;
        }

        public int getAssetFilesize() {
            return this.info.asset_filesize;
        }

        public String getAssetId() {
            return this.info.asset_id;
        }

        public int getAssetIndex() {
            return this.info.idx;
        }

        public Map<String, String> getAssetNameMap() {
            HashMap hashMap = new HashMap();
            if (this.info.assetName != null) {
                for (LangString langString : this.info.assetName) {
                    hashMap.put(langString.language_code.toLowerCase(Locale.ENGLISH), langString.string_title);
                }
            }
            return hashMap;
        }

        public String getAssetPackageDownloadURL() {
            return this.info.asset_filepath;
        }

        public int getAssetScopeVersion() {
            return this.info.asset_sversion;
        }

        public String getAssetThumbnailURL() {
            return this.info.thumbnail_path;
        }

        public String getAssetThumbnailURL_L() {
            return this.info.thumbnail_path_l;
        }

        public String getAssetThumbnailURL_S() {
            return this.info.thumbnail_path_s;
        }

        public String getAssetTitle() {
            return this.info.title;
        }

        public int getAssetVersion() {
            return this.info.asset_version;
        }

        public String getAssetVideoURL() {
            return this.info.videoclip_path;
        }

        public String getCategoryAliasName() {
            return this.info.category_aliasName;
        }

        public String getCategoryIconURL() {
            return this.info.categoryimagePath;
        }

        public int getCategoryIndex() {
            return this.info.category_idx;
        }

        public long getExpireTime() {
            return this.info.expire_time;
        }

        public String getPriceType() {
            return this.info.priceType;
        }

        public String getSubCategoryAliasName() {
            return this.info.category_aliasName;
        }

        public int getSubCategoryIndex() {
            return this.info.subcategory_idx;
        }

        public Map<String, String> getSubCategoryNameMap() {
            HashMap hashMap = new HashMap();
            if (this.info.subcategoryName != null) {
                for (LangString langString : this.info.subcategoryName) {
                    hashMap.put(langString.language_code.toLowerCase(Locale.ENGLISH), langString.string_title);
                }
            }
            return hashMap;
        }

        public List<String> getThumbnailPaths() {
            ArrayList arrayList = new ArrayList();
            if (this.info.thumb != null) {
                for (ThumbInfo thumbInfo : this.info.thumb) {
                    arrayList.add(thumbInfo.file_path);
                }
            }
            return arrayList;
        }

        public int getUpdateTime() {
            return this.info.update_time;
        }
    }

    public static class remoteAssetItem {
        public String category;
        public String id;
        public int idx;
        public String name;
        public String thumbnailPath;
        public String thumbnailURL;
    }

    AssetLocalInstallDB(Context context) {
        if (assetStoreRootPath == null) {
            StringBuilder sb = new StringBuilder();
            sb.append(EditorGlobal.e().getAbsolutePath());
            sb.append(File.separator);
            sb.append(".nexassets");
            sb.append(File.separator);
            sb.append(context.getPackageName());
            assetStoreRootPath = sb.toString();
        }
        if (localRootPath == null) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(context.getFilesDir().getAbsolutePath());
            sb2.append(File.separator);
            sb2.append("assets");
            localRootPath = sb2.toString();
            File file = new File(localRootPath);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        if (localFeaturedPath == null) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(context.getFilesDir().getAbsolutePath());
            sb3.append(File.separator);
            sb3.append("featured");
            localFeaturedPath = sb3.toString();
            File file2 = new File(localFeaturedPath);
            if (!file2.exists()) {
                file2.mkdirs();
            }
        }
        this.readyToInstallPackages = new ArrayList();
        this.readyToDeletePackages = new ArrayList();
        this.readyToLoadPackages = new ArrayList();
        this.mContext = context;
    }

    /* access modifiers changed from: private */
    public boolean checkInstallFile(String str, String str2) {
        boolean z;
        StringBuilder sb = new StringBuilder();
        sb.append(str2);
        sb.append(".json");
        File file = new File(str, sb.toString());
        int assetIdxInJson = getAssetIdxInJson(str2);
        if (assetIdxInJson != Integer.parseInt(str2)) {
            String str3 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("invalid ");
            sb2.append(str2);
            sb2.append(".json. idx=");
            sb2.append(assetIdxInJson);
            Log.d(str3, sb2.toString());
            z = false;
        } else {
            z = true;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(".");
        sb3.append(str2);
        new File(str, sb3.toString());
        StringBuilder sb4 = new StringBuilder();
        sb4.append(str2);
        sb4.append(".jpg");
        File file2 = new File(str, sb4.toString());
        if (!file2.isFile()) {
            String str4 = TAG;
            StringBuilder sb5 = new StringBuilder();
            sb5.append("thumbnail not found (");
            sb5.append(str2);
            sb5.append(")");
            Log.d(str4, sb5.toString());
            z = false;
        }
        if (!z) {
            if (file.isFile()) {
                file.delete();
            }
            if (file2.isFile()) {
                file2.delete();
            }
        }
        return z;
    }

    public static void copy(InputStream inputStream, OutputStream outputStream) throws IOException {
        byte[] bArr = new byte[4096];
        while (true) {
            int read = inputStream.read(bArr);
            if (-1 != read) {
                outputStream.write(bArr, 0, read);
            } else {
                return;
            }
        }
    }

    private boolean copyFile(File file, String str) {
        if (file == null || !file.exists()) {
            return false;
        }
        try {
            FileInputStream fileInputStream = new FileInputStream(file);
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = fileInputStream.read(bArr, 0, 1024);
                if (read == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, read);
            }
            fileOutputStream.close();
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:33:0x00ca, code lost:
        if (r2 != null) goto L_0x00cc;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:35:?, code lost:
        r2.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00d4, code lost:
        if (r2 != null) goto L_0x00cc;
     */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00dd A[SYNTHETIC, Splitter:B:44:0x00dd] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:37:0x00d1=Splitter:B:37:0x00d1, B:31:0x00c7=Splitter:B:31:0x00c7} */
    public File copyThumbnail(String str) {
        if (isSamePath()) {
            StringBuilder sb = new StringBuilder();
            sb.append(assetStoreRootPath);
            sb.append(File.separator);
            sb.append(str);
            sb.append(".jpg");
            File file = new File(sb.toString());
            if (!file.isFile()) {
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("copyThumbnail() file not found=");
                sb2.append(file.getAbsolutePath());
                Log.d(str2, sb2.toString());
            }
            return file;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(assetStoreRootPath);
        sb3.append(File.separator);
        sb3.append(str);
        sb3.append(".jpg");
        File file2 = new File(sb3.toString());
        File file3 = new File(getThumbnailOutputPath(str));
        if (file2.isFile()) {
            Options options = new Options();
            int i = 1;
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file2.getAbsolutePath(), options);
            options.inJustDecodeBounds = false;
            while (i < 8 && options.outWidth / i > 320 && options.outHeight / i > 180) {
                i *= 2;
            }
            options.inSampleSize = i;
            Bitmap decodeFile = BitmapFactory.decodeFile(file2.getAbsolutePath(), options);
            FileOutputStream fileOutputStream = null;
            try {
                file3.createNewFile();
                FileOutputStream fileOutputStream2 = new FileOutputStream(file3);
                try {
                    decodeFile.compress(CompressFormat.PNG, 100, fileOutputStream2);
                    try {
                        fileOutputStream2.close();
                    } catch (IOException unused) {
                    }
                } catch (FileNotFoundException e) {
                    e = e;
                    fileOutputStream = fileOutputStream2;
                    e.printStackTrace();
                } catch (IOException e2) {
                    e = e2;
                    fileOutputStream = fileOutputStream2;
                    try {
                        e.printStackTrace();
                    } catch (Throwable th) {
                        th = th;
                        if (fileOutputStream != null) {
                            try {
                                fileOutputStream.close();
                            } catch (IOException unused2) {
                            }
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (FileNotFoundException e3) {
                e = e3;
                e.printStackTrace();
            } catch (IOException e4) {
                e = e4;
                e.printStackTrace();
            }
            file2.delete();
            return file3;
        }
        createDummyIcon(str);
        return file3;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:34:0x0074, code lost:
        if (r1 != null) goto L_0x0076;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:36:?, code lost:
        r1.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x007e, code lost:
        if (r1 != null) goto L_0x0076;
     */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0087 A[SYNTHETIC, Splitter:B:45:0x0087] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:32:0x0071=Splitter:B:32:0x0071, B:38:0x007b=Splitter:B:38:0x007b} */
    private boolean copyThumbnail(String str, String str2) {
        File file = new File(str);
        File file2 = new File(str2);
        if (file2.isFile()) {
            file2.delete();
        }
        if (!file.isFile()) {
            return false;
        }
        Options options = new Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        options.inJustDecodeBounds = false;
        int i = 1;
        while (i < 8 && options.outWidth / i > 320 && options.outHeight / i > 180) {
            i *= 2;
        }
        options.inSampleSize = i;
        Bitmap decodeFile = BitmapFactory.decodeFile(file.getAbsolutePath(), options);
        if (decodeFile == null) {
            file.delete();
            return false;
        }
        FileOutputStream fileOutputStream = null;
        try {
            file2.createNewFile();
            FileOutputStream fileOutputStream2 = new FileOutputStream(file2);
            try {
                decodeFile.compress(CompressFormat.PNG, 100, fileOutputStream2);
            } catch (FileNotFoundException e) {
                e = e;
                fileOutputStream = fileOutputStream2;
                e.printStackTrace();
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException unused) {
                    }
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException unused2) {
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            e.printStackTrace();
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
        }
        file.delete();
        return true;
    }

    private void createDummy(String str) throws IOException {
        if (!isSamePath()) {
            FileOutputStream fileOutputStream = new FileOutputStream(new File(assetStoreRootPath, str));
            fileOutputStream.write(new byte[]{80, 75});
            fileOutputStream.close();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:30:0x0055 A[SYNTHETIC, Splitter:B:30:0x0055] */
    /* JADX WARNING: Removed duplicated region for block: B:36:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Removed duplicated region for block: B:37:? A[RETURN, SYNTHETIC] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:19:0x0042=Splitter:B:19:0x0042, B:25:0x004c=Splitter:B:25:0x004c} */
    private void createDummyIcon(String str) {
        File file = new File(getThumbnailOutputPath(str));
        int[] iArr = new int[576];
        for (int i = 0; i < iArr.length; i++) {
            iArr[i] = -16777216;
        }
        FileOutputStream fileOutputStream = null;
        Bitmap createBitmap = Bitmap.createBitmap(iArr, 32, 18, Config.ARGB_8888);
        try {
            file.createNewFile();
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                createBitmap.compress(CompressFormat.PNG, 100, fileOutputStream2);
            } catch (FileNotFoundException e) {
                e = e;
                fileOutputStream = fileOutputStream2;
                e.printStackTrace();
                if (fileOutputStream == null) {
                    return;
                }
                fileOutputStream.close();
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                    if (fileOutputStream == null) {
                        return;
                    }
                    fileOutputStream.close();
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException unused) {
                    }
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException unused2) {
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            e.printStackTrace();
            if (fileOutputStream == null) {
            }
            fileOutputStream.close();
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
            if (fileOutputStream == null) {
            }
            fileOutputStream.close();
        }
    }

    private void deleteDir(File file) {
        File[] listFiles = file.listFiles();
        if (listFiles != null) {
            for (File deleteDir : listFiles) {
                deleteDir(deleteDir);
            }
        }
        file.delete();
    }

    private int getAssetIdxInJson(String str) {
        AssetInfo assetInfo;
        FileInputStream fileInputStream;
        String str2 = assetStoreRootPath;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".json");
        File file = new File(str2, sb.toString());
        if (!file.isFile()) {
            return -1;
        }
        try {
            fileInputStream = new FileInputStream(file);
            assetInfo = (AssetInfo) new Gson().fromJson((Reader) new InputStreamReader(fileInputStream), AssetInfo.class);
            try {
                fileInputStream.close();
            } catch (FileNotFoundException | IOException unused) {
            }
        } catch (FileNotFoundException | IOException unused2) {
            assetInfo = null;
        } catch (Throwable th) {
            fileInputStream.close();
            throw th;
        }
        if (assetInfo == null) {
            return -1;
        }
        return assetInfo.idx;
    }

    public static String getAssetStoreRootPath() {
        return assetStoreRootPath;
    }

    private boolean getFeaturedList(String str, int i) {
        InputStream inputStream;
        InputStream inputStream2;
        File file = new File(str);
        ArrayList arrayList = (ArrayList) this.mFeaturedList.get(Integer.valueOf(i));
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.mFeaturedList.put(Integer.valueOf(i), arrayList);
        }
        boolean z = false;
        if (file.isDirectory()) {
            String absolutePath = file.getAbsolutePath();
            StringBuilder sb = new StringBuilder();
            sb.append("");
            sb.append(i);
            sb.append(".json");
            File file2 = new File(absolutePath, sb.toString());
            if (file2.isFile()) {
                try {
                    inputStream2 = new FileInputStream(file2);
                    try {
                        GetNewAssetList getNewAssetList = (GetNewAssetList) new Gson().fromJson((Reader) new InputStreamReader(inputStream2), GetNewAssetList.class);
                        if (getNewAssetList == null) {
                            try {
                                inputStream2.close();
                                return false;
                            } catch (FileNotFoundException e) {
                                e.printStackTrace();
                            } catch (IOException e2) {
                                e2.printStackTrace();
                            } catch (JsonSyntaxException e3) {
                                Log.e(TAG, "getFeaturedList err!");
                                e3.printStackTrace();
                            } catch (JsonIOException e4) {
                                Log.e(TAG, "getFeaturedList err!");
                                e4.printStackTrace();
                            }
                        } else if (getNewAssetList.objList == null) {
                            inputStream2.close();
                            return false;
                        } else {
                            if (getNewAssetList.objList.size() > 0) {
                                arrayList.clear();
                                for (AssetInfo assetInfo : getNewAssetList.objList) {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("");
                                    sb2.append(assetInfo.idx);
                                    if (!new File(str, sb2.toString()).isFile()) {
                                        String str2 = TAG;
                                        StringBuilder sb3 = new StringBuilder();
                                        sb3.append("getFeaturedList() mode=");
                                        sb3.append(i);
                                        sb3.append(", idx=");
                                        sb3.append(i);
                                        sb3.append(", thumbnail not found!");
                                        Log.d(str2, sb3.toString());
                                    } else {
                                        remoteAssetItem remoteassetitem = new remoteAssetItem();
                                        remoteassetitem.id = assetInfo.asset_id;
                                        remoteassetitem.idx = assetInfo.idx;
                                        remoteassetitem.name = ((LangString) assetInfo.assetName.get(0)).string_title;
                                        String language = this.mContext.getResources().getConfiguration().locale.getLanguage();
                                        int i2 = 0;
                                        while (true) {
                                            if (i2 < assetInfo.assetName.size()) {
                                                if (((LangString) assetInfo.assetName.get(i2)).language_code.equals(language) && ((LangString) assetInfo.assetName.get(i2)).string_title != null) {
                                                    remoteassetitem.name = ((LangString) assetInfo.assetName.get(i2)).string_title;
                                                    break;
                                                }
                                                i2++;
                                            } else {
                                                break;
                                            }
                                        }
                                        StringBuilder sb4 = new StringBuilder();
                                        sb4.append(str);
                                        sb4.append(File.separator);
                                        sb4.append(remoteassetitem.idx);
                                        remoteassetitem.thumbnailPath = sb4.toString();
                                        remoteassetitem.thumbnailURL = assetInfo.thumbnail_path_s;
                                        if (assetInfo.category_aliasName != null) {
                                            remoteassetitem.category = assetInfo.category_aliasName;
                                        } else {
                                            remoteassetitem.category = "None";
                                        }
                                        arrayList.add(remoteassetitem);
                                    }
                                }
                                z = true;
                            }
                            inputStream2.close();
                            if (!z) {
                                try {
                                    inputStream = new FileInputStream(file2);
                                    try {
                                        byte[] bArr = new byte[((int) file2.length())];
                                        inputStream.read(bArr);
                                        String str3 = TAG;
                                        StringBuilder sb5 = new StringBuilder();
                                        sb5.append("ErrJson:");
                                        sb5.append(String.valueOf(bArr));
                                        Log.d(str3, sb5.toString());
                                    } catch (Throwable th) {
                                        th = th;
                                        inputStream.close();
                                        throw th;
                                    }
                                    try {
                                        inputStream.close();
                                    } catch (FileNotFoundException e5) {
                                        e5.printStackTrace();
                                    } catch (IOException e6) {
                                        e6.printStackTrace();
                                    }
                                } catch (Throwable th2) {
                                    th = th2;
                                    inputStream = null;
                                    inputStream.close();
                                    throw th;
                                }
                            }
                        }
                    } catch (Throwable th3) {
                        th = th3;
                        inputStream2.close();
                        throw th;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    inputStream2 = null;
                    inputStream2.close();
                    throw th;
                }
            } else {
                String str4 = TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("file not found=");
                sb6.append(file2.getAbsolutePath());
                Log.d(str4, sb6.toString());
            }
        }
        return z;
    }

    public static String getInstalledAssetPath() {
        return localRootPath;
    }

    public static AssetLocalInstallDB getInstance(Context context) {
        if (instance == null) {
            instance = new AssetLocalInstallDB(context.getApplicationContext());
        }
        return instance;
    }

    private String getThumbnailOutputPath(String str) {
        String str2 = localRootPath;
        if (localRootPath.startsWith(this.mContext.getFilesDir().getAbsolutePath())) {
            StringBuilder sb = new StringBuilder();
            sb.append(this.mContext.getFilesDir().getAbsolutePath());
            sb.append(File.separator);
            sb.append("thumb");
            str2 = sb.toString();
        }
        File file = new File(str2);
        if (!file.exists()) {
            file.mkdirs();
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append(str2);
        sb2.append(File.separator);
        sb2.append(str);
        sb2.append(".jpg");
        return sb2.toString();
    }

    /* access modifiers changed from: private */
    public void installPackage(String str, String str2, File file, Task task, boolean z, String str3) throws IOException {
        String str4 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("installPackage() called with: item = [");
        sb.append(str);
        sb.append("], thumbFile = [");
        sb.append(file);
        sb.append("]");
        Log.d(str4, sb.toString());
        File file2 = new File(assetStoreRootPath, str);
        if (file2.exists()) {
            if (p.a(file2)) {
                z = false;
            }
            File file3 = new File(localRootPath, str2);
            if (z) {
                try {
                    if (str3.compareTo(AssetStoreClient.none) == 0) {
                        Log.d(TAG, "installPackage() fail. key not found.");
                        file2.delete();
                        String str5 = assetStoreRootPath;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(".");
                        sb2.append(str2);
                        File file4 = new File(str5, sb2.toString());
                        if (file4.isFile()) {
                            file4.delete();
                        }
                        return;
                    }
                } catch (IOException e) {
                    Log.w(TAG, "installPackage unzip error", e);
                    if (file3.exists()) {
                        file3.delete();
                    }
                    throw new IOException(e);
                }
            }
            try {
                unzip(file2, file3, task, z, str3);
                String str6 = assetStoreRootPath;
                StringBuilder sb3 = new StringBuilder();
                sb3.append(".");
                sb3.append(str2);
                File file5 = new File(str6, sb3.toString());
                if (file5.isFile()) {
                    file5.delete();
                }
            } catch (NoSuchAlgorithmException e2) {
                e2.printStackTrace();
                if (file3.exists()) {
                    file3.delete();
                }
            } catch (NoSuchPaddingException e3) {
                e3.printStackTrace();
                if (file3.exists()) {
                    file3.delete();
                }
            } catch (InvalidKeyException e4) {
                e4.printStackTrace();
                if (file3.exists()) {
                    file3.delete();
                }
            }
            synchronized (this.m_assetdbLock) {
                StoreAssetInfo parseStoreAssetInfo = parseStoreAssetInfo(file3, str2);
                if (parseStoreAssetInfo != null) {
                    String str7 = TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("install StoreAssetItem, idx=");
                    sb4.append(parseStoreAssetInfo.getAssetIndex());
                    sb4.append(", id=");
                    sb4.append(parseStoreAssetInfo.getAssetId());
                    sb4.append(", SDKLevel=");
                    sb4.append(parseStoreAssetInfo.getAssetScopeVersion());
                    sb4.append(", version=");
                    sb4.append(parseStoreAssetInfo.getAssetVersion());
                    Log.d(str7, sb4.toString());
                }
                c.a(this.mContext).a(file3, file, parseStoreAssetInfo);
                file2.delete();
            }
            return;
        }
        throw new FileNotFoundException("Not found asset file");
    }

    private boolean isSamePath() {
        return localRootPath.compareTo(assetStoreRootPath) == 0;
    }

    public static boolean isUpdatedFeaturedList(int i, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(localFeaturedPath);
        sb.append(File.separator);
        sb.append("");
        sb.append(i);
        sb.append(".json");
        File file = new File(sb.toString());
        boolean z = true;
        if (file.isFile()) {
            try {
                FileInputStream fileInputStream = new FileInputStream(file);
                byte[] bArr = new byte[((int) file.length())];
                fileInputStream.read(bArr);
                if (Arrays.equals(bArr, str.getBytes())) {
                    String str2 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("FeaturedList equals index=");
                    sb2.append(i);
                    Log.d(str2, sb2.toString());
                    z = false;
                }
                fileInputStream.close();
            } catch (FileNotFoundException unused) {
            } catch (IOException unused2) {
                Log.d(TAG, "FeaturedList IOException");
            }
        }
        return z;
    }

    private void moveFeaturedList(String str) {
        String[] list;
        StringBuilder sb = new StringBuilder();
        sb.append(assetStoreRootPath);
        sb.append(File.separator);
        sb.append(str);
        File file = new File(sb.toString());
        if (file.isDirectory()) {
            for (String str2 : file.list()) {
                if (!str2.startsWith(".")) {
                    if (str2.endsWith(".json")) {
                        File file2 = new File(file.getAbsolutePath(), str2);
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append(localFeaturedPath);
                        sb2.append(File.separator);
                        sb2.append(str2);
                        if (!copyFile(file2, sb2.toString())) {
                            Log.d(TAG, "copyFile fail!");
                        }
                        file2.delete();
                    } else {
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append(file.getAbsolutePath());
                        sb3.append(File.separator);
                        sb3.append(str2);
                        String sb4 = sb3.toString();
                        StringBuilder sb5 = new StringBuilder();
                        sb5.append(localFeaturedPath);
                        sb5.append(File.separator);
                        sb5.append(str2);
                        copyThumbnail(sb4, sb5.toString());
                    }
                }
            }
        }
    }

    private StoreAssetInfo parseStoreAssetInfo(File file, String str) {
        AssetInfo assetInfo;
        FileInputStream fileInputStream;
        String str2 = assetStoreRootPath;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".json");
        File file2 = new File(str2, sb.toString());
        if (file2.isFile()) {
            try {
                fileInputStream = new FileInputStream(file2);
                assetInfo = (AssetInfo) new Gson().fromJson((Reader) new InputStreamReader(fileInputStream), AssetInfo.class);
                try {
                    fileInputStream.close();
                } catch (FileNotFoundException | IOException unused) {
                }
            } catch (FileNotFoundException | IOException unused2) {
                assetInfo = null;
            } catch (Throwable th) {
                fileInputStream.close();
                throw th;
            }
            file2.delete();
            return new internalStoreAssetInfo(assetInfo);
        }
        Log.d(TAG, "jsonFile file not found!");
        AssetInfo assetInfo2 = new AssetInfo();
        try {
            AssetPackageReader b = AssetPackageReader.b(file, str);
            if (b != null) {
                if (b.e() != null) {
                    assetInfo2.title = (String) b.e().get("en");
                } else {
                    assetInfo2.title = str;
                }
                assetInfo2.idx = Integer.parseInt(str);
                assetInfo2.asset_id = str;
                b.close();
            } else {
                assetInfo2.idx = Integer.parseInt(str);
                assetInfo2.asset_id = str;
                assetInfo2.title = str;
            }
        } catch (IOException unused3) {
            assetInfo2.idx = Integer.parseInt(str);
            assetInfo2.asset_id = str;
            assetInfo2.title = str;
        }
        return new internalStoreAssetInfo(assetInfo2);
    }

    private static String readFromFile(File file) {
        try {
            BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(bufferedInputStream));
            StringBuilder sb = new StringBuilder();
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    sb.append(readLine);
                    sb.append("\n");
                } else {
                    bufferedInputStream.close();
                    return sb.toString();
                }
            }
        } catch (FileNotFoundException e) {
            return e.getMessage();
        } catch (IOException e2) {
            return e2.getMessage();
        }
    }

    /* JADX WARNING: Missing exception handler attribute for start block: B:17:0x003f */
    public static void saveFeaturedList(int i, String str) {
        FileOutputStream fileOutputStream;
        String str2 = localFeaturedPath;
        try {
            StringBuilder sb = new StringBuilder();
            sb.append(str2);
            sb.append(File.separator);
            sb.append("");
            sb.append(i);
            sb.append(".json");
            fileOutputStream = new FileOutputStream(sb.toString());
            fileOutputStream.write(str.getBytes());
            try {
                fileOutputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (IOException ) {
            fileOutputStream.close();
        } catch (FileNotFoundException unused) {
        } catch (Throwable th) {
            try {
                fileOutputStream.close();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            throw th;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:26:0x00b1, code lost:
        if (r5 != null) goto L_0x00b3;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:28:?, code lost:
        r5.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:32:0x00bb, code lost:
        if (r5 != null) goto L_0x00b3;
     */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x00c1 A[SYNTHETIC, Splitter:B:36:0x00c1] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:30:0x00b8=Splitter:B:30:0x00b8, B:24:0x00ae=Splitter:B:24:0x00ae} */
    public static void saveFeaturedThumbnail(int i, Bitmap bitmap) {
        String str = localFeaturedPath;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        File file = new File(str, sb.toString());
        if (file.isFile()) {
            Options options = new Options();
            options.inJustDecodeBounds = true;
            BitmapFactory.decodeFile(file.getAbsolutePath(), options);
            if (options.outWidth == bitmap.getWidth() || options.outHeight == bitmap.getHeight()) {
                long currentTimeMillis = System.currentTimeMillis() - file.lastModified();
                String str2 = TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("saveFeaturedThumbnail assetIdx=");
                sb2.append(i);
                sb2.append(", exists. lastModified=");
                sb2.append(currentTimeMillis);
                Log.d(str2, sb2.toString());
                return;
            }
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("saveFeaturedThumbnail assetIdx=");
            sb3.append(i);
            sb3.append(", is not bmp . size=");
            sb3.append(file.length());
            Log.d(str3, sb3.toString());
            file.delete();
        }
        FileOutputStream fileOutputStream = null;
        try {
            file.createNewFile();
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                bitmap.compress(CompressFormat.PNG, 100, fileOutputStream2);
            } catch (FileNotFoundException e) {
                e = e;
                fileOutputStream = fileOutputStream2;
                e.printStackTrace();
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                    try {
                        fileOutputStream.close();
                    } catch (IOException unused) {
                    }
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException unused2) {
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            e.printStackTrace();
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
        }
    }

    public static void setAssetStoreRootPath(String str) {
        assetStoreRootPath = str;
    }

    public static void setInstalledAssetPath(String str) {
        localRootPath = str;
        File file = new File(localRootPath);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    public static void setMimeType(int i) {
        supportedMimeType = i;
    }

    /* access modifiers changed from: private */
    public int uninstallPackage(int i, boolean z) throws Exception {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("uninstallPackage() called with: assetIdx = [");
        sb.append(i);
        sb.append("]");
        Log.d(str, sb.toString());
        int i2 = 1;
        if (i == 0 || i == 1) {
            return 1;
        }
        synchronized (this.m_assetdbLock) {
            f assetInstalledItemInfoByAssetIdx = getAssetInstalledItemInfoByAssetIdx(i);
            if (assetInstalledItemInfoByAssetIdx != null) {
                File file = new File(URI.create(assetInstalledItemInfoByAssetIdx.getPackageURI()).getPath());
                StringBuilder sb2 = new StringBuilder();
                sb2.append("");
                sb2.append(i);
                File file2 = new File(getThumbnailOutputPath(sb2.toString()));
                if (file.isDirectory()) {
                    deleteDir(file);
                } else {
                    file.delete();
                }
                if (file2.isFile()) {
                    if (z) {
                        file2.delete();
                    } else if (!isSamePath()) {
                        file2.delete();
                    }
                }
                if (z) {
                    String str2 = assetStoreRootPath;
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(i);
                    sb3.append(".zip");
                    File file3 = new File(str2, sb3.toString());
                    if (file3.isFile()) {
                        file3.delete();
                    }
                }
                if (file.exists()) {
                    i2 = file.delete();
                }
                c.a(this.mContext).a(i);
            }
            String str3 = TAG;
            StringBuilder sb4 = new StringBuilder();
            sb4.append("uninstallPackage() returned: ");
            sb4.append(i2);
            Log.d(str3, sb4.toString());
        }
        return i2;
    }

    private static void unzip(File file, File file2, Task task, boolean z, String str) throws IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException {
        ZipInputStream zipInputStream;
        FileOutputStream fileOutputStream;
        String str2 = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("Unzipping '");
        sb.append(file);
        sb.append("' to '");
        sb.append(file2);
        sb.append("'");
        Log.d(str2, sb.toString());
        if (file2.mkdirs() || file2.exists()) {
            long length = file.length();
            task.setProgress(0, 100);
            long j = 0;
            if (length > 0) {
                if (z) {
                    Cipher instance2 = Cipher.getInstance("AES/ECB/PKCS5Padding");
                    instance2.init(2, new SecretKeySpec(str.getBytes(), "AES"));
                    zipInputStream = new ZipInputStream(new CipherInputStream(new FileInputStream(file), instance2));
                } else {
                    zipInputStream = new ZipInputStream(new FileInputStream(file));
                }
                while (true) {
                    try {
                        ZipEntry nextEntry = zipInputStream.getNextEntry();
                        if (nextEntry != null) {
                            String name = nextEntry.getName();
                            if (!name.contains("..")) {
                                File file3 = new File(file2, name);
                                if (nextEntry.isDirectory()) {
                                    if (!file3.mkdirs()) {
                                        if (!file3.exists()) {
                                            StringBuilder sb2 = new StringBuilder();
                                            sb2.append("Failed to create directory: ");
                                            sb2.append(file3);
                                            throw new IOException(sb2.toString());
                                        }
                                    }
                                    String str3 = TAG;
                                    StringBuilder sb3 = new StringBuilder();
                                    sb3.append("  - unzip: made folder '");
                                    sb3.append(name);
                                    sb3.append("'");
                                    Log.d(str3, sb3.toString());
                                } else {
                                    String str4 = TAG;
                                    StringBuilder sb4 = new StringBuilder();
                                    sb4.append("  - unzip: unzipping file '");
                                    sb4.append(name);
                                    sb4.append("' ");
                                    sb4.append(nextEntry.getCompressedSize());
                                    sb4.append("->");
                                    sb4.append(nextEntry.getSize());
                                    sb4.append(" (");
                                    sb4.append(nextEntry.getMethod());
                                    sb4.append(")");
                                    Log.d(str4, sb4.toString());
                                    fileOutputStream = new FileOutputStream(file3);
                                    copy(zipInputStream, fileOutputStream);
                                    b.a(fileOutputStream);
                                    j += nextEntry.getCompressedSize();
                                    int i = (int) ((100 * j) / length);
                                    if (i >= 100) {
                                        i = 99;
                                    }
                                    task.setProgress(i, 100);
                                }
                            } else {
                                throw new IOException("Relative paths not allowed");
                            }
                        } else {
                            b.a(zipInputStream);
                            task.setProgress(100, 100);
                            String str5 = TAG;
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("Unzipping DONE for: '");
                            sb5.append(file);
                            sb5.append("' to '");
                            sb5.append(file2);
                            sb5.append("'");
                            Log.d(str5, sb5.toString());
                            return;
                        }
                    } catch (Throwable th) {
                        b.a(zipInputStream);
                        throw th;
                    }
                }
            } else {
                throw new IOException("Failed because file size is zero");
            }
        } else {
            StringBuilder sb6 = new StringBuilder();
            sb6.append("Failed to create directory: ");
            sb6.append(file2);
            throw new IOException(sb6.toString());
        }
    }

    public void checkInstallDB() {
        String[] list;
        int i = 0;
        for (com.nexstreaming.app.common.nexasset.assetpackage.b installSourceType : c.a(this.mContext).b()) {
            if (installSourceType.getInstallSourceType() == InstallSourceType.STORE) {
                i++;
            }
        }
        if (i == 0) {
            Log.d(TAG, "StoreAsset NotFound!");
            String str = assetStoreRootPath;
            File file = new File(str);
            if (file.isDirectory()) {
                for (String str2 : file.list()) {
                    File file2 = new File(str, str2);
                    if (file2.isFile() && (!str2.endsWith(".zip") || file2.length() <= 2)) {
                        file2.delete();
                    }
                }
            }
        }
    }

    public void checkStore() {
        String[] list;
        this.readyToDeletePackages.clear();
        this.readyToLoadPackages.clear();
        File file = new File(localRootPath);
        if (file.isDirectory()) {
            for (String str : file.list()) {
                File file2 = new File(localRootPath, str);
                if (file2.isDirectory()) {
                    StringBuilder sb = new StringBuilder();
                    sb.append(assetStoreRootPath);
                    sb.append(File.separator);
                    sb.append(str);
                    sb.append(".zip");
                    if (!new File(sb.toString()).isFile()) {
                        this.readyToDeletePackages.add(str);
                        try {
                            uninstallPackage(Integer.parseInt(str));
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    if (file2.length() <= 2) {
                        this.readyToLoadPackages.add(str);
                    }
                }
            }
        }
    }

    public int checkStoreInstall() {
        String[] list;
        this.readyToInstallPackages.clear();
        int i = supportedMimeType;
        String str = assetStoreRootPath;
        File file = new File(str);
        if (file.isDirectory()) {
            for (String str2 : file.list()) {
                File file2 = new File(str, str2);
                if (file2.isFile() && str2.endsWith(".zip") && file2.length() > 2) {
                    if (checkInstallFile(str, str2.substring(0, str2.length() - 4))) {
                        this.readyToInstallPackages.add(str2);
                    } else {
                        file2.delete();
                    }
                }
            }
        }
        return this.readyToInstallPackages.size();
    }

    public List<? extends com.nexstreaming.app.common.nexasset.assetpackage.b> getAssetInstalledDownloadItemItems() {
        ArrayList arrayList = new ArrayList();
        for (com.nexstreaming.app.common.nexasset.assetpackage.b bVar : c.a(this.mContext).b()) {
            if (bVar.getInstallSourceType() == InstallSourceType.STORE) {
                arrayList.add(bVar);
            }
        }
        return arrayList;
    }

    public f getAssetInstalledItemInfoByAssetIdx(int i) {
        Iterator it = c.a(this.mContext).c(i).iterator();
        if (it.hasNext()) {
            return (f) it.next();
        }
        return null;
    }

    public List<remoteAssetItem> getList(int i, String str) {
        getFeaturedList(localFeaturedPath, i);
        return (List) this.mFeaturedList.get(Integer.valueOf(i));
    }

    public List<String> getReadyToInstallPackages() {
        checkStoreInstall();
        return this.readyToInstallPackages;
    }

    public String getThumbnailUrl(int i) {
        List<remoteAssetItem> list = (List) this.mFeaturedList.get(Integer.valueOf(1));
        if (list != null) {
            for (remoteAssetItem remoteassetitem : list) {
                if (remoteassetitem.idx == i) {
                    return remoteassetitem.thumbnailURL;
                }
            }
        }
        List<remoteAssetItem> list2 = (List) this.mFeaturedList.get(Integer.valueOf(2));
        if (list2 != null) {
            for (remoteAssetItem remoteassetitem2 : list2) {
                if (remoteassetitem2.idx == i) {
                    return remoteassetitem2.thumbnailURL;
                }
            }
        }
        return null;
    }

    public File getUnzipFolder(int i) {
        String str = localRootPath;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        return new File(str, sb.toString());
    }

    public Task installPackageAsync(int i) {
        final Task task = new Task();
        this.installing = true;
        new AsyncTask<Integer, Void, Exception>() {
            /* access modifiers changed from: protected */
            public Exception doInBackground(Integer... numArr) {
                String[] strArr;
                String[] strArr2;
                String[] list;
                Process.setThreadPriority(0);
                int intValue = numArr[0].intValue();
                if (intValue == 0) {
                    ArrayList arrayList = new ArrayList();
                    String access$000 = AssetLocalInstallDB.assetStoreRootPath;
                    File file = new File(access$000);
                    if (file.isDirectory()) {
                        for (String str : file.list()) {
                            File file2 = new File(access$000, str);
                            if (file2.isFile() && str.endsWith(".zip") && file2.length() > 2) {
                                if (AssetLocalInstallDB.this.checkInstallFile(access$000, str.substring(0, str.length() - 4))) {
                                    arrayList.add(str);
                                } else {
                                    file2.delete();
                                }
                            }
                        }
                    }
                    if (arrayList.size() == 0) {
                        Log.d(AssetLocalInstallDB.TAG, "download asset package not found.");
                        return new NotFoundException("download asset package not found");
                    }
                    strArr2 = new String[arrayList.size()];
                    strArr = new String[arrayList.size()];
                    for (int i = 0; i < arrayList.size(); i++) {
                        strArr2[i] = (String) arrayList.get(i);
                    }
                } else {
                    AssetLocalInstallDB assetLocalInstallDB = AssetLocalInstallDB.this;
                    String access$0002 = AssetLocalInstallDB.assetStoreRootPath;
                    StringBuilder sb = new StringBuilder();
                    sb.append("");
                    sb.append(intValue);
                    if (assetLocalInstallDB.checkInstallFile(access$0002, sb.toString())) {
                        String[] strArr3 = new String[1];
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("");
                        sb2.append(intValue);
                        sb2.append(".zip");
                        strArr = strArr3;
                        strArr2 = new String[]{sb2.toString()};
                    } else {
                        String str2 = AssetLocalInstallDB.TAG;
                        StringBuilder sb3 = new StringBuilder();
                        sb3.append("download asset package not found. AssetIdx=");
                        sb3.append(intValue);
                        Log.d(str2, sb3.toString());
                        return new NotFoundException("download asset package not found");
                    }
                }
                int i2 = 0;
                while (i2 < strArr2.length) {
                    String str3 = strArr2[i2];
                    String substring = str3.substring(0, str3.length() - 4);
                    try {
                        int parseInt = Integer.parseInt(substring);
                        com.nexstreaming.app.common.nexasset.assetpackage.b b = c.a().b(parseInt);
                        if (b != null) {
                            String str4 = AssetLocalInstallDB.TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("already installed Asset=");
                            sb4.append(parseInt);
                            Log.d(str4, sb4.toString());
                            if (b.getInstallSourceType() == InstallSourceType.STORE) {
                                try {
                                    AssetLocalInstallDB.this.uninstallPackage(parseInt, false);
                                } catch (Exception unused) {
                                }
                            } else {
                                String str5 = AssetLocalInstallDB.TAG;
                                StringBuilder sb5 = new StringBuilder();
                                sb5.append("installed Asset is not store type. idx=");
                                sb5.append(parseInt);
                                Log.d(str5, sb5.toString());
                            }
                        }
                    } catch (NumberFormatException unused2) {
                        String str6 = AssetLocalInstallDB.TAG;
                        StringBuilder sb6 = new StringBuilder();
                        sb6.append("baseId is not Integer baseId=");
                        sb6.append(substring);
                        Log.d(str6, sb6.toString());
                    }
                    File access$300 = AssetLocalInstallDB.this.copyThumbnail(substring);
                    int i3 = i2 + 1;
                    task.setProgress(i3, strArr2.length);
                    try {
                        AssetLocalInstallDB.this.installPackage(strArr2[i2], substring, access$300, task, false, strArr[i2]);
                        String str7 = AssetLocalInstallDB.TAG;
                        StringBuilder sb7 = new StringBuilder();
                        sb7.append("install asset completed : asset = [");
                        sb7.append(strArr2[i2]);
                        sb7.append("]");
                        Log.i(str7, sb7.toString());
                        i2 = i3;
                    } catch (FileNotFoundException e) {
                        String str8 = AssetLocalInstallDB.TAG;
                        StringBuilder sb8 = new StringBuilder();
                        sb8.append("install asset failed : asset = [");
                        sb8.append(strArr2[i2]);
                        sb8.append("]");
                        Log.d(str8, sb8.toString());
                        return e;
                    } catch (IOException e2) {
                        String str9 = AssetLocalInstallDB.TAG;
                        StringBuilder sb9 = new StringBuilder();
                        sb9.append("install asset failed : asset = [");
                        sb9.append(strArr2[i2]);
                        sb9.append("]");
                        Log.d(str9, sb9.toString());
                        new File(AssetLocalInstallDB.assetStoreRootPath, strArr2[i2]).delete();
                        return e2;
                    }
                }
                return null;
            }

            /* access modifiers changed from: protected */
            public void onPostExecute(Exception exc) {
                super.onPostExecute(exc);
                AssetLocalInstallDB.this.installing = false;
                if (exc != null) {
                    task.sendFailure(new InstallTaskError("asset_install_failed", exc));
                    return;
                }
                task.signalEvent(Event.COMPLETE);
            }

            /* access modifiers changed from: protected */
            public void onPreExecute() {
                super.onPreExecute();
            }
        }.executeOnExecutor(sInstallThreadPool, new Integer[]{Integer.valueOf(i)});
        return task;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x00ec  */
    /* JADX WARNING: Removed duplicated region for block: B:31:0x0109  */
    /* JADX WARNING: Removed duplicated region for block: B:36:0x0134  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0156  */
    /* JADX WARNING: Removed duplicated region for block: B:41:0x0173  */
    /* JADX WARNING: Removed duplicated region for block: B:45:0x0197  */
    /* JADX WARNING: Removed duplicated region for block: B:56:0x01b5  */
    public boolean installPackageSync(int i) {
        boolean z;
        FileInputStream fileInputStream;
        String str = assetStoreRootPath;
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        String sb2 = sb.toString();
        if (this.installing) {
            String str2 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("installPackageSync(");
            sb3.append(i);
            sb3.append("): installing retry");
            Log.d(str2, sb3.toString());
            return false;
        }
        this.installing = true;
        File file = new File(str);
        StringBuilder sb4 = new StringBuilder();
        sb4.append(sb2);
        sb4.append(".json");
        File file2 = new File(str, sb4.toString());
        StringBuilder sb5 = new StringBuilder();
        sb5.append(sb2);
        sb5.append(".jpg");
        File file3 = new File(str, sb5.toString());
        StringBuilder sb6 = new StringBuilder();
        sb6.append(sb2);
        sb6.append(".zip");
        File file4 = new File(str, sb6.toString());
        AssetInfo assetInfo = null;
        if (file.isDirectory()) {
            if (!file2.isFile()) {
                String str3 = TAG;
                StringBuilder sb7 = new StringBuilder();
                sb7.append("installPackageSync(");
                sb7.append(i);
                sb7.append("): info json not found!");
                Log.d(str3, sb7.toString());
            } else {
                try {
                    fileInputStream = new FileInputStream(file2);
                    AssetInfo assetInfo2 = (AssetInfo) new Gson().fromJson((Reader) new InputStreamReader(fileInputStream), AssetInfo.class);
                    try {
                        fileInputStream.close();
                        assetInfo = assetInfo2;
                        z = true;
                    } catch (FileNotFoundException unused) {
                        assetInfo = assetInfo2;
                    } catch (IOException unused2) {
                        assetInfo = assetInfo2;
                        String str4 = TAG;
                        StringBuilder sb8 = new StringBuilder();
                        sb8.append("installPackageSync(");
                        sb8.append(i);
                        sb8.append("): info json parse fail!");
                        Log.d(str4, sb8.toString());
                        z = false;
                        if (assetInfo != null) {
                        }
                        z = false;
                        if (!file3.isFile()) {
                        }
                        if (!file4.isFile()) {
                        }
                        z = false;
                        if (z) {
                        }
                    }
                } catch (FileNotFoundException unused3) {
                } catch (IOException unused4) {
                    String str42 = TAG;
                    StringBuilder sb82 = new StringBuilder();
                    sb82.append("installPackageSync(");
                    sb82.append(i);
                    sb82.append("): info json parse fail!");
                    Log.d(str42, sb82.toString());
                    z = false;
                    if (assetInfo != null) {
                    }
                    z = false;
                    if (!file3.isFile()) {
                    }
                    if (!file4.isFile()) {
                    }
                    z = false;
                    if (z) {
                    }
                } catch (Throwable th) {
                    fileInputStream.close();
                    throw th;
                }
                if (assetInfo != null) {
                    String str5 = TAG;
                    StringBuilder sb9 = new StringBuilder();
                    sb9.append("installPackageSync(");
                    sb9.append(i);
                    sb9.append("): json parsing fail!");
                    Log.d(str5, sb9.toString());
                } else {
                    if (assetInfo.idx != i) {
                        String str6 = TAG;
                        StringBuilder sb10 = new StringBuilder();
                        sb10.append("installPackageSync(");
                        sb10.append(i);
                        sb10.append("): invalidation idx=");
                        sb10.append(assetInfo.idx);
                        Log.d(str6, sb10.toString());
                    }
                    if (!file3.isFile()) {
                        String str7 = TAG;
                        StringBuilder sb11 = new StringBuilder();
                        sb11.append("installPackageSync(");
                        sb11.append(i);
                        sb11.append("): thumbnail not found!");
                        Log.d(str7, sb11.toString());
                        z = false;
                    }
                    if (!file4.isFile()) {
                        String str8 = TAG;
                        StringBuilder sb12 = new StringBuilder();
                        sb12.append("installPackageSync(");
                        sb12.append(i);
                        sb12.append("): package not found!");
                        Log.d(str8, sb12.toString());
                    } else {
                        if (!p.a(file4)) {
                            String str9 = TAG;
                            StringBuilder sb13 = new StringBuilder();
                            sb13.append("installPackageSync(");
                            sb13.append(i);
                            sb13.append("): package is not zip!");
                            Log.d(str9, sb13.toString());
                        }
                        if (z) {
                            if (file2.isFile()) {
                                file2.delete();
                            }
                            if (file4.isFile()) {
                                file4.delete();
                            }
                            if (file3.isFile()) {
                                file3.delete();
                            }
                            this.installing = false;
                            return false;
                        }
                        File file5 = new File(localRootPath, sb2);
                        try {
                            File file6 = new File(getThumbnailOutputPath(sb2));
                            copyFile(file3, file6.getAbsolutePath());
                            p.a(file4, file5);
                            c.a(this.mContext).a(file5, file6, (StoreAssetInfo) new internalStoreAssetInfo(assetInfo));
                            file3.delete();
                            file2.delete();
                            file4.delete();
                            this.installing = false;
                            return true;
                        } catch (IOException e) {
                            e.printStackTrace();
                            String str10 = TAG;
                            StringBuilder sb14 = new StringBuilder();
                            sb14.append("installPackageSync(");
                            sb14.append(i);
                            sb14.append("): unzip fail=");
                            sb14.append(file5.getAbsolutePath());
                            Log.d(str10, sb14.toString());
                            this.installing = false;
                            return false;
                        }
                    }
                    z = false;
                    if (z) {
                    }
                }
                z = false;
                if (!file3.isFile()) {
                }
                if (!file4.isFile()) {
                }
                z = false;
                if (z) {
                }
            }
            z = false;
            if (assetInfo != null) {
            }
            z = false;
            if (!file3.isFile()) {
            }
            if (!file4.isFile()) {
            }
            z = false;
            if (z) {
            }
        } else {
            String str11 = TAG;
            StringBuilder sb15 = new StringBuilder();
            sb15.append("installPackageSync(");
            sb15.append(i);
            sb15.append("): store path not found=");
            sb15.append(str);
            Log.d(str11, sb15.toString());
            this.installing = false;
            return false;
        }
    }

    public boolean isInstallingPackages() {
        return this.installing;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:0x003d, code lost:
        if (r5 != null) goto L_0x003f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:?, code lost:
        r5.close();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0047, code lost:
        if (r5 != null) goto L_0x003f;
     */
    /* JADX WARNING: Removed duplicated region for block: B:27:0x004d A[SYNTHETIC, Splitter:B:27:0x004d] */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:21:0x0044=Splitter:B:21:0x0044, B:15:0x003a=Splitter:B:15:0x003a} */
    public File makeThumbnail(Bitmap bitmap, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("");
        sb.append(i);
        File file = new File(getThumbnailOutputPath(sb.toString()));
        FileOutputStream fileOutputStream = null;
        try {
            file.createNewFile();
            FileOutputStream fileOutputStream2 = new FileOutputStream(file);
            try {
                bitmap.compress(CompressFormat.PNG, 100, fileOutputStream2);
            } catch (FileNotFoundException e) {
                e = e;
                fileOutputStream = fileOutputStream2;
                e.printStackTrace();
            } catch (IOException e2) {
                e = e2;
                fileOutputStream = fileOutputStream2;
                try {
                    e.printStackTrace();
                } catch (Throwable th) {
                    th = th;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException unused) {
                        }
                    }
                    throw th;
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream = fileOutputStream2;
                if (fileOutputStream != null) {
                }
                throw th;
            }
            try {
                fileOutputStream2.close();
            } catch (IOException unused2) {
            }
        } catch (FileNotFoundException e3) {
            e = e3;
            e.printStackTrace();
        } catch (IOException e4) {
            e = e4;
            e.printStackTrace();
        }
        return file;
    }

    public void uninstallFromAssetStoreApp() {
        String[] list;
        String str = assetStoreRootPath;
        File file = new File(str);
        if (file.isDirectory()) {
            for (String str2 : file.list()) {
                if (str2.endsWith(".del")) {
                    String substring = str2.substring(0, str2.length() - 4);
                    String str3 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("uninstallFromAssetStoreApp idx=");
                    sb.append(substring);
                    Log.d(str3, sb.toString());
                    try {
                        uninstallPackage(Integer.parseInt(substring));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    new File(str, str2).delete();
                }
            }
        }
    }

    public int uninstallPackage(int i) throws Exception {
        return uninstallPackage(i, true);
    }
}
