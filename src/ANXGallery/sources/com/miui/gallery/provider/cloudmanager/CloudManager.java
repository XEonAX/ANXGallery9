package com.miui.gallery.provider.cloudmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.StringBuilderPrinter;
import com.miui.gallery.Config.SecretAlbumConfig;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CloudUtils.SecretAlbumUtils;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.SpaceFullHandler;
import com.miui.gallery.data.DBCloud;
import com.miui.gallery.photosapi.PhotosOemApi;
import com.miui.gallery.preference.GalleryPreferences.Album;
import com.miui.gallery.provider.AlbumManager;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.provider.GalleryContract.Cloud;
import com.miui.gallery.provider.ShareAlbumManager;
import com.miui.gallery.provider.ShareMediaManager;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.scanner.SaveToCloudUtil;
import com.miui.gallery.scanner.SaveToCloudUtil.SaveParams;
import com.miui.gallery.util.ExifUtil;
import com.miui.gallery.util.ExifUtil.UserCommentData;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.GalleryUtils;
import com.miui.gallery.util.GalleryUtils.QueryHandler;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.MediaStoreUtils;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.deleterecorder.DeleteRecord;
import com.miui.gallery.util.deleterecorder.DeleteRecorder;
import com.miui.gallery.util.logger.TimingTracing;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import miui.util.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CloudManager {
    private static final Set<String> METHODS = new HashSet();
    /* access modifiers changed from: private */
    public static final String[] PRIVATE_COPYABLE_PROJECTION = {"thumbnailFile", "downloadFile", "localFile", "microthumbfile"};
    static final String[] PROJECTION = {"_id", "groupId", "localFlag", "localGroupId", "serverId", "serverType", "fileName", "localFile", "thumbnailFile", "sha1", "ubiSubImageCount", "secretKey", "microthumbfile", "albumId", "description", "size", "dateModified", "mimeType", "title", "description", "dateTaken", "duration", "serverTag", "serverStatus", "downloadFile", "sortBy", "localImageId", "downloadFileStatus", "downloadFileTime", "mixedDateTime", "exifImageWidth", "exifImageLength", "exifOrientation", "exifGPSLatitude", "exifGPSLongitude", "exifMake", "exifModel", "exifFlash", "exifGPSLatitudeRef", "exifGPSLongitudeRef", "exifExposureTime", "exifFNumber", "exifISOSpeedRatings", "exifGPSAltitude", "exifGPSAltitudeRef", "exifGPSTimeStamp", "exifGPSDateStamp", "exifWhiteBalance", "exifFocalLength", "exifGPSProcessingMethod", "exifDateTime", "creatorId", "ubiFocusIndex", "ubiSubIndex", "editedColumns", "fromLocalGroupId", "location", "extraGPS", "address", "specialTypeFlags"};
    /* access modifiers changed from: private */
    public static final String[] PUBLIC_COPYABLE_PROJECTION = {"fileName", "dateTaken", "dateModified", "description", "serverType", "size", "mimeType", "title", "sha1", "duration", "appKey", "babyInfoJson", "mixedDateTime", "location", "extraGPS", "address", "exifImageWidth", "exifImageLength", "exifOrientation", "exifGPSLatitude", "exifGPSLongitude", "exifMake", "exifModel", "exifFlash", "exifGPSLatitudeRef", "exifGPSLongitudeRef", "exifExposureTime", "exifFNumber", "exifISOSpeedRatings", "exifGPSAltitude", "exifGPSAltitudeRef", "exifGPSTimeStamp", "exifGPSDateStamp", "exifWhiteBalance", "exifFocalLength", "exifGPSProcessingMethod", "exifDateTime", "ubiSubImageCount", "ubiFocusIndex", "ubiSubIndex", "specialTypeFlags"};
    private static final String[] QUERY_BY_PATH_PROJECTION = {"_id", "sha1", "size"};

    private static class AddRemoveFavoritesById extends AddRemoveFavoritesBySha1 {
        private long mId;

        public AddRemoveFavoritesById(Context context, ArrayList<Long> arrayList, int i, long j) {
            super(context, arrayList, i, null);
            this.mId = j;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            Cursor cursor2 = null;
            try {
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                cursor = sQLiteDatabase2.query("cloud", CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(this.mId)}, null, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            this.mSha1 = cursor.getString(9);
                            MiscUtil.closeSilently(cursor);
                            return super.prepare(sQLiteDatabase);
                        }
                    } catch (Exception unused) {
                        MiscUtil.closeSilently(cursor);
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        cursor2 = cursor;
                        MiscUtil.closeSilently(cursor2);
                        throw th;
                    }
                }
                MiscUtil.closeSilently(cursor);
                return null;
            } catch (Exception unused2) {
                cursor = null;
                MiscUtil.closeSilently(cursor);
                return null;
            } catch (Throwable th2) {
                th = th2;
                MiscUtil.closeSilently(cursor2);
                throw th;
            }
        }

        public String toString() {
            Locale locale = Locale.US;
            String str = "%s favorites by id: [%d]";
            Object[] objArr = new Object[2];
            objArr[0] = this.mOperationType == 1 ? "Add to" : "Remove from";
            objArr[1] = Long.valueOf(this.mId);
            return String.format(locale, str, objArr);
        }
    }

    private static class AddRemoveFavoritesByPath extends AddRemoveFavoritesBySha1 {
        private String mPath;

        public AddRemoveFavoritesByPath(Context context, ArrayList<Long> arrayList, int i, String str) {
            super(context, arrayList, i, null);
            this.mPath = str;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            try {
                cursor = CloudManager.queryCloudItemByFilePath(this.mContext, sQLiteDatabase, this.mPath);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            boolean z = false;
                            if (cursor.getExtras() != null && cursor.getExtras().getBoolean("is_thumbnail", false)) {
                                z = true;
                            }
                            if (z || cursor.getLong(2) == FileUtils.getFileSize(this.mPath)) {
                                this.mSha1 = cursor.getString(1);
                                MiscUtil.closeSilently(cursor);
                                return super.prepare(sQLiteDatabase);
                            }
                            Log.e("CloudManager", "file size not equals, can not favorite: %s", (Object) this.mPath);
                            MiscUtil.closeSilently(cursor);
                            return null;
                        }
                    } catch (Exception e) {
                        e = e;
                        try {
                            Log.e("CloudManager", (Throwable) e);
                            MiscUtil.closeSilently(cursor);
                            return null;
                        } catch (Throwable th) {
                            th = th;
                            MiscUtil.closeSilently(cursor);
                            throw th;
                        }
                    }
                }
                MiscUtil.closeSilently(cursor);
                return null;
            } catch (Exception e2) {
                e = e2;
                cursor = null;
                Log.e("CloudManager", (Throwable) e);
                MiscUtil.closeSilently(cursor);
                return null;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }

        public String toString() {
            Locale locale = Locale.US;
            String str = "%s favorites by path: %s";
            Object[] objArr = new Object[2];
            objArr[0] = this.mOperationType == 1 ? "Add to" : "Remove from";
            objArr[1] = this.mPath;
            return String.format(locale, str, objArr);
        }
    }

    private static class AddRemoveFavoritesBySha1 extends CursorTask {
        protected int mOperationType;
        protected String mSha1;

        public AddRemoveFavoritesBySha1(Context context, ArrayList<Long> arrayList, int i, String str) {
            super(context, arrayList);
            this.mOperationType = i;
            this.mSha1 = str;
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:17:0x0073 A[Catch:{ all -> 0x0055 }] */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            Cursor cursor;
            long j;
            long currentTimeMillis = System.currentTimeMillis();
            ContentValues contentValues = new ContentValues();
            contentValues.put("dateFavorite", Long.valueOf(currentTimeMillis));
            contentValues.put("isFavorite", Integer.valueOf(this.mOperationType == 1 ? 1 : 0));
            try {
                cursor = sQLiteDatabase.query("favorites", new String[]{"_id"}, "sha1 = ?", new String[]{this.mSha1}, null, null, null);
                if (cursor != null) {
                    try {
                        if (cursor.getCount() > 0) {
                            j = (long) sQLiteDatabase.update("favorites", contentValues, "sha1 = ?", new String[]{this.mSha1});
                            if (j > 0) {
                                if (this.mOperationType == 1) {
                                    mediaManager.insertToFavorites(this.mSha1);
                                } else {
                                    mediaManager.removeFromFavorites(this.mSha1);
                                }
                                String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(-1);
                                sQLiteDatabase.execSQL(String.format("update %s set %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s='%s'", new Object[]{"cloud", "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, "sha1", this.mSha1}));
                            }
                            MiscUtil.closeSilently(cursor);
                            return j;
                        }
                    } catch (Throwable th) {
                        th = th;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                }
                contentValues.put("sha1", this.mSha1);
                contentValues.put("source", Integer.valueOf(1));
                j = sQLiteDatabase.insert("favorites", null, contentValues);
                if (j > 0) {
                }
                MiscUtil.closeSilently(cursor);
                return j;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "sha1 = ? AND serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (localGroupId!=-1000)", new String[]{this.mSha1}, null, null, null);
        }

        public String toString() {
            Locale locale = Locale.US;
            String str = "%s favorites by sha1: %s";
            Object[] objArr = new Object[2];
            objArr[0] = this.mOperationType == 1 ? "Add to" : "Remove from";
            objArr[1] = this.mSha1;
            return String.format(locale, str, objArr);
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            long verify = super.verify(sQLiteDatabase);
            return verify != -1 ? verify : (!this.mCursor.isNull(4) || new CheckPostProcessing(this.mContext, this.mCursor.getString(7)).run(sQLiteDatabase, null) != -111) ? -1 : -111;
        }
    }

    private static class AddToSecret extends CursorTask {
        private long mMediaId;

        public AddToSecret(Context context, ArrayList<Long> arrayList, long j) {
            super(context, arrayList);
            this.mMediaId = j;
        }

        private long addFilePath(ContentValues contentValues, boolean z) {
            String str;
            boolean z2;
            contentValues.put("microthumbfile", this.mCursor.getString(12));
            String addPostfixToFileName = z ? DownloadPathHelper.addPostfixToFileName(this.mCursor.getString(6), String.valueOf(System.currentTimeMillis())) : this.mCursor.getString(6);
            contentValues.put("fileName", addPostfixToFileName);
            String string = this.mCursor.getString(7);
            String safePathInPriorStorage = StorageUtils.getSafePathInPriorStorage(StorageUtils.DIRECTORY_SECRET_ALBUM_PATH);
            if (FileUtils.isFileExist(string)) {
                String encodeFileName = SecretAlbumUtils.encodeFileName(addPostfixToFileName, this.mCursor.getInt(5) == 2);
                if (!TextUtils.equals(addPostfixToFileName, encodeFileName) || z) {
                    File file = new File(FileUtils.getParentFolderPath(string), encodeFileName);
                    if (FileUtils.move(new File(string), file)) {
                        string = file.getAbsolutePath();
                    } else {
                        Log.e("CloudManager", "Failed to move name conflict item %s to %s", string, encodeFileName);
                        HashMap hashMap = new HashMap();
                        hashMap.put("detail", "local file rename conflict file");
                        hashMap.put("src", string);
                        hashMap.put("des", file.getAbsolutePath());
                        GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_failed_bc_file_operation_failed", hashMap);
                        return -113;
                    }
                }
                if (!FileUtils.contains(safePathInPriorStorage, string)) {
                    String moveImageToFolder = CloudUtils.moveImageToFolder(string, safePathInPriorStorage, true);
                    if (!FileUtils.contains(safePathInPriorStorage, moveImageToFolder)) {
                        Log.e("CloudManager", "Failed to move item %s to secret folder", (Object) string);
                        HashMap hashMap2 = new HashMap();
                        hashMap2.put("detail", "local file move failed to secret folder");
                        hashMap2.put("src", string);
                        hashMap2.put("des", safePathInPriorStorage);
                        GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_failed_bc_file_operation_failed", hashMap2);
                        return -113;
                    }
                    string = moveImageToFolder;
                } else {
                    HashMap hashMap3 = new HashMap();
                    hashMap3.put("detail", "local file already exist in secret folder");
                    hashMap3.put("src", string);
                    hashMap3.put("des", safePathInPriorStorage);
                    GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap3);
                }
                contentValues.put("localFile", string);
                String string2 = this.mCursor.getString(7);
                if (!FileUtils.isFileExist(string2)) {
                    MediaFileUtils.deleteFileType(FileType.NORMAL, string2);
                } else {
                    HashMap hashMap4 = new HashMap();
                    hashMap4.put("detail", "local file still exist after move to secret");
                    hashMap4.put("src", string2);
                    GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap4);
                }
                str = string2;
                z2 = true;
            } else {
                str = string;
                z2 = false;
            }
            String string3 = this.mCursor.getString(8);
            if (FileUtils.isFileExist(string3)) {
                String encodeFileName2 = SecretAlbumUtils.encodeFileName(addPostfixToFileName, false);
                if (z2) {
                    HashMap hashMap5 = new HashMap();
                    hashMap5.put("detail", "local & thumbnail both exist");
                    hashMap5.put("localFile", str);
                    hashMap5.put("thumbnailFile", string3);
                    GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap5);
                    contentValues.putNull("thumbnailFile");
                    MediaFileUtils.deleteFileType(FileType.NORMAL, string3);
                } else {
                    if (!TextUtils.equals(addPostfixToFileName, encodeFileName2) || z) {
                        File file2 = new File(FileUtils.getParentFolderPath(string3), encodeFileName2);
                        if (FileUtils.move(new File(string3), file2)) {
                            string3 = file2.getAbsolutePath();
                        } else {
                            Log.e("CloudManager", "Failed to move name conflict item %s to %s", string3, encodeFileName2);
                            HashMap hashMap6 = new HashMap();
                            hashMap6.put("detail", "thumbnail rename conflict file");
                            hashMap6.put("src", string3);
                            hashMap6.put("des", file2.getAbsolutePath());
                            GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_failed_bc_file_operation_failed", hashMap6);
                            return -113;
                        }
                    }
                    if (!FileUtils.contains(safePathInPriorStorage, string3)) {
                        string3 = CloudUtils.moveImageToFolder(string3, safePathInPriorStorage, true);
                        if (!FileUtils.contains(safePathInPriorStorage, string3)) {
                            Log.e("CloudManager", "Failed to move item %s to secret folder", (Object) str);
                            HashMap hashMap7 = new HashMap();
                            hashMap7.put("detail", "thumbnail file move failed to secret folder");
                            hashMap7.put("src", string3);
                            hashMap7.put("des", safePathInPriorStorage);
                            GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_failed_bc_file_operation_failed", hashMap7);
                            return -113;
                        }
                    } else {
                        HashMap hashMap8 = new HashMap();
                        hashMap8.put("detail", "thumbnail file already exist in secret folder");
                        hashMap8.put("src", string3);
                        hashMap8.put("des", safePathInPriorStorage);
                        GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap8);
                    }
                    contentValues.put("thumbnailFile", string3);
                    String string4 = this.mCursor.getString(8);
                    if (!FileUtils.isFileExist(string4)) {
                        MediaFileUtils.deleteFileType(FileType.NORMAL, string4);
                    } else {
                        HashMap hashMap9 = new HashMap();
                        hashMap9.put("detail", "thumbnail file still exist after move to secret");
                        hashMap9.put("src", string4);
                        GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap9);
                    }
                }
            }
            return -1;
        }

        static int canAddSecret(Context context, Cursor cursor) {
            if (SpaceFullHandler.isOwnerSpaceFull()) {
                return -106;
            }
            if (cursor.getInt(5) != 1 && (cursor.getInt(5) != 2 || !SecretAlbumConfig.isVideoSupported())) {
                return -107;
            }
            if (cursor.isNull(4)) {
                String string = cursor.getString(7);
                if (!FileUtils.isFileExist(string)) {
                    return -102;
                }
                int canUpload = CloudUtils.canUpload(string);
                if (canUpload == 4) {
                    return -108;
                }
                if (canUpload != 0) {
                    return -107;
                }
            }
            return (!cursor.isNull(4) || new CheckPostProcessing(context, cursor.getString(7)).run(null, null) != -111) ? 0 : -111;
        }

        private int checkConflict(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            int i;
            String string = this.mCursor.getString(9);
            String string2 = this.mCursor.getString(6);
            String encodeFileName = SecretAlbumUtils.encodeFileName(string2, this.mCursor.getInt(5) == 2);
            if (!TextUtils.isEmpty(string)) {
                try {
                    Cursor query = sQLiteDatabase.query("cloud", new String[]{"sha1", "fileName", "localFlag", "localFile"}, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (sha1 = ? OR fileName = ? OR fileName = ?) AND localGroupId=? AND (serverId IS NOT NULL OR localFile IS NOT NULL)", new String[]{string, string2, encodeFileName, String.valueOf(-1000)}, null, null, null);
                    if (query != null) {
                        boolean z = false;
                        while (true) {
                            try {
                                if (query.moveToNext()) {
                                    if (TextUtils.equals(string, query.getString(0))) {
                                        int i2 = query.getInt(2);
                                        String string3 = query.getString(3);
                                        if ((i2 == 7 || i2 == 8) && !FileUtils.isFileExist(string3)) {
                                            GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_sha1_conflict_with_unsynced_file_unexist_item");
                                        }
                                    }
                                    String string4 = query.getString(1);
                                    if (!z && (string2.equalsIgnoreCase(string4) || encodeFileName.equalsIgnoreCase(string4))) {
                                        z = true;
                                    }
                                } else if (z) {
                                    i = -105;
                                }
                            } catch (Throwable th) {
                                th = th;
                                cursor = query;
                                MiscUtil.closeSilently(cursor);
                                throw th;
                            }
                        }
                        i = -104;
                        MiscUtil.closeSilently(query);
                        return i;
                    }
                    MiscUtil.closeSilently(query);
                } catch (Throwable th2) {
                    th = th2;
                    cursor = null;
                    MiscUtil.closeSilently(cursor);
                    throw th;
                }
            }
            return 0;
        }

        private void deleteAllWithSameSha1(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, boolean z) {
            String string = this.mCursor.getString(9);
            if (!TextUtils.isEmpty(string)) {
                StringBuilder sb = new StringBuilder();
                sb.append(" AND _id!=");
                sb.append(this.mMediaId);
                String sb2 = sb.toString();
                String str = "sha1=? AND localGroupId!=-1000";
                if (!z) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(str);
                    sb3.append(sb2);
                    str = sb3.toString();
                }
                Cursor cursor = null;
                try {
                    Cursor cursor2 = sQLiteDatabase.query("cloud", new String[]{"_id"}, str, new String[]{string}, null, null, null);
                    if (cursor2 != null) {
                        try {
                            if (cursor2.getCount() > 0) {
                                long[] jArr = new long[cursor2.getCount()];
                                for (int i = 0; i < cursor2.getCount(); i++) {
                                    cursor2.moveToPosition(i);
                                    jArr[i] = cursor2.getLong(0);
                                }
                                CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), jArr, 36);
                            }
                        } catch (Exception e) {
                            e = e;
                            cursor = cursor2;
                            try {
                                Log.e("CloudManager", (Throwable) e);
                                MiscUtil.closeSilently(cursor);
                            } catch (Throwable th) {
                                th = th;
                                cursor2 = cursor;
                                MiscUtil.closeSilently(cursor2);
                                throw th;
                            }
                        } catch (Throwable th2) {
                            th = th2;
                            MiscUtil.closeSilently(cursor2);
                            throw th;
                        }
                    }
                    MiscUtil.closeSilently(cursor2);
                } catch (Exception e2) {
                    e = e2;
                    Log.e("CloudManager", (Throwable) e);
                    MiscUtil.closeSilently(cursor);
                }
            }
        }

        private void postCheck(SQLiteDatabase sQLiteDatabase, long j, boolean z) {
            Cursor cursor = null;
            try {
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                Cursor cursor2 = sQLiteDatabase2.query("cloud", new String[]{"localFlag", "localFile", "serverStatus"}, "_id=?", new String[]{String.valueOf(j)}, null, null, null);
                if (cursor2 != null) {
                    try {
                        if (cursor2.moveToFirst()) {
                            int i = cursor2.getInt(0);
                            String string = cursor2.getString(1);
                            String string2 = cursor2.getString(2);
                            if (i != 8) {
                                if (i != 7) {
                                    if (!(i == 2 || i == -1)) {
                                        if (i != 11) {
                                            if (TextUtils.equals("deleted", string2) || TextUtils.equals("purged", string2)) {
                                                HashMap hashMap = new HashMap();
                                                hashMap.put("result", String.valueOf(z));
                                                StringBuilder sb = new StringBuilder();
                                                sb.append("record in invalid server state ");
                                                sb.append(string2);
                                                hashMap.put("detail", sb.toString());
                                                GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap);
                                            }
                                            IOUtils.closeQuietly(cursor2);
                                        }
                                    }
                                    HashMap hashMap2 = new HashMap();
                                    hashMap2.put("result", String.valueOf(z));
                                    StringBuilder sb2 = new StringBuilder();
                                    sb2.append("record in invalid local state ");
                                    sb2.append(i);
                                    hashMap2.put("detail", sb2.toString());
                                    GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap2);
                                    IOUtils.closeQuietly(cursor2);
                                }
                            }
                            if (!FileUtils.isFileExist(string)) {
                                HashMap hashMap3 = new HashMap();
                                hashMap3.put("result", String.valueOf(z));
                                hashMap3.put("detail", "local file not exist with unsynced item");
                                hashMap3.put("localFile", string);
                                GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap3);
                            } else if (z && !string.contains(StorageUtils.DIRECTORY_SECRET_ALBUM_PATH)) {
                                HashMap hashMap4 = new HashMap();
                                hashMap4.put("result", "true");
                                hashMap4.put("detail", "local file not in secret folder");
                                hashMap4.put("localFile", string);
                                GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap4);
                            }
                            IOUtils.closeQuietly(cursor2);
                        }
                    } catch (Exception e) {
                        e = e;
                        cursor = cursor2;
                        try {
                            Log.e("CloudManager", (Throwable) e);
                            IOUtils.closeQuietly(cursor);
                        } catch (Throwable th) {
                            th = th;
                            cursor2 = cursor;
                            IOUtils.closeQuietly(cursor2);
                            throw th;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        IOUtils.closeQuietly(cursor2);
                        throw th;
                    }
                }
                HashMap hashMap5 = new HashMap();
                hashMap5.put("result", String.valueOf(z));
                hashMap5.put("detail", "failed to retrieve record again");
                GallerySamplingStatHelper.recordErrorEvent("operation_abnormal", "add_secret_abnormal", hashMap5);
                IOUtils.closeQuietly(cursor2);
            } catch (Exception e2) {
                e = e2;
                Log.e("CloudManager", (Throwable) e);
                IOUtils.closeQuietly(cursor);
            }
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:49:0x0183  */
        /* JADX WARNING: Removed duplicated region for block: B:50:0x018a  */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j;
            long addFilePath;
            SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
            MediaManager mediaManager2 = mediaManager;
            int canAddSecret = canAddSecret(this.mContext, this.mCursor);
            if (canAddSecret < 0) {
                return (long) canAddSecret;
            }
            this.mMediaId = this.mCursor.getLong(0);
            int checkConflict = checkConflict(sQLiteDatabase);
            if (checkConflict == -104) {
                deleteAllWithSameSha1(sQLiteDatabase2, mediaManager2, true);
                return this.mMediaId;
            }
            int i = this.mCursor.getInt(2);
            if (i == 7 || i == 8) {
                ContentValues contentValues = new ContentValues();
                contentValues.putAll(CloudManager.copyOf(CloudManager.PUBLIC_COPYABLE_PROJECTION, this.mCursor));
                contentValues.put("localFlag", Integer.valueOf(8));
                addFilePath = addFilePath(contentValues, checkConflict == -105);
                if (addFilePath == -1) {
                    contentValues.put("localGroupId", Long.valueOf(-1000));
                    j = sQLiteDatabase2.insert("cloud", null, contentValues);
                    if (j > 0) {
                        mediaManager2.insert(j, contentValues);
                        if (sQLiteDatabase2.delete("cloud", "_id=?", new String[]{String.valueOf(this.mMediaId)}) > 0) {
                            mediaManager2.delete("_id=?", new String[]{String.valueOf(this.mMediaId)});
                        }
                    }
                    if (j > 0) {
                        postCheck(sQLiteDatabase2, j, true);
                        deleteAllWithSameSha1(sQLiteDatabase2, mediaManager2, false);
                    } else {
                        postCheck(sQLiteDatabase2, this.mMediaId, false);
                    }
                    return j;
                }
            } else {
                if (i != 0) {
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put("localGroupId", Long.valueOf(-1000));
                    j = addFilePath(contentValues2, checkConflict == -105);
                    if (j == -1) {
                        if (sQLiteDatabase2.update("cloud", contentValues2, "_id=?", new String[]{String.valueOf(this.mMediaId)}) > 0) {
                            if (mediaManager2 != null) {
                                mediaManager2.update("_id=?", new String[]{String.valueOf(this.mMediaId)}, contentValues2);
                            }
                            j = this.mMediaId;
                        }
                    }
                } else {
                    ContentValues contentValues3 = new ContentValues();
                    contentValues3.put("localFlag", Integer.valueOf(11));
                    ContentValues contentValues4 = new ContentValues();
                    contentValues4.put("localFlag", Integer.valueOf(5));
                    contentValues4.putAll(CloudManager.copyOf(CloudManager.PUBLIC_COPYABLE_PROJECTION, this.mCursor));
                    addFilePath = addFilePath(contentValues4, checkConflict == -105);
                    if (addFilePath == -1) {
                        contentValues4.put("fromLocalGroupId", Integer.valueOf(this.mCursor.getInt(3)));
                        contentValues4.put("localGroupId", Long.valueOf(-1000));
                        contentValues4.put("localImageId", Long.valueOf(this.mMediaId));
                        long insert = sQLiteDatabase2.insert("cloud", null, contentValues4);
                        if (insert > 0) {
                            mediaManager2.insert(insert, contentValues4);
                            if (sQLiteDatabase2.update("cloud", contentValues3, "_id=?", new String[]{String.valueOf(this.mMediaId)}) > 0) {
                                mediaManager2.delete("_id=?", new String[]{String.valueOf(this.mMediaId)});
                            }
                        }
                        j = insert;
                    }
                }
                if (j > 0) {
                }
                return j;
            }
            j = addFilePath;
            if (j > 0) {
            }
            return j;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if (this.mMediaId <= 0) {
                return null;
            }
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(this.mMediaId)}, null, null, null);
        }

        public String toString() {
            return String.format(Locale.US, "AddToSecret{%d}", new Object[]{Long.valueOf(this.mMediaId)});
        }
    }

    private static class AddToSecretByUri extends CursorTask {
        private String mTarPath;
        private Uri mUri;

        public AddToSecretByUri(Context context, ArrayList<Long> arrayList, Uri uri) {
            super(context, arrayList);
            this.mUri = uri;
        }

        private static int canAddSecret(Context context, String str) {
            if (SpaceFullHandler.isOwnerSpaceFull()) {
                return -106;
            }
            int canUpload = CloudUtils.canUpload(str);
            if (canUpload == 4) {
                return -108;
            }
            if (canUpload != 0) {
                return -107;
            }
            return new CheckPostProcessing(context, str).run(null, null) == -111 ? -111 : 0;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            if (this.mCursor == null || !this.mCursor.moveToFirst()) {
                int canAddSecret = canAddSecret(this.mContext, this.mTarPath);
                if (canAddSecret < 0) {
                    return (long) canAddSecret;
                }
                String safePathInPriorStorage = StorageUtils.getSafePathInPriorStorage(StorageUtils.DIRECTORY_SECRET_ALBUM_PATH);
                String fileName = FileUtils.getFileName(this.mTarPath);
                File file = new File(safePathInPriorStorage, fileName);
                String str = this.mTarPath;
                if (file.exists()) {
                    File file2 = new File(FileUtils.getParentFolderPath(this.mTarPath), DownloadPathHelper.addPostfixToFileName(fileName, String.valueOf(System.currentTimeMillis())));
                    FileUtils.move(new File(this.mTarPath), file2);
                    str = file2.getAbsolutePath();
                }
                if (!ExtraTextUtils.startsWithIgnoreCase(this.mTarPath, safePathInPriorStorage)) {
                    str = CloudUtils.moveImageToFolder(this.mTarPath, safePathInPriorStorage, true);
                }
                Context context = this.mContext;
                SaveParams saveParams = new SaveParams(new File(str), -1000, 8, true);
                long saveToCloudDB = SaveToCloudUtil.saveToCloudDB(context, saveParams);
                if (saveToCloudDB == -2) {
                    if (MediaFileUtils.deleteFileType(FileType.NORMAL, this.mTarPath) > 0) {
                        DeleteRecorder.record(new DeleteRecord(35, this.mTarPath, "AddToSecretByUri"));
                    }
                    return -103;
                } else if (saveToCloudDB == -1) {
                    return -101;
                } else {
                    if (MediaFileUtils.deleteFileType(FileType.NORMAL, this.mTarPath) > 0) {
                        DeleteRecorder.record(new DeleteRecord(35, this.mTarPath, "AddToSecretByUri"));
                    }
                    return saveToCloudDB;
                }
            } else {
                long j = this.mCursor.getLong(0);
                if (j <= 0) {
                    return 0;
                }
                long run = new AddToSecret(this.mContext, getDirtyBulk(), j).run(sQLiteDatabase, mediaManager);
                if (run > 0) {
                    if (MediaFileUtils.deleteFileType(FileType.NORMAL, this.mTarPath) > 0) {
                        DeleteRecorder.record(new DeleteRecord(35, this.mTarPath, "AddToSecretByUri"));
                    }
                }
                return run;
            }
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if (this.mUri != null) {
                if ("content".equals(this.mUri.getScheme())) {
                    this.mTarPath = (String) GalleryUtils.safeQuery(this.mUri, new String[]{"_data"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
                        public String handle(Cursor cursor) {
                            if (cursor == null || !cursor.moveToFirst()) {
                                return null;
                            }
                            return cursor.getString(0);
                        }
                    });
                } else if ("file".equals(this.mUri.getScheme())) {
                    this.mTarPath = this.mUri.getPath();
                }
                if (!TextUtils.isEmpty(this.mTarPath)) {
                    return CloudManager.queryCloudItemByFilePath(this.mContext, sQLiteDatabase, this.mTarPath);
                }
            }
            return null;
        }

        public String toString() {
            return String.format("%s{%s}", new Object[]{"AddToSecretByUri", this.mUri});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            return FileUtils.isFileExist(this.mTarPath) ? -1 : -100;
        }
    }

    private static abstract class BaseCopyOrMoveByUri extends CursorTask {
        protected long mAlbumId;
        protected String mTarPath;
        protected Uri mUri;

        public BaseCopyOrMoveByUri(Context context, ArrayList<Long> arrayList, Uri uri, long j) {
            super(context, arrayList);
            this.mUri = uri;
            this.mAlbumId = j;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if ("content".equals(this.mUri.getScheme())) {
                this.mTarPath = (String) GalleryUtils.safeQuery(this.mUri, new String[]{"_data"}, (String) null, (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<String>() {
                    public String handle(Cursor cursor) {
                        if (cursor == null || !cursor.moveToFirst()) {
                            return null;
                        }
                        return cursor.getString(0);
                    }
                });
            } else if ("file".equals(this.mUri.getScheme())) {
                this.mTarPath = this.mUri.getPath();
            }
            if (!TextUtils.isEmpty(this.mTarPath)) {
                return CloudManager.queryCloudItemByFilePath(this.mContext, sQLiteDatabase, this.mTarPath);
            }
            return null;
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            if (TextUtils.isEmpty(this.mTarPath)) {
                return -100;
            }
            long j = -111;
            if (new CheckPostProcessing(this.mContext, this.mTarPath).run(sQLiteDatabase, null) != -111) {
                j = -1;
            }
            return j;
        }
    }

    private static class CheckPostProcessing extends CursorTask {
        private String mFilePath;

        public CheckPostProcessing(Context context, String str) {
            super(context, null);
            this.mFilePath = str;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            return -102;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if (!TextUtils.isEmpty(this.mFilePath)) {
                if ("DCIM/Camera".equalsIgnoreCase(StorageUtils.getRelativePath(this.mContext, FileUtils.getParentFolderPath(this.mFilePath)))) {
                    long mediaStoreId = MediaStoreUtils.getMediaStoreId(this.mFilePath);
                    if (mediaStoreId > 0) {
                        return this.mContext.getContentResolver().query(PhotosOemApi.getQueryProcessingUri(this.mContext, mediaStoreId), null, null, null, null);
                    }
                }
            }
            return null;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(".CheckPostProcessing{");
            sb.append(this.mFilePath);
            sb.append("}");
            return sb.toString();
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            return (this.mCursor == null || this.mCursor.getCount() == 0) ? -1 : -111;
        }
    }

    private static class Copy extends Media {
        public Copy(Context context, ArrayList<Long> arrayList, long j, long j2) {
            super(context, arrayList, j, j2);
            Log.d("CloudManager", "Copy albumId %d mediaId %d", Long.valueOf(j2), Long.valueOf(j));
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:44:0x01b5  */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j;
            long j2;
            Log.d("CloudManager", "%s execute", (Object) toString());
            ContentValues access$300 = CloudManager.copyOf(CloudManager.PUBLIC_COPYABLE_PROJECTION, this.mCursor);
            int i = this.mCursor.getInt(2);
            long j3 = -101;
            if (i == 0 || i == 5 || i == 6 || i == 9) {
                Log.d("CloudManager", "has server id, just insert as copy");
                if (i != 0) {
                    String string = this.mCursor.getString(26);
                    if (TextUtils.isEmpty(string)) {
                        Log.d("CloudManager", "not synced but localImageId is null");
                        return -101;
                    }
                    this.mMediaId = Long.parseLong(string);
                    if (i == 9) {
                        this.mMediaId = ShareMediaManager.convertToMediaId(this.mMediaId);
                    }
                    MiscUtil.closeSilently(this.mCursor);
                    this.mCursor = prepare(sQLiteDatabase);
                    long verify = verify(sQLiteDatabase);
                    if (verify != -1) {
                        return verify;
                    }
                    if (this.mCursor.getInt(2) != 0) {
                        Log.d("CloudManager", "backtrack not synced");
                        return -101;
                    } else if (ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                        access$300.put("localFlag", Integer.valueOf(9));
                    } else {
                        access$300.put("localFlag", Integer.valueOf(6));
                    }
                } else if (ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                    access$300.put("localFlag", Integer.valueOf(9));
                } else {
                    access$300.put("localFlag", Integer.valueOf(6));
                }
            } else {
                Log.d("CloudManager", "no server id, just insert as manual create");
                access$300.put("localFlag", Integer.valueOf(-2));
            }
            access$300.putAll(CloudManager.copyOf(CloudManager.PRIVATE_COPYABLE_PROJECTION, this.mCursor));
            if (ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                long originalMediaId = ShareMediaManager.getOriginalMediaId(this.mMediaId);
                if (ShareAlbumManager.isOtherShareAlbumId(this.mAlbumId)) {
                    access$300.put("localGroupId", Long.valueOf(ShareAlbumManager.getOriginalAlbumId(this.mAlbumId)));
                    access$300.put("localImageId", Long.valueOf(originalMediaId));
                    j = sQLiteDatabase.insert("shareImage", null, access$300);
                    Log.d("CloudManager", "Copy other share to other share id %d", (Object) Long.valueOf(j));
                    Log.d("CloudManager", "inserts: %s COPY RESULT: %d", CloudManager.desensitization(access$300), Long.valueOf(j));
                    if (j > 0) {
                        if (ShareAlbumManager.isOtherShareAlbumId(this.mAlbumId)) {
                            j = ShareMediaManager.convertToMediaId(j);
                        }
                        j3 = j;
                        markAsDirty(j3);
                    }
                    return j3;
                }
                access$300.put("localGroupId", Long.valueOf(this.mAlbumId));
                access$300.put("localImageId", Long.valueOf(originalMediaId));
                j2 = sQLiteDatabase.insert("cloud", null, access$300);
                mediaManager.insert(j2, access$300);
                Log.d("CloudManager", "Copy other share to owner id %d", (Object) Long.valueOf(j2));
            } else if (ShareAlbumManager.isOtherShareAlbumId(this.mAlbumId)) {
                access$300.put("localGroupId", Long.valueOf(ShareAlbumManager.getOriginalAlbumId(this.mAlbumId)));
                access$300.put("localImageId", Long.valueOf(this.mMediaId));
                j = sQLiteDatabase.insert("shareImage", null, access$300);
                Log.d("CloudManager", "Copy owner to other share id %d", (Object) Long.valueOf(j));
                Log.d("CloudManager", "inserts: %s COPY RESULT: %d", CloudManager.desensitization(access$300), Long.valueOf(j));
                if (j > 0) {
                }
                return j3;
            } else {
                access$300.put("localGroupId", Long.valueOf(this.mAlbumId));
                access$300.put("localImageId", Long.valueOf(this.mMediaId));
                j2 = sQLiteDatabase.insert("cloud", null, access$300);
                mediaManager.insert(j2, access$300);
                Log.d("CloudManager", "Copy owner to owner id %d", (Object) Long.valueOf(j2));
            }
            j = j2;
            Log.d("CloudManager", "inserts: %s COPY RESULT: %d", CloudManager.desensitization(access$300), Long.valueOf(j));
            if (j > 0) {
            }
            return j3;
        }

        public String toString() {
            return String.format("Copy{%d, %d}", new Object[]{Long.valueOf(this.mMediaId), Long.valueOf(this.mAlbumId)});
        }
    }

    private static class CopyByUri extends BaseCopyOrMoveByUri {
        public CopyByUri(Context context, ArrayList<Long> arrayList, Uri uri, long j) {
            super(context, arrayList, uri, j);
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j = (this.mCursor == null || !this.mCursor.moveToFirst()) ? 0 : this.mCursor.getLong(0);
            if (j > 0) {
                Copy copy = new Copy(this.mContext, getDirtyBulk(), j, this.mAlbumId);
                return copy.run(sQLiteDatabase, mediaManager);
            }
            Context applicationContext = this.mContext.getApplicationContext();
            SaveParams saveParams = new SaveParams(new File(this.mTarPath), this.mAlbumId, -2, true);
            long saveToCloudDB = SaveToCloudUtil.saveToCloudDB(applicationContext, saveParams);
            if (saveToCloudDB <= 0) {
                return saveToCloudDB == -2 ? -103 : -101;
            }
            markAsDirty(saveToCloudDB);
            return saveToCloudDB;
        }

        public String toString() {
            return String.format("CopyByUri{%s, %d}", new Object[]{this.mUri.toString(), Long.valueOf(this.mAlbumId)});
        }
    }

    private static class CreateAlbum extends CursorTask {
        private String mAlbumPath = CloudManager.genRelativePath(this.mName, false);
        private String mName;

        public CreateAlbum(Context context, ArrayList<Long> arrayList, String str) {
            super(context, arrayList);
            this.mName = str;
        }

        private static String regenerateAlbumPath(Context context, String str) {
            String sb;
            int i = 0;
            while (true) {
                String valueOf = String.valueOf(System.currentTimeMillis());
                StringBuilder sb2 = new StringBuilder();
                sb2.append(str);
                sb2.append("_");
                sb2.append(valueOf.substring(valueOf.length() - 2));
                sb = sb2.toString();
                if (verifyAlbumPath(context, sb) == -1) {
                    break;
                }
                int i2 = i + 1;
                if (i >= 3) {
                    i = i2;
                    break;
                }
                i = i2;
            }
            if (i < 3) {
                return sb;
            }
            StringBuilder sb3 = new StringBuilder();
            sb3.append(str);
            sb3.append("_");
            sb3.append(System.currentTimeMillis());
            return sb3.toString();
        }

        private static long verifyAlbumPath(Context context, String str) {
            long j;
            if (TextUtils.isEmpty(str)) {
                return -100;
            }
            Cursor cursor = null;
            try {
                Cursor query = context.getContentResolver().query(Cloud.CLOUD_URI, new String[]{"_id"}, "localFile like ?  AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{str}, null);
                if (query == null) {
                    try {
                        Log.d("CloudManager", "cursor for albumPath(%s) is null, verify failed", (Object) str);
                        j = -101;
                    } catch (Throwable th) {
                        th = th;
                        cursor = query;
                        MiscUtil.closeSilently(cursor);
                        throw th;
                    }
                } else if (query.moveToFirst()) {
                    long j2 = query.getLong(0);
                    MiscUtil.closeSilently(query);
                    return j2;
                } else {
                    j = -1;
                }
                MiscUtil.closeSilently(query);
                return j;
            } catch (Throwable th2) {
                th = th2;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("serverType", Integer.valueOf(0));
            contentValues.put("fileName", this.mName);
            contentValues.put("dateModified", Long.valueOf(System.currentTimeMillis()));
            contentValues.put("dateTaken", Long.valueOf(System.currentTimeMillis()));
            contentValues.put("localFlag", Integer.valueOf(8));
            contentValues.put("localFile", this.mAlbumPath);
            contentValues.put("attributes", Long.valueOf(1));
            long insert = sQLiteDatabase.insert("cloud", null, contentValues);
            Log.d("CloudManager", "album(%s) creation finish with a id(%s) and albumPath(%s)", this.mName, Long.valueOf(insert), this.mAlbumPath);
            if (insert <= 0) {
                return -101;
            }
            mediaManager.insertAttributes(insert, contentValues.getAsLong("attributes").longValue());
            markAsDirty(insert);
            return insert;
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Removed duplicated region for block: B:25:0x0039  */
        public long getConflictAlbumId(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            try {
                cursor = prepare(sQLiteDatabase);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            long j = cursor.getLong(0);
                            if (cursor != null) {
                                cursor.close();
                            }
                            return j;
                        }
                    } catch (Throwable th) {
                        th = th;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
                long verifyAlbumPath = verifyAlbumPath(this.mContext, this.mAlbumPath);
                if (verifyAlbumPath >= 0) {
                    if (cursor != null) {
                        cursor.close();
                    }
                    return verifyAlbumPath;
                }
                if (cursor != null) {
                    cursor.close();
                }
                return -102;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "fileName=? COLLATE NOCASE  AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{this.mName}, null, null, null);
        }

        public String toString() {
            return String.format("CreateAlbum{%s}", new Object[]{this.mName});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            long verify = super.verify(sQLiteDatabase);
            if (verify == -1) {
                Log.d("CloudManager", "album with name(%s) found, exist %d", this.mName, Integer.valueOf(this.mCursor.getCount()));
                return -103;
            } else if (verify != -102) {
                return verify;
            } else {
                long verifyAlbumPath = verifyAlbumPath(this.mContext, this.mAlbumPath);
                if (verifyAlbumPath <= 0) {
                    return verifyAlbumPath;
                }
                this.mAlbumPath = regenerateAlbumPath(this.mContext, this.mAlbumPath);
                return -1;
            }
        }
    }

    private static abstract class CursorTask {
        protected Context mContext;
        protected Cursor mCursor;
        private ArrayList<Long> mDirtyBulk;

        public CursorTask(Context context, ArrayList<Long> arrayList) {
            this.mContext = context;
            this.mDirtyBulk = arrayList;
        }

        private void release() {
            this.mContext = null;
            if (this.mCursor != null) {
                this.mCursor.close();
            }
            this.mCursor = null;
        }

        /* access modifiers changed from: protected */
        public abstract long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager);

        public ArrayList<Long> getDirtyBulk() {
            return this.mDirtyBulk;
        }

        /* access modifiers changed from: protected */
        public final void markAsDirty(long j) {
            this.mDirtyBulk.add(Long.valueOf(j));
        }

        /* access modifiers changed from: protected */
        public abstract Cursor prepare(SQLiteDatabase sQLiteDatabase);

        public final long run(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            Log.d("CloudManager", "%s is running", (Object) toString());
            this.mCursor = prepare(sQLiteDatabase);
            try {
                long verify = verify(sQLiteDatabase);
                if (verify != -1) {
                    Log.d("CloudManager", "%s finish", (Object) toString());
                    release();
                    return verify;
                }
                long execute = execute(sQLiteDatabase, mediaManager);
                Log.d("CloudManager", "%s finish", (Object) toString());
                release();
                return execute;
            } catch (Throwable th) {
                Log.d("CloudManager", "%s finish", (Object) toString());
                release();
                throw th;
            }
        }

        public abstract String toString();

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            if (this.mCursor == null) {
                Log.d("CloudManager", "cursor for %s is null, abort", (Object) toString());
                return -101;
            } else if (this.mCursor.moveToFirst()) {
                return -1;
            } else {
                Log.d("CloudManager", "cursor for %s has nothing, abort", (Object) toString());
                return -102;
            }
        }
    }

    private static class DeleteAlbum extends CursorTask {
        private long mAlbumId;
        private int mDeleteReason;

        public DeleteAlbum(Context context, ArrayList<Long> arrayList, long j, int i) {
            super(context, arrayList);
            this.mAlbumId = j;
            this.mDeleteReason = i;
        }

        private int deleteItem(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long j, Cursor cursor) {
            int i;
            if (cursor.isNull(4)) {
                Log.d("DeleteAlbum", "DELETE ITEM: no server id found, update to invalid record: %d", (Object) Long.valueOf(j));
                ContentValues contentValues = new ContentValues();
                contentValues.put("localFlag", Integer.valueOf(-1));
                i = sQLiteDatabase.update("cloud", contentValues, "_id = ? ", new String[]{String.valueOf(j)});
            } else {
                Log.d("DeleteAlbum", "DELETE ITEM: server id found, mark delete %d", (Object) Long.valueOf(j));
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put("localFlag", Integer.valueOf(2));
                i = sQLiteDatabase.update("cloud", contentValues2, "_id = ? ", new String[]{String.valueOf(j)});
            }
            mediaManager.delete("_id = ? ", new String[]{String.valueOf(j)});
            Log.d("DeleteAlbum", "DELETE ITEM FINISH: deleted %d item", (Object) Integer.valueOf(i));
            if (i > 0) {
                markAsDirty(j);
            }
            return i;
        }

        private int deleteMediaInAlbum(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long j) {
            int i;
            SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
            Log.d("DeleteAlbum", "deleting media in album(%d)", (Object) Long.valueOf(j));
            ArrayList arrayList = new ArrayList();
            SQLiteDatabase sQLiteDatabase3 = sQLiteDatabase;
            Cursor query = sQLiteDatabase3.query("cloud", CloudManager.PROJECTION, "localGroupId=? AND serverId IS NULL", new String[]{String.valueOf(j)}, null, null, null);
            if (query != null) {
                while (query.moveToNext()) {
                    markAsDirty(query.getLong(0));
                    DeleteRecord createDeleteRecord = CloudManager.createDeleteRecord(this.mDeleteReason, query, "DeleteAlbum");
                    if (createDeleteRecord != null) {
                        arrayList.add(createDeleteRecord);
                    }
                }
                query.close();
                ContentValues contentValues = new ContentValues();
                contentValues.put("localFlag", Integer.valueOf(-1));
                int update = sQLiteDatabase.update("cloud", contentValues, "localGroupId=? AND serverId IS NULL", new String[]{String.valueOf(j)}) + 0;
                Log.d("DeleteAlbum", "marked local media in album(%d)", (Object) Long.valueOf(j));
                i = update;
            } else {
                Log.e("DeleteAlbum", "delete local media in album(%d) returns a null cursor", (Object) Long.valueOf(j));
                i = 0;
            }
            SQLiteDatabase sQLiteDatabase4 = sQLiteDatabase;
            Cursor query2 = sQLiteDatabase4.query("cloud", CloudManager.PROJECTION, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId = ? ", new String[]{String.valueOf(j)}, null, null, null);
            if (query2 != null) {
                while (query2.moveToNext()) {
                    markAsDirty(query2.getLong(0));
                    DeleteRecord createDeleteRecord2 = CloudManager.createDeleteRecord(this.mDeleteReason, query2, "DeleteAlbum");
                    if (createDeleteRecord2 != null) {
                        arrayList.add(createDeleteRecord2);
                    }
                }
                query2.close();
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put("localFlag", Integer.valueOf(2));
                i += sQLiteDatabase.update("cloud", contentValues2, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId = ? ", new String[]{String.valueOf(j)});
                Log.d("DeleteAlbum", "marked cloud media in album(%d)", (Object) Long.valueOf(j));
            } else {
                Log.e("DeleteAlbum", "delete synced media in album(%d) returns a null cursor", (Object) Long.valueOf(j));
            }
            MediaManager mediaManager2 = mediaManager;
            mediaManager2.delete("localGroupId = ? ", new String[]{String.valueOf(j)});
            Log.d("DeleteAlbum", "DELETING items from album(%d), count: %d", Long.valueOf(j), Integer.valueOf(i));
            if (MiscUtil.isValid(arrayList)) {
                DeleteRecorder.record((Collection<DeleteRecord>) arrayList);
            }
            return i;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            Log.d("DeleteAlbum", "DELETING ALBUM:");
            long deleteMediaInAlbum = (long) deleteMediaInAlbum(sQLiteDatabase, mediaManager, this.mAlbumId);
            long deleteItem = (long) deleteItem(this.mContext, sQLiteDatabase, mediaManager, this.mAlbumId, this.mCursor);
            mediaManager.deleteAttributes(this.mAlbumId);
            return deleteItem < 0 ? deleteItem : deleteMediaInAlbum;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id = ?", new String[]{String.valueOf(this.mAlbumId)}, null, null, null);
        }

        public String toString() {
            return String.format("%s{%d}", new Object[]{"DeleteAlbum", Long.valueOf(this.mAlbumId)});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            long verify = super.verify(sQLiteDatabase);
            if (verify != -1) {
                return verify;
            }
            if (this.mCursor.getInt(5) != 0) {
                Log.w("DeleteAlbum", "Image or video can't be deleted here");
                return -100;
            } else if (!CloudManager.isSystemAlbum(this.mCursor.getLong(4))) {
                return -1;
            } else {
                Log.w("DeleteAlbum", "system album can't be deleted");
                return -100;
            }
        }
    }

    private static class DeleteByPath extends CursorTask {
        private ArrayList<Long> mDeleteIds;
        private int mDeleteOptions;
        private int mDeleteReason;
        private String mPath;

        public DeleteByPath(Context context, ArrayList<Long> arrayList, String str, int i, ArrayList<Long> arrayList2, int i2) {
            super(context, arrayList);
            this.mPath = str;
            this.mDeleteOptions = i;
            this.mDeleteIds = arrayList2;
            this.mDeleteReason = i2;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            if (this.mCursor != null && this.mCursor.moveToFirst()) {
                long j = this.mCursor.getLong(0);
                if (j > 0) {
                    long[] access$600 = CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), new long[]{j}, this.mDeleteOptions, this.mDeleteIds, this.mDeleteReason);
                    return access$600.length > 0 ? access$600[0] : -101;
                }
            }
            int deleteFileType = MediaFileUtils.deleteFileType(FileType.NORMAL, this.mPath);
            DeleteRecorder.record(new DeleteRecord(this.mDeleteReason, this.mPath, "DeleteByPath"));
            return (long) deleteFileType;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return CloudManager.queryCloudItemByFilePath(this.mContext, sQLiteDatabase, this.mPath);
        }

        public String toString() {
            return String.format("%s{%s}", new Object[]{"DeleteByPath", this.mPath});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            return TextUtils.isEmpty(this.mPath) ? -100 : -1;
        }
    }

    private static class DeleteBySha1 extends CursorTask {
        private int mDeleteReason;
        private boolean mKeepDup;
        private String mSha1;

        public DeleteBySha1(Context context, ArrayList<Long> arrayList, String str, boolean z, int i) {
            super(context, arrayList);
            this.mSha1 = str;
            this.mKeepDup = z;
            this.mDeleteReason = i;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            int i = 0;
            if (this.mCursor != null && (this.mCursor.getCount() == 1 || (this.mCursor.getCount() > 1 && !this.mKeepDup))) {
                long[] jArr = new long[this.mCursor.getCount()];
                for (int i2 = 0; i2 < this.mCursor.getCount(); i2++) {
                    this.mCursor.moveToPosition(i2);
                    jArr[i2] = this.mCursor.getLong(0);
                }
                i = CloudManager.getValidCount(CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), jArr, this.mDeleteReason));
            }
            return (long) i;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if (TextUtils.isEmpty(this.mSha1)) {
                return null;
            }
            return sQLiteDatabase.query("cloud", new String[]{"_id"}, "sha1=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{this.mSha1}, null, null, null);
        }

        public String toString() {
            return String.format("DeleteBySha1{%s}", new Object[]{this.mSha1});
        }
    }

    private static class DeleteCloudByPath extends CursorTask {
        private ArrayList<Long> mDeleteIds;
        private int mDeleteReason;
        private String mPath;

        public DeleteCloudByPath(Context context, ArrayList<Long> arrayList, String str, ArrayList<Long> arrayList2, int i) {
            super(context, arrayList);
            this.mPath = str;
            this.mDeleteIds = arrayList2;
            this.mDeleteReason = i;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            if (this.mCursor != null && this.mCursor.moveToFirst()) {
                long j = this.mCursor.getLong(0);
                if (j > 0) {
                    long[] access$700 = CloudManager.cloudDelete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), new long[]{j}, this.mDeleteIds, this.mDeleteReason);
                    return access$700.length > 0 ? access$700[0] : -101;
                }
            }
            return 0;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return CloudManager.queryCloudItemByFilePath(this.mContext, sQLiteDatabase, this.mPath);
        }

        public String toString() {
            return String.format("DeleteCloudByPath{%s}", new Object[]{this.mPath});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            return TextUtils.isEmpty(this.mPath) ? -100 : -1;
        }
    }

    private static class DeleteFile extends CursorTask {
        private final String TRACE_TAG = toString();
        private int mDeleteReason;
        private long mId;

        public DeleteFile(Context context, ArrayList<Long> arrayList, long j, int i) {
            super(context, arrayList);
            this.mId = j;
            this.mDeleteReason = i;
        }

        private int deleteAlbumFile(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, int i) {
            Cursor cursor = null;
            String str = "cloud";
            try {
                String[] strArr = CloudManager.PROJECTION;
                String str2 = "localGroupId=?";
                String[] strArr2 = new String[1];
                try {
                    int i2 = 0;
                    strArr2[0] = String.valueOf(this.mId);
                    Cursor query = sQLiteDatabase.query(str, strArr, str2, strArr2, null, null, null);
                    if (query != null) {
                        try {
                            if (query.moveToFirst()) {
                                int i3 = 0;
                                do {
                                    i3 += deleteMediaFile(sQLiteDatabase, mediaManager, query, query.getLong(0), i);
                                } while (query.moveToNext());
                                i2 = i3;
                            }
                        } catch (Throwable th) {
                            th = th;
                            cursor = query;
                            MiscUtil.closeSilently(cursor);
                            throw th;
                        }
                    }
                    MiscUtil.closeSilently(query);
                    return i2;
                } catch (Throwable th2) {
                    th = th2;
                    MiscUtil.closeSilently(cursor);
                    throw th;
                }
            } catch (Throwable th3) {
                th = th3;
                MiscUtil.closeSilently(cursor);
                throw th;
            }
        }

        private int deleteMediaFile(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, Cursor cursor, long j, int i) {
            MediaFileHandleJob.from(this.mContext.getContentResolver(), cursor, j, i).doDelete(this.mContext, false, false);
            ContentValues contentValues = new ContentValues();
            if (cursor.isNull(4)) {
                contentValues.put("localFlag", Integer.valueOf(-1));
                mediaManager.delete("_id=?", new String[]{String.valueOf(j)});
            } else {
                contentValues.put("thumbnailFile", "");
                contentValues.put("localFile", "");
                mediaManager.update("_id=?", new String[]{String.valueOf(j)}, contentValues);
            }
            int update = sQLiteDatabase.update("cloud", contentValues, "_id = ? ", new String[]{String.valueOf(j)});
            Log.d("CloudManager", "clear thumb and origin path");
            return update;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            int i;
            if (this.mCursor.getInt(5) == 0) {
                Log.d("CloudManager", "DELETING ALBUM FILE:");
                i = deleteAlbumFile(sQLiteDatabase, mediaManager, this.mDeleteReason);
                TimingTracing.addSplit(this.TRACE_TAG, String.format("deleteAlbum{%s}", new Object[]{Integer.valueOf(i)}));
            } else {
                Log.d("CloudManager", "DELETING MEDIA FILE");
                i = deleteMediaFile(sQLiteDatabase, mediaManager, this.mCursor, this.mId, this.mDeleteReason);
                TimingTracing.addSplit(this.TRACE_TAG, String.format("deleteFile{%s}", new Object[]{Integer.valueOf(i)}));
            }
            StringBuilder sb = new StringBuilder();
            long stopTracing = TimingTracing.stopTracing(this.TRACE_TAG, new StringBuilderPrinter(sb));
            if (i > 0) {
                long j = (long) i;
                if (stopTracing > 300 * j) {
                    Log.w(toString(), "delete slowly: %s", sb);
                    HashMap hashMap = new HashMap();
                    hashMap.put("cost", String.valueOf(stopTracing / j));
                    hashMap.put("detail", sb.toString());
                    GallerySamplingStatHelper.recordErrorEvent("delete_performance", toString(), hashMap);
                }
            }
            return (long) i;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            TimingTracing.beginTracing(this.TRACE_TAG, String.format("reason{%s}", new Object[]{Integer.valueOf(this.mDeleteReason)}));
            SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
            Cursor query = sQLiteDatabase2.query("cloud", CloudManager.PROJECTION, "_id = ?", new String[]{String.valueOf(this.mId)}, null, null, null);
            TimingTracing.addSplit(this.TRACE_TAG, "prepare");
            return query;
        }

        public String toString() {
            return String.format("DeleteFile{%d}", new Object[]{Long.valueOf(this.mId)});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            long verify = super.verify(sQLiteDatabase);
            if (verify != -1) {
                return verify;
            }
            if (!CloudManager.isSystemAlbum(this.mCursor.getLong(4))) {
                return -1;
            }
            Log.w("CloudManager", "system album can't be deleted");
            return -102;
        }
    }

    private static class DupCopy extends DupMedia {
        protected long mAlbumId;

        public DupCopy(Context context, ArrayList<Long> arrayList, long j, long j2, int i) {
            super(context, arrayList, j2, i);
            this.mAlbumId = j;
            Log.d("CloudManager", "DupCopy albumId %d mediaId %d", Long.valueOf(j), Long.valueOf(j2));
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long run;
            do {
                Copy copy = new Copy(this.mContext, getDirtyBulk(), this.mCursor.getLong(0), this.mAlbumId);
                run = copy.run(sQLiteDatabase, mediaManager);
                if (run > 0 || run == -103 || run == -104) {
                    Log.d("CloudManager", "DUPLICATED COPY FINISH: id(%d)", (Object) Long.valueOf(run));
                }
            } while (this.mCursor.moveToNext());
            Log.d("CloudManager", "DUPLICATED COPY FINISH: id(%d)", (Object) Long.valueOf(run));
            return run;
        }

        public String toString() {
            return String.format("DupCopy{%d, %d}", new Object[]{Long.valueOf(this.mMediaId), Long.valueOf(this.mAlbumId)});
        }
    }

    private static class DupDeleteFile extends DupMedia {
        private final String TRACE_TAG = toString();
        private int mDeleteReason;

        public DupDeleteFile(Context context, ArrayList<Long> arrayList, long j, int i, int i2) {
            super(context, arrayList, j, i);
            this.mDeleteReason = i2;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            int i = 0;
            do {
                DeleteFile deleteFile = new DeleteFile(this.mContext, getDirtyBulk(), this.mCursor.getLong(0), this.mDeleteReason);
                if (deleteFile.run(sQLiteDatabase, mediaManager) > 0) {
                    i++;
                }
            } while (this.mCursor.moveToNext());
            TimingTracing.addSplit(this.TRACE_TAG, String.format("execute{%s}", new Object[]{Integer.valueOf(i)}));
            TimingTracing.stopTracing(this.TRACE_TAG, null);
            Log.d("CloudManager", "DUPLICATED DELETE FILE FINISH: %d items", (Object) Integer.valueOf(i));
            return (long) i;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            TimingTracing.beginTracing(this.TRACE_TAG, String.format("reason{%s}", new Object[]{Integer.valueOf(this.mDeleteReason)}));
            Cursor prepare = super.prepare(sQLiteDatabase);
            TimingTracing.addSplit(this.TRACE_TAG, "prepare");
            return prepare;
        }

        public String toString() {
            return String.format("DupDeleteFile{%d}", new Object[]{Long.valueOf(this.mMediaId)});
        }
    }

    private static abstract class DupMedia extends CursorTask {
        private int mDupType;
        protected long mMediaId;

        public DupMedia(Context context, ArrayList<Long> arrayList, long j, int i) {
            super(context, arrayList);
            this.mMediaId = j;
            this.mDupType = i;
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:17:0x0055  */
        /* JADX WARNING: Removed duplicated region for block: B:21:0x005d  */
        /* JADX WARNING: Removed duplicated region for block: B:41:0x00ab  */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            String str;
            String format;
            String str2;
            Cursor cursor = null;
            switch (this.mDupType) {
                case 0:
                    StringBuilder sb = new StringBuilder();
                    try {
                        Cursor query = sQLiteDatabase.query("cloud", new String[]{"_id"}, "attributes & 4 != 0", null, null, null, null);
                        if (query != null) {
                            while (query.moveToNext()) {
                                try {
                                    if (!query.isFirst()) {
                                        sb.append(',');
                                    }
                                    sb.append(query.getLong(0));
                                } catch (Throwable th) {
                                    th = th;
                                    cursor = query;
                                    if (cursor != null) {
                                        cursor.close();
                                    }
                                    throw th;
                                }
                            }
                        }
                        if (query != null) {
                            query.close();
                        }
                        format = String.format("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 = (SELECT sha1 FROM cloud WHERE _id=?) AND sha1 NOT NULL AND localGroupId IN (%s)", new Object[]{sb});
                        break;
                    } catch (Throwable th2) {
                        th = th2;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                case 1:
                    String str3 = "cloud";
                    try {
                        String[] strArr = {"localGroupId"};
                        StringBuilder sb2 = new StringBuilder();
                        sb2.append("_id=");
                        sb2.append(this.mMediaId);
                        Cursor query2 = sQLiteDatabase.query(str3, strArr, sb2.toString(), null, null, null, null);
                        if (query2 != null) {
                            try {
                                if (query2.moveToFirst()) {
                                    str2 = String.format("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 = (SELECT sha1 FROM cloud WHERE _id=?) AND sha1 NOT NULL AND localGroupId IN (%s)", new Object[]{Long.valueOf(query2.getLong(0))});
                                    if (query2 != null) {
                                        query2.close();
                                    }
                                    str = str2;
                                    break;
                                }
                            } catch (Throwable th3) {
                                th = th3;
                                cursor = query2;
                                if (cursor != null) {
                                }
                                throw th;
                            }
                        }
                        str2 = null;
                        if (query2 != null) {
                        }
                        str = str2;
                    } catch (Throwable th4) {
                        th = th4;
                        if (cursor != null) {
                            cursor.close();
                        }
                        throw th;
                    }
                case 2:
                    format = "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND sha1 = (SELECT sha1 FROM cloud WHERE _id=?) AND sha1 NOT NULL";
                    break;
                default:
                    str = null;
                    break;
            }
            str = format;
            if (TextUtils.isEmpty(str)) {
                return null;
            }
            return sQLiteDatabase.query("cloud", new String[]{"_id"}, str, new String[]{String.valueOf(this.mMediaId)}, null, null, "serverId DESC ");
        }
    }

    private static class DupMove extends DupMedia {
        protected long mAlbumId;

        public DupMove(Context context, ArrayList<Long> arrayList, long j, long j2, int i) {
            super(context, arrayList, j2, i);
            this.mAlbumId = j;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j = -101;
            boolean z = false;
            while (true) {
                long j2 = this.mCursor.getLong(0);
                boolean z2 = true;
                if (!z) {
                    Move move = new Move(this.mContext, getDirtyBulk(), j2, this.mAlbumId);
                    j = move.run(sQLiteDatabase, mediaManager);
                    if (j > 0) {
                        Log.d("CloudManager", "move success, delete items left.");
                    } else if (j == -103) {
                        Log.d("CloudManager", "item exist, skip this, delete items left");
                    } else {
                        if (j == -104) {
                            Log.d("CloudManager", "sha1 conflict, just delete");
                            CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), new long[]{j2}, 41);
                        } else if (j == -105) {
                            Log.d("CloudManager", "file name conflict, return");
                            break;
                        } else {
                            Log.w("CloudManager", "unknown err");
                        }
                        z2 = z;
                    }
                    z = z2;
                } else {
                    SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                    MediaManager mediaManager2 = mediaManager;
                    CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), new long[]{j2}, 42);
                }
                if (!this.mCursor.moveToNext()) {
                    break;
                }
            }
            return j;
        }

        public String toString() {
            return String.format("DupMove{%d, %d}", new Object[]{Long.valueOf(this.mMediaId), Long.valueOf(this.mAlbumId)});
        }
    }

    private static abstract class Media extends CursorTask {
        protected long mAlbumId;
        protected long mMediaId;

        public Media(Context context, ArrayList<Long> arrayList, long j, long j2) {
            super(context, arrayList);
            this.mMediaId = j;
            this.mAlbumId = j2;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            Log.d("CloudManager", "%s prepare", (Object) toString());
            if (ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                return sQLiteDatabase.query("shareImage", CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(ShareMediaManager.getOriginalMediaId(this.mMediaId))}, null, null, null);
            }
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(this.mMediaId)}, null, null, null);
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            Log.d("CloudManager", "%s verify", (Object) toString());
            long verify = super.verify(sQLiteDatabase);
            if (verify != -1) {
                return verify;
            }
            if (this.mCursor.isNull(4)) {
                long run = new CheckPostProcessing(this.mContext, this.mCursor.getString(7)).run(sQLiteDatabase, null);
                if (run == -111) {
                    return run;
                }
            }
            MediaConflict mediaConflict = new MediaConflict(this.mContext, this.mCursor.getString(6), this.mAlbumId, this.mMediaId, this.mCursor.getString(9));
            long run2 = mediaConflict.run(sQLiteDatabase, null);
            if (run2 == -102) {
                return -1;
            }
            return run2;
        }
    }

    private static class MediaConflict extends CursorTask {
        private long mAlbumId;
        private String mFileName;
        private long mMediaId;
        private String mSha1;

        public MediaConflict(Context context, String str, long j, long j2, String str2) {
            super(context, null);
            this.mFileName = str;
            this.mAlbumId = j;
            this.mMediaId = j2;
            this.mSha1 = str2;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j = this.mMediaId;
            if (ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                j = ShareMediaManager.getOriginalMediaId(j);
            }
            if (this.mCursor.getLong(0) == j) {
                return -103;
            }
            String string = this.mCursor.getString(1);
            return (!TextUtils.equals(string, this.mSha1) || TextUtils.isEmpty(string)) ? -105 : -104;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            if (ShareAlbumManager.isOtherShareAlbumId(this.mAlbumId)) {
                return sQLiteDatabase.query("shareImage", new String[]{"_id", "sha1"}, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND fileName = ? AND localGroupId=?", new String[]{this.mFileName, String.valueOf(ShareAlbumManager.getOriginalAlbumId(this.mAlbumId))}, null, null, null);
            }
            return sQLiteDatabase.query("cloud", new String[]{"_id", "sha1"}, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND fileName = ? AND localGroupId=?", new String[]{this.mFileName, String.valueOf(this.mAlbumId)}, null, null, null);
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(".Conflict{");
            sb.append(this.mFileName);
            sb.append("}");
            return sb.toString();
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            long verify = super.verify(sQLiteDatabase);
            if (verify != -1) {
                return verify;
            }
            if (!TextUtils.isEmpty(this.mFileName)) {
                return -1;
            }
            Log.w("CloudManager", "%s's fileName is empty, so no conflict", toString());
            return -102;
        }
    }

    private static class Move extends Media {
        public Move(Context context, ArrayList<Long> arrayList, long j, long j2) {
            super(context, arrayList, j, j2);
            Log.d("CloudManager", "Move mediaId %d albumId %d", Long.valueOf(j), Long.valueOf(j2));
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j;
            int i;
            int i2 = this.mCursor.getInt(2);
            Log.d("CloudManager", "current LOCAL_FLAG is %d", (Object) Integer.valueOf(i2));
            if (i2 != 0) {
                ContentValues contentValues = new ContentValues();
                contentValues.put("localGroupId", Long.valueOf(this.mAlbumId));
                int update = sQLiteDatabase.update("cloud", contentValues, "_id=?", new String[]{String.valueOf(this.mMediaId)});
                Log.d("CloudManager", "MOVE FINISH: local item, result(%d)", (Object) Integer.valueOf(update));
                if (update > 0) {
                    mediaManager.update("_id=?", new String[]{String.valueOf(this.mMediaId)}, contentValues);
                    markAsDirty(this.mMediaId);
                }
                return this.mMediaId;
            }
            ContentValues contentValues2 = new ContentValues();
            if (CloudManager.isSystemAlbum((long) this.mCursor.getInt(1))) {
                Log.d("CloudManager", "system album:");
                contentValues2.put("localFlag", Integer.valueOf(5));
                contentValues2.put("fromLocalGroupId", Integer.valueOf(this.mCursor.getInt(3)));
                contentValues2.put("localGroupId", Long.valueOf(this.mAlbumId));
                contentValues2.putNull("groupId");
                contentValues2.putNull("localImageId");
                Log.d("CloudManager", "updates: %s", (Object) CloudManager.desensitization(contentValues2));
                int update2 = sQLiteDatabase.update("cloud", contentValues2, "_id=?", new String[]{String.valueOf(this.mMediaId)});
                Log.d("CloudManager", "MOVE FINISH: system album item, result(%d)", (Object) Integer.valueOf(update2));
                if (update2 > 0) {
                    mediaManager.update("_id=?", new String[]{String.valueOf(this.mMediaId)}, contentValues2);
                    markAsDirty(this.mMediaId);
                }
                j = this.mMediaId;
            } else {
                Log.d("CloudManager", "cloud album:");
                contentValues2.put("localFlag", Integer.valueOf(11));
                ContentValues contentValues3 = new ContentValues();
                contentValues3.put("localFlag", Integer.valueOf(5));
                contentValues3.putAll(CloudManager.copyOf(CloudManager.PUBLIC_COPYABLE_PROJECTION, this.mCursor));
                contentValues3.putAll(CloudManager.copyOf(CloudManager.PRIVATE_COPYABLE_PROJECTION, this.mCursor));
                contentValues3.put("fromLocalGroupId", Integer.valueOf(this.mCursor.getInt(3)));
                contentValues3.put("localGroupId", Long.valueOf(this.mAlbumId));
                contentValues3.put("localImageId", Long.valueOf(this.mMediaId));
                Log.d("CloudManager", "inserts: %s", (Object) CloudManager.desensitization(contentValues3));
                long insert = sQLiteDatabase.insert("cloud", null, contentValues3);
                if (insert > 0) {
                    mediaManager.insert(insert, contentValues3);
                    markAsDirty(insert);
                    Log.d("CloudManager", "updates: %s", (Object) CloudManager.desensitization(contentValues2));
                    i = sQLiteDatabase.update("cloud", contentValues2, "_id=?", new String[]{String.valueOf(this.mMediaId)});
                    if (i > 0) {
                        mediaManager.delete("_id=?", new String[]{String.valueOf(this.mMediaId)});
                        markAsDirty(this.mMediaId);
                    }
                } else {
                    insert = -101;
                    i = 0;
                }
                Log.d("CloudManager", "MOVE FINISH: cloud album item, results(update:%d; insert:%d)", Integer.valueOf(i), Long.valueOf(insert));
                j = insert;
            }
            return j;
        }

        public String toString() {
            return String.format("Move{%d, %d}", new Object[]{Long.valueOf(this.mMediaId), Long.valueOf(this.mAlbumId)});
        }

        /* access modifiers changed from: protected */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            if (!ShareMediaManager.isOtherShareMediaId(this.mMediaId)) {
                return super.verify(sQLiteDatabase);
            }
            Log.w("CloudManager", "Illegal operate: move share media");
            return -114;
        }
    }

    private static class MoveByUri extends BaseCopyOrMoveByUri {
        public MoveByUri(Context context, ArrayList<Long> arrayList, Uri uri, long j) {
            super(context, arrayList, uri, j);
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j = (this.mCursor == null || !this.mCursor.moveToFirst()) ? 0 : this.mCursor.getLong(0);
            if (j > 0) {
                Move move = new Move(this.mContext, getDirtyBulk(), j, this.mAlbumId);
                long run = move.run(sQLiteDatabase, mediaManager);
                if (run > 0) {
                    FileHandleService.dispatchTask(this.mContext, getDirtyBulk());
                    getDirtyBulk().clear();
                }
                return run;
            }
            Context applicationContext = this.mContext.getApplicationContext();
            SaveParams saveParams = new SaveParams(new File(this.mTarPath), this.mAlbumId, 8, true);
            long saveToCloudDB = SaveToCloudUtil.saveToCloudDB(applicationContext, saveParams);
            if (saveToCloudDB > 0) {
                markAsDirty(saveToCloudDB);
                FileHandleService.dispatchTask(this.mContext, getDirtyBulk());
                getDirtyBulk().clear();
                return saveToCloudDB;
            } else if (saveToCloudDB == -2) {
                return -103;
            } else {
                return saveToCloudDB == -1 ? -101 : -101;
            }
        }

        public String toString() {
            return String.format("MoveByUri{%s, %d}", new Object[]{this.mUri.toString(), Long.valueOf(this.mAlbumId)});
        }
    }

    private static class RemoveFromSecret extends CursorTask {
        private long mAlbumId;
        private long mMediaId;

        public RemoveFromSecret(Context context, ArrayList<Long> arrayList, long j, long j2) {
            super(context, arrayList);
            this.mMediaId = j;
            this.mAlbumId = j2;
        }

        private void addFilePath(ContentValues contentValues, boolean z) {
            contentValues.put("localFile", this.mCursor.getString(7));
            contentValues.put("thumbnailFile", this.mCursor.getString(8));
            contentValues.put("microthumbfile", this.mCursor.getString(12));
            String addPostfixToFileName = z ? DownloadPathHelper.addPostfixToFileName(this.mCursor.getString(6), String.valueOf(System.currentTimeMillis())) : this.mCursor.getString(6);
            contentValues.put("fileName", addPostfixToFileName);
            byte[] blob = this.mCursor.getBlob(11);
            if (blob != null) {
                DBCloud dBCloud = new DBCloud(this.mCursor.getString(4));
                dBCloud.setFileName(addPostfixToFileName);
                dBCloud.setSecretKey(blob);
                dBCloud.setSha1(this.mCursor.getString(9));
                dBCloud.setLocalFile(this.mCursor.getString(7));
                dBCloud.setThumbnailFile(this.mCursor.getString(8));
                dBCloud.setMicroThumbFile(this.mCursor.getString(12));
                dBCloud.setServerType(this.mCursor.getInt(5));
                dBCloud.setTitle(this.mCursor.getString(18));
                SecretAlbumUtils.decryptFiles(dBCloud, contentValues);
                return;
            }
            DBCloud dBCloud2 = new DBCloud(this.mCursor.getString(4));
            dBCloud2.setFileName(addPostfixToFileName);
            dBCloud2.setLocalFile(this.mCursor.getString(7));
            dBCloud2.setThumbnailFile(this.mCursor.getString(8));
            dBCloud2.setServerType(this.mCursor.getInt(5));
            dBCloud2.setTitle(this.mCursor.getString(18));
            SecretAlbumUtils.decodeFileNames(dBCloud2, contentValues);
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            long j;
            if (SpaceFullHandler.isOwnerSpaceFull()) {
                return -106;
            }
            MediaConflict mediaConflict = new MediaConflict(this.mContext, this.mCursor.getString(6), this.mAlbumId, this.mMediaId, this.mCursor.getString(9));
            long run = mediaConflict.run(sQLiteDatabase, null);
            if (run == -104) {
                CloudManager.delete(this.mContext, sQLiteDatabase, mediaManager, getDirtyBulk(), new long[]{this.mMediaId}, 37);
                return -103;
            }
            int i = this.mCursor.getInt(2);
            long j2 = -101;
            if (i != 0) {
                ContentValues contentValues = new ContentValues();
                contentValues.put("localGroupId", Long.valueOf(this.mAlbumId));
                if (this.mCursor.isNull(4) && i == 7) {
                    contentValues.put("localFlag", Integer.valueOf(8));
                }
                addFilePath(contentValues, run == -105);
                if (sQLiteDatabase.update("cloud", contentValues, "_id=?", new String[]{String.valueOf(this.mMediaId)}) > 0) {
                    if (mediaManager != null) {
                        mediaManager.update("_id=?", new String[]{String.valueOf(this.mMediaId)}, contentValues);
                    }
                    j2 = this.mMediaId;
                    markAsDirty(j2);
                }
                j = j2;
            } else {
                ContentValues contentValues2 = new ContentValues();
                contentValues2.put("localFlag", Integer.valueOf(11));
                ContentValues contentValues3 = new ContentValues();
                contentValues3.put("localFlag", Integer.valueOf(5));
                contentValues3.putAll(CloudManager.copyOf(CloudManager.PUBLIC_COPYABLE_PROJECTION, this.mCursor));
                addFilePath(contentValues3, run == -105);
                contentValues3.put("fromLocalGroupId", Integer.valueOf(this.mCursor.getInt(3)));
                contentValues3.put("localGroupId", Long.valueOf(this.mAlbumId));
                contentValues3.put("localImageId", Long.valueOf(this.mMediaId));
                j = sQLiteDatabase.insert("cloud", null, contentValues3);
                if (j > 0) {
                    mediaManager.insert(j, contentValues3);
                    if (sQLiteDatabase.update("cloud", contentValues2, "_id=?", new String[]{String.valueOf(this.mMediaId)}) > 0) {
                        mediaManager.delete("_id=?", new String[]{String.valueOf(this.mMediaId)});
                    }
                    markAsDirty(j);
                }
            }
            return j;
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id=?", new String[]{String.valueOf(this.mMediaId)}, null, null, null);
        }

        public String toString() {
            return String.format(Locale.US, "RemoveFromSecret{%d}", new Object[]{Long.valueOf(this.mMediaId)});
        }
    }

    private static class Rename extends CursorTask {
        private long mId;
        private String mNewName;

        public Rename(Context context, ArrayList<Long> arrayList, long j, String str) {
            super(context, arrayList);
            this.mId = j;
            this.mNewName = str;
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            String str;
            String str2;
            String str3 = null;
            if (!TextUtils.isEmpty(this.mCursor.getString(7))) {
                str = this.mCursor.getString(7);
                str2 = "localFile";
            } else if (!TextUtils.isEmpty(this.mCursor.getString(8))) {
                str = this.mCursor.getString(8);
                str2 = "thumbnailFile";
            } else {
                str = null;
                str2 = null;
            }
            if (FileUtils.isFileExist(str)) {
                str3 = FileUtils.concat(FileUtils.getParentFolderPath(str), this.mNewName);
                if (new File(str3).exists()) {
                    str3 = FileUtils.concat(FileUtils.getParentFolderPath(str), String.format("%s_%s.%s", new Object[]{FileUtils.getFileNameWithoutExtension(this.mNewName), Long.valueOf(System.currentTimeMillis()), FileUtils.getExtension(this.mNewName)}));
                }
            }
            if (!FileUtils.move(new File(str), new File(str3))) {
                return -113;
            }
            MediaStoreUtils.update(MediaStoreUtils.getFileMediaUri(str), str3);
            String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(7);
            GalleryUtils.safeExec(String.format("update %s set %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s=%s", new Object[]{"cloud", "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, "_id", Long.valueOf(this.mId)}));
            ContentValues contentValues = new ContentValues();
            if (str3 != null) {
                contentValues.put(str2, str3);
            }
            contentValues.put("title", FileUtils.getFileTitle(this.mNewName));
            contentValues.put("fileName", this.mNewName);
            return (long) SafeDBUtil.safeUpdate(this.mContext, Cloud.CLOUD_URI, contentValues, "_id=?", new String[]{String.valueOf(this.mId)});
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id=?  AND (serverType!=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{String.valueOf(this.mId)}, null, null, null);
        }

        public String toString() {
            return String.format(Locale.US, "Rename{id: %d}", new Object[]{Long.valueOf(this.mId)});
        }
    }

    private static class RenameAlbum extends CursorTask {
        private long mAlbumId;
        private String mNewName;

        public RenameAlbum(Context context, ArrayList<Long> arrayList, long j, String str) {
            super(context, arrayList);
            this.mAlbumId = j;
            this.mNewName = str;
        }

        private Cursor getConflictAlbumCursor(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "fileName=? COLLATE NOCASE  AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{this.mNewName}, null, null, null);
        }

        /* access modifiers changed from: protected */
        public long execute(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("fileName", this.mNewName);
            if (this.mCursor.getInt(2) == 0) {
                contentValues.put("localFlag", Integer.valueOf(10));
            }
            int update = sQLiteDatabase.update("cloud", contentValues, "_id=?", new String[]{String.valueOf(this.mAlbumId)});
            Log.d("CloudManager", "Album(id: %d) rename finished.", (Object) Long.valueOf(this.mAlbumId));
            if (update > 0) {
                return this.mAlbumId;
            }
            return -101;
        }

        /* access modifiers changed from: 0000 */
        /* JADX WARNING: Removed duplicated region for block: B:18:0x0025  */
        public long getConflictAlbumId(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            try {
                cursor = getConflictAlbumCursor(sQLiteDatabase);
                if (cursor != null) {
                    try {
                        if (cursor.moveToFirst()) {
                            long j = cursor.getLong(0);
                            if (cursor != null) {
                                cursor.close();
                            }
                            return j;
                        }
                    } catch (Throwable th) {
                        th = th;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                }
                if (cursor != null) {
                    cursor.close();
                }
                return -102;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }

        /* access modifiers changed from: protected */
        public Cursor prepare(SQLiteDatabase sQLiteDatabase) {
            return sQLiteDatabase.query("cloud", CloudManager.PROJECTION, "_id=?  AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{String.valueOf(this.mAlbumId)}, null, null, null);
        }

        public String toString() {
            return String.format(Locale.US, "RenameAlbum{id: %d}", new Object[]{Long.valueOf(this.mAlbumId)});
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:33:0x004e  */
        /* JADX WARNING: Removed duplicated region for block: B:37:0x0055  */
        public long verify(SQLiteDatabase sQLiteDatabase) {
            Cursor cursor;
            Exception e;
            long verify = super.verify(sQLiteDatabase);
            if (verify != -1) {
                return verify;
            }
            try {
                cursor = getConflictAlbumCursor(sQLiteDatabase);
                if (cursor == null) {
                    try {
                        Log.d("CloudManager", "cursor is null, verify failed.");
                        if (cursor != null) {
                            MiscUtil.closeSilently(cursor);
                        }
                        return -101;
                    } catch (Exception e2) {
                        e = e2;
                        try {
                            Log.e("CloudManager", (Throwable) e);
                            if (cursor != null) {
                                MiscUtil.closeSilently(cursor);
                            }
                            return -101;
                        } catch (Throwable th) {
                            th = th;
                            if (cursor != null) {
                                MiscUtil.closeSilently(cursor);
                            }
                            throw th;
                        }
                    }
                } else if (cursor.moveToFirst()) {
                    Log.d("CloudManager", "Album name already exists.");
                    if (cursor != null) {
                        MiscUtil.closeSilently(cursor);
                    }
                    return -103;
                } else {
                    if (cursor != null) {
                        MiscUtil.closeSilently(cursor);
                    }
                    return -1;
                }
            } catch (Exception e3) {
                e = e3;
                cursor = null;
                Log.e("CloudManager", (Throwable) e);
                if (cursor != null) {
                }
                return -101;
            } catch (Throwable th2) {
                th = th2;
                cursor = null;
                if (cursor != null) {
                }
                throw th;
            }
        }
    }

    static {
        METHODS.add("create_album");
        METHODS.add("add_to_album");
        METHODS.add("delete");
        METHODS.add("set_album_attributes");
        METHODS.add("force_top");
        METHODS.add("unforce_top");
        METHODS.add("add_remove_secret");
        METHODS.add("rename_album");
        METHODS.add("delete_album");
        METHODS.add("add_remove_favorite");
        METHODS.add("rename");
    }

    private static long addRemoveFavoritesById(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, int i) {
        try {
            AddRemoveFavoritesById addRemoveFavoritesById = new AddRemoveFavoritesById(context, arrayList, i, j);
            return addRemoveFavoritesById.run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            Log.e("CloudManager", "Add or remove favorites by id with error: %s", (Object) Long.valueOf(j));
            return -100;
        }
    }

    private static long addRemoveFavoritesByPath(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String str, int i) {
        try {
            return new AddRemoveFavoritesByPath(context, arrayList, i, str).run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            Log.e("CloudManager", "Add or remove favorites by path with error: %s", (Object) str);
            return -100;
        }
    }

    private static long addRemoveFavoritesSha1(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String str, int i) {
        try {
            return new AddRemoveFavoritesBySha1(context, arrayList, i, str).run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            Log.e("CloudManager", "Add or remove favorites by sha1 with error: %s", (Object) str);
            return -100;
        }
    }

    private static long addToSecret(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j) {
        try {
            return new AddToSecret(context, arrayList, j).run(sQLiteDatabase, mediaManager);
        } catch (Exception e) {
            Log.e("CloudManager", "add to secret error %d, %s", Long.valueOf(j), e);
            return -100;
        }
    }

    private static long addToSecret(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, Uri uri) {
        try {
            return new AddToSecretByUri(context, arrayList, uri).run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            Log.e("CloudManager", "add to secret error %s", (Object) uri);
            return -100;
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:144:0x0418, code lost:
        r11 = r9.getLongArray("extra_src_media_ids");
     */
    /* JADX WARNING: Code restructure failed: missing block: B:145:0x041e, code lost:
        if (r11 == null) goto L_0x043a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:146:0x0420, code lost:
        r7 = new long[r11.length];
        r12 = 0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:148:0x0425, code lost:
        if (r12 >= r11.length) goto L_0x043a;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:149:0x0427, code lost:
        r7[r12] = addRemoveFavoritesById(r25, r26, r27, r14, r11[r12], r10);
        r12 = r12 + 1;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:150:0x043a, code lost:
        r13.putLongArray("ids", r7);
     */
    public static Bundle call(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, String str, String str2, Bundle bundle) {
        Bundle bundle2;
        Context context2;
        boolean z;
        boolean z2;
        int i;
        int i2;
        long[] jArr;
        int i3;
        long[] jArr2;
        long[] jArr3;
        Context context3 = context;
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        String str3 = str;
        String str4 = str2;
        Bundle bundle3 = bundle;
        Bundle bundle4 = new Bundle();
        ArrayList arrayList = new ArrayList();
        if ("add_to_album".equals(str3)) {
            long longValue = Numbers.parse(str4, Long.valueOf(-1)).longValue();
            int i4 = bundle3.getInt("extra_src_type", 0);
            int i5 = bundle3.getInt("extra_type", 0);
            if (i4 == 1) {
                ArrayList parcelableArrayList = bundle3.getParcelableArrayList("extra_src_uris");
                if (parcelableArrayList == null || isVirtualAlbum(longValue)) {
                    Log.e("CloudManager", "error, albumId is %s, uris is %s", str4, parcelableArrayList);
                    return bundle4;
                }
                long[] jArr4 = new long[parcelableArrayList.size()];
                Iterator it = parcelableArrayList.iterator();
                int i6 = 0;
                while (it.hasNext()) {
                    Uri uri = (Uri) it.next();
                    if (i5 == 0) {
                        jArr3 = jArr4;
                        jArr3[i6] = copyByUri(context, sQLiteDatabase, mediaManager, arrayList, longValue, uri);
                    } else {
                        jArr3 = jArr4;
                        if (i5 == 1) {
                            jArr3[i6] = moveByUri(context, sQLiteDatabase, mediaManager, arrayList, longValue, uri);
                        }
                    }
                    i6++;
                    jArr4 = jArr3;
                }
                bundle4.putLongArray("ids", jArr4);
            } else if (i4 == 0) {
                int i7 = bundle3.getInt("extra_dup_type", -1);
                long[] longArray = bundle3.getLongArray("extra_src_media_ids");
                if (longArray == null || (!(i5 == 0 || i5 == 1) || isVirtualAlbum(longValue))) {
                    Log.e("CloudManager", "error, albumId is %s, mediaIds is %s", str4, longArray);
                    return bundle4;
                }
                long[] jArr5 = new long[longArray.length];
                int length = longArray.length;
                int i8 = 0;
                int i9 = 0;
                while (i8 < length) {
                    long j = longArray[i8];
                    if (i5 == 0) {
                        i2 = i8;
                        jArr2 = longArray;
                        i = length;
                        jArr = jArr5;
                        i3 = i5;
                        jArr[i9] = copy(context, sQLiteDatabase, mediaManager, arrayList, longValue, j, i7);
                    } else {
                        i2 = i8;
                        jArr2 = longArray;
                        i = length;
                        jArr = jArr5;
                        i3 = i5;
                        if (i3 == 1) {
                            jArr[i9] = move(context, sQLiteDatabase, mediaManager, arrayList, longValue, j, i7);
                        }
                    }
                    i9++;
                    i8 = i2 + 1;
                    longArray = jArr2;
                    i5 = i3;
                    jArr5 = jArr;
                    length = i;
                    Context context4 = context;
                    SQLiteDatabase sQLiteDatabase3 = sQLiteDatabase;
                    MediaManager mediaManager3 = mediaManager;
                    Bundle bundle5 = bundle;
                }
                bundle4.putLongArray("ids", jArr5);
                context2 = context;
                bundle2 = bundle;
            }
            context2 = context;
            bundle2 = bundle;
        } else {
            if ("delete_album".equals(str3)) {
                ArrayList arrayList2 = new ArrayList();
                bundle2 = bundle;
                int i10 = bundle2.getInt("extra_delete_options", 0);
                int i11 = bundle2.getInt("extra_delete_reason", 21);
                deleteAlbum(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getLongArray("extra_album_ids"), i10, arrayList2, i11);
                bundle4.putLongArray("ids", MiscUtil.ListToArray(arrayList2));
            } else {
                bundle2 = bundle;
                long[] jArr6 = null;
                if ("delete".equals(str3)) {
                    ArrayList arrayList3 = new ArrayList();
                    int i12 = bundle2.getInt("delete_by");
                    int i13 = bundle2.getInt("extra_delete_options", 0);
                    int i14 = bundle2.getInt("extra_delete_reason", 24);
                    if (i12 == 0) {
                        int i15 = bundle2.getInt("extra_dup_type", -1);
                        jArr6 = deleteById(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getLongArray("extra_ids"), i15, i13, arrayList3, i14);
                        bundle4.putLongArray("ids", MiscUtil.ListToArray(arrayList3));
                    } else if (i12 == 1) {
                        jArr6 = deleteByPath(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getStringArray("extra_paths"), i13, arrayList3, i14);
                        bundle4.putLongArray("ids", MiscUtil.ListToArray(arrayList3));
                    } else if (i12 == 2) {
                        jArr6 = deleteBySha1(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getStringArray("extra_sha1s"), bundle2.getBoolean("extra_keep_dup"), i14);
                    } else if (i12 == 3) {
                        jArr6 = deleteCloudByPath(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getStringArray("extra_paths"), arrayList3, i14);
                        bundle4.putLongArray("ids", MiscUtil.ListToArray(arrayList3));
                    }
                    bundle4.putLong("count", (long) getValidCount(jArr6));
                } else if ("create_album".equals(str3)) {
                    context2 = context;
                    Bundle createAlbum = createAlbum(context2, sQLiteDatabase, mediaManager, arrayList, str4);
                    if (createAlbum != null) {
                        bundle4.putAll(createAlbum);
                    } else {
                        bundle4.putLong("id", -101);
                    }
                } else {
                    MediaManager mediaManager4 = mediaManager;
                    context2 = context;
                    SQLiteDatabase sQLiteDatabase4 = sQLiteDatabase;
                    if ("rename_album".equals(str3)) {
                        Bundle renameAlbum = renameAlbum(context, sQLiteDatabase, mediaManager, arrayList, bundle2.getLong("album_id"), str2);
                        if (renameAlbum != null) {
                            bundle4.putAll(renameAlbum);
                            if (renameAlbum.getLong("id") > 0) {
                                bundle4.putBoolean("should_request_sync", true);
                            }
                        } else {
                            bundle4.putLong("id", -101);
                        }
                    } else if ("set_album_attributes".equals(str3)) {
                        long[] longArray2 = bundle2.getLongArray("album_id");
                        long j2 = bundle2.getLong("attributes_bit");
                        setAlbumAttributes(sQLiteDatabase, mediaManager, longArray2, j2, bundle2.getBoolean("set"), bundle2.getBoolean("manual"));
                        int length2 = longArray2.length;
                        int i16 = 0;
                        while (true) {
                            if (i16 >= length2) {
                                break;
                            } else if (!ShareAlbumManager.isOtherShareAlbumId(longArray2[i16])) {
                                List albumSyncAttributes = AlbumManager.getAlbumSyncAttributes();
                                if (MiscUtil.isValid(albumSyncAttributes) && albumSyncAttributes.contains(Long.valueOf(j2))) {
                                    if (j2 == 1) {
                                        bundle4.putBoolean("should_request_sync", bundle2.getBoolean("set"));
                                    } else {
                                        bundle4.putBoolean("should_request_sync", true);
                                    }
                                }
                            } else {
                                i16++;
                            }
                        }
                    } else if ("force_top".equals(str3)) {
                        forceTop(context2, sQLiteDatabase4, mediaManager4, bundle2.getLongArray("album_id"));
                    } else if ("unforce_top".equals(str3)) {
                        unforceTop(context2, sQLiteDatabase4, mediaManager4, bundle2.getLongArray("album_id"));
                    } else if ("add_remove_secret".equals(str3)) {
                        int i17 = bundle2.getInt("operation_type");
                        if (i17 == 1) {
                            long[] longArray3 = bundle2.getLongArray("extra_src_media_ids");
                            if (longArray3 == null) {
                                ArrayList parcelableArrayList2 = bundle2.getParcelableArrayList("extra_src_uris");
                                if (parcelableArrayList2 != null) {
                                    long[] jArr7 = new long[parcelableArrayList2.size()];
                                    for (int i18 = 0; i18 < parcelableArrayList2.size(); i18++) {
                                        jArr7[i18] = addToSecret(context2, sQLiteDatabase4, mediaManager4, arrayList, (Uri) parcelableArrayList2.get(i18));
                                    }
                                    bundle4.putLongArray("ids", jArr7);
                                    longArray3 = jArr7;
                                }
                            } else {
                                for (int i19 = 0; i19 < longArray3.length; i19++) {
                                    longArray3[i19] = addToSecret(context, sQLiteDatabase, mediaManager, arrayList, longArray3[i19]);
                                }
                                bundle4.putLongArray("ids", longArray3);
                            }
                            int length3 = longArray3.length;
                            int i20 = 0;
                            while (true) {
                                if (i20 >= length3) {
                                    z2 = false;
                                    break;
                                } else if (longArray3[i20] > 0) {
                                    z2 = true;
                                    break;
                                } else {
                                    i20++;
                                }
                            }
                            bundle4.putBoolean("should_request_sync", z2);
                        } else if (i17 == 2) {
                            long longValue2 = Numbers.parse(str4, Long.valueOf(-1)).longValue();
                            long[] longArray4 = bundle2.getLongArray("extra_src_media_ids");
                            if (longArray4 != null) {
                                int i21 = 0;
                                while (i21 < longArray4.length) {
                                    long[] jArr8 = longArray4;
                                    int i22 = i21;
                                    jArr8[i22] = removeFromSecret(context, sQLiteDatabase, mediaManager, arrayList, longValue2, longArray4[i21]);
                                    i21 = i22 + 1;
                                    longArray4 = jArr8;
                                }
                                bundle4.putLongArray("ids", longArray4);
                            }
                        }
                    } else if ("add_remove_favorite".equals(str3)) {
                        int i23 = bundle2.getInt("add_remove_by");
                        int i24 = bundle2.getInt("operation_type");
                        switch (i23) {
                            case 1:
                                break;
                            case 2:
                                String[] stringArray = bundle2.getStringArray("extra_src_sha1");
                                if (stringArray != null) {
                                    jArr6 = new long[stringArray.length];
                                    for (int i25 = 0; i25 < stringArray.length; i25++) {
                                        jArr6[i25] = addRemoveFavoritesSha1(context, sQLiteDatabase, mediaManager, arrayList, stringArray[i25], i24);
                                    }
                                    break;
                                }
                                break;
                            case 3:
                                String[] stringArray2 = bundle2.getStringArray("extra_src_paths");
                                if (stringArray2 != null) {
                                    jArr6 = new long[stringArray2.length];
                                    for (int i26 = 0; i26 < stringArray2.length; i26++) {
                                        jArr6[i26] = addRemoveFavoritesByPath(context, sQLiteDatabase, mediaManager, arrayList, stringArray2[i26], i24);
                                    }
                                    break;
                                }
                                break;
                        }
                    } else if ("rename".equals(str3)) {
                        long j3 = bundle2.getLong("src_cloud_id");
                        long j4 = j3;
                        if (rename(context, sQLiteDatabase, mediaManager, arrayList, j3, str2) > 0) {
                            bundle4.putLong("id", j4);
                        } else {
                            bundle4.putLong("id", -101);
                        }
                    }
                }
            }
            context2 = context;
        }
        if (!arrayList.isEmpty()) {
            if (bundle2 != null) {
                z = false;
                if (bundle2.getBoolean("should_operate_sync", false)) {
                    z = true;
                }
            } else {
                z = false;
            }
            startUpdater(context2, z, arrayList);
        }
        return bundle4;
    }

    public static boolean canHandle(String str) {
        return METHODS.contains(str);
    }

    /* access modifiers changed from: private */
    public static long[] cloudDelete(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, ArrayList<Long> arrayList2, int i) {
        DeleteOwner deleteOwner = new DeleteOwner(context, arrayList, jArr, true, i);
        long[] run = deleteOwner.run(sQLiteDatabase, mediaManager);
        if (arrayList2 != null) {
            arrayList2.addAll(arrayList);
        }
        return run;
    }

    private static long copy(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, long j2, int i) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        try {
            Numbers.ensurePositive(j, j2);
            if (i != -1) {
                DupCopy dupCopy = new DupCopy(context, arrayList, j, j2, i);
                return dupCopy.run(sQLiteDatabase, mediaManager);
            }
            Copy copy = new Copy(context, arrayList, j2, j);
            return copy.run(sQLiteDatabase, mediaManager);
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return -100;
        }
    }

    private static long copyByUri(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, Uri uri) {
        try {
            CopyByUri copyByUri = new CopyByUri(context, arrayList, uri, j);
            return copyByUri.run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            return -100;
        }
    }

    /* access modifiers changed from: private */
    public static ContentValues copyOf(String[] strArr, Cursor cursor) {
        HashSet hashSet = new HashSet();
        hashSet.addAll(Arrays.asList(strArr));
        ContentValues contentValues = new ContentValues();
        for (int i = 0; i < cursor.getColumnCount(); i++) {
            String columnName = cursor.getColumnName(i);
            if (hashSet.contains(columnName)) {
                if (!"babyInfoJson".equals(columnName)) {
                    switch (cursor.getType(i)) {
                        case 0:
                            contentValues.putNull(columnName);
                            break;
                        case 1:
                            contentValues.put(columnName, Long.valueOf(cursor.getLong(i)));
                            break;
                        case 2:
                            contentValues.put(columnName, Double.valueOf(cursor.getDouble(i)));
                            break;
                        case 3:
                            contentValues.put(columnName, cursor.getString(i));
                            break;
                        case 4:
                            contentValues.put(columnName, cursor.getBlob(i));
                            break;
                    }
                } else {
                    Log.d("CloudManager", "catch column(%s), remove local_flag ", (Object) columnName);
                    try {
                        String string = cursor.getString(i);
                        if (!TextUtils.isEmpty(string)) {
                            JSONObject jSONObject = new JSONObject(string);
                            if (jSONObject.has("localFlag")) {
                                jSONObject.remove("localFlag");
                            }
                            contentValues.put("babyInfoJson", jSONObject.toString());
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return contentValues;
    }

    private static Bundle createAlbum(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String str) {
        long j;
        Bundle bundle = new Bundle(2);
        if (TextUtils.isEmpty(str)) {
            j = -100;
        } else {
            CreateAlbum createAlbum = new CreateAlbum(context, arrayList, str);
            long run = createAlbum.run(sQLiteDatabase, mediaManager);
            if (run == -103 || run == -105) {
                long conflictAlbumId = createAlbum.getConflictAlbumId(sQLiteDatabase);
                if (conflictAlbumId >= 0) {
                    bundle.putLong("conflict_album_id", conflictAlbumId);
                }
            }
            j = run;
        }
        bundle.putLong("id", j);
        return bundle;
    }

    static DeleteRecord createDeleteRecord(int i, Cursor cursor, String str) {
        if (cursor != null) {
            String string = cursor.getString(7);
            if (TextUtils.isEmpty(string)) {
                string = cursor.getString(8);
            }
            if (!TextUtils.isEmpty(string)) {
                return new DeleteRecord(i, string, str);
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public static long[] delete(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, int i) {
        return delete(context, sQLiteDatabase, mediaManager, arrayList, jArr, 0, null, i);
    }

    /* access modifiers changed from: private */
    public static long[] delete(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, int i, ArrayList<Long> arrayList2, int i2) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        ArrayList<Long> arrayList3 = arrayList;
        long[] jArr2 = jArr;
        ArrayList<Long> arrayList4 = arrayList2;
        if (i == 1) {
            String format = String.format("deleteLocal{%s}", new Object[]{Long.valueOf(Thread.currentThread().getId())});
            TimingTracing.beginTracing(format, String.format("count{%s}", new Object[]{Integer.valueOf(jArr2.length)}));
            long[] jArr3 = new long[jArr2.length];
            for (int i3 = 0; i3 < jArr2.length; i3++) {
                DeleteFile deleteFile = new DeleteFile(context, arrayList, jArr2[i3], i2);
                jArr3[i3] = deleteFile.run(sQLiteDatabase2, mediaManager2);
                if (jArr3[i3] > 0 && arrayList4 != null) {
                    arrayList4.add(Long.valueOf(jArr2[i3]));
                }
            }
            TimingTracing.stopTracing(format, null);
            return jArr3;
        }
        Context context2 = context;
        long[] run = new Delete(context, arrayList3, jArr2, i2).run(sQLiteDatabase2, mediaManager2);
        if (arrayList4 != null) {
            arrayList4.addAll(arrayList3);
        }
        return run;
    }

    private static long[] deleteAlbum(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, int i, ArrayList<Long> arrayList2, int i2) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        long[] jArr2 = jArr;
        try {
            Numbers.ensurePositive(jArr);
            long[] jArr3 = new long[jArr2.length];
            for (int i3 = 0; i3 < jArr2.length; i3++) {
                if (i == 1) {
                    DeleteFile deleteFile = new DeleteFile(context, arrayList, jArr2[i3], i2);
                    jArr3[i3] = deleteFile.run(sQLiteDatabase2, mediaManager2);
                } else {
                    DeleteAlbum deleteAlbum = new DeleteAlbum(context, arrayList, jArr2[i3], i2);
                    jArr3[i3] = deleteAlbum.run(sQLiteDatabase2, mediaManager2);
                }
                if (jArr3[i3] > 0) {
                    arrayList2.add(Long.valueOf(jArr2[i3]));
                } else {
                    ArrayList<Long> arrayList3 = arrayList2;
                }
            }
            return jArr3;
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return new long[]{-100};
        }
    }

    private static long[] deleteById(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, int i, int i2, ArrayList<Long> arrayList2, int i3) {
        try {
            Numbers.ensurePositive(jArr);
            return i != -1 ? dupDelete(context, sQLiteDatabase, mediaManager, arrayList, jArr, i, i2, arrayList2, i3) : delete(context, sQLiteDatabase, mediaManager, arrayList, jArr, i2, arrayList2, i3);
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return new long[]{-100};
        }
    }

    private static long[] deleteByPath(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String[] strArr, int i, ArrayList<Long> arrayList2, int i2) {
        String[] strArr2 = strArr;
        try {
            long[] jArr = new long[strArr2.length];
            for (int i3 = 0; i3 < strArr2.length; i3++) {
                DeleteByPath deleteByPath = new DeleteByPath(context, arrayList, strArr2[i3], i, arrayList2, i2);
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                MediaManager mediaManager2 = mediaManager;
                jArr[i3] = deleteByPath.run(sQLiteDatabase, mediaManager);
            }
            return jArr;
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return new long[]{-100};
        }
    }

    private static long[] deleteBySha1(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String[] strArr, boolean z, int i) {
        String[] strArr2 = strArr;
        try {
            long[] jArr = new long[strArr2.length];
            for (int i2 = 0; i2 < strArr2.length; i2++) {
                DeleteBySha1 deleteBySha1 = new DeleteBySha1(context, arrayList, strArr2[i2], z, i);
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                MediaManager mediaManager2 = mediaManager;
                jArr[i2] = deleteBySha1.run(sQLiteDatabase, mediaManager);
            }
            return jArr;
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return new long[]{-100};
        }
    }

    private static long[] deleteCloudByPath(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, String[] strArr, ArrayList<Long> arrayList2, int i) {
        String[] strArr2 = strArr;
        try {
            long[] jArr = new long[strArr2.length];
            for (int i2 = 0; i2 < strArr2.length; i2++) {
                DeleteCloudByPath deleteCloudByPath = new DeleteCloudByPath(context, arrayList, strArr2[i2], arrayList2, i);
                SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                MediaManager mediaManager2 = mediaManager;
                jArr[i2] = deleteCloudByPath.run(sQLiteDatabase, mediaManager);
            }
            return jArr;
        } catch (Exception e) {
            Log.w("CloudManager", (Throwable) e);
            return new long[]{-100};
        }
    }

    /* access modifiers changed from: private */
    public static ContentValues desensitization(ContentValues contentValues) {
        if (contentValues == null) {
            return null;
        }
        ContentValues contentValues2 = new ContentValues(contentValues);
        contentValues2.remove("address");
        contentValues2.remove("exifGPSLatitude");
        contentValues2.remove("exifGPSLongitude");
        contentValues2.remove("extraGPS");
        contentValues2.remove("location");
        return contentValues2;
    }

    private static long[] dupDelete(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long[] jArr, int i, int i2, ArrayList<Long> arrayList2, int i3) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        long[] jArr2 = jArr;
        ArrayList<Long> arrayList3 = arrayList2;
        if (i2 == 1) {
            String format = String.format("dupDeleteLocal{%s}", new Object[]{Long.valueOf(Thread.currentThread().getId())});
            TimingTracing.beginTracing(format, String.format("count{%s}", new Object[]{Integer.valueOf(jArr2.length)}));
            long[] jArr3 = new long[jArr2.length];
            for (int i4 = 0; i4 < jArr2.length; i4++) {
                DupDeleteFile dupDeleteFile = new DupDeleteFile(context, arrayList, jArr2[i4], i, i3);
                jArr3[i4] = dupDeleteFile.run(sQLiteDatabase2, mediaManager2);
                if (jArr3[i4] > 0 && arrayList3 != null) {
                    arrayList3.add(Long.valueOf(jArr2[i4]));
                }
            }
            TimingTracing.stopTracing(format, null);
            return jArr3;
        }
        DupDelete dupDelete = new DupDelete(context, arrayList, jArr, i, i3);
        long[] run = dupDelete.run(sQLiteDatabase2, mediaManager2);
        if (arrayList3 != null) {
            arrayList3.addAll(arrayList);
        }
        return run;
    }

    private static void forceTop(Context context, SQLiteDatabase sQLiteDatabase, long j, MediaManager mediaManager, boolean z) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        long j2 = j;
        ContentValues contentValues = new ContentValues();
        if (z) {
            long nextForceTopTime = Album.getNextForceTopTime();
            if (j2 == 2147483647L || j2 == 2147483646 || j2 == 2147483645 || j2 == 2147483644 || j2 == 2147483642) {
                Album.setVirtualAlbumSortBy(j2, nextForceTopTime);
                return;
            }
            contentValues.put("sortBy", Long.valueOf(nextForceTopTime));
        } else if (j2 == 2147483647L) {
            Album.setVirtualAlbumSortBy(j2, -998);
            return;
        } else if (j2 == 2147483646) {
            Album.setVirtualAlbumSortBy(j2, -997);
            return;
        } else if (j2 == 2147483645) {
            Album.setVirtualAlbumSortBy(j2, -994);
            return;
        } else if (j2 == 2147483644) {
            Album.setVirtualAlbumSortBy(j2, -1001);
            return;
        } else if (j2 == 2147483642) {
            Album.setVirtualAlbumSortBy(j2, -1000);
            return;
        } else {
            long j3 = j2 == 1 ? -999 : j2 == 2 ? -995 : 0;
            if (j3 == 0) {
                contentValues.putNull("sortBy");
            } else {
                contentValues.put("sortBy", Long.valueOf(j3));
            }
        }
        if (ShareAlbumManager.isOtherShareAlbumId(j)) {
            sQLiteDatabase2.update("shareAlbum", contentValues, String.format(Locale.US, "%s = ?", new Object[]{"_id"}), new String[]{String.valueOf(ShareAlbumManager.getOriginalAlbumId(j))});
        } else {
            sQLiteDatabase2.update("cloud", contentValues, String.format(Locale.US, "%s = ?", new Object[]{"_id"}), new String[]{String.valueOf(j)});
        }
    }

    private static void forceTop(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long[] jArr) {
        for (int length = jArr.length - 1; length >= 0; length--) {
            forceTop(context, sQLiteDatabase, jArr[length], mediaManager, true);
        }
    }

    static String genRelativePath(String str, boolean z) {
        return z ? DownloadPathHelper.getShareFolderRelativePathInCloud() : DownloadPathHelper.getFolderRelativePathInCloud(str);
    }

    static int getValidCount(long... jArr) {
        if (jArr == null) {
            return 0;
        }
        int i = 0;
        for (int i2 = 0; i2 < jArr.length; i2++) {
            i += jArr[i2] > 0 ? 1 : 0;
        }
        return i;
    }

    /* access modifiers changed from: private */
    public static boolean isSystemAlbum(long j) {
        return j == 1 || j == 2 || j == 4 || j == 3;
    }

    private static boolean isVirtualAlbum(long j) {
        for (int i : GalleryContract.Album.ALL_VIRTUAL_ALBUM_IDS) {
            if (j == ((long) i)) {
                return true;
            }
        }
        return false;
    }

    private static long move(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, long j2, int i) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        MediaManager mediaManager2 = mediaManager;
        try {
            Numbers.ensurePositive(j, j2);
            if (i != -1) {
                DupMove dupMove = new DupMove(context, arrayList, j, j2, i);
                return dupMove.run(sQLiteDatabase, mediaManager);
            }
            Move move = new Move(context, arrayList, j2, j);
            return move.run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            return -100;
        }
    }

    private static long moveByUri(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, Uri uri) {
        try {
            MoveByUri moveByUri = new MoveByUri(context, arrayList, uri, j);
            return moveByUri.run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            return -100;
        }
    }

    public static Cursor queryCloudItemByFilePath(Context context, SQLiteDatabase sQLiteDatabase, String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        if (FileUtils.isFileExist(str)) {
            try {
                UserCommentData userCommentData = ExifUtil.getUserCommentData(str);
                CharSequence sha1 = userCommentData != null ? userCommentData.getSha1() : null;
                String relativePath = StorageUtils.getRelativePath(context, FileUtils.getParentFolderPath(str));
                if (TextUtils.isEmpty(relativePath)) {
                    Log.w("CloudManager", "Could't get album path for %s", str);
                    return null;
                } else if (TextUtils.isEmpty(sha1)) {
                    return sQLiteDatabase.query("cloud", QUERY_BY_PATH_PROJECTION, "fileName LIKE ? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)", new String[]{FileUtils.getFileName(str), relativePath}, null, null, null);
                } else {
                    Bundle bundle = new Bundle();
                    bundle.putBoolean("is_thumbnail", true);
                    Cursor query = sQLiteDatabase.query("cloud", QUERY_BY_PATH_PROJECTION, "sha1=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND localGroupId IN (SELECT _id FROM cloud WHERE localFile LIKE ?)", new String[]{sha1, relativePath}, null, null, null);
                    if (query instanceof AbstractCursor) {
                        ((AbstractCursor) query).setExtras(bundle);
                    }
                    return query;
                }
            } catch (Exception e) {
                Log.w("CloudManager", "exif exifSha1 read fail %s", e);
                return null;
            }
        } else {
            return sQLiteDatabase.query("cloud", QUERY_BY_PATH_PROJECTION, "(localFile LIKE ? or thumbnailFile LIKE ?) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{str, str}, null, null, null);
        }
    }

    private static long removeFromSecret(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, long j2) {
        try {
            RemoveFromSecret removeFromSecret = new RemoveFromSecret(context, arrayList, j2, j);
            return removeFromSecret.run(sQLiteDatabase, mediaManager);
        } catch (Exception unused) {
            Log.e("CloudManager", "remove from secret error %d", (Object) Long.valueOf(j2));
            return -100;
        }
    }

    private static long rename(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, String str) {
        if (TextUtils.isEmpty(str)) {
            return -100;
        }
        try {
            Rename rename = new Rename(context, arrayList, j, str);
            return rename.run(sQLiteDatabase, mediaManager);
        } catch (Exception e) {
            Log.e("CloudManager", (Throwable) e);
            return -100;
        }
    }

    private static Bundle renameAlbum(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, ArrayList<Long> arrayList, long j, String str) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        Bundle bundle = new Bundle(2);
        long j2 = -100;
        if (!TextUtils.isEmpty(str)) {
            try {
                Numbers.ensurePositive(j);
                RenameAlbum renameAlbum = new RenameAlbum(context, arrayList, j, str);
                MediaManager mediaManager2 = mediaManager;
                long run = renameAlbum.run(sQLiteDatabase, mediaManager);
                if (run == -103 || run == -105) {
                    long conflictAlbumId = renameAlbum.getConflictAlbumId(sQLiteDatabase);
                    if (conflictAlbumId >= 0) {
                        bundle.putLong("conflict_album_id", conflictAlbumId);
                    }
                }
                j2 = run;
            } catch (Exception e) {
                Log.e("CloudManager", (Throwable) e);
            }
        }
        bundle.putLong("id", j2);
        return bundle;
    }

    private static void setAlbumAttributes(SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long[] jArr, long j, boolean z, boolean z2) {
        int i;
        int i2;
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        long[] jArr2 = jArr;
        long packageAttributeBit = AlbumManager.packageAttributeBit(j, z, z2);
        char c = 1;
        long packageAttributeBit2 = AlbumManager.packageAttributeBit(j, true, true);
        int length = jArr2.length;
        int i3 = 0;
        while (i3 < length) {
            long j2 = jArr2[i3];
            if (ShareAlbumManager.isOtherShareAlbumId(j2)) {
                long originalAlbumId = ShareAlbumManager.getOriginalAlbumId(j2);
                Object[] objArr = new Object[7];
                objArr[0] = "shareAlbum";
                objArr[c] = "attributes";
                objArr[2] = "attributes";
                objArr[3] = Long.valueOf(packageAttributeBit2);
                objArr[4] = Long.valueOf(packageAttributeBit);
                objArr[5] = "_id";
                objArr[6] = String.valueOf(originalAlbumId);
                sQLiteDatabase2.execSQL(String.format(Locale.US, "UPDATE %s SET %s = (%s & ~%d) | %d WHERE %s = %s", objArr));
                i2 = i3;
                i = length;
            } else {
                String str = "";
                List albumSyncAttributes = AlbumManager.getAlbumSyncAttributes();
                if (MiscUtil.isValid(albumSyncAttributes) && albumSyncAttributes.contains(Long.valueOf(j))) {
                    str = GalleryCloudUtils.transformToEditedColumnsElement(6);
                }
                sQLiteDatabase2.execSQL(String.format(Locale.US, "UPDATE %s SET %s = (%s & ~%d) | %d, %s=coalesce(replace(%s, '%s', '') || '%s', '%s') WHERE %s IN (%s)", new Object[]{"cloud", "attributes", "attributes", Long.valueOf(packageAttributeBit2), Long.valueOf(packageAttributeBit), "editedColumns", "editedColumns", str, str, str, "_id", String.valueOf(j2)}));
                i2 = i3;
                i = length;
                mediaManager.updateAttributes(j2, j, z, z2);
            }
            i3 = i2 + 1;
            length = i;
            c = 1;
        }
    }

    private static void startUpdater(Context context, boolean z, ArrayList<Long> arrayList) {
        FileHandleService.execute(context, z, arrayList);
    }

    private static void unforceTop(Context context, SQLiteDatabase sQLiteDatabase, MediaManager mediaManager, long[] jArr) {
        for (int length = jArr.length - 1; length >= 0; length--) {
            forceTop(context, sQLiteDatabase, jArr[length], mediaManager, false);
        }
    }
}
