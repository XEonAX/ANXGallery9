package com.miui.gallery.sdk.download;

import android.net.Uri;
import android.util.Log;
import com.miui.gallery.cloud.AccountCache;
import com.miui.gallery.cloud.AccountCache.AccountInfo;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.sdk.SyncStatus;
import com.miui.gallery.sdk.download.adapter.BaseUriAdapter;
import com.miui.gallery.sdk.download.adapter.IUriAdapter;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.assist.DownloadItem.Builder;
import com.miui.gallery.sdk.download.assist.DownloadItemStatus;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.downloader.IDownloader;
import com.miui.gallery.sdk.download.listener.DownloadListener;
import com.miui.gallery.sdk.download.listener.DownloadProgressListener;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.FileUtils;
import java.util.LinkedList;
import java.util.concurrent.locks.ReentrantLock;

public class ImageDownloader {
    private static volatile ImageDownloader sInstance;
    private DownloadEngine mEngine = new DownloadEngine();

    private ImageDownloader() {
    }

    public static ImageDownloader getInstance() {
        if (sInstance == null) {
            synchronized (ImageDownloader.class) {
                if (sInstance == null) {
                    sInstance = new ImageDownloader();
                }
            }
        }
        return sInstance;
    }

    public void cancel(Uri uri, DownloadType downloadType) {
        this.mEngine.cancel(new Builder().setUri(uri).setType(downloadType).build());
    }

    public void cancelAll() {
        this.mEngine.cancelAll();
    }

    public void cancelAll(DownloadType downloadType) {
        this.mEngine.cancelAll(downloadType);
    }

    public boolean contains(Uri uri, DownloadType downloadType) {
        return this.mEngine.contains(new Builder().setUri(uri).setType(downloadType).build());
    }

    public DownloadOptions ensureDownloadOptions(DownloadOptions downloadOptions) {
        if (downloadOptions == null) {
            Log.d("ImageDownloader", "download options is null, use default");
            downloadOptions = this.mEngine.mDefaultDownloadOptions;
        }
        if (downloadOptions.getUriAdapter() != null) {
            return downloadOptions;
        }
        Log.d("ImageDownloader", "uri adapter is null, use default");
        return new DownloadOptions.Builder().cloneFrom(downloadOptions).setUriAdapter(new BaseUriAdapter()).build();
    }

    public DownloadItemStatus getStatusSync(Uri uri, DownloadType downloadType) {
        SyncStatus syncStatus = SyncStatus.STATUS_NONE;
        DownloadedItem downloadedItem = null;
        if (getInstance().contains(uri, downloadType)) {
            syncStatus = SyncStatus.STATUS_INIT;
        } else if (isOrigin(downloadType)) {
            DBImage dBItemForUri = new BaseUriAdapter().getDBItemForUri(uri);
            if (dBItemForUri != null) {
                String verifiedDownloadFilePathForRead = new RequestCloudItem(downloadType.getPriority(), dBItemForUri).getVerifiedDownloadFilePathForRead();
                if (FileUtils.isFileExist(verifiedDownloadFilePathForRead)) {
                    syncStatus = SyncStatus.STATUS_SUCCESS;
                    downloadedItem = new DownloadedItem(verifiedDownloadFilePathForRead, dBItemForUri.getSecretKeyNoGenerate());
                } else {
                    int downloadFileStatusFromDB = CloudUtils.getDownloadFileStatusFromDB(dBItemForUri);
                    if (2 == downloadFileStatusFromDB) {
                        downloadFileStatusFromDB = -1;
                        DownloadUtil.persistDownloadStatus(dBItemForUri, 0);
                    }
                    syncStatus = SyncStatus.toSyncStatus(downloadFileStatusFromDB);
                }
            }
        } else {
            DBImage dBItemForUri2 = new BaseUriAdapter().getDBItemForUri(uri);
            if (dBItemForUri2 != null) {
                String verifiedDownloadFilePathForRead2 = new RequestCloudItem(downloadType.getPriority(), dBItemForUri2).getVerifiedDownloadFilePathForRead();
                if (FileUtils.isFileExist(verifiedDownloadFilePathForRead2)) {
                    syncStatus = SyncStatus.STATUS_SUCCESS;
                    downloadedItem = new DownloadedItem(verifiedDownloadFilePathForRead2, dBItemForUri2.getSecretKeyNoGenerate());
                }
            }
        }
        return new DownloadItemStatus(syncStatus, downloadedItem);
    }

