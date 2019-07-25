package com.miui.utils;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;

public class SafeContentResolver {

    public interface Callback<T> {
        T call(Cursor cursor);
    }

    public static Uri insert(Context context, Uri uri, ContentValues contentValues) {
        try {
            return context.getContentResolver().insert(uri, contentValues);
        } catch (Exception e) {
            Log.e("SafeContentResolver", "", e);
            return null;
        }
    }

    /* JADX WARNING: Removed duplicated region for block: B:17:0x0028  */
    /* JADX WARNING: Removed duplicated region for block: B:22:0x0033  */
    public static <T> T query(Context context, Uri uri, String[] strArr, String str, String[] strArr2, String str2, Callback<T> callback) {
        Cursor cursor;
        try {
            cursor = context.getContentResolver().query(uri, strArr, str, strArr2, str2);
            try {
                T call = callback.call(cursor);
                if (cursor != null) {
                    cursor.close();
                }
                return call;
            } catch (Exception e) {
                e = e;
                try {
                    Log.e("SafeContentResolver", "", e);
                    if (cursor != null) {
                    }
                    return callback.call(null);
                } catch (Throwable th) {
                    th = th;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            }
        } catch (Exception e2) {
            e = e2;
            cursor = null;
            Log.e("SafeContentResolver", "", e);
            if (cursor != null) {
                cursor.close();
            }
            return callback.call(null);
        } catch (Throwable th2) {
            th = th2;
            cursor = null;
            if (cursor != null) {
            }
            throw th;
        }
    }

    public static int update(Context context, Uri uri, ContentValues contentValues, String str, String[] strArr) {
        try {
            return context.getContentResolver().update(uri, contentValues, str, strArr);
        } catch (Exception e) {
            Log.e("SafeContentResolver", "", e);
            return -1;
        }
    }
}
