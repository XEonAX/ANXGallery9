package com.nexstreaming.nexeditorsdk.service;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.AsyncTask;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Base64;
import android.util.Log;
import com.google.gson_nex.Gson;
import com.nexstreaming.app.common.nexasset.assetpackage.InstallSourceType;
import com.nexstreaming.app.common.nexasset.assetpackage.c;
import com.nexstreaming.app.common.nexasset.store.AssetLocalInstallDB;
import com.nexstreaming.app.common.nexasset.store.AssetLocalInstallDB.internalStoreAssetInfo;
import com.nexstreaming.app.common.nexasset.store.StoreAssetInfo;
import com.nexstreaming.app.common.nexasset.store.json.AssetStoreAPIData.AssetInfo;
import com.nexstreaming.app.common.util.b;
import com.nexstreaming.app.common.util.l;
import com.nexstreaming.app.common.util.n;
import com.nexstreaming.nexeditorsdk.nexAssetPackageManager;
import com.nexstreaming.nexeditorsdk.service.INexAssetService.Stub;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class nexAssetService extends Service {
    public static final String ACTION_ASSET_FEATUREDLIST_COMPLETED = "com.nexstreaming.nexeditorsdk.asset.feathredlist.completed";
    public static final String ACTION_ASSET_INSTALL_COMPLETED = "com.nexstreaming.nexeditorsdk.asset.install.completed";
    public static final String ACTION_ASSET_UNINSTALL_COMPLETED = "com.nexstreaming.nexeditorsdk.asset.uninstall.completed";
    private static final String ACTION_BIND = "com.nexstreaming.nexeditorsdk.service.bind";
    private static final String TAG = "nexAssetService";
    private static final int TYPE_BITMAP_DATA = 1;
    private static final int TYPE_JSON_DATA = 0;
    private static final ExecutorService sInstallThreadExcutor = Executors.newSingleThreadExecutor();
    private AsyncTask<Context, Void, Void> checkReceivedFeaturedListAsyncTask;
    /* access modifiers changed from: private */
    public boolean isRunningAsyncTask;
    /* access modifiers changed from: private */
    public volatile boolean isUpdatedFeaturedList;
    /* access modifiers changed from: private */
    public volatile long lastReceivedFeaturedListTime;
    private AssetInfo mCurrentAssetInfo;
    private Bitmap mCurrentThumbnail;
    private FileOutputStream mFileOutputStream;
    private long mReceivedDataSize = 0;
    private Stub nexAssetService = new Stub() {
        public void connectInstaller(int i, String str, String str2, INexAssetConnectionCallback iNexAssetConnectionCallback) throws RemoteException {
            nexAssetService.this.onConnectionInstaller(i, str, str2, iNexAssetConnectionCallback);
        }

        public void loadInstalledAssetList(INexAssetDataCallback iNexAssetDataCallback) throws RemoteException {
            nexAssetService.this.onLoadInstalledAssetList(iNexAssetDataCallback);
        }

        public void saveAssetInfoData(int i, int i2, String str) throws RemoteException {
            nexAssetService.this.onReceivedAssetInfoData(i, i2, str);
        }

        public void sendAssetData(int i, String str, int i2, long j, INexAssetInstallCallback iNexAssetInstallCallback) throws RemoteException {
            nexAssetService.this.onReceivedAssetData(i, str, i2, j, iNexAssetInstallCallback);
        }

        public void uninstallAsset(int i, INexAssetUninstallCallback iNexAssetUninstallCallback) throws RemoteException {
            nexAssetService.this.onUninstallAsset(i, iNexAssetUninstallCallback);
        }
    };

    private static final class a extends AsyncTask<Void, Void, Boolean> {
        private Context a;
        private String b;
        private Bitmap c;
        private AssetInfo d;
        private INexAssetInstallCallback e;
        private long f = 0;
        private l g = new l();

        public a(Context context, String str, Bitmap bitmap, AssetInfo assetInfo, INexAssetInstallCallback iNexAssetInstallCallback) {
            this.g.c();
            this.g.a();
            String str2 = nexAssetService.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("InstallTask() called with: context = [");
            sb.append(context);
            sb.append("], assetPath = [");
            sb.append(str);
            sb.append("], bitmap = [");
            sb.append(bitmap);
            sb.append("], assetInfo = [");
            sb.append(assetInfo);
            sb.append("], callback = [");
            sb.append(iNexAssetInstallCallback);
            sb.append("]");
            Log.d(str2, sb.toString());
            this.a = context;
            this.b = str;
            this.c = bitmap;
            this.d = assetInfo;
            this.e = iNexAssetInstallCallback;
        }

        private void a(File file, File file2, int i) throws IOException {
            FileOutputStream fileOutputStream;
            String str = nexAssetService.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("Unzipping '");
            sb.append(file);
            sb.append("' to '");
            sb.append(file2);
            sb.append("'");
            Log.d(str, sb.toString());
            if (file2.mkdirs() || file2.exists()) {
                long length = file.length();
                long j = 0;
                ZipInputStream zipInputStream = new ZipInputStream(new FileInputStream(file));
                while (true) {
                    try {
                        ZipEntry nextEntry = zipInputStream.getNextEntry();
                        if (nextEntry != null) {
                            String name = nextEntry.getName();
                            if (!name.contains("..")) {
                                File file3 = new File(file2, name);
                                if (!nextEntry.isDirectory()) {
                                    fileOutputStream = new FileOutputStream(file3);
                                    AssetLocalInstallDB.copy(zipInputStream, fileOutputStream);
                                    b.a(fileOutputStream);
                                    j += nextEntry.getCompressedSize();
                                    double d2 = (double) j;
                                    Double.isNaN(d2);
                                    double d3 = d2 * 100.0d;
                                    double d4 = (double) length;
                                    Double.isNaN(d4);
                                    int i2 = (int) (d3 / d4);
                                    if (i2 >= 100) {
                                        i2 = 99;
                                    }
                                    a(false, i2);
                                } else if (file3.mkdirs()) {
                                    continue;
                                } else if (!file3.exists()) {
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("Failed to create directory: ");
                                    sb2.append(file3);
                                    throw new IOException(sb2.toString());
                                }
                            } else {
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("Relative paths not allowed: ");
                                sb3.append(name);
                                throw new IOException(sb3.toString());
                            }
                        } else {
                            b.a(zipInputStream);
                            String str2 = nexAssetService.TAG;
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("Unzipping DONE for: '");
                            sb4.append(file);
                            sb4.append("' to '");
                            sb4.append(file2);
                            sb4.append("'");
                            Log.d(str2, sb4.toString());
                            return;
                        }
                    } catch (Throwable th) {
                        b.a(zipInputStream);
                        throw th;
                    }
                }
            } else {
                StringBuilder sb5 = new StringBuilder();
                sb5.append("Failed to create directory: ");
                sb5.append(file2);
                throw new IOException(sb5.toString());
            }
        }

        private void a(String str) {
            if (str != null) {
                try {
                    this.e.onInstallFailed(this.d.idx, str);
                    String str2 = nexAssetService.TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("sendCompleted install asset(");
                    sb.append(this.d.idx);
                    sb.append(") error=");
                    sb.append(str);
                    Log.d(str2, sb.toString());
                } catch (RemoteException e2) {
                    e2.printStackTrace();
                }
            } else {
                this.e.onInstallCompleted(this.d.idx);
                String str3 = nexAssetService.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("sendCompleted install asset(");
                sb2.append(this.d.idx);
                sb2.append(") installed");
                Log.d(str3, sb2.toString());
            }
        }

        private void a(boolean z, int i) {
            if (!z && System.currentTimeMillis() - this.f > 1000) {
                z = true;
            }
            if (z) {
                this.f = System.currentTimeMillis();
                String str = nexAssetService.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("sendProgress() asset(");
                sb.append(this.d.idx);
                sb.append(") progress=");
                sb.append(i);
                Log.d(str, sb.toString());
                try {
                    this.e.onProgressInstall(this.d.idx, i, 100);
                } catch (RemoteException e2) {
                    e2.printStackTrace();
                }
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public Boolean doInBackground(Void... voidArr) {
            String str = nexAssetService.TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("installAsset() assetPath = [");
            sb.append(this.b);
            sb.append("]");
            Log.d(str, sb.toString());
            a(true, 0);
            com.nexstreaming.app.common.nexasset.assetpackage.b b2 = c.a(this.a).b(this.d.idx);
            if (b2 != null) {
                String str2 = nexAssetService.TAG;
                StringBuilder sb2 = new StringBuilder();
                sb2.append("already installed Asset=");
                sb2.append(this.d.idx);
                Log.d(str2, sb2.toString());
                if (b2.getInstallSourceType() == InstallSourceType.STORE) {
                    try {
                        AssetLocalInstallDB.getInstance(this.a).uninstallPackage(this.d.idx);
                    } catch (Exception e2) {
                        String message = e2.getMessage();
                        if (message == null) {
                            StringBuilder sb3 = new StringBuilder();
                            sb3.append("uninstall fail asset=");
                            sb3.append(this.d.idx);
                            message = sb3.toString();
                        }
                        new File(this.b).delete();
                        a(message);
                        return Boolean.valueOf(false);
                    }
                } else {
                    String str3 = nexAssetService.TAG;
                    StringBuilder sb4 = new StringBuilder();
                    sb4.append("installed Asset is not store type. idx=");
                    sb4.append(this.d.idx);
                    Log.d(str3, sb4.toString());
                    new File(this.b).delete();
                    StringBuilder sb5 = new StringBuilder();
                    sb5.append("installed Asset is not store type. idx=");
                    sb5.append(this.d.idx);
                    a(sb5.toString());
                    return Boolean.valueOf(false);
                }
            }
            try {
                File file = new File(this.b);
                File unzipFolder = AssetLocalInstallDB.getInstance(this.a).getUnzipFolder(this.d.idx);
                a(file, unzipFolder, this.d.idx);
                file.delete();
                File makeThumbnail = this.c != null ? AssetLocalInstallDB.getInstance(this.a).makeThumbnail(this.c, this.d.idx) : null;
                String str4 = nexAssetService.TAG;
                StringBuilder sb6 = new StringBuilder();
                sb6.append("installed Asset idx=");
                sb6.append(this.d.idx);
                sb6.append(", sdklevel=");
                sb6.append(this.d.asset_sversion);
                sb6.append(", version=");
                sb6.append(this.d.asset_version);
                Log.d(str4, sb6.toString());
                c.a(this.a).a(unzipFolder, makeThumbnail, (StoreAssetInfo) new internalStoreAssetInfo(this.d));
                a((String) null);
                return Boolean.valueOf(true);
            } catch (IOException e3) {
                e3.printStackTrace();
                String message2 = e3.getMessage();
                if (message2 == null) {
                    StringBuilder sb7 = new StringBuilder();
                    sb7.append("unzip or db update fail! asset=");
                    sb7.append(this.d.idx);
                    message2 = sb7.toString();
                }
                a(message2);
                return Boolean.valueOf(false);
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void onPostExecute(Boolean bool) {
            super.onPostExecute(bool);
            if (bool.booleanValue()) {
                Intent intent = new Intent(nexAssetService.ACTION_ASSET_INSTALL_COMPLETED);
                intent.putExtra("index", this.d.idx);
                intent.putExtra("category.alias", this.d.category_aliasName);
                this.a.sendBroadcast(intent);
                this.g.b();
                String str = nexAssetService.TAG;
                StringBuilder sb = new StringBuilder();
                sb.append("install asset(");
                sb.append(this.d.idx);
                sb.append(") time elapsed = ");
                sb.append(this.g.toString());
                Log.d(str, sb.toString());
            }
        }
    }

    private void installAsset(String str, Bitmap bitmap, AssetInfo assetInfo, INexAssetInstallCallback iNexAssetInstallCallback) {
        if (str == null || bitmap == null || bitmap.isRecycled() || assetInfo == null || iNexAssetInstallCallback == null) {
            String str2 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("installAsset fail!=");
            sb.append(str);
            Log.d(str2, sb.toString());
            if (iNexAssetInstallCallback != null) {
                try {
                    iNexAssetInstallCallback.onInstallFailed(assetInfo.idx, "component not found!");
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            }
        } else {
            a aVar = new a(this, str, bitmap, assetInfo, iNexAssetInstallCallback);
            aVar.executeOnExecutor(AsyncTask.SERIAL_EXECUTOR, new Void[0]);
        }
    }

    /* access modifiers changed from: private */
    public void onConnectionInstaller(int i, String str, String str2, INexAssetConnectionCallback iNexAssetConnectionCallback) {
        if (str != null && str2 != null && iNexAssetConnectionCallback != null) {
            byte[] decode = Base64.decode(str, 0);
            this.mCurrentThumbnail = BitmapFactory.decodeByteArray(decode, 0, decode.length);
            String str3 = TAG;
            StringBuilder sb = new StringBuilder();
            sb.append("onConnectionInstaller: make bitmap completed ");
            sb.append(this.mCurrentThumbnail);
            Log.d(str3, sb.toString());
            this.mCurrentAssetInfo = (AssetInfo) new Gson().fromJson(str2, AssetInfo.class);
            String str4 = TAG;
            StringBuilder sb2 = new StringBuilder();
            sb2.append("onConnectionInstaller: convert Asset completed ");
            sb2.append(this.mCurrentAssetInfo);
            Log.d(str4, sb2.toString());
            try {
                iNexAssetConnectionCallback.onConnectionCompleted(i);
            } catch (RemoteException e) {
                e.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: private */
    public void onLoadInstalledAssetList(INexAssetDataCallback iNexAssetDataCallback) {
        INexAssetDataCallback iNexAssetDataCallback2 = iNexAssetDataCallback;
        if (iNexAssetDataCallback2 != null) {
            Log.d(TAG, "internalLoadInstallAssetList() called");
            List<com.nexstreaming.app.common.nexasset.assetpackage.b> assetInstalledDownloadItemItems = AssetLocalInstallDB.getInstance(this).getAssetInstalledDownloadItemItems();
            if (assetInstalledDownloadItemItems == null || assetInstalledDownloadItemItems.size() <= 0) {
                try {
                    iNexAssetDataCallback2.onLoadAssetDatas(null);
                } catch (RemoteException e) {
                    e.printStackTrace();
                }
            } else {
                ArrayList arrayList = new ArrayList();
                for (com.nexstreaming.app.common.nexasset.assetpackage.b bVar : assetInstalledDownloadItemItems) {
                    if (c.a((Context) this).a(bVar)) {
                        String str = TAG;
                        StringBuilder sb = new StringBuilder();
                        sb.append("expire Asset Idx=");
                        sb.append(bVar.getAssetIdx());
                        Log.d(str, sb.toString());
                    } else {
                        int assetIdx = bVar.getAssetIdx();
                        String assetId = bVar.getAssetId();
                        String str2 = "";
                        if (bVar.getAssetName() != null) {
                            str2 = n.a((Context) this, bVar.getAssetName());
                        }
                        String str3 = str2;
                        String str4 = "";
                        if (bVar.getAssetCategory() != null) {
                            str4 = bVar.getAssetCategory().getCategoryAlias();
                        }
                        if (bVar.getAssetSubCategory() != null) {
                            str4 = bVar.getAssetSubCategory().getSubCategoryAlias();
                            if (bVar.getAssetSubCategory().getSubCategoryName() != null) {
                                str4 = n.a((Context) this, bVar.getAssetSubCategory().getSubCategoryName());
                            }
                        }
                        NexInstalledAssetItem nexInstalledAssetItem = new NexInstalledAssetItem(assetIdx, assetId, str3, str4, bVar.getThumbUrl(), bVar.getInstalledTime(), bVar.getExpireTime(), bVar.getMinVersion(), bVar.getPackageVersion());
                        arrayList.add(nexInstalledAssetItem);
                    }
                }
                try {
                    iNexAssetDataCallback2.onLoadAssetDatas(new Gson().toJson((Object) arrayList));
                } catch (RemoteException e2) {
                    e2.printStackTrace();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public void onReceivedAssetData(int i, String str, int i2, long j, INexAssetInstallCallback iNexAssetInstallCallback) {
        StringBuilder sb = new StringBuilder();
        sb.append(getFilesDir());
        sb.append(File.separator);
        sb.append(i);
        sb.append(".zip");
        String sb2 = sb.toString();
        this.mReceivedDataSize += (long) i2;
        byte[] decode = Base64.decode(str, 0);
        if (this.mFileOutputStream == null) {
            try {
                this.mFileOutputStream = new FileOutputStream(new File(sb2));
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        }
        try {
            this.mFileOutputStream.write(decode, 0, i2);
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        if (this.mReceivedDataSize == j) {
            String str2 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("onReceivedAssetData: Received Completed size ");
            sb3.append(this.mReceivedDataSize);
            Log.d(str2, sb3.toString());
            try {
                Log.d(TAG, "onReceivedAssetData: try close stream ");
                this.mFileOutputStream.close();
            } catch (IOException e3) {
                Log.d(TAG, "onReceivedAssetData: fileOutputStream close error", e3);
            }
            installAsset(sb2, this.mCurrentThumbnail, this.mCurrentAssetInfo, iNexAssetInstallCallback);
            this.mFileOutputStream = null;
            this.mCurrentAssetInfo = null;
            this.mCurrentThumbnail = null;
            this.mReceivedDataSize = 0;
        }
    }

    /* access modifiers changed from: private */
    public void onReceivedAssetInfoData(int i, int i2, String str) {
        this.lastReceivedFeaturedListTime = System.currentTimeMillis();
        if (str != null) {
            switch (i) {
                case 0:
                    if (!this.isRunningAsyncTask) {
                        this.isRunningAsyncTask = true;
                        this.isUpdatedFeaturedList = false;
                        this.checkReceivedFeaturedListAsyncTask = new AsyncTask<Context, Void, Void>() {
                            private Context b;

                            /* access modifiers changed from: protected */
                            /* renamed from: a */
                            public Void doInBackground(Context... contextArr) {
                                this.b = contextArr[0];
                                while (System.currentTimeMillis() - nexAssetService.this.lastReceivedFeaturedListTime < 1000) {
                                    String str = nexAssetService.TAG;
                                    StringBuilder sb = new StringBuilder();
                                    sb.append("onReceivedAssetInfoData() wait=");
                                    sb.append(nexAssetService.this.lastReceivedFeaturedListTime);
                                    Log.d(str, sb.toString());
                                    try {
                                        Thread.sleep(500);
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                    }
                                }
                                return null;
                            }

                            /* access modifiers changed from: protected */
                            /* renamed from: a */
                            public void onPostExecute(Void voidR) {
                                super.onPostExecute(voidR);
                                Intent intent = new Intent(nexAssetService.ACTION_ASSET_FEATUREDLIST_COMPLETED);
                                intent.putExtra("update", nexAssetService.this.isUpdatedFeaturedList);
                                this.b.sendBroadcast(intent);
                                nexAssetService.this.isUpdatedFeaturedList = false;
                                nexAssetService.this.isRunningAsyncTask = false;
                                Log.d(nexAssetService.TAG, "onReceivedAssetInfoData() End..");
                            }

                            /* access modifiers changed from: protected */
                            public void onPreExecute() {
                                super.onPreExecute();
                                Log.d(nexAssetService.TAG, "onReceivedAssetInfoData() Start..");
                            }
                        };
                        this.checkReceivedFeaturedListAsyncTask.executeOnExecutor(sInstallThreadExcutor, new Context[]{this, null, null});
                    }
                    if (!this.isUpdatedFeaturedList) {
                        this.isUpdatedFeaturedList = AssetLocalInstallDB.isUpdatedFeaturedList(i2, str);
                    }
                    AssetLocalInstallDB.saveFeaturedList(i2, str);
                    String str2 = TAG;
                    StringBuilder sb = new StringBuilder();
                    sb.append("onReceivedAssetInfoData: featuredAsset =");
                    sb.append(i2);
                    Log.d(str2, sb.toString());
                    return;
                case 1:
                    byte[] decode = Base64.decode(str.getBytes(), 0);
                    AssetLocalInstallDB.saveFeaturedThumbnail(i2, BitmapFactory.decodeByteArray(decode, 0, decode.length));
                    String str3 = TAG;
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("onReceivedAssetInfoData: bitmap index : ");
                    sb2.append(i2);
                    Log.d(str3, sb2.toString());
                    return;
                default:
                    return;
            }
        }
    }

    /* access modifiers changed from: private */
    public void onUninstallAsset(int i, INexAssetUninstallCallback iNexAssetUninstallCallback) {
        nexAssetPackageManager.getAssetPackageManager(getApplicationContext()).putUninstallItem(i);
        try {
            AssetLocalInstallDB.getInstance(getApplicationContext()).uninstallPackage(i);
            iNexAssetUninstallCallback.onUninstallCompleted(i);
        } catch (Exception e) {
            Log.w(TAG, "onUninstallAsset: error ", e);
            try {
                iNexAssetUninstallCallback.onUninstallFailed(i, e.getMessage());
            } catch (RemoteException e2) {
                Log.w(TAG, "onUninstallAsset: ", e2);
            }
        }
        Intent intent = new Intent(ACTION_ASSET_UNINSTALL_COMPLETED);
        intent.putExtra("index", i);
        sendBroadcast(intent);
    }

    public IBinder onBind(Intent intent) {
        String str = TAG;
        StringBuilder sb = new StringBuilder();
        sb.append("onBind() called with: intent = [");
        sb.append(intent);
        sb.append("]");
        Log.d(str, sb.toString());
        if (intent == null || intent.getAction() == null || !intent.getAction().equals(ACTION_BIND)) {
            return null;
        }
        if (intent.getPackage() != null) {
            Intent intent2 = new Intent();
            intent2.setPackage(getPackageName());
            intent2.setAction("com.nexstreaming.app.assetstore.sdk.service.bind");
            String str2 = intent.getPackage();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(intent.getPackage());
            sb2.append(".AssetStoreService");
            intent2.setClassName(str2, sb2.toString());
            String str3 = TAG;
            StringBuilder sb3 = new StringBuilder();
            sb3.append("onBind: ");
            sb3.append(intent2);
            Log.d(str3, sb3.toString());
            startService(intent2);
        }
        return this.nexAssetService;
    }

    public void onCreate() {
        super.onCreate();
        Log.d(TAG, "onCreate() called");
    }

    public void onDestroy() {
        super.onDestroy();
        Log.d(TAG, "onDestroy() called");
    }

    public void onTaskRemoved(Intent intent) {
        super.onTaskRemoved(intent);
        Log.d(TAG, "onTaskRemoved() called");
    }
}
