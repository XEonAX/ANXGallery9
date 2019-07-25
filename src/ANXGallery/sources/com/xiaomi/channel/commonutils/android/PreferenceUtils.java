package com.xiaomi.channel.commonutils.android;

import android.content.Context;
import android.preference.PreferenceManager;
import java.util.Map;

public abstract class PreferenceUtils {
    public static void checkProcess(Context context) {
    }

    public static boolean getSettingBoolean(Context context, String str, boolean z) {
        checkProcess(context);
        return PreferenceManager.getDefaultSharedPreferences(context).getBoolean(str, z);
    }

    public static void putNotNullExtra(Map<String, String> map, String str, String str2) {
        if (map != null && str != null && str2 != null) {
            map.put(str, str2);
        }
    }

    public static void setSettingBoolean(Context context, String str, boolean z) {
        checkProcess(context);
        PreferenceManager.getDefaultSharedPreferences(context).edit().putBoolean(str, z).commit();
    }
}
