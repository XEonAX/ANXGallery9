package com.miui.gallery.cloud.download;

import android.content.Context;
import android.net.Uri;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.Looper;
import android.os.Message;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.cloud.jobs.SyncJobService;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.preference.GalleryPreferences.CTA;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.sdk.download.DownloadOptions;
import com.miui.gallery.sdk.download.DownloadOptions.Builder;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.ImageDownloader;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.listener.DownloadListener;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.threadpool.Future;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.threadpool.ThreadPool.Job;
import com.miui.gallery.threadpool.ThreadPool.JobContext;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.deprecated.Preference;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;

public final class BatchDownloadManager implements Callback, OnConditionChangeListener {
    private static final int[] COUNT_STAGE = {20, 50, 100, 200, 500, 1000, 3000, 5000, 10000};
    /* access modifiers changed from: private */
    public static volatile boolean sHasDownloaded = false;
    private List<OnBatchDownloadListener> mBatchDownloadListeners;
    private final Object mCollectionLock;
    private final Object mDispatchLock;
    private Future mDispatchTask;
    private List<BatchItem> mDownloadItems;
    private Map<String, BatchItem> mDownloadItemsMap;
    private DownloadListener mDownloadListener;
    private ErrorCode mError;
    private List<BatchItem> mFailItems;
    /* access modifiers changed from: private */
    public Builder mOptionsBuilder;
    /* access modifiers changed from: private */
    public AtomicInteger mStatus;
    private List<BatchItem> mSuccessItems;
    private Handler mUIHandler;

    public static class BatchItem {
        public final DownloadType mType;
        public final Uri mUri;

        public BatchItem(Uri uri, DownloadType downloadType) {
            this.mUri = uri;
            this.mType = downloadType;
        }

        public static String generateKey(Uri uri, DownloadType downloadType) {
            return DownloadUtil.generateKey(uri, downloadType);
        }
    }

    private class DispatchJob implements Job {
        private final Context mContext;
        private final DownloadType mType;

        public DispatchJob(Context context, DownloadType downloadType) {
            this.mContext = context;
            this.mType = downloadType;
        }

        private boolean isValidRequest() {
            return Sync.isAutoDownload() && this.mType == BatchDownloadManager.this.getAutoDownloadType() && BatchDownloadManager.this.mStatus.get() == 0;
        }

        private List<Uri> queryDownload(Context context) {
            LinkedList linkedList = new LinkedList();
            List queryDownload = BatchDownloadUtil.queryDownload(this.mContext, this.mType, false, -1);
            if (MiscUtil.isValid(queryDownload)) {
                linkedList.addAll(queryDownload);
            }
            if (CloudControlStrategyHelper.getSyncStrategy().isAutoDownloadShare()) {
                List queryDownload2 = BatchDownloadUtil.queryDownload(this.mContext, this.mType, true, -1);
                if (MiscUtil.isValid(queryDownload2)) {
                    linkedList.addAll(queryDownload2);
                }
            }
            return linkedList;
        }

