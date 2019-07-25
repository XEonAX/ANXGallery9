package com.miui.gallery.picker.helper;

import android.database.Cursor;
import com.miui.gallery.adapter.BaseAdapter;

public class CursorUtils {
    public static String getFaceId(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("serverId");
        if (columnIndex >= 0) {
            return cursor.getString(columnIndex);
        }
        throw new RuntimeException("key needed");
    }

    public static long getFacePhotoId(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("photo_id");
        if (columnIndex >= 0) {
            return cursor.getLong(columnIndex);
        }
        throw new RuntimeException("key needed");
    }

    public static long getFileLength(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("size");
        if (columnIndex >= 0) {
            return cursor.getLong(columnIndex);
        }
        throw new RuntimeException("key needed");
    }

    public static long getId(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("_id");
        if (columnIndex >= 0) {
            return cursor.getLong(columnIndex);
        }
        throw new RuntimeException("key needed");
    }

    public static String getMicroPath(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("alias_micro_thumbnail");
        int columnIndex2 = cursor.getColumnIndex("sha1");
        if (columnIndex >= 0 && columnIndex2 >= 0) {
            return BaseAdapter.getMicroPath(cursor, columnIndex, columnIndex2);
        }
        throw new RuntimeException("key needed");
    }

    public static String getMimeType(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("mimeType");
        if (columnIndex >= 0) {
            return cursor.getString(columnIndex);
        }
        throw new RuntimeException("key needed");
    }

    public static String getSha1(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex("sha1");
        if (columnIndex >= 0) {
            return cursor.getString(columnIndex);
        }
        throw new RuntimeException("key needed");
    }
}
