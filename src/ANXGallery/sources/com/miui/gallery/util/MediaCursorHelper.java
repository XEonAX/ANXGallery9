package com.miui.gallery.util;

import android.database.Cursor;
import android.text.TextUtils;
import com.miui.gallery.data.LocationUtil;

public class MediaCursorHelper {
    public static final String[] PROJECTION = {"_id", "microthumbfile", "thumbnailFile", "localFile", "mimeType", "alias_create_time", "location", "size", "exifImageWidth", "exifImageLength", "duration", "exifGPSLatitude", "exifGPSLatitudeRef", "exifGPSLongitude", "exifGPSLongitudeRef", "alias_sync_state", "localGroupId", "secretKey", "sha1", "creatorId", "alias_is_favorite", "serverId", "exifOrientation", "title", "burst_group_id"};

    public static long getAlbumId(Cursor cursor) {
        return cursor.getLong(16);
    }

    public static long getCreateTime(Cursor cursor) {
        return cursor.getLong(5);
    }

    public static String getCreator(Cursor cursor) {
        return cursor.getString(19);
    }

    public static int getDuration(Cursor cursor) {
        return cursor.getInt(10);
    }

    public static String getFilePath(Cursor cursor) {
        return cursor.getString(3);
    }

    public static int getHeight(Cursor cursor) {
        return cursor.getInt(9);
    }

    public static double getLatitude(Cursor cursor) {
        String string = cursor.getString(11);
        if (!TextUtils.isEmpty(string)) {
            return LocationUtil.convertRationalLatLonToDouble(string, cursor.getString(12));
        }
        return 0.0d;
    }

    public static String getLocation(Cursor cursor) {
        return cursor.getString(6);
    }

    public static double getLongitude(Cursor cursor) {
        String string = cursor.getString(13);
        if (!TextUtils.isEmpty(string)) {
            return LocationUtil.convertRationalLatLonToDouble(string, cursor.getString(14));
        }
        return 0.0d;
    }

    public static long getMediaId(Cursor cursor) {
        return cursor.getLong(0);
    }

    public static String getMicroThumbnailPath(Cursor cursor) {
        return cursor.getString(1);
    }

    public static String getMimeType(Cursor cursor) {
        return cursor.getString(4);
    }

    public static int getOrientation(Cursor cursor) {
        return cursor.getInt(22);
    }

    public static byte[] getSecretKey(Cursor cursor) {
        return cursor.getBlob(17);
    }

    public static String getServerId(Cursor cursor) {
        return cursor.getString(21);
    }

    public static String getSha1(Cursor cursor) {
        return cursor.getString(18);
    }

    public static long getSize(Cursor cursor) {
        return cursor.getLong(7);
    }

    public static int getSyncState(Cursor cursor) {
        return cursor.getInt(15);
    }

    public static String getThumbnailPath(Cursor cursor) {
        return cursor.getString(2);
    }

    public static String getTitle(Cursor cursor) {
        return cursor.getString(23);
    }

    public static int getWidth(Cursor cursor) {
        return cursor.getInt(8);
    }

    public static int isFavorite(Cursor cursor) {
        return cursor.getInt(20);
    }

    public static boolean isSynced(Cursor cursor) {
        return getSyncState(cursor) == 0;
    }
}
