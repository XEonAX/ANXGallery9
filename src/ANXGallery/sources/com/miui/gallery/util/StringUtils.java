package com.miui.gallery.util;

public class StringUtils {
    public static String join(String str, long[] jArr) {
        if (jArr == null || jArr.length <= 0) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        boolean z = true;
        for (long j : jArr) {
            if (z) {
                z = false;
            } else {
                sb.append(str);
            }
            sb.append(j);
        }
        return sb.toString();
    }

    public static String[] mergeStringArray(String[] strArr, String[] strArr2) {
        if (strArr == null) {
            return strArr2;
        }
        if (strArr2 == null) {
            return strArr;
        }
        String[] strArr3 = new String[(strArr.length + strArr2.length)];
        System.arraycopy(strArr, 0, strArr3, 0, strArr.length);
        System.arraycopy(strArr2, 0, strArr3, strArr.length, strArr2.length);
        return strArr3;
    }

    public static String nullToEmpty(CharSequence charSequence) {
        return charSequence == null ? "" : charSequence.toString();
    }

    public static String nullToEmpty(String str) {
        return str == null ? "" : str;
    }
}