    public boolean isOrigin(DownloadType downloadType) {
        return downloadType != null && (downloadType == DownloadType.ORIGIN || downloadType == DownloadType.ORIGIN_FORCE);
    }

    public void load(Uri uri, DownloadType downloadType, DownloadOptions downloadOptions) {
        load(uri, downloadType, downloadOptions, null);
    }

    public void load(Uri uri, DownloadType downloadType, DownloadOptions downloadOptions, DownloadListener downloadListener) {
        load(uri, downloadType, downloadOptions, downloadListener, null);
    }

    public void load(Uri uri, DownloadType downloadType, DownloadOptions downloadOptions, DownloadListener downloadListener, DownloadProgressListener downloadProgressListener) {
        if (uri == null || downloadType == null) {
            if (downloadListener != null) {
                downloadListener.onDownloadFail(uri, downloadType, new DownloadFailReason(ErrorCode.PARAMS_ERROR, "", null));
            }
            return;
        }
        DownloadOptions ensureDownloadOptions = ensureDownloadOptions(downloadOptions);
        IUriAdapter uriAdapter = ensureDownloadOptions.getUriAdapter();
        ReentrantLock lockForUri = this.mEngine.getLockForUri(uri, downloadType);
        this.mEngine.download(new Builder().setUri(uri).setType(downloadType).setUriAdapter(uriAdapter).setUriLock(lockForUri).setDownloadListener(downloadListener).setProgressListener(downloadProgressListener).setDownloader(this.mEngine.getDownloader(downloadType)).setRequirePower(ensureDownloadOptions.isRequirePower()).setRequireCharging(ensureDownloadOptions.isRequireCharging()).setRequireWLAN(ensureDownloadOptions.isRequireWLAN()).setRequireDeviceStorage(ensureDownloadOptions.isRequireDeviceStorage()).setManual(ensureDownloadOptions.isManual()).build(), ensureDownloadOptions.isQueueFirst(), ensureDownloadOptions.isInterruptExecuting());
    }

    public DownloadedItem loadSync(Uri uri, DownloadType downloadType, DownloadOptions downloadOptions) {
        if (uri == null || downloadType == null) {
            return null;
        }
        DownloadOptions ensureDownloadOptions = ensureDownloadOptions(downloadOptions);
        IUriAdapter uriAdapter = ensureDownloadOptions.getUriAdapter();
        ReentrantLock lockForUri = this.mEngine.getLockForUri(uri, downloadType);
        IDownloader downloader = this.mEngine.getDownloader(downloadType);
        AccountInfo accountInfo = AccountCache.getAccountInfo();
        if (accountInfo == null) {
            return null;
        }
        final DownloadedItem[] downloadedItemArr = {null};
        DownloadItem build = new Builder().setUri(uri).setType(downloadType).setUriAdapter(uriAdapter).setUriLock(lockForUri).setDownloadListener(new DownloadListener() {
            public void onDownloadCancel(Uri uri, DownloadType downloadType) {
            }

            public void onDownloadFail(Uri uri, DownloadType downloadType, DownloadFailReason downloadFailReason) {
            }

            public void onDownloadStarted(Uri uri, DownloadType downloadType) {
            }

            public void onDownloadSuccess(Uri uri, DownloadType downloadType, DownloadedItem downloadedItem) {
                downloadedItemArr[0] = downloadedItem;
            }
        }).setDownloader(downloader).setRequirePower(ensureDownloadOptions.isRequirePower()).setRequireCharging(ensureDownloadOptions.isRequireCharging()).setRequireWLAN(ensureDownloadOptions.isRequireWLAN()).setRequireDeviceStorage(ensureDownloadOptions.isRequireDeviceStorage()).setManual(ensureDownloadOptions.isManual()).build();
        LinkedList linkedList = new LinkedList();
        linkedList.add(build);
        downloader.download(accountInfo.mAccount, accountInfo.mToken, linkedList);
        return downloadedItemArr[0];
    }
}
