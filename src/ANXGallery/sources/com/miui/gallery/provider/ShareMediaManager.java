package com.miui.gallery.provider;

import android.accounts.Account;
import android.database.AbstractCursor;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.text.TextUtils;
import com.miui.account.AccountHelper;
import com.miui.gallery.GalleryApp;
import com.miui.gallery.cloud.DownloadPathHelper;
import com.miui.gallery.data.LocationManager;
import com.miui.gallery.movie.utils.MovieStatUtils;
import com.miui.gallery.provider.InternalContract.ShareImage;
import com.miui.gallery.util.Numbers;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

public class ShareMediaManager {
    private static Map<String, String> sShareMediaMap = new HashMap();

    static {
        sShareMediaMap.put("_id", "1073741823+_id");
        sShareMediaMap.put("sha1", "sha1");
        sShareMediaMap.put("localGroupId", "localGroupId");
        sShareMediaMap.put("microthumbfile", "microthumbfile");
        sShareMediaMap.put("thumbnailFile", "thumbnailFile");
        sShareMediaMap.put("localFile", "localFile");
        sShareMediaMap.put("serverType", "serverType");
        sShareMediaMap.put("title", "title");
        sShareMediaMap.put("duration", "duration");
        sShareMediaMap.put("description", "description");
        sShareMediaMap.put("size", "size");
        sShareMediaMap.put("mimeType", "mimeType");
        sShareMediaMap.put("location", "location");
        sShareMediaMap.put("exifGPSLatitude", "exifGPSLatitude");
        sShareMediaMap.put("exifGPSLatitudeRef", "exifGPSLatitudeRef");
        sShareMediaMap.put("exifGPSLongitude", "exifGPSLongitude");
        sShareMediaMap.put("exifGPSLongitudeRef", "exifGPSLongitudeRef");
        sShareMediaMap.put("alias_micro_thumbnail", ShareImage.ALIAS_MICRO_THUMBNAIL);
        sShareMediaMap.put("alias_create_time", " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sShareMediaMap.put("alias_create_date", "STRFTIME('%Y%m%d', CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END /1000, 'unixepoch', 'localtime')");
        sShareMediaMap.put("alias_sync_state", " CASE WHEN localFlag = 0  THEN 0 WHEN localFlag IN (5, 6, 9) THEN 1 ELSE 3 END ");
        sShareMediaMap.put("secretKey", "secretKey");
        sShareMediaMap.put("exifImageWidth", "exifImageWidth");
        sShareMediaMap.put("exifImageLength", "exifImageLength");
        sShareMediaMap.put("serverId", "serverId");
        sShareMediaMap.put("serverTag", "serverTag");
        sShareMediaMap.put("creatorId", "creatorId");
        sShareMediaMap.put("dateModified", "dateModified");
        sShareMediaMap.put("alias_modify_date", "STRFTIME('%Y%m%d',dateModified/1000, 'unixepoch', 'localtime')");
        sShareMediaMap.put("alias_clear_thumbnail", ShareImage.ALIAS_CLEAR_FIRST);
        sShareMediaMap.put("localFlag", "localFlag");
        sShareMediaMap.put("serverStatus", "serverStatus");
        sShareMediaMap.put("alias_is_favorite", MovieStatUtils.DOWNLOAD_SUCCESS);
        sShareMediaMap.put("specialTypeFlags", "specialTypeFlags");
        sShareMediaMap.put("alias_sort_time", " CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END ");
        sShareMediaMap.put("alias_sort_date", "STRFTIME('%Y%m%d', CASE WHEN mixedDateTime NOT NULL THEN mixedDateTime ELSE dateTaken END /1000, 'unixepoch', 'localtime')");
        sShareMediaMap.put("exifOrientation", "exifOrientation");
        sShareMediaMap.put("burst_group_id", MovieStatUtils.DOWNLOAD_SUCCESS);
    }

    public static long convertToMediaId(long j) {
        return j + 1073741823;
    }

    private static Bundle generateHeaderInfo(Cursor cursor) {
        if (cursor == null || cursor.getCount() <= 0 || cursor.getColumnIndex("alias_create_date") == -1 || cursor.getColumnIndex("location") == -1) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        ArrayList arrayList3 = new ArrayList();
        ArrayList arrayList4 = new ArrayList();
        Integer valueOf = Integer.valueOf(-1);
        Integer valueOf2 = Integer.valueOf(1);
        int i = 0;
        while (cursor.moveToNext()) {
            String location = getLocation(cursor);
            if (Numbers.equals(valueOf, -1)) {
                valueOf = Integer.valueOf(getJulianDay(cursor));
                arrayList2.add(Integer.valueOf(i));
                arrayList4.add(location);
            } else if (Numbers.equals(valueOf, getJulianDay(cursor))) {
                valueOf2 = Integer.valueOf(valueOf2.intValue() + 1);
                arrayList4.add(location);
            } else {
                arrayList.add(valueOf2);
                Integer valueOf3 = Integer.valueOf(1);
                arrayList3.add(LocationManager.getInstance().generateTitleLine((List<String>) arrayList4));
                arrayList4.clear();
                arrayList4.add(location);
                Integer valueOf4 = Integer.valueOf(getJulianDay(cursor));
                arrayList2.add(Integer.valueOf(i));
                Integer num = valueOf4;
                valueOf2 = valueOf3;
                valueOf = num;
            }
            i++;
            if (i == cursor.getCount()) {
                arrayList.add(valueOf2);
                arrayList3.add(LocationManager.getInstance().generateTitleLine((List<String>) arrayList4));
            }
        }
        Bundle bundle = new Bundle();
        bundle.putIntegerArrayList("extra_timeline_item_count_in_group", arrayList);
        bundle.putIntegerArrayList("extra_timeline_group_start_pos", arrayList2);
        bundle.putStringArrayList("extra_timeline_group_start_locations", arrayList3);
        return bundle;
    }

    private static int getJulianDay(Cursor cursor) {
        return cursor.getInt(cursor.getColumnIndex("alias_create_date"));
    }

    private static String getLocation(Cursor cursor) {
        return cursor.getString(cursor.getColumnIndex("location"));
    }

    public static String getMediaFileName(String str, String str2) {
        return DownloadPathHelper.addPostfixToFileName(str, str2);
    }

    public static long getOriginalMediaId(long j) {
        return j - 1073741823;
    }

    public static ArrayList<Long> getOwnerSharedImageIds(Map<Long, String> map) {
        ArrayList<Long> arrayList = null;
        if (map == null || map.size() == 0) {
            return null;
        }
        Account xiaomiAccount = AccountHelper.getXiaomiAccount(GalleryApp.sGetAndroidContext());
        if (xiaomiAccount != null) {
            arrayList = new ArrayList<>();
            for (Entry entry : map.entrySet()) {
                if (TextUtils.equals((CharSequence) entry.getValue(), xiaomiAccount.name) || isSharedImageUnsynced(((Long) entry.getKey()).longValue())) {
                    arrayList.add(entry.getKey());
                }
            }
        }
        return arrayList;
    }

    public static String getShareMediaTable() {
        StringBuilder sb = new StringBuilder();
        for (Entry entry : sShareMediaMap.entrySet()) {
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
        sb2.append(" FROM ");
        sb2.append("shareImage");
        sb2.append(" WHERE ");
        sb2.append("(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus='custom'))");
        sb2.append(")");
        return sb2.toString();
    }

    public static boolean isOtherShareMediaId(long j) {
        return j >= 1073741823 && j < 2147483647L;
    }

    private static boolean isSharedImageUnsynced(long j) {
        boolean z = false;
        Cursor query = GalleryApp.sGetAndroidContext().getContentResolver().query(GalleryContract.ShareImage.SHARE_URI, null, "_id = ? AND serverId IS NULL", new String[]{String.valueOf(getOriginalMediaId(j))}, null);
        if (query == null) {
            return false;
        }
        try {
            if (query.getCount() > 0) {
                z = true;
            }
            return z;
        } finally {
            query.close();
        }
    }

    private static boolean isSupportTimelineCursor(Cursor cursor) {
        return (cursor == null || cursor.getColumnIndex("alias_create_date") == -1 || cursor.getColumnIndex("location") == -1) ? false : true;
    }

    public static Cursor query(SQLiteDatabase sQLiteDatabase, String[] strArr, String str, String[] strArr2, String str2, String str3) {
        Cursor query = sQLiteDatabase.query(getShareMediaTable(), strArr, str, strArr2, str2, null, str3);
        if (query != null && query.getCount() > 0 && isSupportTimelineCursor(query) && (query instanceof AbstractCursor)) {
            Bundle generateHeaderInfo = generateHeaderInfo(query);
            if (generateHeaderInfo != null) {
                ((AbstractCursor) query).setExtras(generateHeaderInfo);
            }
        }
        return query;
    }
}
