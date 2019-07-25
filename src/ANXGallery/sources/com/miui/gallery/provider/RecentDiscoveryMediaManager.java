package com.miui.gallery.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.AbstractWindowedCursor;
import android.database.Cursor;
import android.database.MatrixCursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.gallery.cloudcontrol.CloudControlStrategyHelper;
import com.miui.gallery.discovery.DiscoveryMessageManager;
import com.miui.gallery.discovery.RecentDiscoveryMessageOperator.RecentSaveParams;
import com.miui.gallery.model.BaseAlbumCover;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.preference.GalleryPreferences.HiddenAlbum;
import com.miui.gallery.preference.GalleryPreferences.LocalMode;
import com.miui.gallery.provider.InternalContract.Cloud;
import com.miui.gallery.provider.InternalContract.RecentDiscoveredMedia;
import com.miui.gallery.util.FileUtils;
import com.miui.gallery.util.GalleryDateUtils;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.gallery.util.StorageUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Pattern;
import miui.date.DateUtils;

public class RecentDiscoveryMediaManager {
    private static final String ALIAS_MICRO_VALID = String.format(Locale.US, "(%s NOT NULL and %s != '')", new Object[]{"microthumbfile", "microthumbfile"});
    private static final String ALIAS_THUMBNAIL_VALID = String.format(Locale.US, "(%s NOT NULL and %s != '')", new Object[]{"thumbnailFile", "thumbnailFile"});
    private static final String COVER_ALIAS_DISPLAYABLE;
    private static final String SQL_ALBUM_COVER;
    private static final String SQL_INCLUDE_LOCAL;
    private static Map<String, String> sRecentDiscoveryMediaMap = new HashMap();

    private static class Group {
        public long albumId;
        public List<Integer> cursorPosList = new ArrayList();
        public long endDate;
        public int julianday;
        public long startDate;

        public Group(long j, int i, long j2, int i2) {
            this.albumId = j2;
            this.startDate = j;
            this.endDate = j;
            this.julianday = i;
            this.cursorPosList.add(Integer.valueOf(i2));
        }
    }

    public static class RecentMediaEntry {
        /* access modifiers changed from: private */
        public final long mAlbumId;
        private final long mDateModified;
        private final long mMediaId;
        private final String mThumbPath;

        public RecentMediaEntry(long j, long j2, String str, long j3) {
            this.mAlbumId = j;
            this.mMediaId = j2;
            this.mThumbPath = str;
            this.mDateModified = j3;
        }

        public long getDateModified() {
            return this.mDateModified;
        }

        public long getMediaId() {
            return this.mMediaId;
        }

        public String getThumbPath() {
            return this.mThumbPath;
        }
    }

