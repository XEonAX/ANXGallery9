package com.nexstreaming.app.common.util;

import android.content.Context;
import android.content.res.Resources;
import java.util.Locale;
import java.util.Map;

/* compiled from: StringUtil */
public class n {
    private static final char[] a = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
    private static final char[] b = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    private static String a(Context context, String str) {
        if (str == null || context == null) {
            return str;
        }
        if (str.startsWith("@string/")) {
            Resources resources = context.getResources();
            StringBuilder sb = new StringBuilder();
            sb.append("string/kedl_");
            sb.append(str.substring(8));
            int identifier = resources.getIdentifier(sb.toString(), "string", context.getPackageName());
            if (identifier != 0) {
                return context.getResources().getString(identifier);
            }
        } else if (str.startsWith("@")) {
            int identifier2 = context.getResources().getIdentifier(str.substring(1), "string", context.getPackageName());
            if (identifier2 != 0) {
                return context.getResources().getString(identifier2);
            }
        }
        return str;
    }

    public static String a(Context context, Map<String, String> map) {
        return a(context, b(context, map, null));
    }

    public static String a(Context context, Map<String, String> map, String str) {
        return a(context, b(context, map, str));
    }

    public static String a(byte[] bArr) {
        char[] cArr = new char[(bArr.length * 2)];
        for (int i = 0; i < bArr.length; i++) {
            int i2 = i * 2;
            cArr[i2] = a[(bArr[i] & 240) >> 4];
            cArr[i2 + 1] = a[bArr[i] & 15];
        }
        return new String(cArr);
    }

    private static String b(Context context, Map<String, String> map, String str) {
        String str2;
        Locale locale = context != null ? context.getResources().getConfiguration().locale : null;
        if (map == null) {
            return null;
        }
        if (locale == null) {
            locale = Locale.ENGLISH;
        }
        String lowerCase = locale.getLanguage().toLowerCase(Locale.ENGLISH);
        String lowerCase2 = locale.getCountry().toLowerCase(Locale.ENGLISH);
        String lowerCase3 = locale.getVariant().toLowerCase(Locale.ENGLISH);
        if (lowerCase3.isEmpty() && lowerCase2.isEmpty()) {
            str2 = lowerCase;
        } else if (lowerCase3.isEmpty()) {
            StringBuilder sb = new StringBuilder();
            sb.append(lowerCase);
            sb.append("-");
            sb.append(lowerCase2);
            str2 = sb.toString();
        } else if (lowerCase2.isEmpty()) {
            StringBuilder sb2 = new StringBuilder();
            sb2.append(lowerCase);
            sb2.append("-");
            sb2.append(lowerCase3);
            str2 = sb2.toString();
        } else {
            StringBuilder sb3 = new StringBuilder();
            sb3.append(lowerCase);
            sb3.append("-");
            sb3.append(lowerCase2);
            sb3.append("-");
            sb3.append(lowerCase3);
            str2 = sb3.toString();
        }
        String str3 = (String) map.get(str2);
        if (str3 == null) {
            str3 = (String) map.get(lowerCase);
            if (str3 == null) {
                str3 = (String) map.get("");
                if (str3 == null) {
                    str3 = (String) map.get("en");
                    if (str3 == null) {
                        str3 = (String) map.get("en-us");
                        if (str3 == null) {
                            str3 = str;
                        }
                    }
                }
            }
        }
        return str3;
    }
}
