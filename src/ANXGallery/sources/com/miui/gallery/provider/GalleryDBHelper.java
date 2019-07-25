package com.miui.gallery.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.text.TextUtils;
import com.google.common.collect.Sets;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.CloudUtils;
import com.miui.gallery.cloud.CloudUtils.Insertable;
import com.miui.gallery.cloud.GalleryCloudUtils;
import com.miui.gallery.cloud.base.SyncRequest.Builder;
import com.miui.gallery.cloud.base.SyncType;
import com.miui.gallery.data.BackgroundJobService;
import com.miui.gallery.data.LocationGenerator;
import com.miui.gallery.model.PeopleContactInfo;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.preference.GalleryPreferences.DataBase;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.util.ExtraTextUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MediaFileUtils;
import com.miui.gallery.util.MediaFileUtils.FileType;
import com.miui.gallery.util.SafeDBUtil;
import com.miui.gallery.util.SafeDBUtil.QueryHandler;
import com.miui.gallery.util.StorageUtils;
import com.miui.gallery.util.SyncUtil;
import com.miui.gallery.util.deprecated.Preference;
import com.miui.gallery.util.deprecated.Storage;
import com.miui.gallery.util.deprecated.Time;
import com.miui.os.Device;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TimeZone;

public class GalleryDBHelper extends SQLiteOpenHelper {
    private static final String[] sCloudControlTables = {"cloudControl"};
    private static final String[] sCloudTables = {"cloud", "shareAlbum", "shareUser", "shareImage", "cloudUser", "cloudCache", "newFlagCache", "userInfo", "ownerSubUbifocus", "peopleFace", "faceToImages", "peopleRecommend", "shareSubUbifocus", "event", "eventPhoto", "albumCoverKey", "recent_discovered_media", "discovery_message", "cloudSetting"};
    private static GalleryDBHelper sDBHelper;
    private static final String[] sPeopleFaceTables = {"peopleFace", "faceToImages", "peopleRecommend"};
    private static HashMap<String, Integer> sViewNameVersionMap = new HashMap<>();
    private ArrayList<TableColumn> mAlbumColumns = new ArrayList<>();
    private ArrayList<TableColumn> mAlbumCoverKeyColumns = new ArrayList<>();
    private ArrayList<TableColumn> mCloudCacheColumns = new ArrayList<>();
    private ArrayList<TableColumn> mCloudColumns = new ArrayList<>();
    private ArrayList<TableColumn> mCloudControlColumns = new ArrayList<>();
    private ArrayList<TableColumn> mCloudSettingColumns = new ArrayList<>();
    private ArrayList<TableColumn> mCloudUserColumns = new ArrayList<>();
    protected Context mContext;
    private ArrayList<TableColumn> mDiscoveryMessageColumns = new ArrayList<>();
    private ArrayList<TableColumn> mEventColumns = new ArrayList<>();
    private ArrayList<TableColumn> mEventPhotoColumns = new ArrayList<>();
    private ArrayList<TableColumn> mFace2ImagesColumns = new ArrayList<>();
    private ArrayList<TableColumn> mFavoritesColumns = new ArrayList<>();
    private ArrayList<TableColumn> mLocalUbifocusColumns = new ArrayList<>();
    private ArrayList<TableColumn> mNewFlagCacheColumns = new ArrayList<>();
    private int mOldVersion;
    private ArrayList<TableColumn> mOwnerSubUbiImageColumns = new ArrayList<>();
    private ArrayList<TableColumn> mPeopleFaceColumns = new ArrayList<>();
    private ArrayList<TableColumn> mPeopleRecommendColumns = new ArrayList<>();
    private ArrayList<TableColumn> mPhotoGpsCacheColumns = new ArrayList<>();
    private ArrayList<TableColumn> mRecentDiscoveredMediaColumns = new ArrayList<>();
    private ArrayList<TableColumn> mShareAlbumColumns = new ArrayList<>();
    private ArrayList<TableColumn> mShareImageColumns = new ArrayList<>();
    private ArrayList<TableColumn> mShareSubUbiImageColumns = new ArrayList<>();
    private ArrayList<TableColumn> mShareUserColumns = new ArrayList<>();
    private ArrayList<TableColumn> mUserInfoColumns = new ArrayList<>();
    private ArrayList<TableColumn> mWhiteListLastModifyColumns = new ArrayList<>();

    public static class TableColumn {
        public boolean isUnique = false;
        public String mColumnType;
        public String mDefault;
        public String mName;

        public TableColumn(String str, String str2) {
            this.mName = str;
            this.mColumnType = str2;
        }

        public TableColumn(String str, String str2, String str3) {
            this.mName = str;
            this.mColumnType = str2;
            this.mDefault = str3;
        }

        public TableColumn(String str, String str2, boolean z) {
            this.mName = str;
            this.mColumnType = str2;
            this.isUnique = z;
        }
    }

    private static class UpdateLocalGroupIdQueryHandler implements QueryHandler<Void> {
        private final String mAlbumIdColumnName;
        private final SQLiteDatabase mDB;
        private final String mTable;

        public UpdateLocalGroupIdQueryHandler(SQLiteDatabase sQLiteDatabase, String str, String str2) {
            this.mDB = sQLiteDatabase;
            this.mTable = str;
            this.mAlbumIdColumnName = str2;
        }

        public Void handle(Cursor cursor) {
            if (cursor != null) {
                while (cursor.moveToNext()) {
                    int i = cursor.getInt(0);
                    String string = cursor.getString(1);
                    if (!TextUtils.isEmpty(string)) {
                        ContentValues contentValues = new ContentValues();
                        contentValues.put("localGroupId", Integer.valueOf(i));
                        this.mDB.update(this.mTable, contentValues, String.format(Locale.US, "%s=?", new Object[]{this.mAlbumIdColumnName}), new String[]{string});
                    }
                }
            }
            return null;
        }
    }

    static {
        sViewNameVersionMap.put("extended_cloud", Integer.valueOf(3));
        sViewNameVersionMap.put("extended_faceImage", Integer.valueOf(1));
    }

    private GalleryDBHelper(Context context) {
        super(context, "gallery.db", null, 92);
        this.mContext = context;
    }

    private static void addColumn(SQLiteDatabase sQLiteDatabase, String str, TableColumn tableColumn) {
        String str2;
        if (TextUtils.isEmpty(tableColumn.mDefault)) {
            str2 = String.format("ALTER TABLE %s ADD COLUMN %s %s", new Object[]{str, tableColumn.mName, tableColumn.mColumnType});
        } else {
            str2 = String.format("ALTER TABLE %s ADD COLUMN %s %s DEFAULT %s", new Object[]{str, tableColumn.mName, tableColumn.mColumnType, tableColumn.mDefault});
        }
        try {
            sQLiteDatabase.execSQL(str2);
        } catch (Exception e) {
            Map generatorCommonParams = GallerySamplingStatHelper.generatorCommonParams();
            generatorCommonParams.put("sql", str2);
            generatorCommonParams.put("dbversion", String.valueOf(sQLiteDatabase.getVersion()));
            StringBuilder sb = new StringBuilder();
            sb.append(e.getMessage());
            sb.append(" : ");
            sb.append(e.getCause());
            generatorCommonParams.put("exception", sb.toString());
            GallerySamplingStatHelper.recordErrorEvent("db_helper", "db_add_columns", generatorCommonParams);
            throw new SQLException(e.getMessage(), e);
        }
    }

    private void addRecordsForCameraAndScreenshots(final SQLiteDatabase sQLiteDatabase) {
        CloudUtils.addRecordsForCameraAndScreenshots(new Insertable() {
            public long insert(Uri uri, String str, String str2, ContentValues contentValues) {
                return sQLiteDatabase.insert(str, str2, contentValues);
            }
        });
    }

    private void addUniqueIndexs(SQLiteDatabase sQLiteDatabase) {
        upgradeTo35(sQLiteDatabase);
    }

    private void cleanCloudData(SQLiteDatabase sQLiteDatabase) {
        for (String delete : sCloudTables) {
            try {
                sQLiteDatabase.delete(delete, null, null);
            } catch (Exception e) {
                Log.w("GalleryDBHelper", (Throwable) e);
            }
        }
    }

    private void clearColumnList() {
        this.mAlbumColumns.clear();
        this.mAlbumColumns = null;
        this.mCloudSettingColumns.clear();
        this.mCloudSettingColumns = null;
        this.mShareAlbumColumns.clear();
        this.mShareAlbumColumns = null;
        this.mShareImageColumns.clear();
        this.mShareImageColumns = null;
        this.mShareUserColumns.clear();
        this.mShareUserColumns = null;
        this.mCloudUserColumns.clear();
        this.mCloudUserColumns = null;
        this.mCloudCacheColumns.clear();
        this.mCloudCacheColumns = null;
        this.mNewFlagCacheColumns.clear();
        this.mNewFlagCacheColumns = null;
        this.mUserInfoColumns.clear();
        this.mUserInfoColumns = null;
        this.mWhiteListLastModifyColumns.clear();
        this.mWhiteListLastModifyColumns = null;
        this.mPhotoGpsCacheColumns.clear();
        this.mPhotoGpsCacheColumns = null;
        this.mLocalUbifocusColumns.clear();
        this.mLocalUbifocusColumns = null;
        this.mOwnerSubUbiImageColumns.clear();
        this.mOwnerSubUbiImageColumns = null;
        this.mShareSubUbiImageColumns.clear();
        this.mShareSubUbiImageColumns = null;
        this.mPeopleFaceColumns.clear();
        this.mPeopleFaceColumns = null;
        this.mFace2ImagesColumns.clear();
        this.mFace2ImagesColumns = null;
        this.mPeopleRecommendColumns.clear();
        this.mPeopleRecommendColumns = null;
        this.mEventColumns.clear();
        this.mEventColumns = null;
        this.mEventPhotoColumns.clear();
        this.mEventPhotoColumns = null;
        this.mAlbumCoverKeyColumns.clear();
        this.mAlbumCoverKeyColumns = null;
        this.mDiscoveryMessageColumns.clear();
        this.mDiscoveryMessageColumns = null;
        this.mRecentDiscoveredMediaColumns.clear();
        this.mRecentDiscoveredMediaColumns = null;
        this.mCloudControlColumns.clear();
        this.mCloudControlColumns = null;
        this.mFavoritesColumns.clear();
        this.mFavoritesColumns = null;
    }