    static {
        sRecentDiscoveryMediaMap.put("_id", "mediaId");
        sRecentDiscoveryMediaMap.put("sha1", "sha1");
        sRecentDiscoveryMediaMap.put("localGroupId", "localGroupId");
        sRecentDiscoveryMediaMap.put("microthumbfile", "microthumbfile");
        sRecentDiscoveryMediaMap.put("thumbnailFile", "thumbnailFile");
        sRecentDiscoveryMediaMap.put("localFile", "localFile");
        sRecentDiscoveryMediaMap.put("serverType", "serverType");
        sRecentDiscoveryMediaMap.put("title", "title");
        sRecentDiscoveryMediaMap.put("duration", "duration");
        sRecentDiscoveryMediaMap.put("description", "description");
        sRecentDiscoveryMediaMap.put("size", "size");
        sRecentDiscoveryMediaMap.put("mimeType", "mimeType");
        sRecentDiscoveryMediaMap.put("location", "location");
        sRecentDiscoveryMediaMap.put("exifGPSLatitude", "exifGPSLatitude");
        sRecentDiscoveryMediaMap.put("exifGPSLatitudeRef", "exifGPSLatitudeRef");
        sRecentDiscoveryMediaMap.put("exifGPSLongitude", "exifGPSLongitude");
        sRecentDiscoveryMediaMap.put("exifGPSLongitudeRef", "exifGPSLongitudeRef");
        sRecentDiscoveryMediaMap.put("alias_micro_thumbnail", RecentDiscoveredMedia.ALIAS_MICRO_THUMBNAIL);
        sRecentDiscoveryMediaMap.put("alias_create_time", " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sRecentDiscoveryMediaMap.put("alias_create_date", "STRFTIME('%Y%m%d', CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END /1000, 'unixepoch', 'localtime')");
        sRecentDiscoveryMediaMap.put("alias_sync_state", " CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sRecentDiscoveryMediaMap.put("secretKey", "secretKey");
        sRecentDiscoveryMediaMap.put("exifImageWidth", "exifImageWidth");
        sRecentDiscoveryMediaMap.put("exifImageLength", "exifImageLength");
        sRecentDiscoveryMediaMap.put("serverId", "serverId");
        sRecentDiscoveryMediaMap.put("serverTag", "serverTag");
        sRecentDiscoveryMediaMap.put("creatorId", "creatorId");
        sRecentDiscoveryMediaMap.put("dateAdded", "dateAdded");
        sRecentDiscoveryMediaMap.put("alias_julianday", "CAST(JULIANDAY(dateModified/1000, 'unixepoch', 'localtime', 'start of day') AS int)");
        sRecentDiscoveryMediaMap.put("dateModified", "dateModified");
        sRecentDiscoveryMediaMap.put("babyInfoJson", "babyInfoJson");
        sRecentDiscoveryMediaMap.put("alias_clear_thumbnail", RecentDiscoveredMedia.ALIAS_CLEAR_THUMBNAIL);
        sRecentDiscoveryMediaMap.put("alias_is_favorite", "isFavorite");
        sRecentDiscoveryMediaMap.put("specialTypeFlags", "specialTypeFlags");
        sRecentDiscoveryMediaMap.put("alias_sort_time", "dateModified");
        sRecentDiscoveryMediaMap.put("exifOrientation", "exifOrientation");
        sRecentDiscoveryMediaMap.put("burst_group_id", MovieStatUtils.DOWNLOAD_SUCCESS);
        StringBuilder sb = new StringBuilder();
        sb.append(" AND ");
        sb.append(Cloud.ALIAS_LOCAL_MEDIA);
        sb.append(" ");
        SQL_INCLUDE_LOCAL = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        sb2.append(" CASE WHEN ");
        sb2.append(ALIAS_MICRO_VALID);
        sb2.append(" THEN ");
        sb2.append("microthumbfile");
        sb2.append(" ");
        sb2.append("WHEN ");
        sb2.append(ALIAS_THUMBNAIL_VALID);
        sb2.append(" THEN ");
        sb2.append("thumbnailFile");
        sb2.append(" ");
        sb2.append("ELSE ");
        sb2.append("localFile");
        sb2.append(" ");
        sb2.append("END ");
        COVER_ALIAS_DISPLAYABLE = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        sb3.append("_id AS cover_id, ");
        sb3.append(COVER_ALIAS_DISPLAYABLE);
        sb3.append(" AS ");
        sb3.append("cover_path");
        sb3.append(", ");
        sb3.append("sha1");
        sb3.append(" AS ");
        sb3.append("cover_sha1");
        sb3.append(", ");
        sb3.append("alias_sync_state");
        sb3.append(" AS ");
        sb3.append("cover_sync_state");
        sb3.append(", ");
        sb3.append("size");
        sb3.append(" AS ");
        sb3.append("cover_size");
        SQL_ALBUM_COVER = sb3.toString();
    }

    private static void addOneRowToMatrixCursor(Cursor cursor, MatrixCursor matrixCursor, String[] strArr) {
        int length = strArr.length;
        Object[] objArr = new Object[length];
        for (int i = 0; i < length; i++) {
            switch (cursor.getType(i)) {
                case 0:
                    objArr[i] = null;
                    break;
                case 1:
                    objArr[i] = Long.valueOf(cursor.getLong(i));
                    break;
                case 2:
                    objArr[i] = Double.valueOf(cursor.getDouble(i));
                    break;
                case 3:
                    objArr[i] = cursor.getString(i);
                    break;
                case 4:
                    objArr[i] = cursor.getBlob(i);
                    break;
            }
        }
        matrixCursor.addRow(objArr);
    }

    public static void cleanupInvalidRecords() {
        try {
            GalleryDBHelper.getInstance().getWritableDatabase().execSQL("DELETE FROM recentDiscoveredMedia WHERE mediaId IN  (SELECT mediaId FROM (SELECT mediaId, cloud._id AS _id, localFlag, serverStatus FROM (recentDiscoveredMedia LEFT OUTER JOIN cloud ON cloud._id = mediaId)) WHERE (localFlag IN (11, -1, 2) OR (localFlag=0 AND serverStatus<>'custom')) OR (_id IS NULL))");
        } catch (SQLException e) {
            Log.e("RecentDiscoveryMediaManager", "Something wrong happened when cleanup recent table: %s", (Object) e.getMessage());
            e.printStackTrace();
        }
    }

    private static void doInsertToRecent(Context context, boolean z, RecentMediaEntry... recentMediaEntryArr) {
        if (context != null && recentMediaEntryArr != null && recentMediaEntryArr.length > 0) {
            HashMap hashMap = new HashMap();
            for (RecentMediaEntry recentMediaEntry : recentMediaEntryArr) {
                if (recentMediaEntry.mAlbumId != -1000) {
                    String relativePath = StorageUtils.getRelativePath(context, FileUtils.getParentFolderPath(recentMediaEntry.getThumbPath()));
                    if (TextUtils.isEmpty(relativePath)) {
                        Log.w("RecentDiscoveryMediaManager", "Could't get album path for %s", recentMediaEntry.getThumbPath());
                        return;
                    }
                    List list = (List) hashMap.get(relativePath);
                    if (list == null) {
                        list = new LinkedList();
                        hashMap.put(relativePath, list);
                    }
                    list.add(recentMediaEntry);
                }
            }
            LinkedList linkedList = new LinkedList();
            LinkedList linkedList2 = new LinkedList();
            for (Entry entry : hashMap.entrySet()) {
                boolean equalsIgnoreCase = "DCIM/Camera".equalsIgnoreCase((String) entry.getKey());
                if (!z || (!equalsIgnoreCase && isAlbumInWhiteList((String) entry.getKey()))) {
                    List<RecentMediaEntry> list2 = (List) entry.getValue();
                    if (MiscUtil.isValid(list2)) {
                        linkedList.addAll(list2);
                        if (linkedList2.size() < 3 && isMediaCanShowInMessage(((RecentMediaEntry) list2.get(0)).mAlbumId)) {
                            for (RecentMediaEntry recentMediaEntry2 : list2) {
                                if (GalleryDateUtils.daysBeforeToday(recentMediaEntry2.getDateModified()) < 30) {
                                    linkedList2.add(recentMediaEntry2.getThumbPath());
                                    if (linkedList2.size() >= 3) {
                                        break;
                                    }
                                }
                            }
                        }
                    }
                } else if (!equalsIgnoreCase) {
                    recordNotInWhiteListAlbum((String) entry.getKey());
                }
            }
            int size = linkedList.size();
            if (size != 0) {
                ContentValues[] contentValuesArr = new ContentValues[size];
                for (int i = 0; i < size; i++) {
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("mediaId", Long.valueOf(((RecentMediaEntry) linkedList.get(i)).getMediaId()));
                    contentValues.put("dateAdded", Long.valueOf(System.currentTimeMillis()));
                    contentValues.put("source", Integer.valueOf(0));
                    contentValuesArr[i] = contentValues;
                }
                context.getContentResolver().bulkInsert(GalleryContract.RecentDiscoveredMedia.URI, contentValuesArr);
                if (linkedList2.size() > 0) {
                    DiscoveryMessageManager.getInstance().saveMessage(context, 1, new RecentSaveParams(linkedList2.size(), linkedList2));
                }
            }
        }
    }

    private static Bundle generateAlbumCover(SQLiteDatabase sQLiteDatabase, int i, boolean z) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append(SQL_ALBUM_COVER);
        sb.append(" FROM ");
        sb.append(getRecentDiscoveryTable(z));
        sb.append(" ORDER BY ");
        sb.append("dateModified");
        sb.append(" DESC ");
        Cursor rawQuery = sQLiteDatabase.rawQuery(sb.toString(), null);
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
            while (rawQuery.moveToNext()) {
                BaseAlbumCover baseAlbumCover = new BaseAlbumCover();
                baseAlbumCover.coverId = rawQuery.getLong(columnIndex);
                baseAlbumCover.coverPath = rawQuery.getString(columnIndex2);
                baseAlbumCover.coverSha1 = rawQuery.getString(columnIndex3);
                baseAlbumCover.coverSyncState = rawQuery.getInt(columnIndex4);
                baseAlbumCover.coverSize = rawQuery.getLong(columnIndex5);
                arrayList.add(baseAlbumCover);
                if (arrayList.size() >= i) {
                    break;
                }
            }
            Bundle bundle = new Bundle();
            bundle.putParcelableArrayList("album_covers", arrayList);
            bundle.putInt("album_photo_count", rawQuery.getCount());
            return bundle;
        } finally {
            rawQuery.close();
        }
    }

