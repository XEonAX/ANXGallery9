package com.xiaomi.micloudsdk.utils;

import android.content.Context;
import android.content.SharedPreferences.Editor;
import android.preference.PreferenceManager;

public class PrefUtils {
    public static Integer getInt(Context context, String str, Integer num) {
        return Integer.valueOf(PreferenceManager.getDefaultSharedPreferences(context).getInt(str, num.intValue()));
    }

    public static Long getLong(Context context, String str, Long l) {
        return Long.valueOf(PreferenceManager.getDefaultSharedPreferences(context).getLong(str, l.longValue()));
    }

    public static void putInt(Context context, String str, Integer num) {
        Editor edit = PreferenceManager.getDefaultSharedPreferences(context).edit();
        edit.putInt(str, num.intValue());
        edit.commit();
    }

    public static void putLong(Context context, String str, Long l) {
        Editor edit = PreferenceManager.getDefaultSharedPreferences(context).edit();
        edit.putLong(str, l.longValue());
        edit.commit();
    }
}
