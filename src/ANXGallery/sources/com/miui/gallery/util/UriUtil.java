package com.miui.gallery.util;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;

public class UriUtil {
    public static Uri appendDistinct(Uri uri, boolean z) {
        return (uri == null || !z) ? uri : appendParameter(uri.buildUpon(), "distinct", "distinct").build();
    }

    public static Uri appendGroupBy(Uri uri, String str, String str2) {
        return uri != null ? appendParameter(appendParameter(uri.buildUpon(), "groupBy", str), "having", str2).build() : uri;
    }

    public static Uri appendLimit(Uri uri, int i) {
        return uri != null ? appendParameter(uri.buildUpon(), "limit", String.valueOf(i)).build() : uri;
    }

    public static Uri appendLimit(Uri uri, int i, int i2) {
        if (uri == null) {
            return uri;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(i2);
        sb.append(" , ");
        sb.append(i);
        return appendParameter(uri.buildUpon(), "limit", sb.toString()).build();
    }

    private static Builder appendParameter(Builder builder, String str, String str2) {
        if (!(builder == null || str == null || str2 == null)) {
            builder.appendQueryParameter(str, str2);
        }
        return builder;
    }

    public static boolean getDistinct(Uri uri) {
        if (uri != null) {
            return "1".equals(uri.getQueryParameter("distinct"));
        }
        return false;
    }

    public static String getGroupBy(Uri uri) {
        if (uri != null) {
            return uri.getQueryParameter("groupBy");
        }
        return null;
    }

    public static String getHaving(Uri uri) {
        if (uri != null) {
            return uri.getQueryParameter("having");
        }
        return null;
    }

    public static String getLimit(Uri uri) {
        if (uri != null) {
            return uri.getQueryParameter("limit");
        }
        return null;
    }

    public static boolean isNetUri(Uri uri) {
        boolean z = false;
        if (uri == null) {
            return false;
        }
        String scheme = uri.getScheme();
        if (!TextUtils.isEmpty(scheme) && (scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https"))) {
            z = true;
        }
        return z;
    }
}