        public Object run(JobContext jobContext) {
            boolean isAppProcessInForeground = MiscUtil.isAppProcessInForeground(this.mContext);
            BatchDownloadManager.this.mOptionsBuilder.setRequireCharging(!isAppProcessInForeground);
            if (!BatchDownloadManager.this.checkCondition()) {
                Log.d("BatchDownloadManager", "condition not ok, cannot download");
                return null;
            }
            List queryDownload = queryDownload(this.mContext);
            if (MiscUtil.isValid(queryDownload)) {
                BatchDownloadManager.sHasDownloaded = false;
                if (jobContext.isCancelled() || !isValidRequest()) {
                    Log.d("BatchDownloadManager", "not auto batch download before dispatching");
                    return null;
                }
                Log.d("BatchDownloadManager", "start download %s items for %s in foreground %s", Integer.valueOf(queryDownload.size()), BatchDownloadManager.this.getAutoDownloadType(), Boolean.valueOf(isAppProcessInForeground));
                BatchDownloadManager.this.download(queryDownload, BatchDownloadManager.this.mOptionsBuilder.setRequireWLAN(true).setRequireDeviceStorage(true).setRequirePower(true).setRequireCharging(!isAppProcessInForeground).build());
                if (jobContext.isCancelled() || !isValidRequest()) {
                    Log.d("BatchDownloadManager", "not auto batch download after dispatching");
                    ImageDownloader.getInstance().cancelAll(this.mType);
                    return null;
                }
                if (BatchDownloadManager.this.mStatus.compareAndSet(0, 1)) {
                    BatchDownloadManager.this.callbackBatchProgress();
                }
                SyncJobService.scheduleJob(this.mContext, 10000);
                BatchDownloadManager.this.statStartDownload(queryDownload.size());
            } else {
                BatchDownloadManager.sHasDownloaded = true;
                BatchDownloadManager.this.statEndDownload();
                Log.d("BatchDownloadManager", "no items need download for %s", (Object) this.mType);
            }
            return null;
        }
    }

    private final class ItemDownloadListener implements DownloadListener {
        private ItemDownloadListener() {
        }

        public void onDownloadCancel(Uri uri, DownloadType downloadType) {
            BatchDownloadManager.this.onItemDownloadCancel(uri, downloadType);
        }

        public void onDownloadFail(Uri uri, DownloadType downloadType, DownloadFailReason downloadFailReason) {
            BatchDownloadManager.this.onItemDownloadFail(uri, downloadType, downloadFailReason);
        }

        public void onDownloadStarted(Uri uri, DownloadType downloadType) {
        }

        public void onDownloadSuccess(Uri uri, DownloadType downloadType, DownloadedItem downloadedItem) {
            BatchDownloadManager.this.onItemDownloadSuccess(uri, downloadType);
        }
    }

    public interface OnBatchDownloadListener {
        void onDownloadCancelled(List<BatchItem> list, List<BatchItem> list2);

        void onDownloadComplete(List<BatchItem> list, List<BatchItem> list2, ErrorCode errorCode);

        void onDownloadProgress(List<BatchItem> list, List<BatchItem> list2);
    }

    private static final class SingletonHolder {
        /* access modifiers changed from: private */
        public static final BatchDownloadManager INSTANCE = new BatchDownloadManager();
    }

    private BatchDownloadManager() {
        this.mCollectionLock = new Object();
        this.mDispatchLock = new Object();
        this.mError = ErrorCode.NO_ERROR;
        this.mStatus = new AtomicInteger(0);
        this.mBatchDownloadListeners = new ArrayList();
        this.mDownloadListener = new ItemDownloadListener();
        this.mDownloadItemsMap = new HashMap();
        this.mDownloadItems = new LinkedList();
        this.mSuccessItems = new LinkedList();
        this.mFailItems = new LinkedList();
        this.mOptionsBuilder = new Builder();
        this.mUIHandler = new Handler(Looper.getMainLooper(), this);
        DownloadObserver.getInstance().register(GalleryApp.sGetAndroidContext(), this);
    }

    private void callbackBatchCancelled() {
        callbackBatchCancelled(null);
    }

    private void callbackBatchCancelled(OnBatchDownloadListener onBatchDownloadListener) {
        this.mUIHandler.obtainMessage(3, onBatchDownloadListener).sendToTarget();
    }

    private void callbackBatchEnd() {
        callbackBatchEnd(null);
        Log.d("BatchDownloadManager", "download %s end success[%s], total[%s], error %s", getAutoDownloadType(), Integer.valueOf(this.mSuccessItems.size()), Integer.valueOf(this.mDownloadItems.size()), this.mError);
    }

    private void callbackBatchEnd(OnBatchDownloadListener onBatchDownloadListener) {
        this.mUIHandler.obtainMessage(1, onBatchDownloadListener).sendToTarget();
    }

    /* access modifiers changed from: private */
    public void callbackBatchProgress() {
        callbackBatchProgress(null);
    }

