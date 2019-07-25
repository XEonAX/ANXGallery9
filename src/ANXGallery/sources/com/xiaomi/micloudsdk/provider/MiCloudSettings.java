package com.xiaomi.micloudsdk.provider;

import android.content.Context;
import android.provider.Settings.System;
import miui.cloud.AppConstants;

public class MiCloudSettings {
    public static int getInt(Context context, String str, int i) {
        return ((Integer) AppConstants.CLOUD_SDK_LEVEL.get(context)).intValue() >= 18 ? MiCloudSettingsV18.getInt(context, str, i) : System.getInt(context.getContentResolver(), str, i);
    }

    public static String getString(Context context, String str) {
        return ((Integer) AppConstants.CLOUD_SDK_LEVEL.get(context)).intValue() >= 18 ? MiCloudSettingsV18.getString(context, str) : System.getString(context.getContentResolver(), str);
    }

    public static boolean putInt(Context context, String str, int i) {
        return ((Integer) AppConstants.CLOUD_SDK_LEVEL.get(context)).intValue() >= 18 ? MiCloudSettingsV18.putInt(context, str, i) : System.putInt(context.getContentResolver(), str, i);
    }

    public static boolean putString(Context context, String str, String str2) {
        return ((Integer) AppConstants.CLOUD_SDK_LEVEL.get(context)).intValue() >= 18 ? MiCloudSettingsV18.putString(context, str, str2) : System.putString(context.getContentResolver(), str, str2);
    }
}
