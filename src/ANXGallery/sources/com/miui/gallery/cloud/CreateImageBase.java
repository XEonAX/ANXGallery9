package com.miui.gallery.cloud;

import android.accounts.Account;
import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.miui.gallery.cloud.base.GalleryExtendedAuthToken;
import com.miui.gallery.cloud.base.GallerySyncCode;
import com.miui.gallery.cloud.base.GallerySyncResult;
import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.cloud.control.ServerTagCache;
import com.miui.gallery.cloud.control.SyncMonitor;
import com.miui.gallery.cloud.control.UploadInfo;
import com.miui.gallery.data.DBImage;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.deprecated.Storage;
import com.xiaomi.opensdk.exception.AuthenticationException;
import com.xiaomi.opensdk.exception.RetriableException;
import com.xiaomi.opensdk.exception.UnretriableException;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;

public abstract class CreateImageBase implements Operation<DBImage> {
    protected Context mContext;

    public CreateImageBase(Context context) {
        this.mContext = context;
    }

    private int checkExifAndSha1Valid(final DBImage dBImage) throws IOException {
        long dateModified = dBImage.getDateModified();
        long size = dBImage.getSize();
        String localFile = dBImage.getLocalFile();
        File file = new File(localFile);
        String userCommentSha1 = ExifUtil.getUserCommentSha1(localFile);
        String readFileNameFromExif = CloudUtils.readFileNameFromExif(localFile);
        if (dateModified == file.lastModified() && size == file.length() && TextUtils.isEmpty(userCommentSha1) && TextUtils.isEmpty(readFileNameFromExif)) {
            return 0;
        }
        ContentValues contentValues = new ContentValues();
        if (!TextUtils.isEmpty(userCommentSha1) || !TextUtils.isEmpty(readFileNameFromExif)) {
            boolean write = new ThumbnailMetaWriter(dBImage, "", "").write(localFile);
            dBImage.setOriginInfo(userCommentSha1, readFileNameFromExif);
            if (!write) {
                return 11;
            }
            HashMap hashMap = new HashMap();
            hashMap.put("model", Build.MODEL);
            hashMap.put("version", VERSION.INCREMENTAL);
            hashMap.put("hasSha1InExif", String.valueOf(!TextUtils.isEmpty(userCommentSha1)));
            GallerySamplingStatHelper.recordCountEvent("micloud_sync", "upload_thumbnail", hashMap);
            contentValues.put("sha1", FileUtils.getSha1(localFile));
        }
        contentValues.put("size", Long.valueOf(file.length()));
        contentValues.put("dateModified", Long.valueOf(file.lastModified()));
        if (!dBImage.isVideoType()) {
            GalleryCloudUtils.putValuesForImage(localFile, contentValues);
        } else if (!GalleryCloudUtils.putValuesForVideo(localFile, contentValues)) {
            return 12;
        }
        GalleryUtils.safeUpdate(dBImage.getBaseUri(), contentValues, "_id = ? ", new String[]{dBImage.getId()});
        GalleryUtils.safeQuery(CloudUtils.getLimitUri(dBImage.getBaseUri(), 1), CloudUtils.getProjectionAll(), "_id = ? ", new String[]{dBImage.getId()}, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null && cursor.moveToFirst()) {
                    dBImage.reloadData(cursor);
                }
                return null;
            }
        });
        return 0;
    }

    private boolean isInvalidData(DBImage dBImage) {
        boolean z = false;
        if (dBImage == null || ((dBImage.getLocalFlag() != 7 && dBImage.getLocalFlag() != 8) || FileUtils.isFileExist(dBImage.getLocalFile()))) {
            return false;
        }
        DBImage item = CloudUtils.getItem(GalleryCloudUtils.CLOUD_URI, this.mContext, "_id", dBImage.getLocalGroupId());
        if (item != null && !TextUtils.isEmpty(item.getLocalFile()) && item.getLocalFile().equalsIgnoreCase(FileUtils.getParentFolderPath(StorageUtils.getRelativePath(this.mContext, dBImage.getLocalFile())))) {
            z = true;
        }
        return z;
    }

    private boolean isNormalFlag(int i) {
        return (i == -1 || i == 2) ? false : true;
    }

    private void statCannotUpload(DBImage dBImage, int i, boolean z) {
        HashMap hashMap = new HashMap();
        hashMap.put("folder", FileUtils.getParentFolderPath(dBImage.getLocalFile()));
        hashMap.put("media_type", MiscUtil.serverType2Text(dBImage.getServerType()));
        hashMap.put("error_code", String.valueOf(i));
        GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_cannot_upload_v2", hashMap);
        if (z) {
            hashMap.clear();
            hashMap.put("localFile", dBImage.getLocalFile());
            GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_invalid_data", hashMap);
        }
    }

    private void statImageCreate(DBImage dBImage, File file, long j) {
        String str = dBImage.isImageType() ? "image" : dBImage.isVideoType() ? "video" : "other";
        HashMap hashMap = new HashMap();
        hashMap.put("size", String.format(Locale.US, "%.2f", new Object[]{Float.valueOf((((float) file.length()) * 1.0f) / 1024.0f)}));
        hashMap.put("media_type", str);
        hashMap.put("time_in_seconds", String.format(Locale.US, "%.2f", new Object[]{Float.valueOf((((float) j) * 1.0f) / 1000.0f)}));
        GallerySamplingStatHelper.recordCountEvent("Sync", "sync_upload_time_one_photo_v2", hashMap);
        float currentTimeMillis = (((float) (System.currentTimeMillis() - file.lastModified())) * 1.0f) / 60000.0f;
        long j2 = Long.MAX_VALUE;
        try {
            j2 = Long.parseLong(dBImage.getAlbumId());
        } catch (NumberFormatException unused) {
        }
        HashMap hashMap2 = new HashMap();
        hashMap2.put("media_type", str);
        if (j2 <= 1000) {
            hashMap2.put("album_id", dBImage.getAlbumId());
        }
        hashMap2.put("timely_in_minutes", String.format(Locale.US, "%.2f", new Object[]{Float.valueOf(currentTimeMillis)}));
        GallerySamplingStatHelper.recordCountEvent("Sync", "sync_upload_timely_v2", hashMap2);
    }

    private void statRejectUpload(DBImage dBImage, int i) {
        HashMap hashMap = new HashMap();
        hashMap.put("folder", FileUtils.getParentFolderPath(dBImage.getLocalFile()));
        hashMap.put("error_code", String.valueOf(i));
        GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_reject_upload", hashMap);
    }

    private void statUploadError(DBImage dBImage, Exception exc, String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("media_type", MiscUtil.serverType2Text(dBImage.getServerType()));
        hashMap.put("folder", FileUtils.getParentFolderPath(dBImage.getLocalFile()));
        hashMap.put("throwable", exc.getMessage());
        hashMap.put("error", str);
        GallerySamplingStatHelper.recordErrorEvent("Sync", "sync_upload_error", hashMap);
    }

    public int checkState(RequestItemBase requestItemBase) {
        return SyncConditionManager.checkForItem(requestItemBase);
    }

    /* access modifiers changed from: protected */
    public abstract void doUpload(RequestCloudItem requestCloudItem, File file) throws RetriableException, UnretriableException, AuthenticationException, InterruptedException;

    public GallerySyncResult<DBImage> execute(Account account, GalleryExtendedAuthToken galleryExtendedAuthToken, String str, RequestItemBase requestItemBase) throws Exception {
        long currentTimeMillis = System.currentTimeMillis();
        Builder builder = new Builder();
        if (!(requestItemBase instanceof RequestCloudItem)) {
            SyncLog.e("CreateImageBase", "item is not instanceof RequestCloudItem.");
            return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
        } else if (checkState(requestItemBase) != 0) {
            SyncLog.e("CreateImageBase", "condition for create image isn't ok.");
            return builder.setCode(GallerySyncCode.CONDITION_INTERRUPTED).build();
        } else {
            RequestCloudItem requestCloudItem = (RequestCloudItem) requestItemBase;
            DBImage dBImage = requestCloudItem.dbCloud;
            SyncLog.d("CreateImageBase", "create image start %s", (Object) dBImage.getId());
            if (SyncConditionManager.checkCloudSpace(this.mContext) == 2) {
                SyncLog.e("CreateImageBase", "cloud space is full");
                return builder.setCode(GallerySyncCode.NOT_CONTINUE_ERROR).build();
            }
            DBImage dBImage2 = getDBImage(requestCloudItem);
            if (dBImage2 == null) {
                SyncLog.d("CreateImageBase", "item not exist %s", (Object) dBImage.getFileName());
                return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
            } else if (!TextUtils.equals(dBImage.getSha1(), dBImage2.getSha1())) {
                SyncLog.d("CreateImageBase", "item has changed old[%s], new[%s]", dBImage.getFileName(), dBImage2.getFileName());
                return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
            } else if (dBImage2.getLocalFlag() == 0) {
                SyncLog.d("CreateImageBase", "item already synced, id[%s], fileName[%s]", dBImage2.getId(), dBImage2.getFileName());
                return builder.setCode(GallerySyncCode.OK).setData(dBImage2).build();
            } else if (!isNormalFlag(dBImage2.getLocalFlag())) {
                SyncLog.d("CreateImageBase", "item already deleted, id[%s], fileName[%s]", dBImage2.getId(), dBImage2.getFileName());
                return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
            } else {
                int canUpload = CloudUtils.canUpload(dBImage2.getLocalFile());
                if (!(canUpload == 0)) {
                    SyncLog.d("CreateImageBase", "this type of media can't upload, id[%s], fileName[%s]", dBImage2.getId(), dBImage2.getFileName());
                    boolean isInvalidData = isInvalidData(dBImage2);
                    if (isInvalidData) {
                        SyncLog.w("CreateImageBase", "dirty data %s", dBImage2.getLocalFile());
                        CloudUtils.deleteDirty(dBImage2);
                    }
                    statCannotUpload(dBImage2, canUpload, isInvalidData);
                    return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
                }
                int checkExifAndSha1Valid = checkExifAndSha1Valid(dBImage2);
                if (!(checkExifAndSha1Valid == 0)) {
                    SyncLog.e("CreateImageBase", "reject to upload!!");
                    statRejectUpload(dBImage2, checkExifAndSha1Valid);
                    return builder.setCode(GallerySyncCode.NOT_RETRY_ERROR).build();
                }
                requestCloudItem.dbCloud = dBImage2;
                if (!TextUtils.equals(dBImage.getFileName(), dBImage2.getFileName())) {
                    SyncLog.d("CreateImageBase", "file name changed old[%s], new[%s]", dBImage.getFileName(), dBImage2.getFileName());
                }
                File file = new File(requestCloudItem.dbCloud.getLocalFile());
                try {
                    doUpload(requestCloudItem, file);
                    DBImage item = CloudUtils.getItem(dBImage2.getBaseUri(), this.mContext, "_id", dBImage2.getId());
                    if (item != null) {
                        ServerTagCache.getInstance().add(String.valueOf(item.getServerTag()));
                        String name = file.getName();
                        String fileName = item.getFileName();
                        if (TextUtils.equals(dBImage2.getOriginSha1(), item.getSha1())) {
                            SyncLog.d("CreateImageBase", "duplication is found by server, file=%s", (Object) file.getAbsolutePath());
                            MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                            ContentValues contentValues = new ContentValues();
                            contentValues.putNull("localFile");
                            contentValues.putNull("thumbnailFile");
                            Uri baseUri = dBImage2.getBaseUri();
                            StringBuilder sb = new StringBuilder();
                            sb.append("_id = ");
                            sb.append(dBImage2.getId());
                            GalleryUtils.safeUpdate(baseUri, contentValues, sb.toString(), null);
                        } else if (!TextUtils.equals(name, fileName)) {
                            CloudUtils.renameAnItemInLocal(item, fileName, name, true);
                        }
                        builder.setData(item);
                    }
                    if (Storage.startsWithFilePath(Storage.getCloudWaitUploadFilePath(), file.getAbsolutePath()) && !CloudUtils.isFileNeedUpload(file.getAbsolutePath())) {
                        MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                    }
                    SyncLog.d("CreateImageBase", "create image end %s", (Object) requestCloudItem.dbCloud.getFileName());
                    statImageCreate(dBImage2, file, System.currentTimeMillis() - currentTimeMillis);
                    SyncMonitor.getInstance().onUpload(new UploadInfo(System.currentTimeMillis() - currentTimeMillis, file.length()));
                    return builder.setCode(GallerySyncCode.OK).build();
                } catch (UnretriableException e) {
                    e.printStackTrace();
                    if (requestCloudItem.result != null) {
                        GallerySyncCode gallerySyncCode = requestCloudItem.result;
                        requestCloudItem.result = null;
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("upload error, result=");
                        sb2.append(gallerySyncCode);
                        SyncLog.e("CreateImageBase", sb2.toString());
                        statUploadError(dBImage2, e, gallerySyncCode.name());
                        GallerySyncResult<DBImage> build = builder.setCode(requestCloudItem.result).setException(e).build();
                        DBImage item2 = CloudUtils.getItem(dBImage2.getBaseUri(), this.mContext, "_id", dBImage2.getId());
                        if (item2 != null) {
                            ServerTagCache.getInstance().add(String.valueOf(item2.getServerTag()));
                            String name2 = file.getName();
                            String fileName2 = item2.getFileName();
                            if (TextUtils.equals(dBImage2.getOriginSha1(), item2.getSha1())) {
                                SyncLog.d("CreateImageBase", "duplication is found by server, file=%s", (Object) file.getAbsolutePath());
                                MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                                ContentValues contentValues2 = new ContentValues();
                                contentValues2.putNull("localFile");
                                contentValues2.putNull("thumbnailFile");
                                Uri baseUri2 = dBImage2.getBaseUri();
                                StringBuilder sb3 = new StringBuilder();
                                sb3.append("_id = ");
                                sb3.append(dBImage2.getId());
                                GalleryUtils.safeUpdate(baseUri2, contentValues2, sb3.toString(), null);
                            } else if (!TextUtils.equals(name2, fileName2)) {
                                CloudUtils.renameAnItemInLocal(item2, fileName2, name2, true);
                            }
                            builder.setData(item2);
                        }
                        return build;
                    }
                    SyncLog.e("CreateImageBase", "upload error, no result.");
                    statUploadError(dBImage2, e, "no result");
                    GallerySyncResult<DBImage> build2 = builder.setCode(GallerySyncCode.NOT_RETRY_CURRENT).setException(e).build();
                    DBImage item3 = CloudUtils.getItem(dBImage2.getBaseUri(), this.mContext, "_id", dBImage2.getId());
                    if (item3 != null) {
                        ServerTagCache.getInstance().add(String.valueOf(item3.getServerTag()));
                        String name3 = file.getName();
                        String fileName3 = item3.getFileName();
                        if (TextUtils.equals(dBImage2.getOriginSha1(), item3.getSha1())) {
                            SyncLog.d("CreateImageBase", "duplication is found by server, file=%s", (Object) file.getAbsolutePath());
                            MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                            ContentValues contentValues3 = new ContentValues();
                            contentValues3.putNull("localFile");
                            contentValues3.putNull("thumbnailFile");
                            Uri baseUri3 = dBImage2.getBaseUri();
                            StringBuilder sb4 = new StringBuilder();
                            sb4.append("_id = ");
                            sb4.append(dBImage2.getId());
                            GalleryUtils.safeUpdate(baseUri3, contentValues3, sb4.toString(), null);
                        } else if (!TextUtils.equals(name3, fileName3)) {
                            CloudUtils.renameAnItemInLocal(item3, fileName3, name3, true);
                        }
                        builder.setData(item3);
                    }
                    return build2;
                } catch (Throwable th) {
                    DBImage item4 = CloudUtils.getItem(dBImage2.getBaseUri(), this.mContext, "_id", dBImage2.getId());
                    if (item4 != null) {
                        ServerTagCache.getInstance().add(String.valueOf(item4.getServerTag()));
                        String name4 = file.getName();
                        String fileName4 = item4.getFileName();
                        if (TextUtils.equals(dBImage2.getOriginSha1(), item4.getSha1())) {
                            SyncLog.d("CreateImageBase", "duplication is found by server, file=%s", (Object) file.getAbsolutePath());
                            MediaFileUtils.deleteFileType(FileType.ORIGINAL, file);
                            ContentValues contentValues4 = new ContentValues();
                            contentValues4.putNull("localFile");
                            contentValues4.putNull("thumbnailFile");
                            Uri baseUri4 = dBImage2.getBaseUri();
                            StringBuilder sb5 = new StringBuilder();
                            sb5.append("_id = ");
                            sb5.append(dBImage2.getId());
                            GalleryUtils.safeUpdate(baseUri4, contentValues4, sb5.toString(), null);
                        } else if (!TextUtils.equals(name4, fileName4)) {
                            CloudUtils.renameAnItemInLocal(item4, fileName4, name4, true);
                        }
                        builder.setData(item4);
                    }
                    throw th;
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public abstract DBImage getDBImage(RequestCloudItem requestCloudItem);
}