    private void callbackBatchProgress(OnBatchDownloadListener onBatchDownloadListener) {
        this.mUIHandler.obtainMessage(2, onBatchDownloadListener).sendToTarget();
    }

    public static boolean canAutoDownload() {
        return AccountCache.getAccount() != null && Sync.isAutoDownload() && Preference.sIsFirstSynced();
    }

    private void cancelTask() {
        if (this.mDispatchTask != null) {
            this.mDispatchTask.cancel();
            this.mDispatchTask = null;
        }
    }

    /* access modifiers changed from: private */
    public boolean checkCondition() {
        if (!CTA.canConnectNetwork()) {
            Log.d("BatchDownloadManager", "condition cta not allowed");
            setError(ErrorCode.NO_CTA_PERMISSION);
            return false;
        } else if (!NetworkUtils.isNetworkConnected()) {
            Log.d("BatchDownloadManager", "condition no network");
            setError(ErrorCode.NO_NETWORK);
            return false;
        } else if (NetworkUtils.isActiveNetworkMetered()) {
            Log.d("BatchDownloadManager", "condition no wifi");
            setError(ErrorCode.NO_WIFI_CONNECTED);
            return false;
        } else {
            if (this.mOptionsBuilder.build().isRequireCharging()) {
                if (!Sync.getIsPlugged()) {
                    Log.d("BatchDownloadManager", "condition not charging");
                    setError(ErrorCode.NO_CHARGING);
                    return false;
                }
            } else if (!Sync.getPowerCanSync()) {
                Log.d("BatchDownloadManager", "condition low power");
                setError(ErrorCode.POWER_LOW);
                return false;
            }
            if (!Sync.isDeviceStorageLow()) {
                return true;
            }
            Log.d("BatchDownloadManager", "condition low storage");
            setError(ErrorCode.STORAGE_LOW);
            return false;
        }
    }

    private void clearState() {
        synchronized (this.mCollectionLock) {
            this.mDownloadItemsMap.clear();
            this.mDownloadItems.clear();
            this.mSuccessItems.clear();
            this.mFailItems.clear();
            setError(ErrorCode.NO_ERROR);
        }
        this.mStatus.set(0);
    }

    private void doStopDownload() {
        synchronized (this.mDispatchLock) {
            cancelTask();
            ImageDownloader.getInstance().cancelAll(DownloadType.THUMBNAIL_BATCH);
            ImageDownloader.getInstance().cancelAll(DownloadType.ORIGIN_BATCH);
        }
    }

    /* access modifiers changed from: private */
    public void download(List<Uri> list, DownloadOptions downloadOptions) {
        DownloadType autoDownloadType = getAutoDownloadType();
        synchronized (this.mCollectionLock) {
            for (Uri uri : list) {
                BatchItem batchItem = new BatchItem(uri, autoDownloadType);
                this.mDownloadItems.add(batchItem);
                this.mDownloadItemsMap.put(BatchItem.generateKey(uri, autoDownloadType), batchItem);
            }
        }
        synchronized (this.mDispatchLock) {
            for (Uri load : list) {
                ImageDownloader.getInstance().load(load, autoDownloadType, downloadOptions, this.mDownloadListener, null);
            }
        }
    }

    /* access modifiers changed from: private */
    public DownloadType getAutoDownloadType() {
        DownloadType downloadType = Sync.getDownloadType();
        if (downloadType == DownloadType.ORIGIN) {
            downloadType = DownloadType.ORIGIN_BATCH;
        }
        return downloadType == DownloadType.THUMBNAIL ? DownloadType.THUMBNAIL_BATCH : downloadType;
    }

    public static BatchDownloadManager getInstance() {
        return SingletonHolder.INSTANCE;
    }

    private void interruptBatchDownload(Context context) {
        if (this.mStatus.compareAndSet(1, 3)) {
            Log.d("BatchDownloadManager", "interrupt batch download for %s", (Object) getAutoDownloadType());
            doStopDownload();
            callbackBatchEnd();
        }
    }