    private static long getAlbumId(Cursor cursor) {
        return cursor.getLong(cursor.getColumnIndex("localGroupId"));
    }

    private static long getDateModified(Cursor cursor) {
        return cursor.getLong(cursor.getColumnIndex("dateModified"));
    }

    private static long getDateModified(Cursor cursor, int i) {
        if (moveCursorToPosition(cursor, i)) {
            return cursor.getLong(cursor.getColumnIndex("dateModified"));
        }
        return 0;
    }

    private static String getDaysWithinSelection(int i) {
        return String.format(Locale.US, " AND ( CASE WHEN DATE(dateModified/1000, 'unixepoch', 'localtime') == DATE('now', 'localtime') THEN 0 ELSE CAST(JULIANDAY('now', 'localtime', 'start of day') - JULIANDAY(dateModified/1000, 'unixepoch', 'localtime') AS int) + 1 END < %d)", new Object[]{Integer.valueOf(i)});
    }

    private static String getExcludeBabyAlbumSelection() {
        return isInLocalMode() ? "AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND babyInfoJson IS NULL )) " : "";
    }

    private static String getExcludeHiddenAlbumSelection() {
        return isInShowHiddenMode() ? "" : " AND (localGroupId in (SELECT _id FROM cloud WHERE serverType=0 AND attributes&16=0)) ";
    }