    private void createIndexOnCloudCacheTable(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, String.format("create index index_cloudCache_serverId on %s (%s)", new Object[]{"cloudCache", "serverId"}));
    }

    private void createIndexOnCloudTable(SQLiteDatabase sQLiteDatabase) {
        createIndexOnCloudTable_19(sQLiteDatabase);
        createIndexOnCloudTable_20(sQLiteDatabase);
        createIndexOnCloudTable_21(sQLiteDatabase);
        createIndexOnCloudTable_43(sQLiteDatabase);
        createIndexOnCloudTable_51(sQLiteDatabase);
        createIndexOnCloudTable_53(sQLiteDatabase);
        createIndexOnCloudTable_70(sQLiteDatabase);
        createIndexOnCloudTable_75(sQLiteDatabase);
    }

    private void createIndexOnCloudTable_19(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_fileName on cloud (fileName)");
        safeExecSQL(sQLiteDatabase, "create index index_sort on cloud (dateModified DESC ,_id DESC)");
    }

    private void createIndexOnCloudTable_20(SQLiteDatabase sQLiteDatabase) {
    }

    private void createIndexOnCloudTable_21(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_localFlag on cloud (localFlag)");
        safeExecSQL(sQLiteDatabase, "create index index_fileName_NOCASE on cloud (fileName COLLATE NOCASE)");
        safeExecSQL(sQLiteDatabase, "create index index_cloud_albumId on cloud (albumId)");
    }

    private void createIndexOnCloudTable_43(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_mixed_datetime on cloud (mixedDateTime)");
    }

    private void createIndexOnCloudTable_51(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "drop index index_mixed_datetime");
        safeExecSQL(sQLiteDatabase, "create index if not exists index_cloud_mixed_exif_datetime on cloud (mixedDateTime, exifDateTime)");
    }

    private void createIndexOnCloudTable_53(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_cloud_size on cloud (size)");
    }

    private void createIndexOnCloudTable_70(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_microthumbnail on cloud (groupId DESC, dateModified DESC)");
    }

    private void createIndexOnCloudTable_75(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_cloud_sha1 on cloud (sha1)");
    }

    private void createIndexOnCloudUserTable(SQLiteDatabase sQLiteDatabase) {
        createIndexOnCloudUserTable_22(sQLiteDatabase);
    }

    private void createIndexOnCloudUserTable_22(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_cloudUser_albumId on cloudUser (albumId)");
        safeExecSQL(sQLiteDatabase, "create index index_cloudUser_userId on cloudUser (userId)");
        safeExecSQL(sQLiteDatabase, "create index index_cloudUser_localAlbumId on cloudUser (localAlbumId)");
    }

    private void createIndexOnFaceTable(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_serverId_peopleFace on peopleFace (serverId)");
        safeExecSQL(sQLiteDatabase, "create index if not exists index_groupId_peopleFace on peopleFace (groupId)");
        safeExecSQL(sQLiteDatabase, "create index if not exists index_faceId_faceToImages on faceToImages (faceId)");
        safeExecSQL(sQLiteDatabase, "create index if not exists index_imageServerId_faceToImages on faceToImages (imageServerId)");
    }

    private void createIndexOnNewFlagCacheTable(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, String.format("create index index_newFlagCache_albumId on %s (%s)", new Object[]{"newFlagCache", "albumId"}));
        upgradeTo32(sQLiteDatabase);
    }

    private void createIndexOnPeopleRecommendTable(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_peopleServerID_peopleRecommend on peopleRecommend (peopleServerId)");
    }

    private void createIndexOnShareAlbumTable(SQLiteDatabase sQLiteDatabase) {
        createIndexOnShareAlbumTable_21(sQLiteDatabase);
    }

    private void createIndexOnShareAlbumTable_21(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_shareAlbum_albumId on shareAlbum (albumId)");
        safeExecSQL(sQLiteDatabase, "create index index_shareAlbum_creatorId on shareAlbum (creatorId)");
    }

    private void createIndexOnShareImageTable(SQLiteDatabase sQLiteDatabase) {
        createIndexOnShareImageTable_21(sQLiteDatabase);
        createIndexOnShareImageTable_43(sQLiteDatabase);
        createIndexOnShareImageTable_51(sQLiteDatabase);
        createIndexOnShareImageTable_53(sQLiteDatabase);
        createIndexOnShareImageTable_70(sQLiteDatabase);
    }

    private void createIndexOnShareImageTable_21(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_shareImage_albumId on shareImage (albumId)");
        safeExecSQL(sQLiteDatabase, "create index index_shareImage_creatorId on shareImage (creatorId)");
    }

    private void createIndexOnShareImageTable_43(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_mixed_datetime on shareImage (mixedDateTime)");
    }

    private void createIndexOnShareImageTable_51(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "drop index index_mixed_datetime");
        safeExecSQL(sQLiteDatabase, "create index if not exists index_shareimage_mixed_exif_datetime on shareimage (mixedDateTime, exifDateTime)");
    }

    private void createIndexOnShareImageTable_53(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_shareimage_size on shareimage (size)");
    }

    private void createIndexOnShareImageTable_70(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index if not exists index_shareimage_microthumbnail on shareImage (groupId DESC, dateModified DESC)");
    }

    private void createIndexOnShareUserTable(SQLiteDatabase sQLiteDatabase) {
        createIndexOnShareUserTable_21(sQLiteDatabase);
        createIndexOnShareUserTable_22(sQLiteDatabase);
    }

    private void createIndexOnShareUserTable_21(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_shareUser_albumId on shareUser (albumId)");
        safeExecSQL(sQLiteDatabase, "create index index_shareUser_userId on shareUser (userId)");
    }

    private void createIndexOnShareUserTable_22(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "create index index_shareUser_localAlbumId on shareUser (localAlbumId)");
    }

    private void createIndexOnWhiteListLastModifyTable(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "CREATE UNIQUE INDEX IF NOT EXISTS index_path ON whiteListLastModify (path)");
    }

    private void createTable(SQLiteDatabase sQLiteDatabase, String str, ArrayList<TableColumn> arrayList) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < arrayList.size(); i++) {
            TableColumn tableColumn = (TableColumn) arrayList.get(i);
            if (TextUtils.isEmpty(tableColumn.mDefault)) {
                sb.append(String.format(" %s %s", new Object[]{tableColumn.mName, tableColumn.mColumnType}));
            } else {
                sb.append(String.format(" %s %s DEFAULT %s", new Object[]{tableColumn.mName, tableColumn.mColumnType, tableColumn.mDefault}));
            }
            if (tableColumn.isUnique) {
                sb.append(" UNIQUE");
            }
            if (i == 0) {
                sb.append(" PRIMARY KEY ");
            }
            if ("_id".equals(tableColumn.mName)) {
                sb.append(" AUTOINCREMENT");
            }
            if (i < arrayList.size() - 1) {
                sb.append(" , ");
            }
        }
        sQLiteDatabase.execSQL(String.format("CREATE TABLE IF NOT EXISTS %s (%s)", new Object[]{str, sb.toString()}));
        if (str.equals("cloud")) {
            createIndexOnCloudTable(sQLiteDatabase);
        } else if (str.equals("shareAlbum")) {
            createIndexOnShareAlbumTable(sQLiteDatabase);
        } else if (str.equals("shareUser")) {
            createIndexOnShareUserTable(sQLiteDatabase);
        } else if (str.equals("shareImage")) {
            createIndexOnShareImageTable(sQLiteDatabase);
        } else if (str.equals("cloudUser")) {
            createIndexOnCloudUserTable(sQLiteDatabase);
        } else if (str.equals("cloudCache")) {
            createIndexOnCloudCacheTable(sQLiteDatabase);
        } else if (str.equals("newFlagCache")) {
            createIndexOnNewFlagCacheTable(sQLiteDatabase);
        } else if (str.equalsIgnoreCase("whiteListLastModify")) {
            createIndexOnWhiteListLastModifyTable(sQLiteDatabase);
        } else if (str.equalsIgnoreCase("faceToImages")) {
            createIndexOnFaceTable(sQLiteDatabase);
        } else if (str.equalsIgnoreCase("peopleRecommend")) {
            createIndexOnPeopleRecommendTable(sQLiteDatabase);
        }
    }

    private static void createViewByName(SQLiteDatabase sQLiteDatabase, String str) {
        if ("extended_cloud".equalsIgnoreCase(str)) {
            createViewExtendedCloud(sQLiteDatabase);
        } else if ("extended_faceImage".equalsIgnoreCase(str)) {
            createViewExtendedFaceImage(sQLiteDatabase);
        }
    }

    private static void createViewExtendedCloud(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP VIEW IF EXISTS extended_cloud;");
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append("cloud._id AS _id,cloud.sha1 AS sha1,microthumbfile AS microthumbfile,thumbnailFile AS thumbnailFile,localFile AS localFile,serverType AS serverType,title AS title,duration AS duration,description AS description,location AS location,size AS size,localGroupId AS localGroupId,mimeType AS mimeType,exifGPSLatitude AS exifGPSLatitude,exifGPSLatitudeRef AS exifGPSLatitudeRef,exifGPSLongitude AS exifGPSLongitude,exifGPSLongitudeRef AS exifGPSLongitudeRef,exifOrientation AS exifOrientation,secretKey AS secretKey,localFlag AS localFlag,mixedDateTime AS mixedDateTime,dateTaken AS dateTaken,exifImageWidth AS exifImageWidth,exifImageLength AS exifImageLength,serverStatus AS serverStatus,dateModified AS dateModified,creatorId AS creatorId,serverTag AS serverTag,serverId AS serverId,fileName AS fileName,groupId AS groupId,ubiSubImageCount AS ubiSubImageCount,ubiSubIndex AS ubiSubIndex,ubiFocusIndex AS ubiFocusIndex,babyInfoJson AS babyInfoJson,isFavorite AS isFavorite,specialTypeFlags AS specialTypeFlags");
        sb.append(" FROM ");
        sb.append("(SELECT * FROM cloud ORDER BY mixedDateTime DESC,dateModified DESC,_id DESC ) cloud");
        sb.append(" LEFT OUTER JOIN ");
        sb.append("favorites");
        sb.append(" ON ");
        sb.append("cloud");
        sb.append(".");
        sb.append("sha1");
        sb.append(" = ");
        sb.append("favorites");
        sb.append(".");
        sb.append("sha1");
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("CREATE VIEW extended_cloud AS ");
        sb3.append(sb2);
        sb3.append(";");
        sQLiteDatabase.execSQL(sb3.toString());
    }

    public static void createViewExtendedFaceImage(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP VIEW IF EXISTS extended_faceImage;");
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append("peopleFace._id AS _id,peopleFace.serverId AS serverId,peopleFace.groupId AS groupId,peopleFace.localGroupId AS localGroupId,microthumbfile AS microthumbfile,thumbnailFile AS thumbnailFile,dateTaken AS dateTaken,mixedDateTime AS mixedDateTime,mimeType AS mimeType,duration AS duration,location AS location,size AS size,exifImageWidth AS exifImageWidth,exifImageLength AS exifImageLength,exifOrientation AS exifOrientation,exifGPSLatitude AS exifGPSLatitude,exifGPSLatitudeRef AS exifGPSLatitudeRef,exifGPSLongitude AS exifGPSLongitude,exifGPSLongitudeRef AS exifGPSLongitudeRef,serverType AS serverType,localFile AS localFile,specialTypeFlags AS specialTypeFlags,fileName AS fileName,sha1 AS sha1,title AS title,dateModified AS dateModified,ubiSubImageCount AS ubiSubImageCount,ubiSubIndex AS ubiSubIndex,ubiFocusIndex AS ubiFocusIndex,secretKey AS secretKey,faceXScale AS faceXScale,faceYScale AS faceYScale,faceWScale AS faceWScale,faceHScale AS faceHScale,leftEyeXScale AS leftEyeXScale,leftEyeYScale AS leftEyeYScale,RightEyeXScale AS RightEyeXScale,RightEyeYScale AS RightEyeYScale,peopleFace.localFlag AS localFlag,peopleFace.serverStatus AS serverStatus,cloud._id AS photo_id,cloud.serverId AS photo_server_id,faceCoverScore AS faceCoverScore");
        sb.append(" FROM ");
        sb.append("peopleFace");
        sb.append(" JOIN ");
        sb.append("faceToImages");
        sb.append(" JOIN ");
        sb.append("cloud");
        sb.append(" ON ");
        sb.append("peopleFace");
        sb.append(".");
        sb.append("serverId");
        sb.append(" = ");
        sb.append("faceId");
        sb.append(" AND ");
        sb.append("imageServerId");
        sb.append(" = ");
        sb.append("cloud");
        sb.append(".");
        sb.append("serverId");
        sb.append(" WHERE ");
        sb.append(nexExportFormat.TAG_FORMAT_TYPE);
        sb.append(" = '");
        sb.append("FACE");
        sb.append("'");
        sb.append(" AND (");
        sb.append("cloud");
        sb.append(".");
        sb.append("localFlag");
        sb.append(" not in (");
        sb.append(11);
        sb.append(", ");
        sb.append(0);
        sb.append(", ");
        sb.append(-1);
        sb.append(", ");
        sb.append(2);
        sb.append(")");
        sb.append(" OR ( ");
        sb.append("cloud");
        sb.append(".");
        sb.append("localFlag");
        sb.append(" = ");
        sb.append(0);
        sb.append(" AND ");
        sb.append("cloud");
        sb.append(".");
        sb.append("serverStatus");
        sb.append(" = '");
        sb.append("custom");
        sb.append("'))");
        sb.append(" AND ");
        sb.append("cloud");
        sb.append(".");
        sb.append("groupId");
        sb.append(" != ");
        sb.append(1000);
        sb.append(" AND ");
        sb.append("cloud");
        sb.append(".");
        sb.append("localGroupId");
        sb.append(" != ");
        sb.append(-1000);
        sb.append(" ORDER BY ");
        sb.append("cloud");
        sb.append(".");
        sb.append("_id");
        sb.append(" desc ");
        String sb2 = sb.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("CREATE VIEW extended_faceImage AS ");
        sb3.append(sb2);
        sb3.append(";");
        sQLiteDatabase.execSQL(sb3.toString());
    }

    private void createViewIfNeeded(SQLiteDatabase sQLiteDatabase, boolean z) {
        for (Entry entry : sViewNameVersionMap.entrySet()) {
            int viewVersion = DataBase.getViewVersion((String) entry.getKey());
            if (z || viewVersion != ((Integer) entry.getValue()).intValue()) {
                Log.d("GalleryDBHelper", "recreate view: [%s], oldVersion: [%d], newVersion: [%d]", entry.getKey(), Integer.valueOf(viewVersion), entry.getValue());
                createViewByName(sQLiteDatabase, (String) entry.getKey());
                DataBase.setViewVersion((String) entry.getKey(), ((Integer) entry.getValue()).intValue());
            }
        }
        sViewNameVersionMap.clear();
    }

    private void deleteVideoThumbnailFile(final ArrayList<String> arrayList) {
        new Runnable() {
            public void run() {
                Iterator it = arrayList.iterator();
                while (it.hasNext()) {
                    String str = (String) it.next();
                    File file = new File(StorageUtils.getPriorMicroThumbnailDirectory(), CloudUtils.getThumbnailNameBySha1(str));
                    if (file.exists()) {
                        MediaFileUtils.deleteFileType(FileType.MICRO_THUMBNAIL, file);
                    }
                    File file2 = new File(Storage.getMainSDCardCloudThumbnailFilePath(), CloudUtils.getThumbnailNameBySha1(str));
                    if (file2.exists()) {
                        MediaFileUtils.deleteFileType(FileType.THUMBNAIL, file2);
                    }
                }
            }
        }.run();
    }

    private int fixCameraAlbumAttributes(SQLiteDatabase sQLiteDatabase) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("attributes", Long.valueOf(5));
        return sQLiteDatabase.update("cloud", contentValues, String.format(Locale.US, "%s=%d and (%s & %d)=%d", new Object[]{"serverId", Long.valueOf(1), "attributes", Long.valueOf(16), Long.valueOf(16)}), null);
    }

    public static String[] getCloudControlTables() {
        return (String[]) Arrays.copyOf(sCloudControlTables, sCloudControlTables.length);
    }

    public static String[] getCloudTables() {
        return (String[]) Arrays.copyOf(sCloudTables, sCloudTables.length);
    }

    public static String getCursorString(Cursor cursor, int i) {
        String string = cursor.getString(i);
        return string == null ? "" : string;
    }

    public static synchronized GalleryDBHelper getInstance() {
        GalleryDBHelper instance;
        synchronized (GalleryDBHelper.class) {
            instance = getInstance(GalleryApp.sGetAndroidContext());
        }
        return instance;
    }

    public static synchronized GalleryDBHelper getInstance(Context context) {
        GalleryDBHelper galleryDBHelper;
        synchronized (GalleryDBHelper.class) {
            if (sDBHelper == null) {
                sDBHelper = new GalleryDBHelper(context);
            }
            galleryDBHelper = sDBHelper;
        }
        return galleryDBHelper;
    }

    public static String[] getPeopleFaceTables() {
        return (String[]) Arrays.copyOf(sPeopleFaceTables, sPeopleFaceTables.length);
    }

    private ArrayList<String> getVideosExceptCreated(SQLiteDatabase sQLiteDatabase, String str, String str2) {
        Cursor query = sQLiteDatabase.query(str, new String[]{"sha1"}, str2, null, null, null, null);
        if (query == null) {
            return null;
        }
        try {
            ArrayList<String> arrayList = new ArrayList<>();
            while (query.moveToNext()) {
                arrayList.add(query.getString(0));
            }
            return arrayList;
        } finally {
            query.close();
        }
    }

    private void initCloudColumns() {
        if (this.mCloudColumns.isEmpty()) {
            this.mCloudColumns.add(new TableColumn("_id", "integer"));
            this.mCloudColumns.add(new TableColumn("groupId", "integer"));
            this.mCloudColumns.add(new TableColumn("size", "integer"));
            this.mCloudColumns.add(new TableColumn("dateModified", "integer"));
            this.mCloudColumns.add(new TableColumn("mimeType", "text"));
            this.mCloudColumns.add(new TableColumn("title", "text"));
            this.mCloudColumns.add(new TableColumn("description", "text"));
            this.mCloudColumns.add(new TableColumn("fileName", "text"));
            this.mCloudColumns.add(new TableColumn("dateTaken", "integer"));
            this.mCloudColumns.add(new TableColumn("duration", "integer"));
            this.mCloudColumns.add(new TableColumn("serverId", "text"));
            this.mCloudColumns.add(new TableColumn("serverType", "text"));
            this.mCloudColumns.add(new TableColumn("serverStatus", "text"));
            this.mCloudColumns.add(new TableColumn("serverTag", "integer"));
            this.mCloudColumns.add(new TableColumn("exifImageWidth", "integer"));
            this.mCloudColumns.add(new TableColumn("exifImageLength", "integer"));
            this.mCloudColumns.add(new TableColumn("exifOrientation", "integer"));
            this.mCloudColumns.add(new TableColumn("exifGPSLatitude", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSLongitude", "text"));
            this.mCloudColumns.add(new TableColumn("exifMake", "text"));
            this.mCloudColumns.add(new TableColumn("exifModel", "text"));
            this.mCloudColumns.add(new TableColumn("exifFlash", "integer"));
            this.mCloudColumns.add(new TableColumn("exifGPSLatitudeRef", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSLongitudeRef", "text"));
            this.mCloudColumns.add(new TableColumn("exifExposureTime", "text"));
            this.mCloudColumns.add(new TableColumn("exifFNumber", "text"));
            this.mCloudColumns.add(new TableColumn("exifISOSpeedRatings", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSAltitude", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSAltitudeRef", "integer"));
            this.mCloudColumns.add(new TableColumn("exifGPSTimeStamp", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSDateStamp", "text"));
            this.mCloudColumns.add(new TableColumn("exifWhiteBalance", "integer"));
            this.mCloudColumns.add(new TableColumn("exifFocalLength", "text"));
            this.mCloudColumns.add(new TableColumn("exifGPSProcessingMethod", "text"));
            this.mCloudColumns.add(new TableColumn("exifDateTime", "text"));
            this.mCloudColumns.add(new TableColumn("localFlag", "integer"));
            this.mCloudColumns.add(new TableColumn("thumbnailFile", "text"));
            this.mCloudColumns.add(new TableColumn("downloadFile", "text"));
            this.mCloudColumns.add(new TableColumn("localFile", "text"));
            this.mCloudColumns.add(new TableColumn("sha1", "text"));
            this.mCloudColumns.add(new TableColumn("sortBy", "integer"));
            this.mCloudColumns.add(new TableColumn("microthumbfile", "text"));
            this.mCloudColumns.add(new TableColumn("localGroupId", "text"));
            this.mCloudColumns.add(new TableColumn("localImageId", "text"));
            this.mCloudColumns.add(new TableColumn("albumId", "text"));
            this.mCloudColumns.add(new TableColumn("canModified", "integer"));
            this.mCloudColumns.add(new TableColumn("shareUrl", "text"));
            this.mCloudColumns.add(new TableColumn("albumUserTag", "integer"));
            this.mCloudColumns.add(new TableColumn("newImageFlag", "integer"));
            this.mCloudColumns.add(new TableColumn("newUserFlag", "integer"));
            this.mCloudColumns.add(new TableColumn("creatorId", "text"));
            this.mCloudColumns.add(new TableColumn("isPublic", "integer"));
            this.mCloudColumns.add(new TableColumn("publicUrl", "text"));
            this.mCloudColumns.add(new TableColumn("downloadFileStatus", "integer"));
            this.mCloudColumns.add(new TableColumn("downloadFileTime", "integer"));
            this.mCloudColumns.add(new TableColumn("mixedDateTime", "integer"));
            this.mCloudColumns.add(new TableColumn("ubiSubImageCount", "integer"));
            this.mCloudColumns.add(new TableColumn("ubiFocusIndex", "integer"));
            this.mCloudColumns.add(new TableColumn("ubiSubIndex", "integer"));
            this.mCloudColumns.add(new TableColumn("editedColumns", "text"));
            this.mCloudColumns.add(new TableColumn("fromLocalGroupId", "text"));
            this.mCloudColumns.add(new TableColumn("secretKey", "blob"));
            this.mCloudColumns.add(new TableColumn("appKey", "text"));
            this.mCloudColumns.add(new TableColumn("babyInfoJson", "text"));
            this.mCloudColumns.add(new TableColumn("peopleId", "text"));
            this.mCloudColumns.add(new TableColumn("lables", "integer"));
            this.mCloudColumns.add(new TableColumn("thumbnailInfo", "text"));
            this.mCloudColumns.add(new TableColumn("location", "text"));
            this.mCloudColumns.add(new TableColumn("attributes", "integer", String.valueOf(0)));
            this.mCloudColumns.add(new TableColumn("extraGPS", "text"));
            this.mCloudColumns.add(new TableColumn("address", "text"));
            this.mCloudColumns.add(new TableColumn("specialTypeFlags", "integer", String.valueOf(0)));
        }
    }

    private void refillBabyAlbumDataTaken(final SQLiteDatabase sQLiteDatabase) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        SafeDBUtil.safeQuery(sQLiteDatabase2, "cloud", new String[]{"_id"}, String.format(Locale.US, " NOT ( %s is null )", new Object[]{"peopleId"}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        int i = cursor.getInt(0);
                        GalleryDBHelper.safeExecSQL(sQLiteDatabase, String.format(Locale.US, "update %s set %s = %d where %s = %d", new Object[]{"cloud", "dateTaken", Long.valueOf(-996), "_id", Integer.valueOf(i)}));
                    }
                }
                return null;
            }
        });
    }

    private void refillIsFavorite(final SQLiteDatabase sQLiteDatabase) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        SafeDBUtil.safeQuery(sQLiteDatabase2, "cloud", new String[]{"description", "sha1"}, "serverType IN (1,2) AND description NOT NULL AND description != '' AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))", (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null) {
                    HashSet newHashSet = Sets.newHashSet();
                    while (cursor.moveToNext()) {
                        String string = cursor.getString(0);
                        String string2 = cursor.getString(1);
                        if (!TextUtils.isEmpty(string2) && !newHashSet.contains(string2)) {
                            Boolean isFavoriteFromDescription = CloudUtils.getIsFavoriteFromDescription(string);
                            if (isFavoriteFromDescription != null && isFavoriteFromDescription.booleanValue()) {
                                ContentValues contentValues = new ContentValues();
                                contentValues.put("isFavorite", Integer.valueOf(1));
                                contentValues.put("sha1", string2);
                                contentValues.put("dateFavorite", Long.valueOf(System.currentTimeMillis()));
                                contentValues.put("source", Integer.valueOf(1));
                                if (SafeDBUtil.safeInsert(sQLiteDatabase, "favorites", contentValues) > 0) {
                                    newHashSet.add(string2);
                                }
                            }
                        }
                    }
                }
                return null;
            }
        });
    }

    /* access modifiers changed from: private */
    public void refillLocalFileAndAttributes(SQLiteDatabase sQLiteDatabase, int i, String str, boolean z, boolean z2) {
        String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(6);
        Locale locale = Locale.US;
        String str2 = "update %s set %s='%s', %s=((%s & ~%d) | %d | %d), %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s=%d";
        Object[] objArr = new Object[15];
        objArr[0] = "cloud";
        objArr[1] = "localFile";
        objArr[2] = str;
        objArr[3] = "attributes";
        objArr[4] = "attributes";
        objArr[5] = Long.valueOf(5);
        long j = 0;
        objArr[6] = Long.valueOf(z ? 1 : 0);
        if (z2) {
            j = 4;
        }
        objArr[7] = Long.valueOf(j);
        objArr[8] = "editedColumns";
        objArr[9] = "editedColumns";
        objArr[10] = transformToEditedColumnsElement;
        objArr[11] = transformToEditedColumnsElement;
        objArr[12] = transformToEditedColumnsElement;
        objArr[13] = "_id";
        objArr[14] = Integer.valueOf(i);
        safeExecSQL(sQLiteDatabase, String.format(locale, str2, objArr));
    }

    public static void refillLocalGroupId(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (z) {
            SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
            SafeDBUtil.safeQuery(sQLiteDatabase2, "cloud", new String[]{"_id", "serverId"}, String.format(Locale.US, "%s=%s AND %s='%s'", new Object[]{"serverType", Integer.valueOf(0), "serverStatus", "custom"}), (String[]) null, (String) null, (QueryHandler<T>) new UpdateLocalGroupIdQueryHandler<T>(sQLiteDatabase, "cloud", "groupId"));
        }
        if (z2) {
            SQLiteDatabase sQLiteDatabase3 = sQLiteDatabase;
            SafeDBUtil.safeQuery(sQLiteDatabase3, "shareAlbum", new String[]{"_id", "albumId"}, String.format(Locale.US, "%s='%s'", new Object[]{"serverStatus", "custom"}), (String[]) null, (String) null, (QueryHandler<T>) new UpdateLocalGroupIdQueryHandler<T>(sQLiteDatabase, "shareImage", "albumId"));
        }
    }

    private void refillLocalGroupId(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2, boolean z3) {
        boolean z4 = true;
        boolean z5 = !z;
        if (z2 || z3) {
            z4 = false;
        }
        refillLocalGroupId(sQLiteDatabase, z5, z4);
    }

    private void refillRelationTypeOfPeople(final SQLiteDatabase sQLiteDatabase) {
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        SafeDBUtil.safeQuery(sQLiteDatabase2, "peopleFace", new String[]{"_id", "peopleContactJsonInfo"}, String.format(Locale.US, " NOT ( %s is null )", new Object[]{"peopleContactJsonInfo"}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
            public Void handle(Cursor cursor) {
                if (cursor != null) {
                    while (cursor.moveToNext()) {
                        int i = cursor.getInt(0);
                        PeopleContactInfo fromJson = PeopleContactInfo.fromJson(cursor.getString(1));
                        if (fromJson != null && !TextUtils.isEmpty(fromJson.relationWithMe)) {
                            int relationType = fromJson.getRelationType();
                            GalleryDBHelper.safeExecSQL(sQLiteDatabase, String.format(Locale.US, "update %s set %s = %d where %s = %d", new Object[]{"peopleFace", "relationType", Integer.valueOf(relationType), "_id", Integer.valueOf(i)}));
                        }
                    }
                }
                return null;
            }
        });
    }

    private void replaceHongMiFilePath(SQLiteDatabase sQLiteDatabase) {
        String[] strArr;
        if (Device.IS_HONGMI) {
            String str = "update %s set %s = substr(%s, 0, 16) || (substr(%s, 10, 7) = 'sdcard0') ||  substr(%s, 17) where substr(%s, 10, 7) = 'sdcard1' OR substr(%s, 10, 7) = 'sdcard0' ";
            for (String str2 : new String[]{"localFile", "thumbnailFile", "microthumbfile"}) {
                sQLiteDatabase.execSQL(String.format(str, new Object[]{"cloud", str2, str2, str2, str2, str2, str2}));
                sQLiteDatabase.execSQL(String.format(str, new Object[]{"shareImage", str2, str2, str2, str2, str2, str2}));
            }
        }
    }

    /* access modifiers changed from: private */
    public static boolean safeExecSQL(SQLiteDatabase sQLiteDatabase, String str) {
        try {
            sQLiteDatabase.execSQL(str);
            return true;
        } catch (Exception e) {
            Log.w("GalleryDBHelper", "fail to execSQL: %s , detail: %s", str, e.toString());
            return false;
        }
    }

    private static void setAllSyncTagAsDefault(Context context, SQLiteDatabase sQLiteDatabase) {
        Log.d("GalleryDBHelperConvertOldData", "setAllSyncTagAsDefault, url != 2.1");
        ContentValues contentValues = new ContentValues();
        contentValues.put("syncTag", Integer.valueOf(0));
        contentValues.put("shareSyncTagAlbumList", Integer.valueOf(0));
        contentValues.put("shareSyncTagAlbumInfo", Integer.valueOf(0));
        contentValues.put("shareSyncTagImageList", Integer.valueOf(0));
        sQLiteDatabase.update("cloudSetting", contentValues, null, null);
        ContentValues contentValues2 = new ContentValues();
        contentValues2.put("albumImageTag", Integer.valueOf(0));
        sQLiteDatabase.update("shareAlbum", contentValues2, null, null);
        SyncUtil.requestSync(context, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(Long.MAX_VALUE).build());
    }

    private void updateCameraAlbumValues(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, String.format(Locale.US, "UPDATE %s SET %s=%d, %s=%d, %s=(CASE WHEN %s=null THEN null WHEN %s>%d THEN %d ELSE %s END) WHERE %s=%d", new Object[]{"cloud", "dateTaken", Long.valueOf(-999), "mixedDateTime", Long.valueOf(-999), "sortBy", "sortBy", "sortBy", Long.valueOf(-1002), Long.valueOf(-999), "sortBy", "serverId", Long.valueOf(1)}));
    }

    private void upgradeAlbumEditedColumns(SQLiteDatabase sQLiteDatabase) {
        String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(6);
        Object[] objArr = {"cloud", "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, DatabaseUtils.concatenateWhere(DatabaseUtils.concatenateWhere("(serverType=0)", "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))"), String.format(Locale.US, "(%s & %d) = %d or (%s & %d) = %d", new Object[]{"attributes", Long.valueOf(12), Long.valueOf(12), "attributes", Long.valueOf(48), Long.valueOf(48)}))};
        sQLiteDatabase.execSQL(String.format("update %s set %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s", objArr));
    }

    private void upgradeTo21(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(44));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(45));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(46));
            createIndexOnCloudTable_21(sQLiteDatabase);
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(6));
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(7));
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(8));
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(9));
        }
        createTable(sQLiteDatabase, "shareAlbum", this.mShareAlbumColumns);
        createTable(sQLiteDatabase, "shareImage", this.mShareImageColumns);
        createTable(sQLiteDatabase, "shareUser", this.mShareUserColumns);
    }

    private void upgradeTo22(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "shareUser", (TableColumn) this.mShareUserColumns.get(12));
            addColumn(sQLiteDatabase, "shareUser", (TableColumn) this.mShareUserColumns.get(11));
            createIndexOnShareUserTable_22(sQLiteDatabase);
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(10));
        }
        createTable(sQLiteDatabase, "cloudUser", this.mCloudUserColumns);
    }

    private void upgradeTo23(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(16));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(17));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(18));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(19));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(46));
        }
    }

    private void upgradeTo24(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(20));
        }
    }

    private void upgradeTo25(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(47));
        }
    }

    private void upgradeTo26(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(48));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(49));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(21));
        }
    }

    private void upgradeTo27(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(50));
        }
    }

    private void upgradeTo28(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "cloudCache", this.mCloudCacheColumns);
    }

    private void upgradeTo29(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "newFlagCache", this.mNewFlagCacheColumns);
    }

    private void upgradeTo31(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(51));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(52));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(22));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(23));
        }
        if (this.mOldVersion >= 21) {
            cleanCloudData(sQLiteDatabase);
        }
    }

    private void upgradeTo32(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, "CREATE INDEX index_cloud_server_type on cloud (serverType)");
    }

    private void upgradeTo33(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "userInfo", this.mUserInfoColumns);
    }

    private void upgradeTo34(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "whiteListLastModify", this.mWhiteListLastModifyColumns);
    }

    private void upgradeTo35(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, String.format("CREATE UNIQUE INDEX IF NOT EXISTS index_serverId ON %s (%s)", new Object[]{"cloud", "serverId"}));
        safeExecSQL(sQLiteDatabase, String.format("CREATE UNIQUE INDEX IF NOT EXISTS index_albumId ON %s (%s)", new Object[]{"shareAlbum", "albumId"}));
        safeExecSQL(sQLiteDatabase, String.format("CREATE UNIQUE INDEX IF NOT EXISTS index_shareId ON %s (%s)", new Object[]{"shareImage", "shareId"}));
        safeExecSQL(sQLiteDatabase, String.format("CREATE UNIQUE INDEX IF NOT EXISTS index_path ON %s (%s)", new Object[]{"whiteListLastModify", nexExportFormat.TAG_FORMAT_PATH}));
    }

    private void upgradeTo36(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(53));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(54));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(47));
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(48));
        }
    }

    private void upgradeTo37(SQLiteDatabase sQLiteDatabase) {
        replaceHongMiFilePath(sQLiteDatabase);
    }

    private void upgradeTo38(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(11));
        }
        setAllSyncTagAsDefault(this.mContext, sQLiteDatabase);
    }

    private void upgradeTo39(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "photoGpsCache", this.mPhotoGpsCacheColumns);
    }

    private void upgradeTo40(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS photoGpsCache");
        createTable(sQLiteDatabase, "photoGpsCache", this.mPhotoGpsCacheColumns);
    }

    private void upgradeTo41(SQLiteDatabase sQLiteDatabase) {
        String format = String.format(Locale.US, " %s = %d AND ( %s != %d OR %s != %d OR %s != %d )", new Object[]{"serverType", Integer.valueOf(2), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(4), "localFlag", Integer.valueOf(8)});
        ArrayList videosExceptCreated = getVideosExceptCreated(sQLiteDatabase, "cloud", format);
        ArrayList videosExceptCreated2 = getVideosExceptCreated(sQLiteDatabase, "shareImage", format);
        if ((videosExceptCreated == null || videosExceptCreated.isEmpty()) && (videosExceptCreated2 == null || videosExceptCreated2.isEmpty())) {
            Log.d("GalleryDBHelper", "none video in database, skip delete and resync.");
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("DELETE FROM %s WHERE ");
        sb.append(format);
        String sb2 = sb.toString();
        if (videosExceptCreated != null && !videosExceptCreated.isEmpty()) {
            sQLiteDatabase.execSQL(String.format(sb2, new Object[]{"cloud"}));
            deleteVideoThumbnailFile(videosExceptCreated);
        }
        if (videosExceptCreated2 != null && !videosExceptCreated2.isEmpty()) {
            sQLiteDatabase.execSQL(String.format(sb2, new Object[]{"shareImage"}));
            deleteVideoThumbnailFile(videosExceptCreated2);
        }
        Preference.sSetLastSlowScanTime(0);
        setAllSyncTagAsDefault(this.mContext, sQLiteDatabase);
    }

    private void upgradeTo42(SQLiteDatabase sQLiteDatabase) {
        if (this.mOldVersion < 29 || this.mOldVersion > 37) {
            StringBuilder sb = new StringBuilder();
            sb.append("upgrade to 42, should clean data, oldVesion:");
            sb.append(this.mOldVersion);
            Log.d("GalleryDBHelper", sb.toString());
            cleanCloudData(sQLiteDatabase);
            Preference.setDBUpgradeTo42();
            SyncUtil.requestSync(this.mContext, new Builder().setSyncType(SyncType.NORMAL).setSyncReason(Long.MAX_VALUE).build());
        }
    }

    private void upgradeTo43(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        String format = String.format(Locale.US, "CASE WHEN %1$s IS NULL THEN %2$s ELSE strftime('%%s000', substr(%1$s, 0, 5)||'-'||substr(%1$s, 6, 2)||'-'||substr(%1$s,9,2)||' '||substr(%1$s, 11, 9)||'.000')%3$+d END", new Object[]{"exifDateTime", "dateModified", Integer.valueOf(TimeZone.getDefault().getRawOffset())});
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(55));
            safeExecSQL(sQLiteDatabase, String.format("UPDATE %s SET %s = %s", new Object[]{"cloud", "mixedDateTime", format}));
            createIndexOnCloudTable_43(sQLiteDatabase);
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(49));
            safeExecSQL(sQLiteDatabase, String.format("UPDATE %s SET %s = %s", new Object[]{"shareImage", "mixedDateTime", format}));
            createIndexOnShareImageTable_43(sQLiteDatabase);
        }
    }

    private void upgradeTo44(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "localUbifocus", this.mLocalUbifocusColumns);
    }

    private void upgradeTo45(SQLiteDatabase sQLiteDatabase) {
        safeExecSQL(sQLiteDatabase, Time.getUpgradeMixedDateTimeSqlString("cloud"));
        safeExecSQL(sQLiteDatabase, Time.getUpgradeMixedDateTimeSqlString("shareImage"));
    }

    private void upgradeTo46(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(12));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(24));
        }
        ContentValues contentValues = new ContentValues();
        contentValues.put("syncInfo", "");
        sQLiteDatabase.update("cloudSetting", contentValues, null, null);
        Preference.setSyncFetchSyncExtraInfoFromV2ToV3(true);
    }

    private void upgradeTo47(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        createTable(sQLiteDatabase, "ownerSubUbifocus", this.mOwnerSubUbiImageColumns);
        createTable(sQLiteDatabase, "shareSubUbifocus", this.mShareSubUbiImageColumns);
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(56));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(57));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(58));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(50));
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(51));
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(52));
        }
    }

    private void upgradeTo48(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(59));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(53));
        }
    }

    private void upgradeTo49(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(60));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(54));
        }
    }

    private void upgradeTo50(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(13));
        }
    }

    private void upgradeTo51(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            createIndexOnCloudTable_51(sQLiteDatabase);
        }
        if (!z2) {
            createIndexOnShareImageTable_51(sQLiteDatabase);
        }
    }

    private void upgradeTo52(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2, boolean z3, boolean z4) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(61));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(55));
        }
        if (!z3) {
            addColumn(sQLiteDatabase, "ownerSubUbifocus", (TableColumn) this.mOwnerSubUbiImageColumns.get(51));
        }
        if (!z4) {
            addColumn(sQLiteDatabase, "shareSubUbifocus", (TableColumn) this.mShareSubUbiImageColumns.get(53));
        }
    }

    private void upgradeTo53(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            createIndexOnCloudTable_53(sQLiteDatabase);
        }
        if (!z2) {
            createIndexOnShareImageTable_53(sQLiteDatabase);
        }
    }

    private void upgradeTo54(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(62));
        }
    }

    private void upgradeTo55(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "peopleFace", this.mPeopleFaceColumns);
        createTable(sQLiteDatabase, "faceToImages", this.mFace2ImagesColumns);
    }

    private void upgradeTo56(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(14));
            addColumn(sQLiteDatabase, "cloudSetting", (TableColumn) this.mCloudSettingColumns.get(15));
        }
    }

    private void upgradeTo58(SQLiteDatabase sQLiteDatabase, boolean z) {
        createTable(sQLiteDatabase, "peopleRecommend", this.mPeopleRecommendColumns);
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", (TableColumn) this.mPeopleFaceColumns.get(16));
        }
    }

    private void upgradeTo59(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "event", this.mEventColumns);
        createTable(sQLiteDatabase, "eventPhoto", this.mEventPhotoColumns);
    }

    private void upgradeTo61(boolean z) {
    }

    private void upgradeTo62(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "albumCoverKey", this.mAlbumCoverKeyColumns);
    }

    private void upgradeTo63(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(63));
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(64));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "peopleFace", (TableColumn) this.mPeopleFaceColumns.get(17));
        }
    }

    private void upgradeTo64(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudUser", (TableColumn) this.mCloudUserColumns.get(13));
            addColumn(sQLiteDatabase, "cloudUser", (TableColumn) this.mCloudUserColumns.get(14));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareUser", (TableColumn) this.mShareUserColumns.get(13));
            addColumn(sQLiteDatabase, "shareUser", (TableColumn) this.mShareUserColumns.get(14));
        }
    }

    private void upgradeTo65(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(25));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(26));
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(27));
        }
    }

    private void upgradeTo66(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(28));
        }
    }

    private void upgradeTo67(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", (TableColumn) this.mShareImageColumns.get(56));
        }
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(65));
        }
    }

    private void upgradeTo68(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloudUser", (TableColumn) this.mCloudUserColumns.get(15));
        }
    }

    private void upgradeTo69(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", (TableColumn) this.mCloudColumns.get(66));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareAlbum", (TableColumn) this.mShareAlbumColumns.get(29));
        }
    }

    private void upgradeTo70(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            createIndexOnCloudTable_70(sQLiteDatabase);
        }
        if (!z2) {
            createIndexOnShareImageTable_70(sQLiteDatabase);
        }
    }

    private void upgradeTo71(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "eventPhoto", this.mEventPhotoColumns);
    }

    private void upgradeTo72(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", (TableColumn) this.mPeopleFaceColumns.get(18));
        }
    }

    private void upgradeTo73(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2, boolean z3) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", new TableColumn("location", "text"));
            addColumn(sQLiteDatabase, "cloud", new TableColumn("attributes", "integer", String.valueOf(0)));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", new TableColumn("location", "text"));
        }
        if (!z3) {
            addColumn(sQLiteDatabase, "shareAlbum", new TableColumn("attributes", "integer", String.valueOf(0)));
        }
        LocationGenerator.getInstance().generate(this.mContext);
        addRecordsForCameraAndScreenshots(sQLiteDatabase);
        refillLocalGroupId(sQLiteDatabase, z, z2, z3);
    }

    private void upgradeTo74(final SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
            SafeDBUtil.safeQuery(sQLiteDatabase2, "cloud", new String[]{"_id", "description", "fileName", "appKey", "serverId"}, String.format(Locale.US, "%s=%s AND (%s=%d OR %s=%d OR (%s=%d AND %s='%s')) AND %s IS NULL AND %s != %d", new Object[]{"serverType", Integer.valueOf(0), "localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(10), "localFlag", Integer.valueOf(0), "serverStatus", "custom", "localFile", "serverId", Long.valueOf(1)}), (String[]) null, (String) null, (QueryHandler<T>) new QueryHandler<Void>() {
                public Void handle(Cursor cursor) {
                    boolean z;
                    String str;
                    if (cursor != null) {
                        while (cursor.moveToNext()) {
                            int i = cursor.getInt(0);
                            String string = cursor.getString(1);
                            String string2 = cursor.getString(2);
                            String string3 = cursor.getString(3);
                            String string4 = cursor.getString(4);
                            String localFileFromDescription = CloudUtils.getLocalFileFromDescription(string);
                            if (TextUtils.isEmpty(localFileFromDescription)) {
                                localFileFromDescription = CloudUtils.getOwnerAlbumLocalFile(string2, string3);
                            }
                            Boolean autoUploadAttributeFromDescription = CloudUtils.getAutoUploadAttributeFromDescription(string);
                            if (String.valueOf(2).equals(string4)) {
                                String screenshotsLocalFile = CloudUtils.getScreenshotsLocalFile();
                                if (autoUploadAttributeFromDescription == null) {
                                    autoUploadAttributeFromDescription = Boolean.valueOf(Preference.sGetIsScreenShotAutoUploadOpen());
                                }
                                str = screenshotsLocalFile;
                                z = true;
                            } else {
                                if (TextUtils.isEmpty(string3)) {
                                    boolean startsWithIgnoreCase = ExtraTextUtils.startsWithIgnoreCase(localFileFromDescription, "MIUI/Gallery/cloud");
                                    if (autoUploadAttributeFromDescription == null) {
                                        autoUploadAttributeFromDescription = Boolean.valueOf(startsWithIgnoreCase);
                                    }
                                } else if (autoUploadAttributeFromDescription == null) {
                                    autoUploadAttributeFromDescription = Boolean.valueOf(Preference.sGetIsAlbumAutoUploadOpen(string3));
                                }
                                str = localFileFromDescription;
                                z = false;
                            }
                            GalleryDBHelper.this.refillLocalFileAndAttributes(sQLiteDatabase, i, str, autoUploadAttributeFromDescription.booleanValue(), z);
                        }
                    }
                    return null;
                }
            });
        }
    }

    private void upgradeTo75(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            createIndexOnCloudTable_75(sQLiteDatabase);
        }
    }

    private void upgradeTo76(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", new TableColumn("relationType", "integer", MovieStatUtils.DOWNLOAD_SUCCESS));
        }
    }

    private void upgradeTo77(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            refillBabyAlbumDataTaken(sQLiteDatabase);
        }
        if (!z2) {
            refillRelationTypeOfPeople(sQLiteDatabase);
        }
    }

    private void upgradeTo78(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z && !z2) {
            String format = String.format(Locale.US, "%s=%s AND (%s = %d OR %s=%d OR %s=%d OR (%s=%d AND %s='%s')) AND %s NOT NULL AND %s & %d = 0", new Object[]{"serverType", Integer.valueOf(0), "localFlag", Integer.valueOf(7), "localFlag", Integer.valueOf(8), "localFlag", Integer.valueOf(10), "localFlag", Integer.valueOf(0), "serverStatus", "custom", "babyInfoJson", "attributes", Long.valueOf(1)});
            String transformToEditedColumnsElement = GalleryCloudUtils.transformToEditedColumnsElement(6);
            Object[] objArr = {"cloud", "attributes", "attributes", Long.valueOf(1), "editedColumns", "editedColumns", transformToEditedColumnsElement, transformToEditedColumnsElement, transformToEditedColumnsElement, format};
            safeExecSQL(sQLiteDatabase, String.format(Locale.US, "update %s set %s=(%s | %d), %s=coalesce(replace(%s, '%s', '') || '%s', '%s') where %s", objArr));
        }
    }

    private void upgradeTo79(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("localGroupId", Long.valueOf(-1000));
            contentValues.putNull("thumbnailFile");
            SafeDBUtil.safeUpdate(sQLiteDatabase, "cloud", contentValues, "groupId=?", new String[]{String.valueOf(1000)});
        }
        if (z2) {
            Log.i("GalleryDBHelper", "delete secret thumbnail, because it has no sha1");
            BackgroundJobService.startJobDeleteSecretThumbnail(this.mContext.getApplicationContext());
        }
    }

    private void upgradeTo80(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            safeExecSQL(sQLiteDatabase, String.format(Locale.US, "update %s set %s=(%s & ~%d)  where %s=%s and (%s is null or %s!='%s')", new Object[]{"cloud", "attributes", "attributes", Long.valueOf(4), "serverType", Integer.valueOf(0), "serverId", "serverId", Long.valueOf(1)}));
        }
    }

    private void upgradeTo81(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", new TableColumn("eTag", "integer", MovieStatUtils.DOWNLOAD_SUCCESS));
        }
    }

    private void upgradeTo82(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("localGroupId", Long.valueOf(-1000));
            SafeDBUtil.safeUpdate(sQLiteDatabase, "cloud", contentValues, "groupId=?", new String[]{String.valueOf(1000)});
        }
    }

    private void upgradeTo83(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (z) {
            ContentValues contentValues = new ContentValues();
            contentValues.putNull("location");
            SafeDBUtil.safeUpdate(sQLiteDatabase, "cloud", contentValues, (String) null, (String[]) null);
            LocationGenerator.getInstance().generate(this.mContext);
            Log.d("GalleryDBHelper", "upgradeTo83 success");
        }
    }

    private void upgradeTo84(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        String str = "update %s set attributes=( ((attributes & 1) * 1) | ((attributes & 2) * 2) | ((attributes & 4) * 4) ) where attributes > 0";
        if (!z) {
            sQLiteDatabase.execSQL(String.format(Locale.US, str, new Object[]{"cloud"}));
        }
        if (!z2) {
            sQLiteDatabase.execSQL(String.format(Locale.US, str, new Object[]{"shareAlbum"}));
        }
    }

    private void upgradeTo85(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "discoveryMessage", this.mDiscoveryMessageColumns);
        createTable(sQLiteDatabase, "recentDiscoveredMedia", this.mRecentDiscoveredMediaColumns);
    }

    private void upgradeTo86(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", new TableColumn("extraGPS", "text"));
            addColumn(sQLiteDatabase, "cloud", new TableColumn("address", "text"));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", new TableColumn("extraGPS", "text"));
            addColumn(sQLiteDatabase, "shareImage", new TableColumn("address", "text"));
        }
    }

    private void upgradeTo87(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "cloudControl", this.mCloudControlColumns);
    }

    private void upgradeTo88(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", new TableColumn("relationText", "text"));
        }
    }

    private void upgradeTo89(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            StringBuilder sb = new StringBuilder();
            sb.append("UPDATE %s SET attributes=(attributes | (((attributes & 2) | (NOT (attributes & 1))) << 6))  WHERE (serverType=0) AND ");
            sb.append(Cloud.ALIAS_NON_SYSTEM_ALBUM);
            String sb2 = sb.toString();
            sQLiteDatabase.execSQL(String.format(Locale.US, sb2, new Object[]{"cloud"}));
        }
    }

    private void upgradeTo90(SQLiteDatabase sQLiteDatabase, boolean z) {
        createTable(sQLiteDatabase, "favorites", this.mFavoritesColumns);
        if (!z) {
            updateCameraAlbumValues(sQLiteDatabase);
            refillIsFavorite(sQLiteDatabase);
        }
    }

    private void upgradeTo91(SQLiteDatabase sQLiteDatabase, boolean z, boolean z2) {
        if (!z) {
            addColumn(sQLiteDatabase, "cloud", new TableColumn("specialTypeFlags", "integer", String.valueOf(0)));
        }
        if (!z2) {
            addColumn(sQLiteDatabase, "shareImage", new TableColumn("specialTypeFlags", "integer", String.valueOf(0)));
        }
    }

    private void upgradeTo92(SQLiteDatabase sQLiteDatabase, boolean z) {
        if (!z) {
            addColumn(sQLiteDatabase, "peopleFace", new TableColumn("faceCoverScore", "real", String.valueOf(-1.0d)));
        }
    }

    public void analyze() {
        execSQL("analyze;");
    }

    public int delete(String str, String str2, String[] strArr) {
        return getWritableDatabase().delete(str, str2, strArr);
    }

    public boolean deleteDatabase() {
        return this.mContext.deleteDatabase("gallery.db");
    }

    public boolean execSQL(String str) {
        try {
            getWritableDatabase().execSQL(str);
            return true;
        } catch (SQLiteException e) {
            Log.w("GalleryDBHelper", "exec sql", e);
            return false;
        }
    }

    public ArrayList<TableColumn> getCloudColumns() {
        initCloudColumns();
        return this.mCloudColumns;
    }

    public long insert(String str, ContentValues contentValues) {
        return getWritableDatabase().insert(str, null, contentValues);
    }

    public void onConfigure(SQLiteDatabase sQLiteDatabase) {
        super.onConfigure(sQLiteDatabase);
        initCloudColumns();
        this.mAlbumColumns.add(new TableColumn("_id", "integer"));
        this.mAlbumColumns.add(new TableColumn("bucket_id", "text"));
        this.mAlbumColumns.add(new TableColumn("bucket_path", "text"));
        this.mAlbumColumns.add(new TableColumn("recent_visit_time", "integer"));
        this.mAlbumColumns.add(new TableColumn("visit_count", "integer"));
        this.mAlbumColumns.add(new TableColumn("is_hidden_recent", "integer"));
        this.mAlbumColumns.add(new TableColumn("is_manually_recent", "integer"));
        this.mAlbumColumns.add(new TableColumn("is_hidden", "integer"));
        this.mAlbumColumns.add(new TableColumn("sort_by", "integer"));
        this.mAlbumColumns.add(new TableColumn("cover_path", "integer"));
        this.mAlbumColumns.add(new TableColumn("sdcard_sort_by", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("_id", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("accountName", "text"));
        this.mCloudSettingColumns.add(new TableColumn("accountType", "text"));
        this.mCloudSettingColumns.add(new TableColumn("syncTag", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("isSync", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("isSyncOnlyOnWifi", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("shareSyncTagAlbumList", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("shareSyncTagAlbumInfo", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("shareSyncTagImageList", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("shareSyncTagUserList", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("ownerSyncTagUserList", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("syncInfo", "text"));
        this.mCloudSettingColumns.add(new TableColumn("shareSyncInfo", "text"));
        this.mCloudSettingColumns.add(new TableColumn("cloudTabNewFlag", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("faceWatermark", "integer"));
        this.mCloudSettingColumns.add(new TableColumn("faceSyncToken", "text"));
        this.mShareAlbumColumns.add(new TableColumn("_id", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("groupId", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("dateModified", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("description", "text"));
        this.mShareAlbumColumns.add(new TableColumn("fileName", "text"));
        this.mShareAlbumColumns.add(new TableColumn("dateTaken", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("serverId", "text"));
        this.mShareAlbumColumns.add(new TableColumn("serverType", "text"));
        this.mShareAlbumColumns.add(new TableColumn("serverStatus", "text"));
        this.mShareAlbumColumns.add(new TableColumn("serverTag", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("localFlag", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("sortBy", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("canModified", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("albumId", "text"));
        this.mShareAlbumColumns.add(new TableColumn("creatorId", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("shareUrl", "text"));
        this.mShareAlbumColumns.add(new TableColumn("albumStatus", "text"));
        this.mShareAlbumColumns.add(new TableColumn("albumTag", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("albumImageTag", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("albumUserTag", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("shareUrlLong", "text"));
        this.mShareAlbumColumns.add(new TableColumn("newImageFlag", "text"));
        this.mShareAlbumColumns.add(new TableColumn("isPublic", "integer"));
        this.mShareAlbumColumns.add(new TableColumn("publicUrl", "text"));
        this.mShareAlbumColumns.add(new TableColumn("syncInfo", "text"));
        this.mShareAlbumColumns.add(new TableColumn("babyInfoJson", "text"));
        this.mShareAlbumColumns.add(new TableColumn("peopleId", "text"));
        this.mShareAlbumColumns.add(new TableColumn("sharerInfo", "text"));
        this.mShareAlbumColumns.add(new TableColumn("editedColumns", "text"));
        this.mShareAlbumColumns.add(new TableColumn("thumbnailInfo", "text"));
        this.mShareAlbumColumns.add(new TableColumn("attributes", "integer", String.valueOf(0)));
        this.mShareUserColumns.add(new TableColumn("_id", "integer"));
        this.mShareUserColumns.add(new TableColumn("userId", "integer"));
        this.mShareUserColumns.add(new TableColumn("userName", "text"));
        this.mShareUserColumns.add(new TableColumn("createTime", "integer"));
        this.mShareUserColumns.add(new TableColumn("requestType", "text"));
        this.mShareUserColumns.add(new TableColumn("requestValue", "text"));
        this.mShareUserColumns.add(new TableColumn("serverStatus", "text"));
        this.mShareUserColumns.add(new TableColumn("serverTag", "integer"));
        this.mShareUserColumns.add(new TableColumn("albumId", "text"));
        this.mShareUserColumns.add(new TableColumn("localFlag", "integer"));
        this.mShareUserColumns.add(new TableColumn("shareUrl", "text"));
        this.mShareUserColumns.add(new TableColumn("shareText", "text"));
        this.mShareUserColumns.add(new TableColumn("localAlbumId", "text"));
        this.mShareUserColumns.add(new TableColumn("relation", "text"));
        this.mShareUserColumns.add(new TableColumn("relationText", "text"));
        this.mShareImageColumns.add(new TableColumn("_id", "integer"));
        this.mShareImageColumns.add(new TableColumn("groupId", "integer"));
        this.mShareImageColumns.add(new TableColumn("size", "integer"));
        this.mShareImageColumns.add(new TableColumn("dateModified", "integer"));
        this.mShareImageColumns.add(new TableColumn("mimeType", "text"));
        this.mShareImageColumns.add(new TableColumn("title", "text"));
        this.mShareImageColumns.add(new TableColumn("description", "text"));
        this.mShareImageColumns.add(new TableColumn("fileName", "text"));
        this.mShareImageColumns.add(new TableColumn("dateTaken", "integer"));
        this.mShareImageColumns.add(new TableColumn("duration", "integer"));
        this.mShareImageColumns.add(new TableColumn("serverId", "text"));
        this.mShareImageColumns.add(new TableColumn("serverType", "text"));
        this.mShareImageColumns.add(new TableColumn("serverStatus", "text"));
        this.mShareImageColumns.add(new TableColumn("serverTag", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifImageWidth", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifImageLength", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifOrientation", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifGPSLatitude", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSLongitude", "text"));
        this.mShareImageColumns.add(new TableColumn("exifMake", "text"));
        this.mShareImageColumns.add(new TableColumn("exifModel", "text"));
        this.mShareImageColumns.add(new TableColumn("exifFlash", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifGPSLatitudeRef", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSLongitudeRef", "text"));
        this.mShareImageColumns.add(new TableColumn("exifExposureTime", "text"));
        this.mShareImageColumns.add(new TableColumn("exifFNumber", "text"));
        this.mShareImageColumns.add(new TableColumn("exifISOSpeedRatings", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSAltitude", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSAltitudeRef", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifGPSTimeStamp", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSDateStamp", "text"));
        this.mShareImageColumns.add(new TableColumn("exifWhiteBalance", "integer"));
        this.mShareImageColumns.add(new TableColumn("exifFocalLength", "text"));
        this.mShareImageColumns.add(new TableColumn("exifGPSProcessingMethod", "text"));
        this.mShareImageColumns.add(new TableColumn("exifDateTime", "text"));
        this.mShareImageColumns.add(new TableColumn("localFlag", "integer"));
        this.mShareImageColumns.add(new TableColumn("thumbnailFile", "text"));
        this.mShareImageColumns.add(new TableColumn("downloadFile", "text"));
        this.mShareImageColumns.add(new TableColumn("localFile", "text"));
        this.mShareImageColumns.add(new TableColumn("sha1", "text"));
        this.mShareImageColumns.add(new TableColumn("sortBy", "integer"));
        this.mShareImageColumns.add(new TableColumn("microthumbfile", "text"));
        this.mShareImageColumns.add(new TableColumn("localGroupId", "text"));
        this.mShareImageColumns.add(new TableColumn("localImageId", "text"));
        this.mShareImageColumns.add(new TableColumn("albumId", "text"));
        this.mShareImageColumns.add(new TableColumn("creatorId", "text"));
        this.mShareImageColumns.add(new TableColumn("shareId", "text"));
        this.mShareImageColumns.add(new TableColumn("downloadFileStatus", "integer"));
        this.mShareImageColumns.add(new TableColumn("downloadFileTime", "integer"));
        this.mShareImageColumns.add(new TableColumn("mixedDateTime", "integer"));
        this.mShareImageColumns.add(new TableColumn("ubiSubImageCount", "integer"));
        this.mShareImageColumns.add(new TableColumn("ubiFocusIndex", "integer"));
        this.mShareImageColumns.add(new TableColumn("ubiSubIndex", "integer"));
        this.mShareImageColumns.add(new TableColumn("editedColumns", "text"));
        this.mShareImageColumns.add(new TableColumn("fromLocalGroupId", "text"));
        this.mShareImageColumns.add(new TableColumn("secretKey", "blob"));
        this.mShareImageColumns.add(new TableColumn("lables", "integer"));
        this.mShareImageColumns.add(new TableColumn("location", "text"));
        this.mShareImageColumns.add(new TableColumn("extraGPS", "text"));
        this.mShareImageColumns.add(new TableColumn("address", "text"));
        this.mShareImageColumns.add(new TableColumn("specialTypeFlags", "integer", String.valueOf(0)));
        this.mCloudUserColumns.add(new TableColumn("_id", "integer"));
        this.mCloudUserColumns.add(new TableColumn("userId", "integer"));
        this.mCloudUserColumns.add(new TableColumn("userName", "text"));
        this.mCloudUserColumns.add(new TableColumn("createTime", "integer"));
        this.mCloudUserColumns.add(new TableColumn("requestType", "text"));
        this.mCloudUserColumns.add(new TableColumn("requestValue", "text"));
        this.mCloudUserColumns.add(new TableColumn("serverStatus", "text"));
        this.mCloudUserColumns.add(new TableColumn("serverTag", "integer"));
        this.mCloudUserColumns.add(new TableColumn("albumId", "text"));
        this.mCloudUserColumns.add(new TableColumn("localFlag", "integer"));
        this.mCloudUserColumns.add(new TableColumn("shareUrl", "text"));
        this.mCloudUserColumns.add(new TableColumn("shareText", "text"));
        this.mCloudUserColumns.add(new TableColumn("localAlbumId", "text"));
        this.mCloudUserColumns.add(new TableColumn("relation", "text"));
        this.mCloudUserColumns.add(new TableColumn("relationText", "text"));
        this.mCloudUserColumns.add(new TableColumn("phone", "text"));
        this.mCloudCacheColumns.add(new TableColumn("_id", "integer"));
        this.mCloudCacheColumns.add(new TableColumn("serverId", "text"));
        this.mCloudCacheColumns.add(new TableColumn("barcodeData", "text"));
        this.mCloudCacheColumns.add(new TableColumn("barcodeDataDeadline", "integer"));
        this.mCloudCacheColumns.add(new TableColumn("smsShareData", "text"));
        this.mCloudCacheColumns.add(new TableColumn("smsShareDataDeadline", "integer"));
        this.mNewFlagCacheColumns.add(new TableColumn("_id", "integer"));
        this.mNewFlagCacheColumns.add(new TableColumn("albumId", "text"));
        this.mNewFlagCacheColumns.add(new TableColumn("newImageFlag", "integer"));
        this.mNewFlagCacheColumns.add(new TableColumn("newUserFlag", "integer"));
        this.mUserInfoColumns.add(new TableColumn("_id", "integer"));
        this.mUserInfoColumns.add(new TableColumn("date_modified", "integer"));
        this.mUserInfoColumns.add(new TableColumn("user_id", "text"));
        this.mUserInfoColumns.add(new TableColumn("alias_nick", "text"));
        this.mUserInfoColumns.add(new TableColumn("miliao_nick", "text"));
        this.mUserInfoColumns.add(new TableColumn("miliao_icon_url", "text"));
        this.mWhiteListLastModifyColumns.add(new TableColumn(nexExportFormat.TAG_FORMAT_PATH, "text"));
        this.mWhiteListLastModifyColumns.add(new TableColumn("stamp", "integer"));
        this.mPhotoGpsCacheColumns.add(new TableColumn("gpsData", "text"));
        this.mPhotoGpsCacheColumns.add(new TableColumn("cityId", "text"));
        this.mLocalUbifocusColumns.add(new TableColumn("data", "text"));
        this.mLocalUbifocusColumns.add(new TableColumn("focusIndex", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("_id", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("groupId", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("size", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("dateModified", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("mimeType", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("title", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("description", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("fileName", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("dateTaken", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("duration", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("serverId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("serverType", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("serverStatus", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("serverTag", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifImageWidth", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifImageLength", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifOrientation", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSLatitude", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSLongitude", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifMake", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifModel", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifFlash", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSLatitudeRef", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSLongitudeRef", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifExposureTime", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifFNumber", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifISOSpeedRatings", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSAltitude", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSAltitudeRef", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSTimeStamp", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSDateStamp", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifWhiteBalance", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifFocalLength", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifGPSProcessingMethod", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("exifDateTime", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("localFlag", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("thumbnailFile", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("downloadFile", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("localFile", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("sha1", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("sortBy", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("microthumbfile", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("localGroupId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("localImageId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("albumId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("downloadFileStatus", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("downloadFileTime", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("mixedDateTime", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("ubiServerId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("ubiLocalId", "text"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("ubiSubIndex", "integer"));
        this.mOwnerSubUbiImageColumns.add(new TableColumn("secretKey", "blob"));
        this.mShareSubUbiImageColumns.add(new TableColumn("_id", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("groupId", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("size", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("dateModified", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("mimeType", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("title", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("description", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("fileName", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("dateTaken", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("duration", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("serverId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("serverType", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("serverStatus", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("serverTag", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifImageWidth", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifImageLength", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifOrientation", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSLatitude", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSLongitude", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifMake", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifModel", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifFlash", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSLatitudeRef", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSLongitudeRef", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifExposureTime", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifFNumber", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifISOSpeedRatings", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSAltitude", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSAltitudeRef", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSTimeStamp", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSDateStamp", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifWhiteBalance", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifFocalLength", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifGPSProcessingMethod", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("exifDateTime", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("localFlag", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("thumbnailFile", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("downloadFile", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("localFile", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("sha1", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("sortBy", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("microthumbfile", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("localGroupId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("localImageId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("albumId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("creatorId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("shareId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("downloadFileStatus", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("downloadFileTime", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("mixedDateTime", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("ubiServerId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("ubiLocalId", "text"));
        this.mShareSubUbiImageColumns.add(new TableColumn("ubiSubIndex", "integer"));
        this.mShareSubUbiImageColumns.add(new TableColumn("secretKey", "blob"));
        this.mPeopleFaceColumns.add(new TableColumn("_id", "integer"));
        this.mPeopleFaceColumns.add(new TableColumn("serverId", "text"));
        this.mPeopleFaceColumns.add(new TableColumn(nexExportFormat.TAG_FORMAT_TYPE, "text"));
        this.mPeopleFaceColumns.add(new TableColumn("groupId", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("localGroupId", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("localFlag", "integer"));
        this.mPeopleFaceColumns.add(new TableColumn("faceXScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("faceYScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("faceWScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("faceHScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("leftEyeXScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("leftEyeYScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("RightEyeXScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("RightEyeYScale", "real"));
        this.mPeopleFaceColumns.add(new TableColumn("serverStatus", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("peopleName", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("visibilityType", "integer"));
        this.mPeopleFaceColumns.add(new TableColumn("peopleType", "integer"));
        this.mPeopleFaceColumns.add(new TableColumn("peopleContactJsonInfo", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("relationType", "integer", MovieStatUtils.DOWNLOAD_SUCCESS));
        this.mPeopleFaceColumns.add(new TableColumn("eTag", "integer", MovieStatUtils.DOWNLOAD_SUCCESS));
        this.mPeopleFaceColumns.add(new TableColumn("relationText", "text"));
        this.mPeopleFaceColumns.add(new TableColumn("faceCoverScore", "real", String.valueOf(-1.0d)));
        this.mFace2ImagesColumns.add(new TableColumn("_id", "integer"));
        this.mFace2ImagesColumns.add(new TableColumn("faceId", "text"));
        this.mFace2ImagesColumns.add(new TableColumn("imageServerId", "text"));
        this.mPeopleRecommendColumns.add(new TableColumn("_id", "integer"));
        this.mPeopleRecommendColumns.add(new TableColumn("peopleServerId", "text"));
        this.mPeopleRecommendColumns.add(new TableColumn("recommendPeoplesJson", "text"));
        this.mPeopleRecommendColumns.add(new TableColumn("recommendHistoryJson", "text"));
        this.mPeopleRecommendColumns.add(new TableColumn("lastUpdateFromServerTime", "integer"));
        this.mEventColumns.add(new TableColumn("_id", "integer"));
        this.mEventColumns.add(new TableColumn("name", "text"));
        this.mEventPhotoColumns.add(new TableColumn("_id", "integer"));
        this.mEventPhotoColumns.add(new TableColumn("localEventId", "integer"));
        this.mEventPhotoColumns.add(new TableColumn("key", "integer"));
        this.mEventPhotoColumns.add(new TableColumn("dateTaken", "integer"));
        this.mAlbumCoverKeyColumns.add(new TableColumn(nexExportFormat.TAG_FORMAT_PATH, "text"));
        this.mAlbumCoverKeyColumns.add(new TableColumn("userKey", "text"));
        this.mAlbumCoverKeyColumns.add(new TableColumn("lastModified", "integer"));
        this.mAlbumCoverKeyColumns.add(new TableColumn("key", "blob"));
        this.mDiscoveryMessageColumns.add(new TableColumn("_id", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("message", "text"));
        this.mDiscoveryMessageColumns.add(new TableColumn("title", "text"));
        this.mDiscoveryMessageColumns.add(new TableColumn("subTitle", "text"));
        this.mDiscoveryMessageColumns.add(new TableColumn(nexExportFormat.TAG_FORMAT_TYPE, "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("priority", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("receiveTime", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("updateTime", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("triggerTime", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("expireTime", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("actionUri", "text"));
        this.mDiscoveryMessageColumns.add(new TableColumn("messageSource", "text"));
        this.mDiscoveryMessageColumns.add(new TableColumn("isConsumed", "integer"));
        this.mDiscoveryMessageColumns.add(new TableColumn("extraData", "text"));
        this.mRecentDiscoveredMediaColumns.add(new TableColumn("_id", "integer"));
        this.mRecentDiscoveredMediaColumns.add(new TableColumn("mediaId", "integer", true));
        this.mRecentDiscoveredMediaColumns.add(new TableColumn("dateAdded", "integer"));
        this.mRecentDiscoveredMediaColumns.add(new TableColumn("source", "integer"));
        this.mCloudControlColumns.add(new TableColumn("_id", "integer"));
        this.mCloudControlColumns.add(new TableColumn("featureName", "text", true));
        this.mCloudControlColumns.add(new TableColumn("status", "text"));
        this.mCloudControlColumns.add(new TableColumn("strategy", "text"));
        this.mFavoritesColumns.add(new TableColumn("_id", "integer"));
        this.mFavoritesColumns.add(new TableColumn("isFavorite", "integer"));
        this.mFavoritesColumns.add(new TableColumn("dateFavorite", "integer"));
        this.mFavoritesColumns.add(new TableColumn("source", "integer"));
        this.mFavoritesColumns.add(new TableColumn("sha1", "text", true));
    }

    public void onCreate(SQLiteDatabase sQLiteDatabase) {
        createTable(sQLiteDatabase, "album", this.mAlbumColumns);
        createTable(sQLiteDatabase, "cloud", this.mCloudColumns);
        createTable(sQLiteDatabase, "cloudSetting", this.mCloudSettingColumns);
        createTable(sQLiteDatabase, "shareAlbum", this.mShareAlbumColumns);
        createTable(sQLiteDatabase, "shareImage", this.mShareImageColumns);
        createTable(sQLiteDatabase, "shareUser", this.mShareUserColumns);
        createTable(sQLiteDatabase, "cloudUser", this.mCloudUserColumns);
        createTable(sQLiteDatabase, "cloudCache", this.mCloudCacheColumns);
        createTable(sQLiteDatabase, "newFlagCache", this.mNewFlagCacheColumns);
        createTable(sQLiteDatabase, "userInfo", this.mUserInfoColumns);
        createTable(sQLiteDatabase, "whiteListLastModify", this.mWhiteListLastModifyColumns);
        createTable(sQLiteDatabase, "photoGpsCache", this.mPhotoGpsCacheColumns);
        createTable(sQLiteDatabase, "localUbifocus", this.mLocalUbifocusColumns);
        createTable(sQLiteDatabase, "ownerSubUbifocus", this.mOwnerSubUbiImageColumns);
        createTable(sQLiteDatabase, "shareSubUbifocus", this.mShareSubUbiImageColumns);
        createTable(sQLiteDatabase, "peopleFace", this.mPeopleFaceColumns);
        createTable(sQLiteDatabase, "faceToImages", this.mFace2ImagesColumns);
        createTable(sQLiteDatabase, "peopleRecommend", this.mPeopleRecommendColumns);
        createTable(sQLiteDatabase, "event", this.mEventColumns);
        createTable(sQLiteDatabase, "eventPhoto", this.mEventPhotoColumns);
        createTable(sQLiteDatabase, "albumCoverKey", this.mAlbumCoverKeyColumns);
        createTable(sQLiteDatabase, "discoveryMessage", this.mDiscoveryMessageColumns);
        createTable(sQLiteDatabase, "recentDiscoveredMedia", this.mRecentDiscoveredMediaColumns);
        createTable(sQLiteDatabase, "cloudControl", this.mCloudControlColumns);
        createTable(sQLiteDatabase, "favorites", this.mFavoritesColumns);
        createViewIfNeeded(sQLiteDatabase, true);
        addUniqueIndexs(sQLiteDatabase);
        clearColumnList();
        addRecordsForCameraAndScreenshots(sQLiteDatabase);
    }

    public void onOpen(SQLiteDatabase sQLiteDatabase) {
        super.onOpen(sQLiteDatabase);
        if (!DataBase.getEverFixedCameraAlbumAttributes()) {
            try {
                fixCameraAlbumAttributes(sQLiteDatabase);
                DataBase.setEverFixedCameraAlbumAttributes();
            } catch (Exception e) {
                HashMap hashMap = new HashMap();
                StringBuilder sb = new StringBuilder();
                sb.append(this.mOldVersion);
                sb.append("_");
                sb.append(sQLiteDatabase.getVersion());
                hashMap.put("version", sb.toString());
                hashMap.put("exception", android.util.Log.getStackTraceString(e));
                GallerySamplingStatHelper.recordErrorEvent("db_helper", "db_fix_camera_attributes", hashMap);
                Log.e("GalleryDBHelper", "version old[%d], new[%d], exception[%s]", Integer.valueOf(this.mOldVersion), Integer.valueOf(sQLiteDatabase.getVersion()), android.util.Log.getStackTraceString(e));
            }
        }
        if (!DataBase.getEverUpgradeAlbumEditedColumns()) {
            try {
                Log.i("GalleryDBHelper", "upgradeAlbumEditedColumns");
                upgradeAlbumEditedColumns(sQLiteDatabase);
                DataBase.setEverUpgradeAlbumEditedColumns();
            } catch (Exception e2) {
                Log.e("GalleryDBHelper", "version old[%d], new[%d], exception[%s]", Integer.valueOf(this.mOldVersion), Integer.valueOf(sQLiteDatabase.getVersion()), android.util.Log.getStackTraceString(e2));
            }
        }
        createViewIfNeeded(sQLiteDatabase, false);
    }

    /* JADX WARNING: Removed duplicated region for block: B:100:0x0244  */
    /* JADX WARNING: Removed duplicated region for block: B:103:0x0254  */
    /* JADX WARNING: Removed duplicated region for block: B:106:0x0264  */
    /* JADX WARNING: Removed duplicated region for block: B:109:0x0274  */
    /* JADX WARNING: Removed duplicated region for block: B:112:0x0284  */
    /* JADX WARNING: Removed duplicated region for block: B:115:0x0294  */
    /* JADX WARNING: Removed duplicated region for block: B:116:0x02a2  */
    /* JADX WARNING: Removed duplicated region for block: B:119:0x02ab  */
    /* JADX WARNING: Removed duplicated region for block: B:122:0x02bb  */
    /* JADX WARNING: Removed duplicated region for block: B:125:0x02cb  */
    /* JADX WARNING: Removed duplicated region for block: B:128:0x02db  */
    /* JADX WARNING: Removed duplicated region for block: B:131:0x02eb  */
    /* JADX WARNING: Removed duplicated region for block: B:132:0x02ff  */
    /* JADX WARNING: Removed duplicated region for block: B:135:0x0306  */
    /* JADX WARNING: Removed duplicated region for block: B:138:0x0316  */
    /* JADX WARNING: Removed duplicated region for block: B:141:0x0326  */
    /* JADX WARNING: Removed duplicated region for block: B:142:0x0332  */
    /* JADX WARNING: Removed duplicated region for block: B:145:0x0339  */
    /* JADX WARNING: Removed duplicated region for block: B:148:0x0349  */
    /* JADX WARNING: Removed duplicated region for block: B:151:0x0359  */
    /* JADX WARNING: Removed duplicated region for block: B:154:0x0362  */
    /* JADX WARNING: Removed duplicated region for block: B:163:0x0378  */
    /* JADX WARNING: Removed duplicated region for block: B:166:0x0381  */
    /* JADX WARNING: Removed duplicated region for block: B:169:0x038a  */
    /* JADX WARNING: Removed duplicated region for block: B:172:0x039a  */
    /* JADX WARNING: Removed duplicated region for block: B:175:0x03a3  */
    /* JADX WARNING: Removed duplicated region for block: B:178:0x03ac  */
    /* JADX WARNING: Removed duplicated region for block: B:181:0x03b5  */
    /* JADX WARNING: Removed duplicated region for block: B:184:0x03be  */
    /* JADX WARNING: Removed duplicated region for block: B:187:0x03c7  */
    /* JADX WARNING: Removed duplicated region for block: B:190:0x03d0  */
    /* JADX WARNING: Removed duplicated region for block: B:193:0x03d9  */
    /* JADX WARNING: Removed duplicated region for block: B:196:0x03e2  */
    /* JADX WARNING: Removed duplicated region for block: B:199:0x03eb  */
    /* JADX WARNING: Removed duplicated region for block: B:202:0x03fb  */
    /* JADX WARNING: Removed duplicated region for block: B:205:0x040b  */
    /* JADX WARNING: Removed duplicated region for block: B:208:0x041b  */
    /* JADX WARNING: Removed duplicated region for block: B:211:0x042b  */
    /* JADX WARNING: Removed duplicated region for block: B:214:0x043b  */
    /* JADX WARNING: Removed duplicated region for block: B:221:0x0452  */
    /* JADX WARNING: Removed duplicated region for block: B:228:0x0469  */
    /* JADX WARNING: Removed duplicated region for block: B:235:0x0480  */
    /* JADX WARNING: Removed duplicated region for block: B:238:0x0490  */
    /* JADX WARNING: Removed duplicated region for block: B:241:0x04a0  */
    /* JADX WARNING: Removed duplicated region for block: B:253:0x04cb  */
    /* JADX WARNING: Removed duplicated region for block: B:256:0x04db  */
    /* JADX WARNING: Removed duplicated region for block: B:259:0x04eb  */
    /* JADX WARNING: Removed duplicated region for block: B:262:0x04fb  */
    /* JADX WARNING: Removed duplicated region for block: B:270:0x051f  */
    /* JADX WARNING: Removed duplicated region for block: B:271:0x052c  */
    /* JADX WARNING: Removed duplicated region for block: B:274:0x0534  */
    /* JADX WARNING: Removed duplicated region for block: B:277:0x0544  */
    /* JADX WARNING: Removed duplicated region for block: B:279:0x0552  */
    /* JADX WARNING: Removed duplicated region for block: B:28:0x00d6  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x00e8  */
    /* JADX WARNING: Removed duplicated region for block: B:38:0x00fa  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x0108  */
    /* JADX WARNING: Removed duplicated region for block: B:42:0x0111  */
    /* JADX WARNING: Removed duplicated region for block: B:43:0x011d  */
    /* JADX WARNING: Removed duplicated region for block: B:46:0x0124  */
    /* JADX WARNING: Removed duplicated region for block: B:49:0x0134  */
    /* JADX WARNING: Removed duplicated region for block: B:52:0x0144  */
    /* JADX WARNING: Removed duplicated region for block: B:55:0x0154  */
    /* JADX WARNING: Removed duplicated region for block: B:58:0x0164  */
    /* JADX WARNING: Removed duplicated region for block: B:61:0x0174  */
    /* JADX WARNING: Removed duplicated region for block: B:64:0x0184  */
    /* JADX WARNING: Removed duplicated region for block: B:67:0x0194  */
    /* JADX WARNING: Removed duplicated region for block: B:70:0x01a4  */
    /* JADX WARNING: Removed duplicated region for block: B:73:0x01b4  */
    /* JADX WARNING: Removed duplicated region for block: B:76:0x01c4  */
    /* JADX WARNING: Removed duplicated region for block: B:79:0x01d4  */
    /* JADX WARNING: Removed duplicated region for block: B:82:0x01e4  */
    /* JADX WARNING: Removed duplicated region for block: B:85:0x01f4  */
    /* JADX WARNING: Removed duplicated region for block: B:88:0x0204  */
    /* JADX WARNING: Removed duplicated region for block: B:91:0x0214  */
    /* JADX WARNING: Removed duplicated region for block: B:94:0x0224  */
    /* JADX WARNING: Removed duplicated region for block: B:97:0x0234  */
    public void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        boolean z;
        boolean z2;
        boolean z3;
        boolean z4;
        boolean z5;
        boolean z6;
        boolean z7;
        boolean z8;
        boolean z9;
        boolean z10;
        boolean z11;
        boolean z12;
        boolean z13;
        boolean z14;
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        this.mOldVersion = i;
        if (this.mOldVersion < i2) {
            Log.i("GalleryDBHelper", "onUpgrade oldVersion[%d], newVersion[%d]", Integer.valueOf(i), Integer.valueOf(i2));
            if (this.mOldVersion < 92) {
                if (this.mOldVersion < 9) {
                    sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS album");
                    sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS cloud");
                    onCreate(sQLiteDatabase);
                    z3 = true;
                    z2 = true;
                    z = true;
                } else {
                    z3 = false;
                    z2 = false;
                    z = false;
                }
                if (this.mOldVersion < 14) {
                    if (!z3) {
                        sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS cloud");
                        createTable(sQLiteDatabase2, "cloud", this.mCloudColumns);
                        z3 = true;
                    }
                    if (!z2) {
                        sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS cloudSetting");
                        createTable(sQLiteDatabase2, "cloudSetting", this.mCloudSettingColumns);
                        z2 = true;
                    }
                }
                if (this.mOldVersion < 15 && !z) {
                    addColumn(sQLiteDatabase2, "album", (TableColumn) this.mAlbumColumns.get(10));
                    sQLiteDatabase2.execSQL(String.format(Locale.US, "UPDATE %s SET %s=%d", new Object[]{"album", ((TableColumn) this.mAlbumColumns.get(10)).mName, Integer.valueOf(1)}));
                }
                if (this.mOldVersion < 18) {
                    Log.d("GalleryDBHelper", "upgrade to 18");
                    int i3 = this.mOldVersion;
                    if (!z3) {
                        sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS cloud");
                        createTable(sQLiteDatabase2, "cloud", this.mCloudColumns);
                        z3 = true;
                    }
                    if (!z2) {
                        sQLiteDatabase2.execSQL("DROP TABLE IF EXISTS cloudSetting");
                        createTable(sQLiteDatabase2, "cloudSetting", this.mCloudSettingColumns);
                        z5 = z3;
                        z4 = true;
                        if (this.mOldVersion < 19) {
                            Log.d("GalleryDBHelper", "upgrade to 19");
                            if (!z5) {
                                createIndexOnCloudTable_19(sQLiteDatabase);
                            }
                        }
                        if (this.mOldVersion < 20) {
                            Log.d("GalleryDBHelper", "upgrade to 20");
                            if (!z5) {
                                createIndexOnCloudTable_20(sQLiteDatabase);
                            }
                        }
                        if (this.mOldVersion >= 21) {
                            Log.d("GalleryDBHelper", "upgrade to 21");
                            upgradeTo21(sQLiteDatabase2, z5, z4);
                            z8 = true;
                            z7 = true;
                            z6 = true;
                        } else {
                            z8 = false;
                            z7 = false;
                            z6 = false;
                        }
                        if (this.mOldVersion >= 22) {
                            Log.d("GalleryDBHelper", "upgrade to 22");
                            upgradeTo22(sQLiteDatabase2, z8, z4);
                            z9 = true;
                        } else {
                            z9 = false;
                        }
                        if (this.mOldVersion < 23) {
                            Log.d("GalleryDBHelper", "upgrade to 23");
                            upgradeTo23(sQLiteDatabase2, z7, z6);
                        }
                        if (this.mOldVersion < 24) {
                            Log.d("GalleryDBHelper", "upgrade to 24");
                            upgradeTo24(sQLiteDatabase2, z7);
                        }
                        if (this.mOldVersion < 25) {
                            Log.d("GalleryDBHelper", "upgrade to 25");
                            upgradeTo25(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion < 26) {
                            Log.d("GalleryDBHelper", "upgrade to 26");
                            upgradeTo26(sQLiteDatabase2, z5, z7);
                        }
                        if (this.mOldVersion < 27) {
                            Log.d("GalleryDBHelper", "upgrade to 27");
                            upgradeTo27(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion < 28) {
                            Log.d("GalleryDBHelper", "upgrade to 28");
                            upgradeTo28(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 29) {
                            Log.d("GalleryDBHelper", "upgrade to 29");
                            upgradeTo29(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 31) {
                            Log.d("GalleryDBHelper", "upgrade to 31");
                            upgradeTo31(sQLiteDatabase2, z5, z7);
                        }
                        if (this.mOldVersion < 32) {
                            Log.d("GalleryDBHelper", "upgrade to 32");
                            upgradeTo32(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 33) {
                            Log.d("GalleryDBHelper", "upgrade to 33");
                            upgradeTo33(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 34) {
                            Log.d("GalleryDBHelper", "upgrade to 34");
                            upgradeTo34(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 35) {
                            Log.d("GalleryDBHelper", "upgrade to 35");
                            upgradeTo35(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 36) {
                            Log.d("GalleryDBHelper", "upgrade to 36");
                            upgradeTo36(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 37) {
                            Log.d("GalleryDBHelper", "upgrade to 37");
                            upgradeTo37(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 38) {
                            Log.d("GalleryDBHelper", "upgrade to 38");
                            upgradeTo38(sQLiteDatabase2, z4);
                        }
                        if (this.mOldVersion < 39) {
                            Log.d("GalleryDBHelper", "upgrade to 39");
                            upgradeTo39(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 40) {
                            Log.d("GalleryDBHelper", "upgrade to 40");
                            upgradeTo40(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 41) {
                            Log.d("GalleryDBHelper", "upgrade to 41");
                            upgradeTo41(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 42) {
                            Log.d("GalleryDBHelper", "upgrade to 42");
                            upgradeTo42(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 43) {
                            Log.d("GalleryDBHelper", "upgrade to 43");
                            upgradeTo43(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 44) {
                            Log.d("GalleryDBHelper", "upgrade to 44");
                            upgradeTo44(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 45) {
                            Log.d("GalleryDBHelper", "upgrade to 45");
                            upgradeTo45(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 46) {
                            Log.d("GalleryDBHelper", "upgrade to 46");
                            upgradeTo46(sQLiteDatabase2, z4, z7);
                        }
                        if (this.mOldVersion >= 47) {
                            Log.d("GalleryDBHelper", "upgrade to 47");
                            upgradeTo47(sQLiteDatabase2, z5, z6);
                            z11 = true;
                            z10 = true;
                        } else {
                            z11 = false;
                            z10 = false;
                        }
                        if (this.mOldVersion < 48) {
                            Log.d("GalleryDBHelper", "upgrade to 48");
                            upgradeTo48(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 49) {
                            Log.d("GalleryDBHelper", "upgrade to 49");
                            upgradeTo49(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 50) {
                            Log.d("GalleryDBHelper", "upgrade to 50");
                            upgradeTo50(sQLiteDatabase2, z4);
                        }
                        if (this.mOldVersion < 51) {
                            Log.d("GalleryDBHelper", "upgrade to 51");
                            upgradeTo51(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion >= 52) {
                            Log.d("GalleryDBHelper", "upgrade to 52");
                            z12 = z9;
                            upgradeTo52(sQLiteDatabase, z5, z6, z11, z10);
                        } else {
                            z12 = z9;
                        }
                        if (this.mOldVersion < 53) {
                            Log.d("GalleryDBHelper", "upgrade to 53");
                            upgradeTo53(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 54) {
                            Log.d("GalleryDBHelper", "upgrade to 53");
                            upgradeTo54(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion >= 55) {
                            Log.d("GalleryDBHelper", "upgrade to 55");
                            upgradeTo55(sQLiteDatabase);
                            z13 = true;
                        } else {
                            z13 = false;
                        }
                        if (this.mOldVersion < 56) {
                            Log.d("GalleryDBHelper", "upgrade to 56");
                            upgradeTo56(sQLiteDatabase2, z4);
                        }
                        if (this.mOldVersion < 57) {
                            Log.d("GalleryDBHelper", "upgrade to 57");
                            createIndexOnFaceTable(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 58) {
                            upgradeTo58(sQLiteDatabase2, z13);
                        }
                        if (this.mOldVersion < 59) {
                            upgradeTo59(sQLiteDatabase);
                        }
                        boolean z15 = this.mOldVersion < 55 && this.mOldVersion <= 60;
                        if (this.mOldVersion < 61) {
                            upgradeTo61(z15);
                        }
                        if (this.mOldVersion < 62) {
                            upgradeTo62(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 63) {
                            Log.d("GalleryDBHelper", "upgrade to 63");
                            upgradeTo63(sQLiteDatabase2, z5, z13);
                        }
                        if (this.mOldVersion < 64) {
                            upgradeTo64(sQLiteDatabase2, z12, z8);
                        }
                        if (this.mOldVersion < 65) {
                            upgradeTo65(sQLiteDatabase2, z7);
                        }
                        if (this.mOldVersion < 66) {
                            upgradeTo66(sQLiteDatabase2, z7);
                        }
                        if (this.mOldVersion < 67) {
                            upgradeTo67(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 68) {
                            upgradeTo68(sQLiteDatabase2, z12);
                        }
                        if (this.mOldVersion < 69) {
                            upgradeTo69(sQLiteDatabase2, z5, z7);
                        }
                        if (this.mOldVersion < 70) {
                            upgradeTo70(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 71) {
                            upgradeTo71(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 72) {
                            upgradeTo72(sQLiteDatabase2, z13);
                        }
                        if (this.mOldVersion < 73) {
                            Log.d("GalleryDBHelper", "upgrade to 73");
                            upgradeTo73(sQLiteDatabase2, z5, z6, z7);
                        }
                        if (this.mOldVersion < 74) {
                            Log.d("GalleryDBHelper", "upgrade to 74");
                            upgradeTo74(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion < 75) {
                            Log.d("GalleryDBHelper", "upgrade to 75");
                            upgradeTo75(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion < 76) {
                            Log.d("GalleryDBHelper", "upgrade to 76");
                            upgradeTo76(sQLiteDatabase2, z13);
                        }
                        if (this.mOldVersion < 77) {
                            Log.d("GalleryDBHelper", "upgrade to 77");
                            upgradeTo77(sQLiteDatabase2, z5, z13);
                        }
                        if (this.mOldVersion < 78) {
                            Log.d("GalleryDBHelper", "upgrade to 78");
                            upgradeTo78(sQLiteDatabase2, z5, this.mOldVersion < 73);
                        }
                        if (this.mOldVersion < 79) {
                            Log.d("GalleryDBHelper", "upgrade to 79");
                            upgradeTo79(sQLiteDatabase2, z5, this.mOldVersion > 72);
                        }
                        if (this.mOldVersion < 80) {
                            Log.d("GalleryDBHelper", "upgrade to 80");
                            upgradeTo80(sQLiteDatabase2, this.mOldVersion < 73);
                        }
                        if (this.mOldVersion < 81) {
                            Log.d("GalleryDBHelper", "upgrade to 81");
                            upgradeTo81(sQLiteDatabase2, z13);
                        }
                        if (this.mOldVersion < 82) {
                            Log.d("GalleryDBHelper", "upgrade to 82");
                            upgradeTo82(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion < 83) {
                            Log.d("GalleryDBHelper", "upgrade to 83");
                            upgradeTo83(sQLiteDatabase2, this.mOldVersion > 73);
                        }
                        if (this.mOldVersion < 84 && this.mOldVersion > 72) {
                            Log.d("GalleryDBHelper", "upgrade to 84");
                            upgradeTo84(sQLiteDatabase2, z5, z7);
                        }
                        if (this.mOldVersion < 85) {
                            Log.d("GalleryDBHelper", "upgrade to 85");
                            upgradeTo85(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 86) {
                            Log.d("GalleryDBHelper", "upgrade to 86");
                            upgradeTo86(sQLiteDatabase2, z5, z6);
                        }
                        if (this.mOldVersion < 87) {
                            Log.d("GalleryDBHelper", "upgrade to 87");
                            upgradeTo87(sQLiteDatabase);
                        }
                        if (this.mOldVersion < 88) {
                            Log.d("GalleryDBHelper", "upgrade to 88");
                            upgradeTo88(sQLiteDatabase2, z13);
                        }
                        if (this.mOldVersion < 89 && this.mOldVersion > 72) {
                            Log.d("GalleryDBHelper", "upgrade to 89");
                            upgradeTo89(sQLiteDatabase2, z5);
                        }
                        if (this.mOldVersion >= 90) {
                            Log.d("GalleryDBHelper", "upgrade to 90");
                            upgradeTo90(sQLiteDatabase2, z5);
                            z14 = true;
                        } else {
                            z14 = false;
                        }
                        if (this.mOldVersion < 91) {
                            Log.d("GalleryDBHelper", "upgrade to 91");
                            upgradeTo91(sQLiteDatabase2, z5, z6);
                            z14 = true;
                        }
                        if (this.mOldVersion < 92) {
                            Log.d("GalleryDBHelper", "upgrade to 92");
                            upgradeTo92(sQLiteDatabase2, z13);
                            z14 = true;
                        }
                        if (z14) {
                            createViewIfNeeded(sQLiteDatabase2, true);
                        }
                    }
                }
                z5 = z3;
                z4 = z2;
                if (this.mOldVersion < 19) {
                }
                if (this.mOldVersion < 20) {
                }
                if (this.mOldVersion >= 21) {
                }
                if (this.mOldVersion >= 22) {
                }
                if (this.mOldVersion < 23) {
                }
                if (this.mOldVersion < 24) {
                }
                if (this.mOldVersion < 25) {
                }
                if (this.mOldVersion < 26) {
                }
                if (this.mOldVersion < 27) {
                }
                if (this.mOldVersion < 28) {
                }
                if (this.mOldVersion < 29) {
                }
                if (this.mOldVersion < 31) {
                }
                if (this.mOldVersion < 32) {
                }
                if (this.mOldVersion < 33) {
                }
                if (this.mOldVersion < 34) {
                }
                if (this.mOldVersion < 35) {
                }
                if (this.mOldVersion < 36) {
                }
                if (this.mOldVersion < 37) {
                }
                if (this.mOldVersion < 38) {
                }
                if (this.mOldVersion < 39) {
                }
                if (this.mOldVersion < 40) {
                }
                if (this.mOldVersion < 41) {
                }
                if (this.mOldVersion < 42) {
                }
                if (this.mOldVersion < 43) {
                }
                if (this.mOldVersion < 44) {
                }
                if (this.mOldVersion < 45) {
                }
                if (this.mOldVersion < 46) {
                }
                if (this.mOldVersion >= 47) {
                }
                if (this.mOldVersion < 48) {
                }
                if (this.mOldVersion < 49) {
                }
                if (this.mOldVersion < 50) {
                }
                if (this.mOldVersion < 51) {
                }
                if (this.mOldVersion >= 52) {
                }
                if (this.mOldVersion < 53) {
                }
                if (this.mOldVersion < 54) {
                }
                if (this.mOldVersion >= 55) {
                }
                if (this.mOldVersion < 56) {
                }
                if (this.mOldVersion < 57) {
                }
                if (this.mOldVersion < 58) {
                }
                if (this.mOldVersion < 59) {
                }
                if (this.mOldVersion < 55) {
                }
                if (this.mOldVersion < 61) {
                }
                if (this.mOldVersion < 62) {
                }
                if (this.mOldVersion < 63) {
                }
                if (this.mOldVersion < 64) {
                }
                if (this.mOldVersion < 65) {
                }
                if (this.mOldVersion < 66) {
                }
                if (this.mOldVersion < 67) {
                }
                if (this.mOldVersion < 68) {
                }
                if (this.mOldVersion < 69) {
                }
                if (this.mOldVersion < 70) {
                }
                if (this.mOldVersion < 71) {
                }
                if (this.mOldVersion < 72) {
                }
                if (this.mOldVersion < 73) {
                }
                if (this.mOldVersion < 74) {
                }
                if (this.mOldVersion < 75) {
                }
                if (this.mOldVersion < 76) {
                }
                if (this.mOldVersion < 77) {
                }
                if (this.mOldVersion < 78) {
                }
                if (this.mOldVersion < 79) {
                }
                if (this.mOldVersion < 80) {
                }
                if (this.mOldVersion < 81) {
                }
                if (this.mOldVersion < 82) {
                }
                if (this.mOldVersion < 83) {
                }
                Log.d("GalleryDBHelper", "upgrade to 84");
                upgradeTo84(sQLiteDatabase2, z5, z7);
                if (this.mOldVersion < 85) {
                }
                if (this.mOldVersion < 86) {
                }
                if (this.mOldVersion < 87) {
                }
                if (this.mOldVersion < 88) {
                }
                Log.d("GalleryDBHelper", "upgrade to 89");
                upgradeTo89(sQLiteDatabase2, z5);
                if (this.mOldVersion >= 90) {
                }
                if (this.mOldVersion < 91) {
                }
                if (this.mOldVersion < 92) {
                }
                if (z14) {
                }
            }
            clearColumnList();
            return;
        }
        throw new IllegalStateException("database cannot be downgraded");
    }

    public Cursor query(String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5, String str6) {
        return getReadableDatabase().query(str, strArr, str2, strArr2, str3, str4, str5, str6);
    }

    public Cursor query(boolean z, String str, String[] strArr, String str2, String[] strArr2, String str3, String str4, String str5, String str6) {
        return getReadableDatabase().query(z, str, strArr, str2, strArr2, str3, str4, str5, str6);
    }

    public int update(String str, ContentValues contentValues, String str2, String[] strArr) {
        return getWritableDatabase().update(str, contentValues, str2, strArr);
    }
}
