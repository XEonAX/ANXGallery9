package com.android.internal;

import android.os.SystemProperties;

public class SystemPropertiesCompat {
    public static String get(String str, String str2) {
        try {
            return SystemProperties.get(str, str2);
        } catch (Throwable th) {
            th.printStackTrace();
            return str2;
        }
    }

    public static int getInt(String str, int i) {
        try {
            return SystemProperties.getInt(str, i);
        } catch (Throwable th) {
            th.printStackTrace();
            return i;
        }
    }
}
