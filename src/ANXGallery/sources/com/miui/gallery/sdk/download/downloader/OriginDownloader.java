package com.miui.gallery.sdk.download.downloader;

import android.accounts.Account;
import android.content.ContentValues;
import android.net.Uri;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryKssManager;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.SyncConditionManager;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.util.ErrorParseUtil;
import com.miui.gallery.sdk.download.DownloadType;
import com.miui.gallery.sdk.download.assist.DownloadFailReason;
import com.miui.gallery.sdk.download.assist.DownloadItem;
import com.miui.gallery.sdk.download.assist.DownloadedItem;
import com.miui.gallery.sdk.download.assist.RequestItem;
import com.miui.gallery.sdk.download.util.DownloadUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.SecretAlbumCryptoUtils;
import com.miui.gallery.util.SpecialTypeMediaUtils;
import com.xiaomi.opensdk.file.model.MiCloudFileListener;
import java.io.File;
import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

public class OriginDownloader implements IDownloader {
    private boolean checkConditionPermitted(DownloadItem downloadItem) {
        DownloadFailReason checkCondition = DownloadUtil.checkCondition(downloadItem);
        if (checkCondition == null) {
            return true;
        }
        if (downloadItem.isStatusOk()) {
            DownloadItem.callbackError(downloadItem, checkCondition);
        }
        return false;
    }

