package com.xiaomi.mistatistic.sdk;

public class CustomSettings {
    private static boolean a = false;
    private static boolean b = false;
    private static boolean c = true;

    public static boolean isDataUploadingEnabled() {
        return c;
    }

    public static boolean isUseSystemStatService() {
        return b;
    }

    public static boolean isUseSystemUploadingService() {
        return a;
    }
}
