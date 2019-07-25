package com.miui.gallery.cloudcontrol;

import android.content.Context;
import android.os.AsyncTask;
import android.os.Looper;
import android.os.SystemClock;
import android.text.TextUtils;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloudcontrol.FeatureProfile.Status;
import com.miui.gallery.cloudcontrol.observers.FeatureStatusObserver;
import com.miui.gallery.cloudcontrol.observers.FeatureStrategyObserver;
import com.miui.gallery.cloudcontrol.strategies.AlbumSortDateStrategy;
import com.miui.gallery.cloudcontrol.strategies.AlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.AssistantScenarioStrategy;
import com.miui.gallery.cloudcontrol.strategies.BackupPolicisStrategy;
import com.miui.gallery.cloudcontrol.strategies.BaseStrategy;
import com.miui.gallery.cloudcontrol.strategies.CloudGuideStrategy;
import com.miui.gallery.cloudcontrol.strategies.ComponentsStrategy;
import com.miui.gallery.cloudcontrol.strategies.CreationStrategy;
import com.miui.gallery.cloudcontrol.strategies.FeatureSwitchStrategy;
import com.miui.gallery.cloudcontrol.strategies.HiddenAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.IgnoreAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.LocationStrategy;
import com.miui.gallery.cloudcontrol.strategies.PhotoPrintStrategy;
import com.miui.gallery.cloudcontrol.strategies.ScannerStrategy;
import com.miui.gallery.cloudcontrol.strategies.SearchStrategy;
import com.miui.gallery.cloudcontrol.strategies.ServerReservedAlbumNamesStrategy;
import com.miui.gallery.cloudcontrol.strategies.ServerUnModifyAlbumsStrategy;
import com.miui.gallery.cloudcontrol.strategies.SyncStrategy;
import com.miui.gallery.cloudcontrol.strategies.UploadSupportedFileTypeStrategy;
import com.miui.gallery.util.Log;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CountDownLatch;

public class CloudControlManager {
    /* access modifiers changed from: private */
    public ProfileCache mCache;
    /* access modifiers changed from: private */
    public CountDownLatch mInitDoneSignal;
    private AsyncTask<Context, Void, Void> mInitTask;
    /* access modifiers changed from: private */
    public volatile boolean mInitialized;
    /* access modifiers changed from: private */
    public volatile boolean mIsInitDone;
    private volatile boolean mIsInitStart;
    private Map<String, Class<? extends BaseStrategy>> mStrategyClassMap;

    private static class SingletonHolder {
        static final CloudControlManager INSTANCE = new CloudControlManager();
    }

    private CloudControlManager() {
        this.mInitTask = new AsyncTask<Context, Void, Void>() {
            /* access modifiers changed from: protected */
            public Void doInBackground(Context... contextArr) {
                CloudControlManager.this.registerStrategyClass();
                try {
                    long currentTimeMillis = System.currentTimeMillis();
                    CloudControlManager.this.mCache.load(contextArr[0]);
                    CloudControlManager.this.mInitialized = true;
                    Log.d("CloudControlManager", "Load cache costs %d ms.", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
                } catch (Exception e) {
                    CloudControlManager.this.mInitialized = false;
                    Log.e("CloudControlManager", "Init failed, what should not happen: %s.", (Object) e);
                } catch (Throwable th) {
                    CloudControlManager.this.mIsInitDone = true;
                    CloudControlManager.this.mInitDoneSignal.countDown();
                    throw th;
                }
                CloudControlManager.this.mIsInitDone = true;
                CloudControlManager.this.mInitDoneSignal.countDown();
                CloudControlManager.this.mCache.notifyAfterLoadFinished();
                return null;
            }
        };
        this.mInitDoneSignal = new CountDownLatch(1);
        this.mStrategyClassMap = new HashMap();
        this.mCache = new ProfileCache();
    }

    public static CloudControlManager getInstance() {
        return SingletonHolder.INSTANCE;
    }

    private boolean initialized() {
        if (this.mIsInitDone) {
            return this.mInitialized;
        }
        if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
            Log.d("CloudControlManager", "not initialized, but caller is main thread, doesn't block, stack trace:\n%s", (Object) TextUtils.join("\n\t", Thread.currentThread().getStackTrace()));
            return false;
        }
        if (!this.mIsInitStart) {
            Log.d("CloudControlManager", "start init");
            init(GalleryApp.sGetAndroidContext());
        }
        Log.d("CloudControlManager", "not initialized, waiting lock from:\n%s", (Object) TextUtils.join("\n\t", Thread.currentThread().getStackTrace()));
        try {
            long uptimeMillis = SystemClock.uptimeMillis();
            this.mInitDoneSignal.await();
            Log.d("CloudControlManager", "wait init done costs %d ms", (Object) Long.valueOf(SystemClock.uptimeMillis() - uptimeMillis));
        } catch (InterruptedException e) {
            Log.e("CloudControlManager", (Throwable) e);
        }
        Log.d("CloudControlManager", "initialized: %b", (Object) Boolean.valueOf(this.mInitialized));
        return this.mInitialized;
    }

