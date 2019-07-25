package com.miui.gallery.preference;

import android.content.SharedPreferences;

public class MemoryPreferenceHelper {
    private SharedPreferences mSharedPreferences;

    private static class SingletonHolder {
        /* access modifiers changed from: private */
        public static final MemoryPreferenceHelper INSTANCE = new MemoryPreferenceHelper();
    }

    private MemoryPreferenceHelper() {
        this.mSharedPreferences = new MemoryPreferencesImpl();
    }

    public static void clear() {
        getPreferences().edit().clear().apply();
    }

    public static boolean getBoolean(String str, boolean z) {
        return getPreferences().getBoolean(str, z);
    }

    public static int getInt(String str, int i) {
        return getPreferences().getInt(str, i);
    }

    public static long getLong(String str, long j) {
        return getPreferences().getLong(str, j);
    }

    static SharedPreferences getPreferences() {
        return SingletonHolder.INSTANCE.mSharedPreferences;
    }

    public static String getString(String str, String str2) {
        return getPreferences().getString(str, str2);
    }

    public static void putBoolean(String str, boolean z) {
        getPreferences().edit().putBoolean(str, z).apply();
    }

    public static void putInt(String str, int i) {
        getPreferences().edit().putInt(str, i).apply();
    }

    public static void putLong(String str, long j) {
        getPreferences().edit().putLong(str, j).apply();
    }

    public static void putString(String str, String str2) {
        getPreferences().edit().putString(str, str2).apply();
    }
}
