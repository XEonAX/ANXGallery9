package com.xiaomi.micloudsdk.sync.utils;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import com.miui.gallery.assistant.jni.filter.BaiduSceneResult;
import com.miui.utils.SafeContentResolver;
import com.miui.utils.SafeContentResolver.Callback;
import java.util.Locale;
import miui.cloud.AppConstants;

public class SyncContentUtils {
    private static final Uri PAUSE_EXCEPT_URI = Uri.parse("content://com.miui.micloud/sync_pause_except");
    private static final Uri PAUSE_URI = Uri.parse("content://com.miui.micloud/sync_pause");
    private static final Uri SYNC_RESULT_URI = Uri.parse("content://com.miui.micloud/sync_result");

    public enum Reason {
        SUCCESS(0, 0),
        UNKNOWN(-1, -1),
        NETWORK_DISALLOWED(1000, 1000),
        AUTH_TOKEN_ERROR(1001, 100),
        ACTIVATED_FAIL(1002, 1001),
        TIME_UNAVAILABLE(1003, BaiduSceneResult.SHOOTING),
        PERMISSION_LIMIT(-1, 1002),
        SECURE_SPACE_LIMIT(-1, 1003),
        SYNC_SOFT_ERROR(-1, 1),
        SYNC_HARD_ERROR(-1, 2),
        PRIVACY_ERROR(-1, 52003);
        
        final int v8;
        final int v9;

        private Reason(int i, int i2) {
            this.v8 = i;
            this.v9 = i2;
        }
    }

    public static void insertPauseExceptAuthority(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("insertPauseExceptAuthority: authority: ");
        sb.append(str);
        Log.d("SyncContentUtils", sb.toString());
        ContentValues contentValues = new ContentValues();
        contentValues.put("authority", str);
        SafeContentResolver.insert(context, PAUSE_EXCEPT_URI, contentValues);
    }

    public static boolean isPauseExceptAuthority(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("isPauseExceptAuthority: authority: ");
        sb.append(str);
        Log.d("SyncContentUtils", sb.toString());
        return ((Boolean) SafeContentResolver.query(context, PAUSE_EXCEPT_URI, new String[]{"param_is_sync_pause_except"}, null, new String[]{str}, null, new Callback<Boolean>() {
            public Boolean call(Cursor cursor) {
                boolean z = false;
                if (cursor == null || !cursor.moveToFirst()) {
                    Log.e("SyncContentUtils", "loadResumeTime: error cursor is null or query fail");
                    return Boolean.valueOf(false);
                }
                if (cursor.getInt(0) == 1) {
                    z = true;
                }
                return Boolean.valueOf(z);
            }
        })).booleanValue();
    }

    public static long loadResumeTime(Context context, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append("loadResumeTime: authority: ");
        sb.append(str);
        Log.d("SyncContentUtils", sb.toString());
        String[] strArr = {"resume_time"};
        StringBuilder sb2 = new StringBuilder();
        sb2.append("authority='");
        sb2.append(str);
        sb2.append("'");
        return ((Long) SafeContentResolver.query(context, PAUSE_URI, strArr, sb2.toString(), null, null, new Callback<Long>() {
            public Long call(Cursor cursor) {
                if (cursor != null && cursor.moveToFirst()) {
                    return Long.valueOf(cursor.getLong(0));
                }
                Log.e("SyncContentUtils", "loadResumeTime: error cursor is null or query fail");
                return Long.valueOf(0);
            }
        })).longValue();
    }

    public static void recordSyncResult(Context context, String str, int i) {
        StringBuilder sb = new StringBuilder();
        sb.append("recordSyncResult: authority: ");
        sb.append(str);
        sb.append(", code: ");
        sb.append(i);
        Log.d("SyncContentUtils", sb.toString());
        if (i != -1) {
            ContentValues contentValues = new ContentValues();
            contentValues.put("authority", str);
            contentValues.put("code", Integer.valueOf(i));
            StringBuilder sb2 = new StringBuilder();
            sb2.append("authority='");
            sb2.append(str);
            sb2.append("'");
            SafeContentResolver.update(context, SYNC_RESULT_URI, contentValues, sb2.toString(), null);
        }
    }

    public static void recordSyncResult(Context context, String str, Reason reason) {
        Log.d("SyncContentUtils", String.format(Locale.US, "record %s on %d", new Object[]{reason, AppConstants.MIUI_ROM_LEVEL.get(context)}));
        if (((Integer) AppConstants.MIUI_ROM_LEVEL.get(context)).intValue() > 8) {
            recordSyncResult(context, str, reason.v9);
        } else {
            recordSyncResult(context, str, reason.v8);
        }
    }

    public static void savePauseTime(Context context, String str, long j) {
        StringBuilder sb = new StringBuilder();
        sb.append("savePauseTime: authority: ");
        sb.append(str);
        sb.append(", time: ");
        sb.append(j);
        Log.d("SyncContentUtils", sb.toString());
        ContentValues contentValues = new ContentValues();
        contentValues.put("authority", str);
        contentValues.put("resume_time", Long.valueOf(System.currentTimeMillis() + j));
        StringBuilder sb2 = new StringBuilder();
        sb2.append("authority='");
        sb2.append(str);
        sb2.append("'");
        if (SafeContentResolver.update(context, PAUSE_URI, contentValues, sb2.toString(), null) == 0) {
            SafeContentResolver.insert(context, PAUSE_URI, contentValues);
        }
    }
}
