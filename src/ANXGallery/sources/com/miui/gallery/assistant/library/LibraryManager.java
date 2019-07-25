package com.miui.gallery.assistant.library;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.ContentValues;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.AsyncTask;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.assistant.library.Library.LibraryStatus;
import com.miui.gallery.card.CardManager;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.dao.GalleryEntityManager;
import com.miui.gallery.dao.base.Entity;
import com.miui.gallery.net.base.RequestError;
import com.miui.gallery.net.library.LibraryDownloadManager;
import com.miui.gallery.net.library.LibraryRequest;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.CancelListener;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.xiaomi.micloudsdk.request.utils.CloudUtils;
import java.io.File;
import java.util.HashSet;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

public class LibraryManager {
    /* access modifiers changed from: private */
    public static final String TAG = "LibraryManager";
    /* access modifiers changed from: private */
    public final CountDownLatch mCountDownLatch;
    private final Map<Long, Library> mCurrentLibraries;
    @SuppressLint({"StaticFieldLeak"})
    private final AsyncTask<Context, Void, Void> mInitTask;
    /* access modifiers changed from: private */
    public volatile boolean mInitialized;
    /* access modifiers changed from: private */
    public volatile boolean mInitializing;
    /* access modifiers changed from: private */
    public final LibraryDownloadManager mLibraryDownloadManager;
    private NetworkReceiver mNetworkReceiver;

    public interface DownloadListener {
        void onDownloadProgress(long j, int i);

        void onDownloadResult(long j, int i);
    }

    private class LibraryDownloadJob implements Job {
        private final boolean mAllowedOverMetered;
        private final Set<LibraryItem> mDownloadSet = new HashSet();
        private final Library mLibrary;
        private final DownloadListener mLibraryDownloadListener;

        LibraryDownloadJob(Library library, boolean z, DownloadListener downloadListener) {
            this.mLibrary = library;
            this.mAllowedOverMetered = z;
            this.mLibraryDownloadListener = downloadListener;
        }

        /* access modifiers changed from: private */
        public void cancel() {
            LibraryManager.this.mLibraryDownloadManager.cancel(this.mLibrary.getLibraryId());
        }

        public Object run(JobContext jobContext) {
            if (this.mLibrary.getLibraryItems() != null) {
                for (LibraryItem libraryItem : this.mLibrary.getLibraryItems()) {
                    if (!libraryItem.isExist()) {
                        this.mDownloadSet.add(libraryItem);
                    }
                }
                if (this.mDownloadSet.isEmpty()) {
                    this.mLibraryDownloadListener.onDownloadResult(this.mLibrary.getLibraryId(), 0);
                } else if (!jobContext.isCancelled()) {
                    LibraryManager.this.mLibraryDownloadManager.download(this.mLibrary.getLibraryId(), this.mAllowedOverMetered, this.mDownloadSet, this.mLibraryDownloadListener);
                } else {
                    this.mLibraryDownloadListener.onDownloadResult(this.mLibrary.getLibraryId(), 2);
                }
            } else {
                this.mLibraryDownloadListener.onDownloadResult(this.mLibrary.getLibraryId(), 1);
            }
            jobContext.setCancelListener(new CancelListener() {
                public void onCancel() {
                    LibraryDownloadJob.this.cancel();
                }
            });
            return null;
        }
    }

    private static final class LibraryManagerHolder {
        /* access modifiers changed from: private */
        public static final LibraryManager INSTANCE = new LibraryManager();
    }

    private class NetworkReceiver extends BroadcastReceiver {
        private boolean mIsNetConnected = NetworkUtils.isNetworkConnected();
        private boolean mIsWifiConnected = (!NetworkUtils.isActiveNetworkMetered());

