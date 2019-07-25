package com.miui.gallery.search.utils;

import com.miui.gallery.util.Log;

public class SearchLog {
    public static void d(String str, String str2) {
        Log.d(getFinalTag(str), str2);
    }

    public static void d(String str, String str2, Object obj) {
        Log.d(getFinalTag(str), str2, obj);
    }

    public static void d(String str, String str2, Object obj, Object obj2) {
        Log.d(getFinalTag(str), str2, obj, obj2);
    }

    public static void d(String str, String str2, Object obj, Object obj2, Object obj3) {
        Log.d(getFinalTag(str), str2, obj, obj2, obj3);
    }

    public static void e(String str, String str2) {
        Log.e(getFinalTag(str), str2);
    }

    public static void e(String str, String str2, Object obj) {
        Log.e(getFinalTag(str), str2, obj);
    }

    public static void e(String str, String str2, Object obj, Object obj2) {
        Log.e(getFinalTag(str), str2, obj, obj2);
    }

    public static void e(String str, Throwable th) {
        e(str, "", th);
    }

    private static String getFinalTag(String str) {
        StringBuilder sb = new StringBuilder("SearchLog");
        sb.append("_");
        sb.append(str);
        return sb.toString();
    }

    public static void i(String str, String str2) {
        Log.i(getFinalTag(str), str2);
    }

    public static void i(String str, String str2, Object obj) {
        Log.i(getFinalTag(str), str2, obj);
    }

    public static void i(String str, String str2, Object obj, Object obj2) {
        Log.i(getFinalTag(str), str2, obj, obj2);
    }

    public static void w(String str, String str2) {
        Log.w(getFinalTag(str), str2);
    }

    public static void w(String str, String str2, Object obj) {
        Log.w(getFinalTag(str), str2, obj);
    }

    public static void w(String str, String str2, Object obj, Object obj2) {
        Log.w(getFinalTag(str), str2, obj, obj2);
    }

    public static void w(String str, Throwable th) {
        w(str, "", th);
    }
}