    /* access modifiers changed from: private */
    public void registerStrategyClass() {
        this.mStrategyClassMap.clear();
        this.mStrategyClassMap.put("album-list", AlbumsStrategy.class);
        this.mStrategyClassMap.put("cloud-guide", CloudGuideStrategy.class);
        this.mStrategyClassMap.put("sync", SyncStrategy.class);
        this.mStrategyClassMap.put("server-unmodify-albums", ServerUnModifyAlbumsStrategy.class);
        this.mStrategyClassMap.put("components-list", ComponentsStrategy.class);
        this.mStrategyClassMap.put("hidden-albums", HiddenAlbumsStrategy.class);
        this.mStrategyClassMap.put("ignore-albums", IgnoreAlbumsStrategy.class);
        this.mStrategyClassMap.put("location", LocationStrategy.class);
        this.mStrategyClassMap.put("search", SearchStrategy.class);
        this.mStrategyClassMap.put("album-sort-date", AlbumSortDateStrategy.class);
        this.mStrategyClassMap.put("backup-policies", BackupPolicisStrategy.class);
        this.mStrategyClassMap.put("server-reserved-album-names", ServerReservedAlbumNamesStrategy.class);
        this.mStrategyClassMap.put("media_scanner", ScannerStrategy.class);
        this.mStrategyClassMap.put("upload-supported-file-types", UploadSupportedFileTypeStrategy.class);
        this.mStrategyClassMap.put("photo-print", PhotoPrintStrategy.class);
        this.mStrategyClassMap.put("creation", CreationStrategy.class);
        this.mStrategyClassMap.put("assistant-rules", AssistantScenarioStrategy.class);
        this.mStrategyClassMap.put("feature-switch", FeatureSwitchStrategy.class);
    }

    public void clearCloudCache() {
        if (this.mIsInitStart && initialized()) {
            this.mCache.clearCloudCache();
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0023, code lost:
        return;
     */
    public synchronized void init(Context context) {
        if (!this.mIsInitDone) {
            if (!this.mIsInitStart) {
                Log.d("CloudControlManager", "init");
                this.mIsInitStart = true;
                this.mInitTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Context[]{context});
            }
        }
    }

    public void insertToCache(FeatureProfile featureProfile) {
        if (featureProfile != null && initialized()) {
            this.mCache.insertToCloudCache(featureProfile);
        }
    }

    public Status queryFeatureStatus(String str) {
        return initialized() ? this.mCache.queryStatus(str) : Status.UNAVAILABLE;
    }

    public <T extends BaseStrategy> T queryFeatureStrategy(String str) {
        return queryFeatureStrategy(str, null);
    }

    public <T extends BaseStrategy> T queryFeatureStrategy(String str, Merger<T> merger) {
        if (initialized()) {
            if (((Class) this.mStrategyClassMap.get(str)) != null) {
                try {
                    return this.mCache.queryStrategy(str, (Class) this.mStrategyClassMap.get(str), merger);
                } catch (Exception e) {
                    Log.e("CloudControlManager", "Generic type doesn't match.");
                    e.printStackTrace();
                }
            } else {
                Log.e("CloudControlManager", "No strategy class was registered with %s.", (Object) str);
            }
        }
        return null;
    }

    public Status registerStatusObserver(String str, FeatureStatusObserver featureStatusObserver) {
        return this.mCache.registerStatusObserver(str, featureStatusObserver);
    }

    public <T extends BaseStrategy> T registerStrategyObserver(String str, Class<T> cls, Merger<T> merger, FeatureStrategyObserver<T> featureStrategyObserver) {
        return this.mCache.registerStrategyObserver(str, cls, merger, featureStrategyObserver);
    }

    public void unregisterStatusObserver(FeatureStatusObserver featureStatusObserver) {
        this.mCache.unregisterStatusObserver(featureStatusObserver);
    }

    public void unregisterStrategyObserver(FeatureStrategyObserver featureStrategyObserver) {
        this.mCache.unregisterStrategyObserver(featureStrategyObserver);
    }
}
