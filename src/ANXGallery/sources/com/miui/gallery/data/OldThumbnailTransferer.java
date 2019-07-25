package com.miui.gallery.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.google.common.collect.Sets;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.RequestCloudItem;
import com.miui.gallery.cloud.ThumbnailMetaWriter;
import com.miui.gallery.preference.GalleryPreferences.PrefKeys;
import com.miui.gallery.preference.PreferenceHelper;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.util.CryptoUtil;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.ConcatConverter;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.deprecated.Storage;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Set;

public class OldThumbnailTransferer {
    private final Set<String> mThumbnailWrittenExif;

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static OldThumbnailTransferer sInstance = new OldThumbnailTransferer();
    }

    private OldThumbnailTransferer() {
        this.mThumbnailWrittenExif = Sets.newHashSet();
    }

    static OldThumbnailTransferer getInstance() {
        return SingletonHolder.sInstance;
    }

    private boolean inThumbnailFolder(String[] strArr, String str) {
        for (String startsWithIgnoreCase : strArr) {
            if (ExtraTextUtils.startsWithIgnoreCase(str, startsWithIgnoreCase)) {
                return true;
            }
        }
        return false;
    }

    private boolean isTheSameItem(DBImage dBImage, String str) {
        try {
            String sha1 = dBImage.getSha1();
            UserCommentData userCommentData = ExifUtil.getUserCommentData(str);
            if (TextUtils.equals(sha1, userCommentData != null ? userCommentData.getSha1() : null) || TextUtils.equals(sha1, FileUtils.getSha1(str))) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean refillMetaForSecretItem(String str, DBImage dBImage) {
        boolean z;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(".tmp");
        String sb2 = sb.toString();
        if (!CryptoUtil.decryptFile(str, sb2, dBImage.getSecretKey())) {
            Log.w("OldThumbnailTransferer", "fail to decrypt file %s", str);
        } else if (!new ThumbnailMetaWriter(dBImage).write(sb2)) {
            Log.w("OldThumbnailTransferer", "fail to write meta for %s", str);
        } else if (CryptoUtil.encryptFile(sb2, str, dBImage.getSecretKey())) {
            z = true;
            Log.i("OldThumbnailTransferer", "refill meta for file %s successfully", (Object) str);
            new File(sb2).delete();
            return z;
        } else {
            Log.w("OldThumbnailTransferer", "fail to encrypt file %s", str);
        }
        z = false;
        new File(sb2).delete();
        return z;
    }

    public static void transfer(Context context) {
        if (!PreferenceHelper.getBoolean(PrefKeys.UPGRADE_OLD_THUMBNAIL_TRANSFERED, false)) {
            BackgroundJobService.startJobTransferOldThumbnail(context);
        }
    }

    private void transfer(Uri uri, int[] iArr, List<String> list, List<String> list2) {
        if (iArr[0] > 0) {
            final String[] cloudThumbnailFilePath = Storage.getCloudThumbnailFilePath();
            Context sGetAndroidContext = GalleryApp.sGetAndroidContext();
            String[] strArr = {"*"};
            String format = String.format(Locale.US, "(%s=%d OR %s=%d) AND (%s IS NULL OR %s='' OR %s='%s') AND %s!=%d AND %s NOT NULL", new Object[]{"serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "serverStatus", "serverStatus", "serverStatus", "custom", "localFlag", Integer.valueOf(2), "thumbnailFile"});
            final int[] iArr2 = iArr;
            final Uri uri2 = uri;
            final List<String> list3 = list;
            final List<String> list4 = list2;
            AnonymousClass1 r1 = new QueryHandler<Void>() {
                public Void handle(Cursor cursor) {
                    if (cursor != null) {
                        while (cursor.moveToNext() && iArr2[0] > 0) {
                            DBImage createDBImageByUri = CloudUtils.createDBImageByUri(uri2, cursor);
                            if (OldThumbnailTransferer.this.transfer(createDBImageByUri, cloudThumbnailFilePath)) {
                                int[] iArr = iArr2;
                                iArr[0] = iArr[0] - 1;
                                if (createDBImageByUri.isUbiFocus()) {
                                    list3.add(createDBImageByUri.getId());
                                    list4.add(createDBImageByUri.getServerId());
                                }
                            }
                        }
                    }
                    return null;
                }
            };
            SafeDBUtil.safeQuery(sGetAndroidContext, uri, strArr, format, (String[]) null, "mixedDateTime DESC", (QueryHandler<T>) r1);
        }
    }

    /* access modifiers changed from: private */
    public boolean transfer(DBImage dBImage, String[] strArr) {
        String id = dBImage.getId();
        String thumbnailFile = dBImage.getThumbnailFile();
        String sha1 = dBImage.getSha1();
        String downloadOriginalFilePath = RequestCloudItem.getDownloadOriginalFilePath(dBImage);
        if (!TextUtils.isEmpty(downloadOriginalFilePath)) {
            ContentValues contentValues = new ContentValues();
            contentValues.putNull("thumbnailFile");
            CloudUtils.updateToLocalDB(dBImage.getBaseUri(), contentValues, dBImage.getId());
            Log.i("OldThumbnailTransferer", "original file %s for %s exists. skip transfering", downloadOriginalFilePath, id);
            return false;
        } else if (TextUtils.isEmpty(thumbnailFile) || !inThumbnailFolder(strArr, thumbnailFile) || !new File(thumbnailFile).exists()) {
            Log.i("OldThumbnailTransferer", "skip transfering thumbnail %s for %s", thumbnailFile, id);
            return false;
        } else {
            if (dBImage.isSecretItem()) {
                if (!refillMetaForSecretItem(thumbnailFile, dBImage)) {
                    Log.e("OldThumbnailTransferer", "failed to refill meta for %s. end transfering", (Object) thumbnailFile);
                    return false;
                }
            } else if (!this.mThumbnailWrittenExif.contains(sha1)) {
                if (!new ThumbnailMetaWriter(dBImage).write(thumbnailFile)) {
                    Log.e("OldThumbnailTransferer", "failed to write exif for %s. end transfering", (Object) thumbnailFile);
                    return false;
                }
                this.mThumbnailWrittenExif.add(sha1);
            }
            String concat = FileUtils.concat(DownloadPathHelper.getDownloadFolderPath(dBImage), dBImage.isSecretItem() ? FileUtils.getFileName(thumbnailFile) : DownloadPathHelper.getThumbnailDownloadFileNameNotSecret(dBImage));
            if (!new File(concat).exists()) {
                concat = CloudUtils.copyImage(thumbnailFile, concat, dBImage.isSecretItem());
            } else if (dBImage.isSecretItem() || isTheSameItem(dBImage, concat)) {
                Log.i("OldThumbnailTransferer", "destFile %s already exists", (Object) concat);
            } else {
                Log.i("OldThumbnailTransferer", "rename before transfering %s", (Object) concat);
                CloudUtils.renameForPhotoConflict(concat);
                concat = CloudUtils.copyImage(thumbnailFile, concat, dBImage.isSecretItem());
            }
            if (TextUtils.equals(concat, thumbnailFile)) {
                Log.w("OldThumbnailTransferer", "failed to transfer %s to ", thumbnailFile, concat);
                return false;
            }
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put("thumbnailFile", concat);
            SafeDBUtil.safeUpdate(GalleryApp.sGetAndroidContext(), dBImage.getBaseUri(), contentValues2, String.format(Locale.US, "%s=?", new Object[]{"_id"}), new String[]{String.valueOf(id)});
            Log.i("OldThumbnailTransferer", "transfered %s to %s successfully", thumbnailFile, concat);
            return true;
        }
    }

    private void transferSubUbiImage(final Uri uri, String str, String str2, List<String> list, List<String> list2) {
        AnonymousClass2 r11 = new ConcatConverter<String>() {
            public String convertToString(String str) {
                if (TextUtils.isEmpty(str)) {
                    return null;
                }
                StringBuilder sb = new StringBuilder();
                sb.append("'");
                sb.append(str);
                sb.append("'");
                return sb.toString();
            }
        };
        String concatAll = GalleryUtils.concatAll(list, ",", r11);
        String concatAll2 = GalleryUtils.concatAll(list2, ",", r11);
        if (!TextUtils.isEmpty(concatAll) || !TextUtils.isEmpty(concatAll2)) {
            final String[] cloudThumbnailFilePath = Storage.getCloudThumbnailFilePath();
            String str3 = str;
            SafeDBUtil.safeQuery(GalleryDBHelper.getInstance().getReadableDatabase(), str3, new String[]{"*"}, String.format(Locale.US, "(%s IN (%s) OR %s IN (%s))", new Object[]{"ubiLocalId", concatAll, "ubiServerId", concatAll2}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                public Void handle(Cursor cursor) {
                    if (cursor != null) {
                        while (cursor.moveToNext()) {
                            OldThumbnailTransferer.this.transfer(CloudUtils.createDBImageByUri(uri, cursor), cloudThumbnailFilePath);
                        }
                    }
                    return null;
                }
            });
        }
    }

    /* access modifiers changed from: 0000 */
    public void transfer() {
        String[] cloudThumbnailFilePath;
        String[] cloudThumbnailModifiedTimeMapFilePath;
        int[] iArr = {500};
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        transfer(GalleryCloudUtils.CLOUD_URI, iArr, arrayList, arrayList2);
        ArrayList arrayList3 = arrayList;
        ArrayList arrayList4 = arrayList2;
        transferSubUbiImage(GalleryCloudUtils.OWNER_SUB_UBIFOCUS_URI, "ownerSubUbifocus", "cloud", arrayList3, arrayList4);
        arrayList.clear();
        arrayList2.clear();
        transfer(GalleryCloudUtils.SHARE_IMAGE_URI, iArr, arrayList, arrayList2);
        transferSubUbiImage(GalleryCloudUtils.SHARE_SUB_UBIFOCUS_URI, "shareSubUbifocus", "shareImage", arrayList3, arrayList4);
        for (String str : Storage.getCloudThumbnailFilePath()) {
            Log.i("OldThumbnailTransferer", "thumbnails transfered. delete old thumbnail folder: %s", (Object) str);
            MediaFileUtils.deleteFileType(FileType.FOLDER, str);
        }
        for (String str2 : Storage.getCloudThumbnailModifiedTimeMapFilePath()) {
            Log.i("OldThumbnailTransferer", "thumbnails transfered. delete thumbnail modified time file: %s", (Object) str2);
            MediaFileUtils.deleteFileType(FileType.THUMBNAIL, str2);
        }
        PreferenceHelper.putBoolean(PrefKeys.UPGRADE_OLD_THUMBNAIL_TRANSFERED, true);
    }
}
