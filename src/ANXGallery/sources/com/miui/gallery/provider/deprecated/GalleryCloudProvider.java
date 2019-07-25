package com.miui.gallery.provider.deprecated;

import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.UriMatcher;
import android.database.ContentObserver;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.sqlite.SQLiteDatabase;
import android.net.Uri;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.preference.GalleryPreferences.Sync;
import com.miui.gallery.provider.AlbumManager;
import com.miui.gallery.provider.GalleryContentResolver;
import com.miui.gallery.provider.GalleryContract;
import com.miui.gallery.provider.GalleryContract.Album;
import com.miui.gallery.provider.GalleryContract.CloudUser;
import com.miui.gallery.provider.GalleryContract.Media;
import com.miui.gallery.provider.GalleryContract.PeopleFace;
import com.miui.gallery.provider.GalleryContract.ShareUser;
import com.miui.gallery.provider.GalleryDBHelper;
import com.miui.gallery.provider.cache.MediaManager;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.Numbers;
import com.miui.gallery.util.SyncLog;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.UriUtil;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class GalleryCloudProvider extends ContentProvider {
    private static final String[] SAFE_INSERT_PROJECTION = {"_id", "fileName"};
    public static final Uri SYNC_SETTINGS_URI = GalleryContract.AUTHORITY_URI.buildUpon().appendPath("syncSettings").build();
    public static final Uri UPLOAD_STATE_URI = GalleryContract.AUTHORITY_URI.buildUpon().appendPath("uploadState").build();
    protected static GalleryDBHelper sDBHelper;
    /* access modifiers changed from: protected */
    public static final UriMatcher sUriMatcher = new UriMatcher(-1);
    private ContentResolver mContentResolver;
    private int mHasPendingItem = 0;
    private int mIsUploading = 0;
    protected MediaManager mMediaManager = null;

    protected static class AlbumInfo {
        protected static final String[] PROJECTION = {"_id", "attributes"};
        public final long mAlbumId;
        public final long mAttributes;

        public AlbumInfo(long j, long j2) {
            this.mAlbumId = j;
            this.mAttributes = j2;
        }
    }

    private class ContentResolver extends GalleryContentResolver {
        private ContentResolver() {
        }

        /* access modifiers changed from: protected */
        public Object matchUri(Uri uri) {
            return GalleryCloudProvider.matchTableName(uri);
        }

        /* access modifiers changed from: protected */
        public void notifyInternal(Uri uri, ContentObserver contentObserver, long j) {
            switch (GalleryCloudProvider.sUriMatcher.match(uri)) {
                case 1:
                case 2:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Media.URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OWNER_ALBUM_MEDIA, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Media.URI_ALL, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.ONE_PERSON_URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.PERSONS_URI, contentObserver, false);
                    break;
                case 5:
                case 6:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                    break;
                case 7:
                case 8:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI_SHARE_ALL, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(ShareUser.SHARE_USER_URI, contentObserver, false);
                    break;
                case 9:
                case 10:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Media.URI_OTHER_ALBUM_MEDIA, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Media.URI_ALL, contentObserver, false);
                    break;
                case 11:
                case 12:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI_SHARE_ALL, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(CloudUser.CLOUD_USER_URI, contentObserver, false);
                    break;
                case 17:
                case 18:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(Album.URI_SHARE_ALL, contentObserver, false);
                    break;
                case 24:
                case 25:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.ONE_PERSON_URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.PERSONS_URI, contentObserver, false);
                    break;
                case 26:
                case 27:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.ONE_PERSON_URI, contentObserver, false);
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.PERSONS_URI, contentObserver, false);
                    break;
                case 30:
                case 31:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(PeopleFace.RECOMMEND_FACES_OF_ONE_PERSON_URI, contentObserver, false);
                    break;
                default:
                    GalleryCloudProvider.this.getContext().getContentResolver().notifyChange(uri, contentObserver, false);
                    break;
            }
            if (j != 0) {
                SyncUtil.requestSync(GalleryCloudProvider.this.getContext(), new Builder().setSyncType(SyncType.NORMAL).setSyncReason(j).setDelayUpload(true).build());
            }
        }
    }

    static {
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud", 1);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloud/#", 2);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudSetting", 3);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudSetting/#", 4);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareAlbum", 5);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareAlbum/#", 6);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareUser", 7);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareUser/#", 8);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareImage", 9);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareImage/#", 10);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudUser", 11);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudUser/#", 12);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudCache", 13);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "cloudCache/#", 14);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "newFlagCache", 15);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "newFlagCache/#", 16);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "userInfo", 17);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "userInfo/#", 18);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "ownerSubUbifocus", 19);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "ownerSubUbifocus/#", 20);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareSubUbifocus", 21);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "shareSubUbifocus/#", 22);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFace", 24);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFace/#", 25);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "faceToImages", 26);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "faceToImages/#", 27);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFaceJoinFaceToImagesJoinCloud", 28);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFaceJoinFaceToImagesJoinCloud/#", 29);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFaceJoinFaceToImages", 38);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleFaceJoinFaceToImages/#", 39);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "uploadState", 23);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleRecommend", 30);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "peopleRecommend/#", 31);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "event", 32);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "event/#", 33);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "eventPhoto", 34);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "eventPhoto/#", 35);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "albumCoverKey", 36);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "albumCoverKey/#", 37);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "syncInfo", 40);
        sUriMatcher.addURI("com.miui.gallery.cloud.provider", "syncSettings", 41);
    }

    private String appendIdSelection(String str, long j) {
        String str2;
        if (j > 0) {
            StringBuilder sb = new StringBuilder();
            sb.append("_id = ");
            sb.append(j);
            str2 = sb.toString();
        } else {
            str2 = null;
        }
        if (TextUtils.isEmpty(str) && TextUtils.isEmpty(str2)) {
            return null;
        }
        if (TextUtils.isEmpty(str) && !TextUtils.isEmpty(str2)) {
            return str2;
        }
        if (!TextUtils.isEmpty(str) && TextUtils.isEmpty(str2)) {
            return str;
        }
        if (TextUtils.isEmpty(str) || TextUtils.isEmpty(str2)) {
            return null;
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("(");
        sb2.append(str);
        sb2.append(" ) AND ");
        sb2.append(str2);
        return sb2.toString();
    }

    private boolean deleteNonDBData(Uri uri, String str, String[] strArr) {
        return sUriMatcher.match(uri) == 23;
    }

    private boolean deleteSyncInfo(Uri uri, String str, String[] strArr) {
        if (sUriMatcher.match(uri) != 40) {
            return false;
        }
        Log.w("GalleryCloudProvider", "operation is not supported!");
        return true;
    }

    public static long getIdFromString(String str) {
        if (str != null) {
            try {
                return Long.valueOf(str).longValue();
            } catch (NumberFormatException unused) {
            }
        }
        return -1;
    }

    private final List<Long> getIdsSelection(String str, String[] strArr) {
        Cursor query = sDBHelper.query("cloud", new String[]{"_id"}, str, strArr, null, null, null, null);
        if (query == null) {
            return null;
        }
        try {
            ArrayList arrayList = new ArrayList();
            while (query.moveToNext()) {
                arrayList.add(Long.valueOf(query.getLong(0)));
            }
            return arrayList;
        } finally {
            query.close();
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:19:0x0033  */
    private int getMediaCount(String str, String str2) {
        Cursor cursor;
        try {
            cursor = sDBHelper.query(str, new String[]{"count(_id)"}, str2, null, null, null, null, null);
            if (cursor != null) {
                try {
                    if (cursor.moveToNext()) {
                        int i = cursor.getInt(0);
                        if (cursor != null) {
                            cursor.close();
                        }
                        return i;
                    }
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            }
            if (cursor != null) {
                cursor.close();
            }
            return 0;
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
            }
            throw th;
        }
    }

    private boolean insertNonDBData(Uri uri, ContentValues contentValues) {
        return sUriMatcher.match(uri) == 23;
    }

    private boolean insertSyncInfo(Uri uri, ContentValues contentValues) {
        if (sUriMatcher.match(uri) != 40) {
            return false;
        }
        Log.w("GalleryCloudProvider", "operation is not supported!");
        return true;
    }

    public static boolean isCloudUri(Uri uri) {
        return uri.toString().startsWith(GalleryContract.AUTHORITY_URI.toString());
    }

    public static String matchTableName(Uri uri) {
        switch (sUriMatcher.match(uri)) {
            case 1:
            case 2:
                return "cloud";
            case 3:
            case 4:
                return "cloudSetting";
            case 5:
            case 6:
                return "shareAlbum";
            case 7:
            case 8:
                return "shareUser";
            case 9:
            case 10:
                return "shareImage";
            case 11:
            case 12:
                return "cloudUser";
            case 13:
            case 14:
                return "cloudCache";
            case 15:
            case 16:
                return "newFlagCache";
            case 17:
            case 18:
                return "userInfo";
            case 19:
            case 20:
                return "ownerSubUbifocus";
            case 21:
            case 22:
                return "shareSubUbifocus";
            case 23:
                return "uploadState";
            case 24:
            case 25:
                return "peopleFace";
            case 26:
            case 27:
                return "faceToImages";
            case 28:
            case 29:
                return "peopleFace join FaceToImages join cloud";
            case 30:
            case 31:
                return "peopleRecommend";
            case 32:
            case 33:
                return "event";
            case 34:
            case 35:
                return "eventPhoto";
            case 36:
            case 37:
                return "albumCoverKey";
            case 38:
            case 39:
                return "peopleFace join faceToImages";
            default:
                Log.d("GalleryCloudProvider", "match table name, uri is not cloud");
                return null;
        }
    }

    private Cursor queryNonDBData(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        int match = sUriMatcher.match(uri);
        if (match == 23) {
            MatrixCursor matrixCursor = new MatrixCursor(new String[]{"is_upload", "has_pending_item"}, 1);
            SyncLog.d("GalleryCloudProvider", "query upload state isUploading[%d], hasPendingItem[%d]", Integer.valueOf(this.mIsUploading), Integer.valueOf(this.mHasPendingItem));
            matrixCursor.addRow(new Object[]{Integer.valueOf(this.mIsUploading), Integer.valueOf(this.mHasPendingItem)});
            return matrixCursor;
        } else if (match != 41) {
            return null;
        } else {
            MatrixCursor matrixCursor2 = new MatrixCursor(new String[]{"backupOnlyInWifi"}, 1);
            boolean backupOnlyInWifi = Sync.getBackupOnlyInWifi();
            SyncLog.d("GalleryCloudProvider", "query backup only wifi [%s]", (Object) Boolean.valueOf(backupOnlyInWifi));
            matrixCursor2.addRow(new Object[]{Integer.valueOf(backupOnlyInWifi ? 1 : 0)});
            return matrixCursor2;
        }
    }

    private Cursor querySyncInfo(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        if (sUriMatcher.match(uri) != 40) {
            return null;
        }
        String format = String.format(Locale.US, "(%s) AND (%s = %s OR %s = %s) AND (%s = %s OR %s = %s) AND ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s))", new Object[]{CloudUtils.SELECTION_OWNER_NEED_SYNC, "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), Long.valueOf(CloudUtils.getMaxImageSizeLimit()), Long.valueOf(CloudUtils.getMaxVideoSizeLimit())});
        String format2 = String.format(Locale.US, "(%s = %d OR %s = %d) AND (%s = %s OR %s = %s) AND ((serverType = 1 AND size < %s) OR (serverType = 2 AND size < %s))", new Object[]{"localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2), Long.valueOf(CloudUtils.getMaxImageSizeLimit()), Long.valueOf(CloudUtils.getMaxVideoSizeLimit())});
        String format3 = String.format(Locale.US, "%s = '%s' AND %s = %d AND (%s = %s OR %s = %s) ", new Object[]{"serverStatus", "custom", "localFlag", Integer.valueOf(0), "serverType", Integer.valueOf(1), "serverType", Integer.valueOf(2)});
        String[] strArr3 = strArr == null ? new String[]{"syncableCount"} : strArr;
        Integer[] numArr = new Integer[strArr3.length];
        int i = -1;
        int i2 = -1;
        for (int i3 = 0; i3 < strArr3.length; i3++) {
            if (TextUtils.equals(strArr3[i3], "syncableCount")) {
                if (i == -1) {
                    i = getMediaCount("cloud", format) + getMediaCount("shareImage", format2);
                }
                numArr[i3] = Integer.valueOf(i);
            } else if (TextUtils.equals(strArr3[i3], "syncedCount")) {
                if (i2 == -1) {
                    i2 = getMediaCount("cloud", format3) + getMediaCount("shareImage", format3);
                }
                numArr[i3] = Integer.valueOf(i2);
            } else {
                StringBuilder sb = new StringBuilder();
                sb.append("unsupported argument: ");
                sb.append(strArr3[i3]);
                throw new IllegalArgumentException(sb.toString());
            }
        }
        SyncLog.d("GalleryCloudProvider", "query syncInfo syncableCount[%d], syncedCount[%d]", Integer.valueOf(i), Integer.valueOf(i2));
        MatrixCursor matrixCursor = new MatrixCursor(strArr3, 1);
        matrixCursor.addRow(numArr);
        return matrixCursor;
    }

    public static Cursor rawQuery(String str, String[] strArr) {
        if (sDBHelper == null) {
            return null;
        }
        return sDBHelper.getWritableDatabase().rawQuery(str, null);
    }

    private boolean updateNonDBData(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        if (sUriMatcher.match(uri) != 23) {
            return false;
        }
        Boolean asBoolean = contentValues.getAsBoolean("is_upload");
        Boolean asBoolean2 = contentValues.getAsBoolean("has_pending_item");
        if (asBoolean != null) {
            if (!asBoolean.booleanValue()) {
                this.mIsUploading = 0;
            } else {
                this.mIsUploading = 1;
            }
        }
        if (asBoolean2 != null) {
            if (asBoolean2.booleanValue()) {
                this.mHasPendingItem = 1;
            } else {
                this.mHasPendingItem = 0;
            }
        }
        this.mContentResolver.notifyChange(uri, null, 0);
        return true;
    }

    private boolean updateSyncInfo(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        if (sUriMatcher.match(uri) != 40) {
            return false;
        }
        Log.w("GalleryCloudProvider", "operation is not supported!");
        return true;
    }

    private static void validateInsertValues(String str, ContentValues contentValues) {
        if (TextUtils.equals("userInfo", str) && !contentValues.containsKey("date_modified")) {
            contentValues.put("date_modified", Long.valueOf(System.currentTimeMillis()));
        }
    }

    private static void validateUpdateValues(String str, ContentValues contentValues) {
        if (TextUtils.equals("userInfo", str) && !contentValues.containsKey("date_modified")) {
            contentValues.put("date_modified", Long.valueOf(System.currentTimeMillis()));
        }
    }

    /* access modifiers changed from: protected */
    public ContentValues appendValuesForCloud(ContentValues contentValues, boolean z) {
        String packageNameFromScreenshotFileName = FileUtils.getPackageNameFromScreenshotFileName(getContext(), contentValues.getAsString("fileName"));
        if (!TextUtils.isEmpty(packageNameFromScreenshotFileName)) {
            contentValues.put("location", packageNameFromScreenshotFileName);
        } else if (z && TextUtils.isEmpty(contentValues.getAsString("location"))) {
            LocationManager.getInstance().appendDefaultLocationValues(contentValues);
        }
        return contentValues;
    }

    public Bundle call(String str, String str2, Bundle bundle) {
        if (!"raw_update".equals(str)) {
            return super.call(str, str2, bundle);
        }
        String string = bundle.getString("statement");
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        boolean execSQL = sDBHelper.execSQL(string);
        Bundle bundle2 = new Bundle();
        bundle2.putBoolean("bool_result", execSQL);
        if (execSQL) {
            Uri uri = (Uri) bundle.getParcelable("notify_uri");
            if (uri != null) {
                this.mContentResolver.notifyChangeDelay(uri, null, 0);
            }
        }
        return bundle2;
    }

    public int delete(Uri uri, String str, String[] strArr) {
        if (sDBHelper == null || deleteNonDBData(uri, str, strArr) || deleteSyncInfo(uri, str, strArr)) {
            return 0;
        }
        String matchTableName = matchTableName(uri);
        String genIDSelection = "cloud".equals(matchTableName) ? genIDSelection(str, strArr) : null;
        int delete = sDBHelper.delete(matchTableName, str, strArr);
        if (!TextUtils.isEmpty(genIDSelection)) {
            this.mMediaManager.delete(genIDSelection, null);
            deleteAttributes(genIDSelection);
        }
        if (delete > 0) {
            this.mContentResolver.notifyChange(uri, null, 0);
        }
        return delete;
    }

    /* access modifiers changed from: protected */
    public final void deleteAttributes(String str) {
        AlbumInfo[] genSelectedAlbums = genSelectedAlbums(str);
        if (genSelectedAlbums != null && genSelectedAlbums.length > 0) {
            for (AlbumInfo albumInfo : genSelectedAlbums) {
                this.mMediaManager.deleteAttributes(albumInfo.mAlbumId);
            }
        }
    }

    /* access modifiers changed from: protected */
    public final String genIDSelection(String str, String[] strArr) {
        StringBuilder sb = new StringBuilder();
        sb.append("_id");
        sb.append(" IN (");
        sb.append(TextUtils.join(",", getIdsSelection(str, strArr)));
        sb.append(')');
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public final AlbumInfo[] genSelectedAlbums(String str) {
        String[] strArr = AlbumInfo.PROJECTION;
        StringBuilder sb = new StringBuilder();
        sb.append(str);
        sb.append(" AND ");
        sb.append("serverType");
        sb.append(" = ?");
        Cursor query = sDBHelper.query("cloud", strArr, sb.toString(), new String[]{String.valueOf(0)}, null, null, null, null);
        AlbumInfo[] albumInfoArr = new AlbumInfo[(query == null ? 0 : query.getCount())];
        if (query != null) {
            while (query.moveToNext()) {
                try {
                    albumInfoArr[query.getPosition()] = new AlbumInfo(query.getLong(0), query.getLong(1));
                } finally {
                    query.close();
                }
            }
        }
        return albumInfoArr;
    }

    public String getType(Uri uri) {
        return null;
    }

    public Uri insert(Uri uri, ContentValues contentValues) {
        if (sDBHelper == null || insertNonDBData(uri, contentValues) || insertSyncInfo(uri, contentValues)) {
            return null;
        }
        String matchTableName = matchTableName(uri);
        SQLiteDatabase writableDatabase = sDBHelper.getWritableDatabase();
        writableDatabase.beginTransactionNonExclusive();
        try {
            long onPreInsert = onPreInsert(writableDatabase, matchTableName, contentValues);
            if (onPreInsert == -1) {
                validateInsertValues(matchTableName, contentValues);
                if ("cloud".equals(matchTableName) || "shareImage".equals(matchTableName)) {
                    appendValuesForCloud(contentValues, true);
                }
                onPreInsert = writableDatabase.insert(matchTableName, null, contentValues);
                if (onPreInsert == -1) {
                    return null;
                }
                if ("cloud".equals(matchTableName)) {
                    this.mMediaManager.insert(onPreInsert, contentValues);
                    if (contentValues.containsKey("serverType") && Numbers.equals(contentValues.getAsInteger("serverType"), 0)) {
                        Long asLong = contentValues.getAsLong("attributes");
                        this.mMediaManager.insertAttributes(onPreInsert, asLong == null ? 0 : asLong.longValue());
                    }
                }
            } else {
                update(uri, contentValues, "_id=?", new String[]{String.valueOf(onPreInsert)});
            }
            writableDatabase.setTransactionSuccessful();
            writableDatabase.endTransaction();
            if (onPreInsert == -1) {
                return null;
            }
            Uri build = uri.buildUpon().appendPath(String.valueOf(onPreInsert)).build();
            this.mContentResolver.notifyChangeDelay(build, null, 0);
            return build;
        } finally {
            writableDatabase.endTransaction();
        }
    }

    /* access modifiers changed from: protected */
    public boolean isMediaItem(ContentValues contentValues) {
        boolean z = false;
        if (contentValues == null) {
            return false;
        }
        Integer asInteger = contentValues.getAsInteger("serverType");
        if (asInteger != null && (Numbers.equals(asInteger, 1) || Numbers.equals(asInteger, 2))) {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: protected */
    public boolean needNotifyUpdate(Uri uri, ContentValues contentValues) {
        if (contentValues == null || (!contentValues.containsKey("localFlag") && !contentValues.containsKey("serverStatus") && !contentValues.containsKey("specialTypeFlags"))) {
            return uri.getBooleanQueryParameter("requireNotifyUri", false);
        }
        return true;
    }

    public boolean onCreate() {
        sDBHelper = GalleryDBHelper.getInstance(getContext());
        this.mContentResolver = new ContentResolver();
        return true;
    }

    /* access modifiers changed from: protected */
    public long onPreInsert(SQLiteDatabase sQLiteDatabase, String str, ContentValues contentValues) {
        Cursor query;
        ContentValues contentValues2 = contentValues;
        Cursor cursor = null;
        try {
            long j = -1;
            if ("cloud".equals(str)) {
                Integer asInteger = contentValues2.getAsInteger("serverType");
                if (asInteger != null) {
                    if (asInteger.intValue() != 1) {
                        if (asInteger.intValue() != 2) {
                            if (asInteger.intValue() == 0) {
                                String asString = contentValues2.getAsString("localFile");
                                if (!TextUtils.isEmpty(asString)) {
                                    SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
                                    query = sQLiteDatabase2.query("cloud", SAFE_INSERT_PROJECTION, "localFile like ? AND (serverType=0) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{asString}, null, null, null);
                                    cursor = query;
                                }
                            }
                        }
                    }
                    String asString2 = contentValues2.getAsString("sha1");
                    String asString3 = contentValues2.getAsString("localGroupId");
                    String asString4 = contentValues2.getAsString("thumbnailFile");
                    String asString5 = contentValues2.getAsString("fileName");
                    if (!TextUtils.isEmpty(asString2) && !TextUtils.isEmpty(asString3)) {
                        if (TextUtils.isEmpty(asString4)) {
                            if (!TextUtils.isEmpty(asString5)) {
                                SQLiteDatabase sQLiteDatabase3 = sQLiteDatabase;
                                query = sQLiteDatabase3.query("cloud", SAFE_INSERT_PROJECTION, "sha1=? AND localGroupId=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND fileName=?", new String[]{asString2, asString3, asString5}, null, null, null);
                                cursor = query;
                            }
                        }
                        query = sQLiteDatabase.query("cloud", SAFE_INSERT_PROJECTION, "sha1=? AND localGroupId=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", new String[]{asString2, asString3}, null, null, null);
                        cursor = query;
                    }
                }
                if (cursor != null && cursor.moveToFirst()) {
                    j = cursor.getLong(0);
                    String string = cursor.getString(1);
                    Log.w("GalleryCloudProvider", "item conflict in onPreInsert %s", string);
                    Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
                    StringBuilder sb = new StringBuilder();
                    sb.append(contentValues2.getAsString("fileName"));
                    sb.append("_");
                    sb.append(string);
                    generatorCommonParams.put("name", sb.toString());
                    GallerySamplingStatHelper.recordCountEvent("Sync", "sync_insert_transaction", generatorCommonParams);
                }
            }
            return j;
        } finally {
            MiscUtil.closeSilently(cursor);
        }
    }

    public Cursor query(Uri uri, String[] strArr, String str, String[] strArr2, String str2) {
        Cursor queryNonDBData = queryNonDBData(uri, strArr, str, strArr2, str2);
        if (queryNonDBData != null) {
            return queryNonDBData;
        }
        Cursor querySyncInfo = querySyncInfo(uri, strArr, str, strArr2, str2);
        if (querySyncInfo != null) {
            return querySyncInfo;
        }
        long idFromString = getIdFromString(uri.getLastPathSegment());
        String limit = UriUtil.getLimit(uri);
        String groupBy = UriUtil.getGroupBy(uri);
        String having = UriUtil.getHaving(uri);
        String matchTableName = matchTableName(uri);
        if (!matchTableName.equalsIgnoreCase("peopleFace join FaceToImages join cloud")) {
            StringBuilder sb = new StringBuilder();
            sb.append(matchTableName);
            sb.append(" as master");
            matchTableName = sb.toString();
        }
        String str3 = matchTableName;
        return sDBHelper.query(UriUtil.getDistinct(uri), str3, strArr, appendIdSelection(str, idFromString), strArr2, groupBy, having, str2, limit);
    }

    public int update(Uri uri, ContentValues contentValues, String str, String[] strArr) {
        String str2;
        if (sDBHelper == null || updateNonDBData(uri, contentValues, str, strArr) || updateSyncInfo(uri, contentValues, str, strArr)) {
            return 0;
        }
        String matchTableName = matchTableName(uri);
        if ("cloud".equals(matchTableName)) {
            str2 = genIDSelection(str, strArr);
            if (contentValues.containsKey("attributes")) {
                updateAttributes(sDBHelper.getWritableDatabase(), matchTableName, str2, contentValues);
            }
        } else {
            str2 = null;
        }
        validateUpdateValues(matchTableName, contentValues);
        if ("cloud".equals(matchTableName) || "shareImage".equals(matchTableName)) {
            appendValuesForCloud(contentValues, false);
        }
        int update = sDBHelper.update(matchTableName, contentValues, str, strArr);
        if (!TextUtils.isEmpty(str2) && this.mMediaManager.update(str2, null, contentValues) != update && isMediaItem(contentValues) && !this.mMediaManager.isItemDeleted(contentValues)) {
            this.mMediaManager.insert(sDBHelper.getWritableDatabase(), str, strArr);
        }
        if (update > 0 && needNotifyUpdate(uri, contentValues)) {
            this.mContentResolver.notifyChangeDelay(uri, null, 0);
        }
        return update;
    }

    /* access modifiers changed from: protected */
    public final void updateAttributes(SQLiteDatabase sQLiteDatabase, String str, String str2, ContentValues contentValues) {
        ContentValues contentValues2 = contentValues;
        AlbumInfo[] genSelectedAlbums = genSelectedAlbums(str2);
        if (genSelectedAlbums != null && genSelectedAlbums.length > 0) {
            Long asLong = contentValues2.getAsLong("attributes");
            ArrayList arrayList = new ArrayList();
            for (AlbumInfo albumInfo : genSelectedAlbums) {
                this.mMediaManager.updateAttributes(albumInfo.mAlbumId, asLong == null ? 0 : asLong.longValue());
                if (!contentValues2.containsKey("editedColumns")) {
                    Iterator it = AlbumManager.getAlbumSyncAttributes().iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        Long l = (Long) it.next();
                        if ((asLong.longValue() & l.longValue()) != (albumInfo.mAttributes & l.longValue())) {
                            arrayList.add(Long.valueOf(albumInfo.mAlbumId));
                            break;
                        }
                    }
                }
            }
            if (arrayList.size() > 0) {
                String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(6);
                sQLiteDatabase.execSQL(String.format(Locale.US, "UPDATE %s SET %s=coalesce(replace(%s, '%s', '') || '%s', '%s') WHERE %s IN (%s)", new Object[]{str, "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, "_id", TextUtils.join(",", arrayList)}));
            }
        }
    }
}
