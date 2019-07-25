package com.miui.gallery.util;

public class ExtraTextUtils {
    public static boolean endsWithIgnoreCase(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        return str.toLowerCase().endsWith(str2.toLowerCase());
    }

    public static boolean equalsIgnoreCase(String str, String str2) {
        if (str == str2) {
            return true;
        }
        if (str == null || str2 == null || str.length() != str2.length()) {
            return false;
        }
        return str.equalsIgnoreCase(str2);
    }

    public static boolean startsWithIgnoreCase(String str, String str2) {
        if (str == null || str2 == null) {
            return false;
        }
        return str.toLowerCase().startsWith(str2.toLowerCase());
    }
}
