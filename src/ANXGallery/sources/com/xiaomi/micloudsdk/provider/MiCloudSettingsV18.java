package com.xiaomi.micloudsdk.provider;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.net.Uri;
import android.util.Log;
import com.miui.utils.SafeContentResolver;
import java.util.HashSet;

final class MiCloudSettingsV18 {
    private static final Uri BASE_URI = Uri.parse("content://com.xiaomi.micloudsdk.provider.MiCloudSettingsProvider");
    private static final HashSet<String> NEED_CATCH_EXCEPTION_PACKAGES = new HashSet<>(1);

    static {
        NEED_CATCH_EXCEPTION_PACKAGES.add("com.xiaomi.xmsf");
    }

    public static int getInt(Context context, String str, int i) {
        int i2;
        String string = getString(context, str);
        if (string != null) {
            try {
                i2 = Integer.parseInt(string);
            } catch (NumberFormatException unused) {
                return i;
            }
        } else {
            i2 = i;
        }
        return i2;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x006a  */
    /* JADX WARNING: Removed duplicated region for block: B:32:0x0070  */
    public static String getString(Context context, String str) {
        Cursor cursor;
        Cursor cursor2 = null;
        int i = 0;
        while (true) {
            if (i >= 3) {
                break;
            }
            try {
                cursor = context.getContentResolver().query(BASE_URI, new String[]{str}, null, null, null);
                if (cursor == null) {
                    break;
                }
                try {
                    if (cursor.moveToFirst()) {
                        break;
                    }
                    cursor.close();
                    StringBuilder sb = new StringBuilder();
                    sb.append("Error query for: ");
                    sb.append(str);
                    sb.append(". Retry ");
                    sb.append(i);
                    Log.w("MiCloudSettings", sb.toString());
                    i++;
                    cursor2 = cursor;
                } catch (Exception e) {
                    e = e;
                    cursor2 = cursor;
                    try {
                        Log.e("MiCloudSettings", "", e);
                        if (cursor2 != null) {
                        }
                        return null;
                    } catch (Throwable th) {
                        th = th;
                        cursor = cursor2;
                        if (cursor != null) {
                        }
                        throw th;
                    }
                } catch (Throwable th2) {
                    th = th2;
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            } catch (Exception e2) {
                e = e2;
                Log.e("MiCloudSettings", "", e);
                if (cursor2 != null) {
                    cursor2.close();
                }
                return null;
            }
        }
        cursor2 = cursor;
        String string = cursor2 == null ? null : cursor2.getString(0);
        if (cursor2 != null) {
            cursor2.close();
        }
        return string;
    }

    public static boolean putInt(Context context, String str, int i) {
        return putString(context, str, String.valueOf(i));
    }

    public static boolean putString(Context context, String str, String str2) {
        ContentValues contentValues = new ContentValues();
        contentValues.put("micloud_settings_key", str);
        contentValues.put("micloud_settings_value", String.valueOf(str2));
        return SafeContentResolver.insert(context, BASE_URI, contentValues) != null;
    }
}