        public NetworkReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            boolean z;
            boolean z2 = false;
            boolean z3 = !intent.getBooleanExtra("noConnectivity", false);
            if (this.mIsNetConnected != z3) {
                Log.d(LibraryManager.TAG, "NetworkReceiver lastConnect: %s, netConnect: %s", Boolean.valueOf(this.mIsNetConnected), Boolean.valueOf(z3));
                this.mIsNetConnected = z3;
                z = true;
            } else {
                z = false;
            }
            if (this.mIsNetConnected && !NetworkUtils.isActiveNetworkMetered()) {
                z2 = true;
            }
            if (this.mIsWifiConnected != z2) {
                Log.d(LibraryManager.TAG, "NetworkReceiver lastWifiConnect: %s, wifiConnect: %s", Boolean.valueOf(this.mIsWifiConnected), Boolean.valueOf(z2));
                this.mIsWifiConnected = z2;
                z = true;
            }
            if (z && this.mIsWifiConnected && LibraryManager.this.tryDownloadAllLibrarys()) {
                LibraryManager.this.unRegisterNetObserver(GalleryApp.sGetAndroidContext());
            }
        }
    }

    private LibraryManager() {
        this.mInitTask = new AsyncTask<Context, Void, Void>() {
            /* access modifiers changed from: protected */
            public Void doInBackground(Context... contextArr) {
                Context context = contextArr[0];
                LibraryManager.this.initAllLibrarys();
                LibraryManager.this.mInitializing = false;
                LibraryManager.this.mInitialized = true;
                LibraryManager.this.mCountDownLatch.countDown();
                if (!LibraryManager.this.tryDownloadAllLibrarys()) {
                    LibraryManager.this.registerNetObserver(context);
                }
                return null;
            }
        };
        this.mCurrentLibraries = new ConcurrentHashMap();
        this.mLibraryDownloadManager = new LibraryDownloadManager();
        this.mCountDownLatch = new CountDownLatch(1);
    }

    private Future downloadLibraryInternal(final Library library, boolean z, final DownloadListener downloadListener) {
        AnonymousClass4 r0 = new DownloadListener() {
            public void onDownloadProgress(long j, int i) {
                downloadListener.onDownloadProgress(j, i);
            }

            public void onDownloadResult(final long j, final int i) {
                ThreadManager.getMainHandler().post(new Runnable() {
                    public void run() {
                        if (downloadListener != null) {
                            downloadListener.onDownloadResult(j, i);
                        }
                    }
                });
                switch (i) {
                    case 0:
                        if (library != null) {
                            library.setLibraryStatus(LibraryStatus.STATE_AVAILABLE);
                        }
                        DeleteLibraryTask.post();
                        LibraryManager.this.recordDownloadResult(library, "success");
                        return;
                    case 1:
                        if (library != null) {
                            library.setLibraryStatus(LibraryStatus.STATE_NOT_DOWNLOADED);
                        }
                        LibraryManager.this.recordDownloadResult(library, "cancel");
                        return;
                    case 2:
                        if (library != null) {
                            library.setLibraryStatus(LibraryStatus.STATE_NOT_DOWNLOADED);
                        }
                        LibraryManager.this.recordDownloadResult(library, "fail");
                        return;
                    default:
                        return;
                }
            }
        };
        if (library == null) {
            return null;
        }
        library.setLibraryStatus(LibraryStatus.STATE_DOWNLOADING);
        return ThreadManager.getNetworkPool().submit(new LibraryDownloadJob(library, z, r0));
    }

    private Library getCurrentLibraryById(long j) {
        Library library = (Library) this.mCurrentLibraries.get(Long.valueOf(j));
        if (library == null) {
            library = (Library) GalleryEntityManager.getInstance().find(Library.class, String.valueOf(j));
            if (library != null) {
                this.mCurrentLibraries.put(Long.valueOf(j), library);
            }
        }
        return library;
    }

    public static LibraryManager getInstance() {
        return LibraryManagerHolder.INSTANCE;
    }

    /* access modifiers changed from: private */
    public void initAllLibrarys() {
        for (Long longValue : LibraryConstants.sAllLibraries) {
            long longValue2 = longValue.longValue();
            Library currentLibraryById = getCurrentLibraryById(longValue2);
            if (currentLibraryById == null || (currentLibraryById.isOverDue() && !currentLibraryById.isLoaded())) {
                try {
                    Object[] executeSync = new LibraryRequest(longValue2).executeSync();
                    if (executeSync != null && executeSync.length > 0 && (executeSync[0] instanceof Library)) {
                        refreshServerLibraryInfo((Library) executeSync[0]);
                    }
                } catch (RequestError e) {
                    Log.e(TAG, (Throwable) e);
                }
            }
            refreshLibraryStatusInternal(longValue2);
        }
    }

    private boolean loadLibraryInternal(Library library) {
        return library != null && (library.isLoaded() || library.load());
    }

    /* access modifiers changed from: private */
    public void recordDownloadResult(Library library, String str) {
        if (library != null) {
            StringBuilder sb = new StringBuilder();
            sb.append("library_download_result_");
            sb.append(library.getLibraryId());
            GallerySamplingStatHelper.recordStringPropertyEvent("assistant", sb.toString(), str);
        }
    }

    private LibraryStatus refreshLibraryStatusInternal(long j) {
        Library library = (Library) this.mCurrentLibraries.get(Long.valueOf(j));
        if (library == null) {
            return LibraryStatus.STATE_NO_LIBRARY_INFO;
        }
        if (library.isExist()) {
            library.setLibraryStatus(library.isLoaded() ? LibraryStatus.STATE_LOADED : LibraryStatus.STATE_AVAILABLE);
        } else if (this.mLibraryDownloadManager.isLibraryDownloading(library.getLibraryId())) {
            library.setLibraryStatus(LibraryStatus.STATE_DOWNLOADING);
        } else {
            library.setLibraryStatus(LibraryStatus.STATE_NOT_DOWNLOADED);
        }
        return library.getLibraryStatus();
    }

    private void refreshServerLibraryInfo(Library library) {
        if (library != null) {
            library.setRefreshTime(System.currentTimeMillis());
            long libraryId = library.getLibraryId();
            Library library2 = (Library) this.mCurrentLibraries.get(Long.valueOf(libraryId));
            this.mCurrentLibraries.put(Long.valueOf(libraryId), library);
            if (library2 == null) {
                GalleryEntityManager.getInstance().insert((Entity) library);
            } else {
                updateLibraryToDatabase(library);
            }
        }
    }

    /* access modifiers changed from: private */
    public void registerNetObserver(Context context) {
        this.mNetworkReceiver = new NetworkReceiver();
        IntentFilter intentFilter = new IntentFilter("android.net.conn.CONNECTIVITY_CHANGE");
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE");
        context.registerReceiver(this.mNetworkReceiver, intentFilter, null, ThreadManager.getWorkHandler());
    }

    /* access modifiers changed from: private */
    public boolean tryDownloadAllLibrarys() {
        if (!this.mInitialized || !LibraryDownloadManager.checkCondition(false)) {
            return false;
        }
        boolean z = true;
        for (Long longValue : LibraryConstants.sAllLibraries) {
            long longValue2 = longValue.longValue();
            Library library = getLibrary(longValue2);
            if (library == null) {
                Log.d(TAG, "Library %d is available or no download info,no need to download now", (Object) Long.valueOf(longValue2));
            } else if (library.getLibraryStatus() == LibraryStatus.STATE_NOT_DOWNLOADED) {
                Log.d(TAG, String.format(Locale.US, "Library %d download when app start up Begin.", new Object[]{Long.valueOf(longValue2)}));
                downloadLibrary(library, false, new DownloadListener() {
                    public void onDownloadProgress(long j, int i) {
                    }

                    public void onDownloadResult(long j, int i) {
                        Log.d(LibraryManager.TAG, "Library %d download result:%d.", Long.valueOf(j), Integer.valueOf(i));
                        if (LibraryManager.this.isLibrarysExist(LibraryConstants.sStoryLibraries) && CloudUtils.getXiaomiAccount() == null) {
                            CardManager.getInstance().triggerGuaranteeScenarios(false);
                        }
                    }
                });
                z = false;
            }
        }
        return z;
    }

    /* access modifiers changed from: private */
    public void unRegisterNetObserver(Context context) {
        if (this.mNetworkReceiver != null) {
            context.unregisterReceiver(this.mNetworkReceiver);
            this.mNetworkReceiver = null;
        }
    }

    private void updateLibraryToDatabase(Library library) {
        if (library != null) {
            ContentValues contentValues = new ContentValues();
            library.onConvertToContents(contentValues);
            GalleryEntityManager.getInstance().update(Library.class, contentValues, String.format("%s=%s", new Object[]{"libraryId", Long.valueOf(library.getLibraryId())}), null);
        }
    }

    public Future downloadLibrary(Library library, boolean z, final DownloadListener downloadListener) {
        if (library == null || library.isLibraryItemInfosConsistent()) {
            return downloadLibraryInternal(library, z, downloadListener);
        }
        final long libraryId = library.getLibraryId();
        ThreadManager.getMainHandler().post(new Runnable() {
            public void run() {
                if (downloadListener != null) {
                    downloadListener.onDownloadResult(libraryId, 1);
                }
            }
        });
        return null;
    }

    public Library getLibrary(long j) {
        if (this.mInitialized) {
            return (Library) this.mCurrentLibraries.get(Long.valueOf(j));
        }
        return null;
    }

    public String getLibraryItemPath(String str) {
        File dir = GalleryApp.sGetAndroidContext().getDir("libs", 0);
        StringBuilder sb = new StringBuilder();
        sb.append(dir.getAbsolutePath());
        sb.append(File.separator);
        sb.append(str);
        return sb.toString();
    }

    public Library getLibrarySync(long j) {
        if (!this.mInitialized) {
            try {
                this.mCountDownLatch.await(1, TimeUnit.SECONDS);
            } catch (InterruptedException e) {
                Log.e(TAG, (Throwable) e);
            }
            this.mCountDownLatch.countDown();
        }
        Library library = (Library) this.mCurrentLibraries.get(Long.valueOf(j));
        if (library != null) {
            return library;
        }
        try {
            Object[] executeSync = new LibraryRequest(j).executeSync();
            if (executeSync == null || executeSync.length <= 0 || !(executeSync[0] instanceof Library)) {
                return library;
            }
            Library library2 = (Library) executeSync[0];
            try {
                refreshServerLibraryInfo(library2);
                refreshLibraryStatusInternal(j);
                return library2;
            } catch (RequestError e2) {
                e = e2;
                library = library2;
                Log.e(TAG, (Throwable) e);
                return library;
            }
        } catch (RequestError e3) {
            e = e3;
            Log.e(TAG, (Throwable) e);
            return library;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:11:0x0023, code lost:
        return;
     */
    public synchronized void init(Context context) {
        if (!this.mInitialized) {
            if (!this.mInitializing) {
                Log.d(TAG, "init");
                this.mInitializing = true;
                this.mInitTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, new Context[]{context});
            }
        }
    }

    public synchronized boolean isInitialized() {
        return this.mInitialized;
    }

    public boolean isLibrarysExist(Long[] lArr) {
        if (lArr != null && lArr.length > 0) {
            for (Long longValue : lArr) {
                Library library = getLibrary(longValue.longValue());
                if (library == null || (library.getLibraryStatus() != LibraryStatus.STATE_AVAILABLE && library.getLibraryStatus() != LibraryStatus.STATE_LOADED)) {
                    return false;
                }
            }
        }
        return true;
    }

    public boolean loadLibrary(long j) {
        return loadLibrary(new Long[]{Long.valueOf(j)});
    }

    /* JADX WARNING: Code restructure failed: missing block: B:34:0x0052, code lost:
        return false;
     */
    public synchronized boolean loadLibrary(Long[] lArr) {
        if (lArr != null) {
            if (lArr.length > 0) {
                for (Long longValue : lArr) {
                    long longValue2 = longValue.longValue();
                    Library library = getLibrary(longValue2);
                    if (library == null) {
                        return false;
                    }
                    if (library.getLibraryStatus() == LibraryStatus.STATE_LOADED) {
                        Log.d(TAG, "Library %d has been loaded, no need load again!", (Object) Long.valueOf(longValue2));
                    } else if (library.getLibraryStatus() != LibraryStatus.STATE_AVAILABLE) {
                        return false;
                    } else {
                        if (!getInstance().loadLibraryInternal(library)) {
                            return false;
                        }
                        library.setLibraryStatus(LibraryStatus.STATE_LOADED);
                    }
                }
                return true;
            }
        }
    }
}