    private static String getIncludeLocalSelection() {
        return isInLocalMode() ? SQL_INCLUDE_LOCAL : "";
    }

    private static int getJulianday(Cursor cursor) {
        return cursor.getInt(cursor.getColumnIndex("alias_julianday"));
    }

    private static String getNotInHiddenAlbumSelection(long j) {
        if (isInShowHiddenMode()) {
            return "";
        }
        return String.format(Locale.US, " AND (%s in (SELECT _id FROM cloud WHERE serverType=0 AND attributes&16=0))", new Object[]{Long.valueOf(j)});
    }

    private static String getNotSecretSelection(long j) {
        return String.format(Locale.US, "(%s !=-1000)", new Object[]{Long.valueOf(j)});
    }

    public static String getRecentDiscoveryTable(boolean z) {
        String str;
        StringBuilder sb = new StringBuilder();
        for (Entry entry : sRecentDiscoveryMediaMap.entrySet()) {
            if (sb.length() != 0) {
                sb.append(",");
            }
            sb.append((String) entry.getValue());
            sb.append(" AS ");
            sb.append((String) entry.getKey());
        }
        StringBuilder sb2 = new StringBuilder();
        sb2.append("(SELECT ");
        sb2.append(sb);
        sb2.append(" FROM (");
        sb2.append("recentDiscoveredMedia");
        sb2.append(" JOIN ");
        sb2.append("extended_cloud");
        sb2.append(" ON ");
        sb2.append("extended_cloud");
        sb2.append(".");
        sb2.append("_id");
        sb2.append(" = ");
        sb2.append("mediaId");
        sb2.append(")");
        sb2.append(" WHERE ");
        sb2.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))");
        sb2.append(" AND ");
        sb2.append("(localGroupId!=-1000)");
        sb2.append(getExcludeHiddenAlbumSelection());
        sb2.append(getIncludeLocalSelection());
        sb2.append(getExcludeBabyAlbumSelection());
        sb2.append(getDaysWithinSelection(30));
        if (z) {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(" GROUP BY ");
            sb3.append("sha1");
            str = sb3.toString();
        } else {
            str = "";
        }
        sb2.append(str);
        sb2.append(")");
        return sb2.toString();
    }

    private static void insertItemToGroupList(long j, int i, long j2, int i2, ArrayList<Group> arrayList) {
        long j3 = j;
        int i3 = i2;
        ArrayList<Group> arrayList2 = arrayList;
        if (MiscUtil.isValid(arrayList)) {
            boolean z = true;
            int size = arrayList.size() - 1;
            while (size >= 0) {
                Group group = (Group) arrayList2.get(size);
                if (group.endDate - j3 > 180000) {
                    if (!z || j2 != group.albumId) {
                        int i4 = i;
                    } else if (i == group.julianday) {
                        mergeItemToGroup(j, i3, group);
                        return;
                    }
                    Group group2 = new Group(j, i, j2, i2);
                    arrayList2.add(group2);
                    return;
                }
                int i5 = i;
                if (j2 == group.albumId) {
                    mergeItemToGroup(j, i3, group);
                    return;
                } else {
                    size--;
                    z = false;
                }
            }
            Group group3 = new Group(j, i, j2, i2);
            arrayList2.add(group3);
        } else {
            int i6 = i;
            if (arrayList2 == null) {
                arrayList2 = new ArrayList<>();
            }
            Group group4 = new Group(j, i, j2, i2);
            arrayList2.add(group4);
        }
    }

    public static void insertToRecent(Context context, RecentMediaEntry... recentMediaEntryArr) {
        doInsertToRecent(context, true, recentMediaEntryArr);
    }

    public static void insertToRecentUnchecked(Context context, RecentMediaEntry... recentMediaEntryArr) {
        doInsertToRecent(context, false, recentMediaEntryArr);
    }

    private static boolean isAlbumInWhiteList(String str) {
        ArrayList albumsInWhiteList = CloudControlStrategyHelper.getAlbumsInWhiteList();
        if (MiscUtil.isValid(albumsInWhiteList)) {
            Iterator it = albumsInWhiteList.iterator();
            while (it.hasNext()) {
                String str2 = (String) it.next();
                if (str2 != null && str2.equalsIgnoreCase(str)) {
                    return true;
                }
            }
        }
        ArrayList<Pattern> albumWhiteListPatterns = CloudControlStrategyHelper.getAlbumWhiteListPatterns();
        if (MiscUtil.isValid(albumWhiteListPatterns)) {
            for (Pattern matcher : albumWhiteListPatterns) {
                if (matcher.matcher(str).find()) {
                    return true;
                }
            }
        }
        return false;
    }

    private static boolean isInLocalMode() {
        return LocalMode.isOnlyShowLocalPhoto();
    }

    private static boolean isInShowHiddenMode() {
        return HiddenAlbum.isShowHiddenAlbum();
    }

    private static boolean isMediaCanShowInMessage(long j) {
        StringBuilder sb = new StringBuilder();
        sb.append("SELECT ");
        sb.append(getNotSecretSelection(j));
        sb.append(getNotInHiddenAlbumSelection(j));
        Cursor rawQuery = GalleryDBHelper.getInstance().getReadableDatabase().rawQuery(sb.toString(), null);
        boolean z = false;
        if (rawQuery != null) {
            try {
                if (rawQuery.moveToFirst()) {
                    if (rawQuery.getInt(0) != 0) {
                        z = true;
                    }
                    return z;
                }
                rawQuery.close();
            } finally {
                rawQuery.close();
            }
        }
        return false;
    }

    private static void mergeItemToGroup(long j, int i, Group group) {
        group.endDate = j;
        group.cursorPosList.add(Integer.valueOf(i));
    }

    private static boolean moveCursorToPosition(Cursor cursor, int i) {
        return cursor != null && !cursor.isClosed() && cursor.moveToPosition(i);
    }

    public static Cursor query(SQLiteDatabase sQLiteDatabase, String[] strArr, String str, String[] strArr2, String str2, String str3, boolean z, boolean z2) {
        boolean z3;
        if (z2) {
            if (strArr != null) {
                ArrayList arrayList = new ArrayList(Arrays.asList(strArr));
                if (!arrayList.contains("localGroupId")) {
                    arrayList.add("localGroupId");
                    z3 = true;
                } else {
                    z3 = false;
                }
                if (!arrayList.contains("dateModified")) {
                    arrayList.add("dateModified");
                    z3 = true;
                }
                if (!arrayList.contains("alias_julianday")) {
                    arrayList.add("alias_julianday");
                    z3 = true;
                }
                if (z3) {
                    strArr = new String[arrayList.size()];
                    for (int i = 0; i < arrayList.size(); i++) {
                        strArr[i] = (String) arrayList.get(i);
                    }
                }
            }
            str3 = "dateModified DESC ";
        }
        SQLiteDatabase sQLiteDatabase2 = sQLiteDatabase;
        Cursor query = sQLiteDatabase2.query(getRecentDiscoveryTable(z), strArr, str, strArr2, str2, null, str3);
        if (query == null || query.getCount() <= 0 || !z2) {
            return query;
        }
        try {
            long currentTimeMillis = System.currentTimeMillis();
            Cursor resortAndGenerateHeaders = resortAndGenerateHeaders(query, strArr);
            Log.d("RecentDiscoveryMediaManager", "resortAndGenerateHeaders cost %d ms.", (Object) Long.valueOf(System.currentTimeMillis() - currentTimeMillis));
            return resortAndGenerateHeaders;
        } catch (Exception e) {
            Log.e("RecentDiscoveryMediaManager", "resortAndGenerateHeaders failed.");
            e.printStackTrace();
            return null;
        } finally {
            MiscUtil.closeSilently(query);
        }
    }

    public static Cursor queryAlbumCover(SQLiteDatabase sQLiteDatabase, int i, boolean z) {
        AnonymousClass1 r0 = new AbstractWindowedCursor() {
            public String[] getColumnNames() {
                return new String[0];
            }

            public int getCount() {
                return 0;
            }
        };
        r0.setExtras(generateAlbumCover(sQLiteDatabase, i, z));
        return r0;
    }

    private static void recordNotInWhiteListAlbum(String str) {
        HashMap hashMap = new HashMap();
        hashMap.put("album_relative_path", str);
        GallerySamplingStatHelper.recordCountEvent("media_scanner", "scanner_directory_not_in_white_list", hashMap);
    }

    private static Cursor resortAndGenerateHeaders(Cursor cursor, String[] strArr) {
        if (cursor == null || cursor.getCount() <= 0 || cursor.getColumnIndex("dateModified") == -1 || cursor.getColumnIndex("alias_julianday") == -1 || cursor.getColumnIndex("localGroupId") == -1) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        while (cursor.moveToNext()) {
            insertItemToGroupList(getDateModified(cursor), getJulianday(cursor), getAlbumId(cursor), cursor.getPosition(), arrayList);
        }
        MatrixCursor matrixCursor = new MatrixCursor(strArr);
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        Iterator it = arrayList.iterator();
        int i = 0;
        while (it.hasNext()) {
            Group group = (Group) it.next();
            arrayList4.add(DateUtils.formatRelativeTime(getDateModified(cursor, ((Integer) group.cursorPosList.get(0)).intValue()), false));
            arrayList2.add(Integer.valueOf(group.cursorPosList.size()));
            arrayList3.add(Integer.valueOf(i));
            i += group.cursorPosList.size();
            for (Integer intValue : group.cursorPosList) {
                if (moveCursorToPosition(cursor, intValue.intValue())) {
                    addOneRowToMatrixCursor(cursor, matrixCursor, strArr);
                }
            }
        }
        Bundle bundle = new Bundle();
        bundle.putIntegerArrayList("extra_timeline_item_count_in_group", arrayList2);
        bundle.putIntegerArrayList("extra_timeline_group_start_pos", arrayList3);
        bundle.putStringArrayList("extra_timeline_group_time_labels", arrayList4);
        matrixCursor.setExtras(bundle);
        return matrixCursor;
    }
}
