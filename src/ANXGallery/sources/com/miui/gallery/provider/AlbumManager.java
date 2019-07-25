package com.miui.gallery.provider;

import android.database.AbstractWindowedCursor;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.model.FaceAlbumCover;
import com.miui.gallery.preference.GalleryPreferences.Album;
import com.miui.gallery.preference.GalleryPreferences.HiddenAlbum;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.InternalContract.ShareImage;
import com.miui.gallery.provider.MediaSortDateHelper.SortDate;
import com.miui.gallery.ui.AIAlbumStatusHelper;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.face.FaceRegionRectF;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class AlbumManager {
    private static Map<Long, Long> ALBUM_ATTRIBUTES = null;
    private static List<Long> ALBUM_SYNC_ATTRIBUTES = null;
    private static final String SQL_ALBUM_BASIC;
    private static final String SQL_ALBUM_COUNT = ", count(_id) AS media_count";
    private static final String SQL_ALBUM_COVER_DEFAULT;
    private static final String SQL_ALBUM_COVER_FORMAT;
    private static final String SQL_ALBUM_COVER_PLACEHOLDER = ", -1 AS cover_id, NULL AS cover_path, NULL AS cover_sha1, 0 AS cover_sync_state, 0 AS cover_size, NULL AS latest_photo ";
    private static final String SQL_ALBUM_DEDUPLICATE_COUNT = ", count(DISTINCT sha1) AS media_count";
    private static String SQL_ALBUM_IMMUTABLE = "CASE WHEN localFile LIKE '/%%' THEN 1 ELSE 0 END AS immutable";
    private static String SQL_ALBUM_LOCAL_PATH = "localFile AS local_path";
    private static String SQL_ALBUM_NAME = "fileName AS name";
    private static String SQL_ALBUM_NOT_HIDDEN = "AND (attributes & 16 = 0)";
    private static String SQL_ALBUM_SORT_BY = "CASE WHEN sortBy IS NULL THEN CASE WHEN dateTaken >0 THEN 9223372036854775807 - dateTaken ELSE dateTaken END ELSE sortBy END AS sortBy";
    public static final String SQL_BABY_ALBUM_COVER;
    public static final String SQL_BABY_OTHER_SHARED_ALBUM_COVER;
    private static String SQL_EXCLUDE_BABY_ALBUM = "AND (babyInfoJson IS NULL)";
    private static String SQL_EXCLUDE_MEDIA_IN_BABY_ALBUM = "AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND babyInfoJson IS NULL )) ";
    private static final String SQL_RECENT_ALBUM_COVER;
    private static final String SQL_SHARE_ALBUM;
    private static final String SQL_SHARE_ALBUM_BASIC;
    private static final String SQL_SHARE_ALBUM_COUNT = ", count(_id) AS media_count";
    private static final String SQL_SHARE_ALBUM_COVER;
    private static String SQL_SHARE_ALBUM_NOT_HIDDEN = "AND (attributes & 16 = 0)";
    private static String SQL_SHARE_ALBUM_SORT_BY = "CASE WHEN sortBy IS NULL THEN CASE WHEN dateTaken >0 THEN 9223372036854775807 - dateTaken ELSE dateTaken END ELSE sortBy END AS sortBy";
    private static final String SQL_SHARE_DEDUPLICATE_ALBUM_COUNT = ", count(DISTINCT sha1) AS media_count";
    private static final String SQL_UNION_SHARE_ALBUM;

    static {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT _id AS _id, attributes AS attributes, ");
        sb.append(SQL_ALBUM_NAME);
        sb.append(", ");
        sb.append(SQL_ALBUM_LOCAL_PATH);
        sb.append(", ");
        sb.append("localFlag");
        sb.append(" AS ");
        sb.append("flag");
        sb.append(", ");
        sb.append("dateTaken");
        sb.append(" AS ");
        sb.append("top_time");
        sb.append(", ");
        sb.append("peopleId");
        sb.append(" AS ");
        sb.append("face_people_id");
        sb.append(", ");
        sb.append("babyInfoJson");
        sb.append(" AS ");
        sb.append("baby_info");
        sb.append(", ");
        sb.append("NULL AS ");
        sb.append("baby_sharer_info");
        sb.append(", ");
        sb.append("serverId");
        sb.append(" AS ");
        sb.append("serverId");
        sb.append(", ");
        sb.append("thumbnailInfo");
        sb.append(" AS ");
        sb.append("thumbnail_info");
        sb.append(", ");
        sb.append(SQL_ALBUM_SORT_BY);
        sb.append(", ");
        sb.append(SQL_ALBUM_IMMUTABLE);
        sb.append(" ");
        sb.append("FROM ");
        sb.append("cloud");
        sb.append(" ");
        sb.append("WHERE ");
        sb.append("(serverType=0)");
        sb.append(" ");
        sb.append("AND ");
        sb.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))");
        sb.append(" ");
        sb.append("%s ");
        sb.append("%s");
        SQL_ALBUM_BASIC = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append("SELECT 2147383647+_id AS _id, attributes AS attributes, sharealbum.fileName AS name, NULL AS local_path, localFlag AS flag, dateTaken AS top_time, peopleId AS face_people_id, babyInfoJson AS baby_info, sharerInfo AS baby_sharer_info, serverId AS serverId, NULL AS thumbnail_info, ");
        sb2.append(SQL_SHARE_ALBUM_SORT_BY);
        sb2.append(", ");
        sb2.append(0);
        sb2.append(" AS ");
        sb2.append("immutable");
        sb2.append(" ");
        sb2.append("FROM ");
        sb2.append("shareAlbum");
        sb2.append(" ");
        sb2.append("WHERE ");
        sb2.append("serverId");
        sb2.append(" IS NOT NULL ");
        sb2.append("%s");
        SQL_SHARE_ALBUM_BASIC = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append(", _id AS cover_id, (");
        sb3.append(Cloud.ALIAS_CLEAR_FIRST);
        sb3.append(") AS ");
        sb3.append("cover_path");
        sb3.append(", ");
        sb3.append("sha1");
        sb3.append(" AS ");
        sb3.append("cover_sha1");
        sb3.append(", ");
        sb3.append(" CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sb3.append(" AS ");
        sb3.append("cover_sync_state");
        sb3.append(", ");
        sb3.append("size");
        sb3.append(" AS ");
        sb3.append("cover_size");
        sb3.append(", ");
        sb3.append("max(CASE");
        sb3.append(" WHEN ");
        sb3.append("localGroupId");
        sb3.append(" IN ");
        sb3.append("(SELECT ");
        sb3.append("_id");
        sb3.append(" FROM ");
        sb3.append("cloud");
        sb3.append(" WHERE ");
        sb3.append("localFile");
        sb3.append(" COLLATE NOCASE IN (%s)");
        sb3.append(" AND ");
        sb3.append("(serverType=0)");
        sb3.append(")");
        sb3.append(" THEN ");
        sb3.append("dateModified");
        sb3.append(" ELSE (");
        sb3.append(" CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sb3.append(") END) ");
        sb3.append("AS latest_photo ");
        SQL_ALBUM_COVER_FORMAT = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        sb4.append(", _id AS cover_id, (");
        sb4.append(Cloud.ALIAS_CLEAR_FIRST);
        sb4.append(") AS ");
        sb4.append("cover_path");
        sb4.append(", ");
        sb4.append("sha1");
        sb4.append(" AS ");
        sb4.append("cover_sha1");
        sb4.append(", ");
        sb4.append(" CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sb4.append(" AS ");
        sb4.append("cover_sync_state");
        sb4.append(", ");
        sb4.append("size");
        sb4.append(" AS ");
        sb4.append("cover_size");
        sb4.append(", ");
        sb4.append("max(");
        sb4.append(" CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sb4.append(") AS latest_photo ");
        SQL_ALBUM_COVER_DEFAULT = sb4.toString();
        StringBuilder sb5 = new StringBuilder();
        sb5.append(", _id AS cover_id, (");
        sb5.append(Cloud.ALIAS_CLEAR_FIRST);
        sb5.append(") AS ");
        sb5.append("cover_path");
        sb5.append(", ");
        sb5.append("sha1");
        sb5.append(" AS ");
        sb5.append("cover_sha1");
        sb5.append(", ");
        sb5.append(" CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sb5.append(" AS ");
        sb5.append("cover_sync_state");
        sb5.append(", ");
        sb5.append("size");
        sb5.append(" AS ");
        sb5.append("cover_size");
        sb5.append(", ");
        sb5.append("max(");
        sb5.append("dateModified");
        sb5.append(") AS latest_photo ");
        SQL_RECENT_ALBUM_COVER = sb5.toString();
        StringBuilder sb6 = new StringBuilder();
        sb6.append(", 1073741823+_id AS cover_id, (");
        sb6.append(ShareImage.ALIAS_CLEAR_FIRST);
        sb6.append(") AS ");
        sb6.append("cover_path");
        sb6.append(", ");
        sb6.append("sha1");
        sb6.append(" AS ");
        sb6.append("cover_sha1");
        sb6.append(", ");
        sb6.append(" CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sb6.append(" AS ");
        sb6.append("cover_sync_state");
        sb6.append(", ");
        sb6.append("size");
        sb6.append(" AS ");
        sb6.append("cover_size");
        sb6.append(", ");
        sb6.append("max(");
        sb6.append(" CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sb6.append(") AS latest_photo ");
        SQL_SHARE_ALBUM_COVER = sb6.toString();
        StringBuilder sb7 = new StringBuilder();
        sb7.append("(SELECT * FROM (SELECT cloud.serverId as imageId");
        sb7.append(SQL_ALBUM_COVER_DEFAULT);
        sb7.append("FROM ");
        sb7.append("cloud");
        sb7.append(" ");
        sb7.append(" WHERE ");
        sb7.append("localGroupId");
        sb7.append(" = %s ))");
        SQL_BABY_ALBUM_COVER = sb7.toString();
        StringBuilder sb8 = new StringBuilder();
        sb8.append("(SELECT * FROM (SELECT serverId as imageId");
        sb8.append(SQL_ALBUM_COVER_DEFAULT);
        sb8.append("FROM ");
        sb8.append("shareImage");
        sb8.append(" ");
        sb8.append(" WHERE ");
        sb8.append("localGroupId");
        sb8.append(" = %s ))");
        SQL_BABY_OTHER_SHARED_ALBUM_COVER = sb8.toString();
        StringBuilder sb9 = new StringBuilder();
        sb9.append("SELECT * FROM (");
        sb9.append(SQL_SHARE_ALBUM_BASIC);
        sb9.append(")");
        sb9.append(" LEFT JOIN ");
        sb9.append("(SELECT ");
        sb9.append(2147383647);
        sb9.append("+");
        sb9.append("localGroupId");
        sb9.append(" AS ");
        sb9.append("_id");
        sb9.append("%s");
        sb9.append(SQL_SHARE_ALBUM_COVER);
        sb9.append(", 0 AS size ");
        sb9.append("FROM ");
        sb9.append("shareImage");
        sb9.append(" ");
        sb9.append("WHERE ");
        sb9.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))");
        sb9.append(" ");
        sb9.append("%s");
        sb9.append("GROUP BY ");
        sb9.append("localGroupId");
        sb9.append(") USING (");
        sb9.append("_id");
        sb9.append(")");
        SQL_SHARE_ALBUM = sb9.toString();
        StringBuilder sb10 = new StringBuilder();
        sb10.append(" UNION ");
        sb10.append(SQL_SHARE_ALBUM);
        SQL_UNION_SHARE_ALBUM = sb10.toString();
        HashMap hashMap = new HashMap();
        hashMap.put(Long.valueOf(1), Long.valueOf(2));
        hashMap.put(Long.valueOf(4), Long.valueOf(8));
        hashMap.put(Long.valueOf(16), Long.valueOf(32));
        hashMap.put(Long.valueOf(64), Long.valueOf(128));
        ALBUM_ATTRIBUTES = Collections.unmodifiableMap(hashMap);
        ArrayList arrayList = new ArrayList();
        arrayList.add(Long.valueOf(1));
        arrayList.add(Long.valueOf(4));
        arrayList.add(Long.valueOf(16));
        arrayList.add(Long.valueOf(64));
        ALBUM_SYNC_ATTRIBUTES = Collections.unmodifiableList(arrayList);
    }

    private static String genPlaceholderAlbumSelection(long j, String str, long j2, long j3, long j4) {
        return String.format(Locale.US, " UNION SELECT %d AS _id, 0 AS attributes, '%s' AS name, NULL AS local_path, 0 AS flag, %d AS top_time, NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '%d' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable , 2147483647 AS media_count, -1 AS cover_id, NULL AS cover_path, NULL AS cover_sha1, 0 AS cover_sync_state, 0 AS cover_size, NULL AS latest_photo , 0 AS size ", new Object[]{Long.valueOf(j), str, Long.valueOf(j2), Long.valueOf(j3), Long.valueOf(j4)});
    }

    private static Bundle generateFaceAlbumCover(SQLiteDatabase sQLiteDatabase) {
        Cursor rawQuery = sQLiteDatabase.rawQuery(FaceManager.buildTopFaceCoverQuery(), null);
        if (rawQuery == null) {
            return null;
        }
        try {
            ArrayList arrayList = new ArrayList();
            int columnIndex = rawQuery.getColumnIndex("cover_id");
            int columnIndex2 = rawQuery.getColumnIndex("cover_path");
            int columnIndex3 = rawQuery.getColumnIndex("cover_sha1");
            int columnIndex4 = rawQuery.getColumnIndex("cover_sync_state");
            int columnIndex5 = rawQuery.getColumnIndex("cover_size");
            int columnIndex6 = rawQuery.getColumnIndex("faceRect");
            while (rawQuery.moveToNext()) {
                FaceAlbumCover faceAlbumCover = new FaceAlbumCover();
                faceAlbumCover.coverId = rawQuery.getLong(columnIndex);
                faceAlbumCover.coverPath = rawQuery.getString(columnIndex2);
                faceAlbumCover.coverSha1 = rawQuery.getString(columnIndex3);
                faceAlbumCover.coverSyncState = rawQuery.getInt(columnIndex4);
                faceAlbumCover.coverSize = rawQuery.getLong(columnIndex5);
                faceAlbumCover.faceRectF = FaceRegionRectF.resolveFrom(rawQuery.getString(columnIndex6));
                if (faceAlbumCover.faceRectF != null) {
                    arrayList.add(faceAlbumCover);
                }
                if (arrayList.size() == 4) {
                    break;
                }
            }
            Bundle bundle = new Bundle();
            bundle.putParcelableArrayList("face_album_cover", arrayList);
            bundle.putInt("face_album_count", rawQuery.getCount());
            return bundle;
        } finally {
            rawQuery.close();
        }
    }

    public static Map<Long, Long> getAlbumAttributes() {
        return ALBUM_ATTRIBUTES;
    }

    private static String getAlbumBasicColumns(boolean z, boolean z2) {
        String str = SQL_ALBUM_BASIC;
        Object[] objArr = new Object[2];
        objArr[0] = z ? SQL_ALBUM_NOT_HIDDEN : "";
        objArr[1] = z2 ? SQL_EXCLUDE_BABY_ALBUM : "";
        return String.format(str, objArr);
    }

    public static List<Long> getAlbumSyncAttributes() {
        return ALBUM_SYNC_ATTRIBUTES;
    }

    private static String getExcludeEmptyAlbumSelection(boolean z) {
        String str;
        StringBuilder sb = new StringBuilder();
        sb.append("(media_count >0 ");
        if (z) {
            str = "";
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(" OR (");
            sb2.append(Cloud.ALIAS_USER_CREATE_ALBUM);
            sb2.append(")");
            str = sb2.toString();
        }
        sb.append(str);
        sb.append(" OR ");
        sb.append("_id");
        sb.append("=");
        sb.append(2147483646);
        sb.append(")");
        return sb.toString();
    }

    private static String getExcludeEmptyRecentAlbumSelection() {
        return "(media_count > 0 OR _id!=2147483644)";
    }

    private static String getExcludeHiddenAlbumSelection(boolean z) {
        return z ? " AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND attributes&16=0)) " : "";
    }

    private static String getExcludeHiddenShareAlbumSelection(boolean z) {
        return z ? SQL_SHARE_ALBUM_NOT_HIDDEN : "";
    }

    private static String getExcludeMediaInBabyAlbumSelection(boolean z) {
        return z ? SQL_EXCLUDE_MEDIA_IN_BABY_ALBUM : "";
    }

    private static String getExcludeNonLocalSelection(int i, boolean z) {
        String str;
        String str2;
        switch (i) {
            case 1:
                str = Cloud.ALIAS_LOCAL_IMAGE;
                break;
            case 2:
                str = Cloud.ALIAS_LOCAL_VIDEO;
                break;
            default:
                return getExcludeNonLocalSelection(z);
        }
        if (z) {
            str2 = String.format(" AND %s ", new Object[]{str});
        } else {
            str2 = "";
        }
        return str2;
    }

    private static String getExcludeNonLocalSelection(boolean z) {
        if (!z) {
            return "";
        }
        return String.format(" AND %s ", new Object[]{Cloud.ALIAS_LOCAL_MEDIA});
    }

    private static String getFaceAlbumColumns() {
        return String.format(Locale.US, " UNION SELECT 2147483646 AS _id, 0 AS attributes, 'FACE' AS name, NULL AS local_path, 0 AS flag, -997 AS top_time,NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '-2147483646' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable, COUNT(*) AS media_count, 0 AS size , -1 AS cover_id, NULL AS cover_path, NULL AS cover_sha1, 0 AS cover_sync_state, 0 AS cover_size, NULL AS latest_photo FROM peopleFace WHERE ((localFlag=5 OR (localFlag=0 AND serverStatus='normal')) AND type = 'FACE')", new Object[]{Long.valueOf(Album.getVirtualAlbumSortBy(2147483646, -997))});
    }

    private static String getFavoritesAlbumColumns(String str, boolean z, boolean z2, Integer num, boolean z3) {
        long virtualAlbumSortBy = Album.getVirtualAlbumSortBy(2147483642, -1000);
        if (z3) {
            return genPlaceholderAlbumSelection(2147483642, "FAVORITES", -1000, -2147483642, virtualAlbumSortBy);
        }
        return String.format(Locale.US, " UNION SELECT 2147483642 AS _id, 0 AS attributes, 'FAVORITES' AS name, NULL AS local_path, 0 AS flag, -1000 AS top_time, NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '-2147483642' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable %s %s %sFROM extended_cloud WHERE (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (localGroupId!=-1000) AND (serverType IN (1,2) AND isFavorite NOT NULL AND isFavorite > 0) %s%s%s%s", new Object[]{Long.valueOf(virtualAlbumSortBy), ", count(DISTINCT sha1) AS media_count", str, ", 0 AS size ", getMediaTypeSelection(num), getExcludeNonLocalSelection(z2), getExcludeHiddenAlbumSelection(z), getExcludeMediaInBabyAlbumSelection(z2)});
    }

    private static String getMediaTypeSelection(Integer num) {
        if (num == null || (num.intValue() != 2 && num.intValue() != 1)) {
            return "";
        }
        return String.format(Locale.US, " AND %s = %s ", new Object[]{"serverType", num.toString()});
    }

    private static String getPanoAlbumColumns(String str, boolean z, boolean z2, boolean z3) {
        long virtualAlbumSortBy = Album.getVirtualAlbumSortBy(2147483645, -994);
        if (z3) {
            return genPlaceholderAlbumSelection(2147483645, "PANO", -994, -2147483645, virtualAlbumSortBy);
        }
        boolean z4 = z2;
        return String.format(Locale.US, " UNION SELECT 2147483645 AS _id, 0 AS attributes, 'PANO' AS name, NULL AS local_path, 0 AS flag, -994 AS top_time, NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '-2147483645' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable %s %s %sFROM (SELECT * FROM cloud ORDER BY mixedDateTime DESC,dateModified DESC,_id DESC ) cloud WHERE (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (exifImageWidth > 1080 AND exifImageLength > 0 AND exifImageWidth- 3 * exifImageLength > 0 AND title LIKE 'PANO%%') AND (localGroupId!=-1000)%s%s", new Object[]{Long.valueOf(virtualAlbumSortBy), ", count(DISTINCT sha1) AS media_count", str, ", 0 AS size ", getExcludeNonLocalSelection(1, z2), getExcludeHiddenAlbumSelection(z)});
    }

    private static String getRecentAlbumColumns(boolean z, boolean z2, boolean z3, Integer num, boolean z4, boolean z5) {
        long virtualAlbumSortBy = Album.getVirtualAlbumSortBy(2147483644, -1001);
        if (z5) {
            return genPlaceholderAlbumSelection(2147483644, "RECENT", -1001, -2147483644, virtualAlbumSortBy);
        }
        Locale locale = Locale.US;
        String str = " UNION SELECT 2147483644 AS _id, 0 AS attributes, 'RECENT' AS name, NULL AS local_path, 0 AS flag, -1001 AS top_time, NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '-2147483644' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable %s %s %sFROM (SELECT mediaId AS _id, sha1, localFlag, dateModified, serverStatus, localGroupId, thumbnailFile, microthumbfile, localFile, serverType, size, babyInfoJson FROM (recentDiscoveredMedia JOIN (SELECT * FROM cloud ORDER BY mixedDateTime DESC,dateModified DESC,_id DESC ) cloud ON cloud._id = mediaId) WHERE ( CASE WHEN DATE(dateModified/1000, 'unixepoch', 'localtime') == DATE('now', 'localtime') THEN 0 ELSE CAST(JULIANDAY('now', 'localtime', 'start of day') - JULIANDAY(dateModified/1000, 'unixepoch', 'localtime') AS int) + 1 END < 30)) WHERE (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (localGroupId!=-1000)%s%s%s%s";
        Object[] objArr = new Object[8];
        objArr[0] = Long.valueOf(virtualAlbumSortBy);
        objArr[1] = z3 ? SQL_ALBUM_DEDUPLICATE_COUNT : SQL_ALBUM_COUNT;
        objArr[2] = z4 ? SQL_RECENT_ALBUM_COVER : SQL_ALBUM_COVER_PLACEHOLDER;
        objArr[3] = ", 0 AS size ";
        objArr[4] = getMediaTypeSelection(num);
        objArr[5] = getExcludeNonLocalSelection(z2);
        objArr[6] = getExcludeHiddenAlbumSelection(z);
        objArr[7] = getExcludeMediaInBabyAlbumSelection(z2);
        return String.format(locale, str, objArr);
    }

    private static String getShareAlbumBasicColumns(boolean z, boolean z2, Integer num) {
        String str = SQL_UNION_SHARE_ALBUM;
        Object[] objArr = new Object[3];
        objArr[0] = getExcludeHiddenShareAlbumSelection(z);
        objArr[1] = z2 ? SQL_SHARE_DEDUPLICATE_ALBUM_COUNT : SQL_SHARE_ALBUM_COUNT;
        objArr[2] = getMediaTypeSelection(num);
        return String.format(str, objArr);
    }

    private static String getVideoAlbumColumns(String str, boolean z, boolean z2, boolean z3) {
        long virtualAlbumSortBy = Album.getVirtualAlbumSortBy(2147483647L, -998);
        if (z3) {
            return genPlaceholderAlbumSelection(2147483647L, "VIDEO", -998, -2147483647L, virtualAlbumSortBy);
        }
        boolean z4 = z2;
        return String.format(Locale.US, " UNION SELECT 2147483647 AS _id, 0 AS attributes, 'VIDEO' AS name, NULL AS local_path, 0 AS flag, -998 AS top_time, NULL AS face_people_id, NULL AS baby_info, NULL AS baby_sharer_info, '-2147483647' AS serverId, NULL AS thumbnail_info, %d AS sortBy, 0 AS immutable %s %s %sFROM (SELECT * FROM cloud ORDER BY mixedDateTime DESC,dateModified DESC,_id DESC ) cloud WHERE serverType=2 AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) AND (localGroupId!=-1000)%s%s", new Object[]{Long.valueOf(virtualAlbumSortBy), ", count(DISTINCT sha1) AS media_count", str, ", 0 AS size ", getExcludeNonLocalSelection(2, z2), getExcludeHiddenAlbumSelection(z)});
    }

    private static boolean isInLocalMode() {
        return LocalMode.isOnlyShowLocalPhoto();
    }

    private static boolean isInShowHiddenMode() {
        return HiddenAlbum.isShowHiddenAlbum();
    }

    private static boolean isIncludeFaceAlbum(boolean z) {
        return AIAlbumStatusHelper.isFaceAlbumEnabled() && !z;
    }

    private static boolean isQueryColumn(String[] strArr, String str) {
        if (strArr != null && strArr.length > 0) {
            if ("*".equals(strArr[0].trim())) {
                return true;
            }
            for (String trim : strArr) {
                if (str.equals(trim.trim())) {
                    return true;
                }
            }
        }
        return false;
    }

    public static boolean isVirtualAlbum(long j) {
        for (int i : GalleryContract.Album.ALL_VIRTUAL_ALBUM_IDS) {
            if (((long) i) == j) {
                return true;
            }
        }
        return false;
    }

    public static long packageAttributeBit(long j, boolean z, boolean z2) {
        long longValue = ((Long) ALBUM_ATTRIBUTES.get(Long.valueOf(j))).longValue();
        if (!z) {
            j = 0;
        }
        if (!z2) {
            longValue = 0;
        }
        return j | longValue;
    }

    public static Cursor query(SQLiteDatabase sQLiteDatabase, String[] strArr, String str, String[] strArr2, String str2, boolean z, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6, boolean z7, boolean z8, boolean z9, Integer num, boolean z10, boolean z11, String str3) {
        String str4;
        String str5;
        String str6;
        String str7;
        String str8;
        String str9 = str;
        boolean z12 = z9;
        Integer num2 = num;
        boolean z13 = z11;
        boolean z14 = !z8 && !isInShowHiddenMode();
        boolean z15 = !z8 && isInLocalMode();
        String str10 = "";
        String str11 = "";
        String str12 = "";
        String str13 = "";
        String str14 = "";
        String str15 = "";
        if (z10) {
            List albumPathsBySortDate = MediaSortDateHelper.getSortDateProvider().getAlbumPathsBySortDate(SortDate.MODIFY_TIME);
            if (MiscUtil.isValid(albumPathsBySortDate)) {
                Locale locale = Locale.US;
                str7 = str10;
                String str16 = SQL_ALBUM_COVER_FORMAT;
                str6 = str11;
                str5 = str12;
                StringBuilder sb = new StringBuilder();
                str4 = str13;
                sb.append("'");
                sb.append(TextUtils.join("', '", albumPathsBySortDate));
                sb.append("'");
                str8 = String.format(locale, str16, new Object[]{sb.toString()});
            } else {
                str7 = str10;
                str6 = str11;
                str5 = str12;
                str4 = str13;
                str8 = SQL_ALBUM_COVER_DEFAULT;
            }
        } else {
            str7 = str10;
            str6 = str11;
            str5 = str12;
            str4 = str13;
            str8 = SQL_ALBUM_COVER_PLACEHOLDER;
        }
        String str17 = str8;
        if (z2 && ((num2 == null || num.intValue() == 1) && isIncludeFaceAlbum(z15))) {
            str7 = getFaceAlbumColumns();
        }
        if (z && (num2 == null || num.intValue() == 2)) {
            str6 = getVideoAlbumColumns(str17, z14, z15, z13);
        }
        if (z3 && !z15) {
            str5 = getShareAlbumBasicColumns(z14, z12, num2);
        }
        if (z4 && (num2 == null || num.intValue() == 1)) {
            str4 = getPanoAlbumColumns(str17, z14, z15, z13);
        }
        if (z5) {
            str14 = getRecentAlbumColumns(z14, z15, z9, num, z10, z11);
        }
        if (z6) {
            str15 = getFavoritesAlbumColumns(str17, z14, z15, num2, z13);
        }
        String albumBasicColumns = getAlbumBasicColumns(z14, z15);
        String str18 = isQueryColumn(strArr, "size") ? ", sum(size) AS size " : ", 0 AS size ";
        String str19 = "(SELECT * FROM (%s) LEFT JOIN (SELECT localGroupId AS _id%s%s%sFROM (SELECT * FROM cloud ORDER BY mixedDateTime DESC,dateModified DESC,_id DESC ) cloud WHERE (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom')) %s%sGROUP BY localGroupId) USING (_id)%s %s %s %s %s %s)";
        Object[] objArr = new Object[12];
        objArr[0] = albumBasicColumns;
        objArr[1] = z12 ? SQL_ALBUM_DEDUPLICATE_COUNT : SQL_ALBUM_COUNT;
        objArr[2] = str17;
        objArr[3] = str18;
        objArr[4] = getMediaTypeSelection(num);
        objArr[5] = getExcludeNonLocalSelection(z15);
        objArr[6] = str5;
        objArr[7] = str6;
        objArr[8] = str4;
        objArr[9] = str14;
        objArr[10] = str15;
        objArr[11] = str7;
        String format = String.format(str19, objArr);
        if (z7) {
            if (TextUtils.isEmpty(str)) {
                str9 = getExcludeEmptyAlbumSelection(z15);
            } else {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(getExcludeEmptyAlbumSelection(z15));
                sb2.append(" AND (");
                sb2.append(str9);
                sb2.append(")");
                str9 = sb2.toString();
            }
        } else if (!z8 && z5) {
            if (TextUtils.isEmpty(str)) {
                str9 = getExcludeEmptyRecentAlbumSelection();
            } else {
                StringBuilder sb3 = new StringBuilder();
                sb3.append(getExcludeEmptyRecentAlbumSelection());
                sb3.append(" AND (");
                sb3.append(str9);
                sb3.append(")");
                str9 = sb3.toString();
            }
        }
        return sQLiteDatabase.query(format, strArr, str9, strArr2, null, null, str2, str3);
    }

    public static Cursor queryFaceAlbumCover(SQLiteDatabase sQLiteDatabase) {
        AnonymousClass1 r0 = new AbstractWindowedCursor() {
            public String[] getColumnNames() {
                return new String[0];
            }

            public int getCount() {
                return 0;
            }
        };
        if (isIncludeFaceAlbum(false)) {
            r0.setExtras(generateFaceAlbumCover(sQLiteDatabase));
        }
        return r0;
    }
}