    private static boolean checkDBImageValid(RequestItem requestItem) {
        DBImage dBImage = requestItem.mDBItem;
        if (DownloadUtil.canDownloadStatus(dBImage)) {
            return true;
        }
        if (dBImage == null) {
            fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.PARAMS_ERROR, "item null", null), null);
        } else {
            String downloadTempFilePath = DownloadUtil.getDownloadTempFilePath(dBImage, requestItem.mDownloadItem.getType());
            if (DownloadUtil.isNotSyncedStatus(dBImage)) {
                fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.NOT_SYNCED, String.format("item invalid server[%s], local[%s]", new Object[]{dBImage.getServerStatus(), Integer.valueOf(dBImage.getLocalFlag())}), null), downloadTempFilePath);
            } else {
                fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.PARAMS_ERROR, String.format("item invalid server[%s], local[%s]", new Object[]{dBImage.getServerStatus(), Integer.valueOf(dBImage.getLocalFlag())}), null), downloadTempFilePath);
            }
        }
        return false;
    }

    private static MiCloudFileListener createListener(final RequestCloudItem requestCloudItem, final RequestItem requestItem) {
        return new MiCloudFileListener() {
            public void onDataReceived(long j, long j2) {
                if (requestItem.mDownloadItem.isCancelled()) {
                    Log.i("OriginalFileDownloader", "downloading cancelled: %s", (Object) requestCloudItem.getFileName());
                    Thread.currentThread().interrupt();
                    return;
                }
                if (SyncConditionManager.check(requestCloudItem.priority) != 0) {
                    Log.i("OriginalFileDownloader", "net work is changed, interrupt this thread item: %s", (Object) requestCloudItem.getFileName());
                    Thread.currentThread().interrupt();
                }
                requestCloudItem.mDownloadedSize = j;
                requestCloudItem.mTotalSize = j2;
                DownloadItem.callbackProgress(requestItem.mDownloadItem, j, j2);
            }

            public void onDataSended(long j, long j2) {
            }
        };
    }

    private boolean doPostOriginDownloadWork(RequestItem requestItem, RequestCloudItem requestCloudItem, String str, long j) {
        boolean z;
        if (!DownloadUtil.isOriginalFileValid(str, requestCloudItem.dbCloud, true)) {
            Log.d("OriginalFileDownloader", "Downloaded original file [%s] is invalid", (Object) str);
            fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.SERVER_ERROR, String.format("Downloaded original file [%s] is invalid", new Object[]{str}), null), str);
            return false;
        }
        DownloadUtil.statDownloadSuccess(requestItem, j, requestItem.mDBItem.getSize());
        ErrorCode ensureDownloadFolder = DownloadUtil.ensureDownloadFolder(requestCloudItem.dbCloud, requestItem.mDownloadItem.getType());
        if (ensureDownloadFolder != ErrorCode.NO_ERROR) {
            String downloadFolderPath = DownloadUtil.getDownloadFolderPath(requestCloudItem.dbCloud, requestItem.mDownloadItem.getType());
            Log.d("OriginalFileDownloader", "Cannot create folder [%s] to download", (Object) downloadFolderPath);
            fireFailEvent(requestItem, new DownloadFailReason(ensureDownloadFolder, String.format("Cannot create folder [%s] to download", new Object[]{downloadFolderPath}), null), str);
            return false;
        }
        String downloadFilePath = DownloadUtil.getDownloadFilePath(requestCloudItem.dbCloud, requestItem.mDownloadItem.getType());
        if (TextUtils.isEmpty(downloadFilePath)) {
            Log.d("OriginalFileDownloader", "Cannot find valid download path for image [%s]", (Object) requestItem.mDBItem);
            fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.UNKNOWN, String.format("Cannot find valid download path for image [%s]", new Object[]{requestItem.mDBItem}), null), str);
            return false;
        }
        if (!requestItem.mDBItem.isSecretItem()) {
            z = FileUtils.move(new File(str), new File(downloadFilePath));
        } else {
            z = SecretAlbumCryptoUtils.encrypt(str, downloadFilePath, requestItem.mDBItem.isVideoType(), requestItem.mDBItem.getSecretKey());
            MediaFileUtils.deleteFileType(FileType.NORMAL, str);
        }
        if (!z) {
            Log.d("OriginalFileDownloader", "Move or encrypt failed for image [%s]", (Object) requestItem.mDBItem);
            MediaFileUtils.deleteFileType(FileType.NORMAL, downloadFilePath);
            fireFailEvent(requestItem, new DownloadFailReason(ErrorCode.FILE_OPERATE_ERROR, String.format("Move or encrypt failed for image [%s]", new Object[]{requestItem.mDBItem}), null), str);
            return false;
        } else if (requestItem.mDownloadItem.isCancelled()) {
            Log.d("OriginalFileDownloader", "downloading for image[%s] is cancelled", (Object) requestItem.mDBItem);
            MediaFileUtils.deleteFileType(FileType.NORMAL, downloadFilePath);
            return false;
        } else {
            if (!(!requestItem.mDownloadItem.isManual() || !CloudControlStrategyHelper.getSyncStrategy().isFrontForManualDownload())) {
                Log.d("OriginalFileDownloader", "front for manual downloading %s", (Object) requestItem.mDBItem.getFileName());
            } else if (requestItem.mDBItem.getMixedDateTime() > 0 && !FileUtils.setLastModified(downloadFilePath, requestItem.mDBItem.getMixedDateTime())) {
                Log.w("OriginalFileDownloader", "set last modified error");
            }
            DBImage dBItemForUri = requestItem.mDownloadItem.getUriAdapter().getDBItemForUri(requestItem.mDownloadItem.getUri());
            if (!checkDBImageValid(new RequestItem(requestItem.mDownloadItem, dBItemForUri))) {
                Log.d("OriginalFileDownloader", "DBImage [%s] is invalid after download file for uri [%s] finished", dBItemForUri, requestItem.mDownloadItem.getUri());
                MediaFileUtils.deleteFileType(FileType.NORMAL, downloadFilePath);
                DownloadUtil.persistDownloadStatus(requestItem.mDBItem, 0);
                return false;
            }
            ContentValues contentValues = new ContentValues();
            if (!requestItem.mDBItem.isSecretItem()) {
                String checkAndReturnValidFilePathForType = DownloadUtil.checkAndReturnValidFilePathForType(requestItem.mDBItem, DownloadType.THUMBNAIL);
                if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType) && !checkAndReturnValidFilePathForType.equalsIgnoreCase(downloadFilePath)) {
                    Log.d("OriginalFileDownloader", "Delete thumbnail [%s] of image [%s], because we already have original file", checkAndReturnValidFilePathForType, requestItem.mDBItem);
                    MediaFileUtils.deleteFileType(FileType.THUMBNAIL, checkAndReturnValidFilePathForType);
                }
                if (!TextUtils.isEmpty(requestItem.mDBItem.getThumbnailFile())) {
                    Log.d("OriginalFileDownloader", "Delete thumbnail record [%s] of image [%s], because we already have original file", requestItem.mDBItem.getThumbnailFile(), requestItem.mDBItem);
                    requestItem.mDBItem.setThumbnailFile(null);
                    contentValues.putNull("thumbnailFile");
                }
            }
            requestItem.mDBItem.setLocalFile(downloadFilePath);
            contentValues.put("localFile", downloadFilePath);
            if (!requestItem.mDBItem.isSecretItem()) {
                if (requestItem.mDBItem.isImageType()) {
                    contentValues.put("specialTypeFlags", Long.valueOf(SpecialTypeMediaUtils.parseFlagsForImage(downloadFilePath)));
                } else if (requestItem.mDBItem.isVideoType()) {
                    contentValues.put("specialTypeFlags", Long.valueOf(SpecialTypeMediaUtils.parseFlagsForVideo(downloadFilePath)));
                }
            }
            Uri baseUri = requestItem.mDBItem.getBaseUri();
            if (requestItem.mDownloadItem.isManual()) {
                baseUri = baseUri.buildUpon().appendQueryParameter("requireNotifyUri", "true").build();
            }
            if (CloudUtils.updateToLocalDB(baseUri, contentValues, requestItem.mDBItem.getId()) <= 0) {
                Log.d("OriginalFileDownloader", "Update database failed after download original file for image [%s]", (Object) requestItem.mDBItem);
                MediaFileUtils.deleteFileType(FileType.NORMAL, downloadFilePath);
                return false;
            }
            if (!requestItem.mDBItem.isSecretItem()) {
                MediaFileUtils.triggerMediaScan(true, new File(downloadFilePath));
            }
            return true;
        }
    }

    private static void fireFailEvent(RequestItem requestItem, DownloadFailReason downloadFailReason, String str) {
        Log.d("OriginalFileDownloader", "download fail %s", (Object) downloadFailReason);
        if (downloadFailReason.getCause() != null) {
            Log.e("OriginalFileDownloader", downloadFailReason.getCause());
        }
        MediaFileUtils.deleteFileType(FileType.NORMAL, str);
        if (requestItem.mDownloadItem.isStatusOk()) {
            DownloadItem.callbackError(requestItem.mDownloadItem, downloadFailReason);
        }
        DownloadUtil.statDownloadError(requestItem, null, downloadFailReason);
    }

    private static DownloadedItem packageDownloadedItem(DBImage dBImage) {
        return new DownloadedItem(dBImage.getLocalFile(), dBImage.isSecretItem() ? dBImage.getSecretKeyNoGenerate() : null);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:52:0x015c, code lost:
        if (r10.mDownloadItem.isManual() != false) goto L_0x015e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x01c2, code lost:
        if (r10.mDownloadItem.isManual() != false) goto L_0x015e;
     */
    /* JADX WARNING: Removed duplicated region for block: B:78:0x01d3 A[Catch:{ all -> 0x01c7, all -> 0x01f9 }] */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x01eb A[Catch:{ all -> 0x01c7, all -> 0x01f9 }] */
    public void download(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, List<DownloadItem> list) {
        String str;
        List<DownloadItem> list2 = list;
        if (list2 != null && list.size() > 0) {
            Log.d("OriginalFileDownloader", "Start downloading items [%s] total count %d", list2, Integer.valueOf(list.size()));
            for (DownloadItem downloadItem : list) {
                if (!checkConditionPermitted(downloadItem)) {
                    Log.d("OriginalFileDownloader", "Download condition not ok type %s", (Object) downloadItem.getType());
                } else {
                    ReentrantLock uriLock = downloadItem.getUriLock();
                    if (uriLock.isLocked()) {
                        Log.d("OriginalFileDownloader", "%s wait lock", (Object) downloadItem);
                    }
                    uriLock.lock();
                    DBImage dBItemForUri = downloadItem.getUriAdapter().getDBItemForUri(downloadItem.getUri());
                    Log.d("OriginalFileDownloader", "Start downloading origin file for uri [%s] size [%d]", downloadItem.getUri(), Long.valueOf(dBItemForUri != null ? dBItemForUri.getSize() : -1));
                    RequestItem requestItem = new RequestItem(downloadItem, dBItemForUri);
                    String checkAndReturnValidFilePathForType = DownloadUtil.checkAndReturnValidFilePathForType(dBItemForUri, downloadItem.getType());
                    if (!TextUtils.isEmpty(checkAndReturnValidFilePathForType)) {
                        if (requestItem.mDBItem.getMixedDateTime() > 0) {
                            FileUtils.setLastModified(checkAndReturnValidFilePathForType, requestItem.mDBItem.getMixedDateTime());
                        }
                        Log.d("OriginalFileDownloader", "Original file for id %s already exist, no need to download again", (Object) requestItem.mDBItem.getId());
                        if (downloadItem.compareAnsSetStatus(0, 3)) {
                            DownloadUtil.persistDownloadStatus(requestItem);
                            DownloadItem.callbackSuccess(downloadItem, packageDownloadedItem(dBItemForUri));
                        }
                    } else if (!checkDBImageValid(requestItem)) {
                        Log.d("OriginalFileDownloader", "Invalid dbImage [%s] for download uri [%s]!", dBItemForUri, downloadItem.getUri());
                    } else {
                        RequestCloudItem requestCloudItem = new RequestCloudItem(requestItem.mDownloadItem.getType().getPriority(), requestItem.mDBItem);
                        if (!requestItem.mDownloadItem.isStatusOk()) {
                            Log.d("OriginalFileDownloader", "Item %s status %s", requestItem.mDownloadItem.getKey(), Integer.valueOf(requestItem.mDownloadItem.getStatus()));
                        } else {
                            if (requestItem.mDownloadItem.isManual()) {
                                DownloadUtil.persistDownloadStatus(requestItem.mDBItem, 1);
                            }
                            if (Thread.currentThread().isInterrupted()) {
                                Log.d("OriginalFileDownloader", "Origin download thread is interrupted!");
                                uriLock.unlock();
                                return;
                            }
                            long currentTimeMillis = System.currentTimeMillis();
                            try {
                                ErrorCode ensureDownloadTempFolder = DownloadUtil.ensureDownloadTempFolder(requestCloudItem.dbCloud, downloadItem.getType());
                                if (ensureDownloadTempFolder != ErrorCode.NO_ERROR) {
                                    Log.d("OriginalFileDownloader", "Failed to create temp download folder [%s] for image [%s]", (Object) DownloadUtil.getDownloadTempFolderPath(requestCloudItem.dbCloud, downloadItem.getType()));
                                    fireFailEvent(requestItem, new DownloadFailReason(ensureDownloadTempFolder, "Failed to create temp download folder", null), null);
                                } else {
                                    str = DownloadUtil.getDownloadTempFilePath(requestCloudItem.dbCloud, downloadItem.getType());
                                    try {
                                        if (requestItem.mDBItem.isShareItem()) {
                                            GalleryKssManager.doSharerDownload(requestCloudItem, str, createListener(requestCloudItem, requestItem));
                                        } else {
                                            GalleryKssManager.doOwnerDownload(requestCloudItem, str, createListener(requestCloudItem, requestItem));
                                        }
                                        Log.d("OriginalFileDownloader", "Done downloading temp file [%s] for image [%s]", str, requestItem.mDBItem);
                                        if (doPostOriginDownloadWork(requestItem, requestCloudItem, str, currentTimeMillis)) {
                                            if (requestItem.mDownloadItem.compareAnsSetStatus(0, 3)) {
                                                DownloadItem.callbackSuccess(requestItem.mDownloadItem, packageDownloadedItem(requestItem.mDBItem));
                                            }
                                            Log.d("OriginalFileDownloader", "Successfully complete origin download work for image [%s]!", (Object) requestItem.mDBItem);
                                        } else {
                                            Log.d("OriginalFileDownloader", "Error occurred when doing post origin download work for image [%s]!", (Object) requestItem.mDBItem);
                                        }
                                    } catch (Throwable th) {
                                        th = th;
                                        try {
                                            if (checkConditionPermitted(requestItem.mDownloadItem)) {
                                                fireFailEvent(requestItem, new DownloadFailReason(ErrorParseUtil.parseError(th, str), th.getMessage(), th), str);
                                            }
                                            if (requestItem.mDownloadItem.isManual()) {
                                                DownloadUtil.persistDownloadStatus(requestItem);
                                            }
                                            uriLock.unlock();
                                        } catch (Throwable th2) {
                                            uriLock.unlock();
                                            throw th2;
                                        }
                                    }
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                str = null;
                                if (checkConditionPermitted(requestItem.mDownloadItem)) {
                                }
                                if (requestItem.mDownloadItem.isManual()) {
                                }
                                uriLock.unlock();
                            }
                        }
                    }
                    uriLock.unlock();
                }
            }
        }
    }
}
