package com.miui.gallery.provider.cache;

import android.database.Cursor;
import android.database.CursorWindow;
import android.text.TextUtils;

class ParseUtils {
    public static byte[] getBlob(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        return cursor.getBlob(i);
    }

    public static Character getChar(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        String string = cursor.getString(i);
        if (TextUtils.isEmpty(string)) {
            return null;
        }
        return Character.valueOf(string.charAt(0));
    }

    public static Integer getInt(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        return Integer.valueOf(cursor.getInt(i));
    }

    public static Long getLong(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        return Long.valueOf(cursor.getLong(i));
    }

    public static String getString(Cursor cursor, int i) {
        if (cursor.isNull(i)) {
            return null;
        }
        return cursor.getString(i);
    }

    public static boolean putBlob(CursorWindow cursorWindow, byte[] bArr, int i, int i2) {
        return bArr == null ? cursorWindow.putNull(i, i2) : cursorWindow.putBlob(bArr, i, i2);
    }

    public static boolean putLong(CursorWindow cursorWindow, Number number, int i, int i2) {
        return number == null ? cursorWindow.putNull(i, i2) : cursorWindow.putLong(number.longValue(), i, i2);
    }

    public static boolean putString(CursorWindow cursorWindow, String str, int i, int i2) {
        return str == null ? cursorWindow.putNull(i, i2) : cursorWindow.putString(str, i, i2);
    }
}