    private boolean isBatchDownloading(DownloadType downloadType) {
        boolean z;
        synchronized (this.mCollectionLock) {
            z = false;
            if ((this.mDownloadItems.size() > 0 ? ((BatchItem) this.mDownloadItems.get(0)).mType : null) == downloadType && this.mStatus.get() == 1) {
                z = true;
            }
        }
        return z;
    }

    private boolean isDownloadEnd(DownloadType downloadType) {
        boolean z;
        synchronized (this.mCollectionLock) {
            z = false;
            if ((this.mDownloadItems.size() > 0 ? ((BatchItem) this.mDownloadItems.get(0)).mType : null) == downloadType && this.mFailItems.size() + this.mSuccessItems.size() >= this.mDownloadItems.size()) {
                z = true;
            }
        }
        return z;
    }

    private boolean isValidItem(Uri uri, DownloadType downloadType) {
        return getAutoDownloadType() == downloadType && this.mDownloadItemsMap.containsKey(BatchItem.generateKey(uri, downloadType));
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0029, code lost:
        return;
     */
    public void onItemDownloadCancel(Uri uri, DownloadType downloadType) {
        synchronized (this.mCollectionLock) {
            if (isValidItem(uri, downloadType)) {
                this.mFailItems.add(new BatchItem(uri, downloadType));
                if (isDownloadEnd(downloadType) && this.mStatus.compareAndSet(1, 4)) {
                    callbackBatchEnd();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:13:0x0030, code lost:
        return;
     */
    public void onItemDownloadFail(Uri uri, DownloadType downloadType, DownloadFailReason downloadFailReason) {
        synchronized (this.mCollectionLock) {
            if (isValidItem(uri, downloadType)) {
                updateFailReason(downloadFailReason);
                this.mFailItems.add(new BatchItem(uri, downloadType));
                if (isDownloadEnd(getAutoDownloadType()) && this.mStatus.compareAndSet(1, 4)) {
                    callbackBatchEnd();
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:12:0x002d, code lost:
        return;
     */
    public void onItemDownloadSuccess(Uri uri, DownloadType downloadType) {
        synchronized (this.mCollectionLock) {
            if (isValidItem(uri, downloadType)) {
                this.mSuccessItems.add(new BatchItem(uri, downloadType));
                if (isDownloadEnd(getAutoDownloadType())) {
                    this.mStatus.set(4);
                    callbackBatchEnd();
                } else {
                    callbackBatchProgress();
                }
            }
        }
    }

    private void resumeBatchDownload(Context context) {
        if (canAutoDownload()) {
            Log.d("BatchDownloadManager", "resume batch download for %s", (Object) getAutoDownloadType());
            startBatchDownload(context, false);
        }
    }

    private void setError(ErrorCode errorCode) {
        synchronized (this.mCollectionLock) {
            this.mError = errorCode;
        }
    }

    /* access modifiers changed from: private */
    public void statEndDownload() {
        if (Preference.sIsFirstSynced() && !Sync.isEverAutoDownloaded()) {
            Log.d("BatchDownloadManager", "stat end download");
            Sync.setEverAutoDownloaded();
            HashMap hashMap = new HashMap();
            hashMap.put("timely", String.valueOf((int) ((((System.currentTimeMillis() - Sync.getAutoDownloadTime()) / 1000) / 60) / 60)));
            GallerySamplingStatHelper.recordCountEvent("Sync", String.format("sync_auto_download_%s", new Object[]{Sync.getDownloadType()}), hashMap);
        }
    }

    /* access modifiers changed from: private */
    public void statStartDownload(int i) {
        if (Preference.sIsFirstSynced() && Sync.getAutoDownloadTime() < 0) {
            Log.d("BatchDownloadManager", "stat start download");
            Sync.setAutoDownloadTime(System.currentTimeMillis());
            HashMap hashMap = new HashMap();
            hashMap.put("stage", GallerySamplingStatHelper.formatValueStage((float) i, COUNT_STAGE));
            GallerySamplingStatHelper.recordCountEvent("Sync", "sync_auto_download_weight", hashMap);
        }
    }

    private void updateFailReason(DownloadFailReason downloadFailReason) {
        if (downloadFailReason != null) {
            setError(downloadFailReason.getCode());
        }
    }

    public void download(Uri uri) {
        DownloadOptions build = this.mOptionsBuilder.setRequireWLAN(true).setRequireDeviceStorage(true).setRequirePower(true).setQueueFirst(true).build();
        LinkedList linkedList = new LinkedList();
        linkedList.add(uri);
        download(linkedList, build);
        Log.d("BatchDownloadManager", "download %s at first", (Object) uri);
    }

    public boolean handleMessage(Message message) {
        switch (message.what) {
            case 1:
                if (message.obj != null) {
                    ((OnBatchDownloadListener) message.obj).onDownloadComplete(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems), this.mError);
                } else {
                    synchronized (this.mBatchDownloadListeners) {
                        for (OnBatchDownloadListener onDownloadComplete : this.mBatchDownloadListeners) {
                            onDownloadComplete.onDownloadComplete(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems), this.mError);
                        }
                    }
                }
                return true;
            case 2:
                if (message.obj != null) {
                    ((OnBatchDownloadListener) message.obj).onDownloadProgress(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems));
                } else {
                    synchronized (this.mBatchDownloadListeners) {
                        for (OnBatchDownloadListener onDownloadProgress : this.mBatchDownloadListeners) {
                            onDownloadProgress.onDownloadProgress(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems));
                        }
                    }
                }
                return true;
            case 3:
                if (message.obj != null) {
                    ((OnBatchDownloadListener) message.obj).onDownloadCancelled(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems));
                } else {
                    synchronized (this.mBatchDownloadListeners) {
                        for (OnBatchDownloadListener onDownloadCancelled : this.mBatchDownloadListeners) {
                            onDownloadCancelled.onDownloadCancelled(Collections.unmodifiableList(this.mSuccessItems), Collections.unmodifiableList(this.mDownloadItems));
                        }
                    }
                }
                return true;
            default:
                return false;
        }
    }

    public void onConditionChanged(Context context) {
        if (checkCondition()) {
            resumeBatchDownload(context);
        } else {
            interruptBatchDownload(context);
        }
    }

    public void registerBatchDownloadListener(OnBatchDownloadListener onBatchDownloadListener) {
        synchronized (this.mBatchDownloadListeners) {
            this.mBatchDownloadListeners.add(onBatchDownloadListener);
        }
        switch (this.mStatus.get()) {
            case 1:
                callbackBatchProgress(onBatchDownloadListener);
                return;
            case 2:
                callbackBatchCancelled(onBatchDownloadListener);
                return;
            default:
                callbackBatchEnd(onBatchDownloadListener);
                return;
        }
    }

    public void startBatchDownload(Context context, boolean z) {
        DownloadType autoDownloadType = getAutoDownloadType();
        if (isBatchDownloading(autoDownloadType)) {
            Log.d("BatchDownloadManager", "batch downloading already started: %s", (Object) autoDownloadType);
        } else if (!sHasDownloaded || z) {
            clearState();
            synchronized (this.mDispatchLock) {
                doStopDownload();
                this.mDispatchTask = ThreadManager.getMiscPool().submit(new DispatchJob(context.getApplicationContext(), autoDownloadType));
            }
        } else {
            Log.d("BatchDownloadManager", "no need download because memory marker");
        }
    }

    public void stopBatchDownload(Context context) {
        Log.d("BatchDownloadManager", "stop batch download for %s", (Object) getAutoDownloadType());
        doStopDownload();
        this.mStatus.set(2);
        callbackBatchCancelled();
    }

    public void unregisterBatchDownloadListener(OnBatchDownloadListener onBatchDownloadListener) {
        synchronized (this.mBatchDownloadListeners) {
            this.mBatchDownloadListeners.remove(onBatchDownloadListener);
        }
    }
}
