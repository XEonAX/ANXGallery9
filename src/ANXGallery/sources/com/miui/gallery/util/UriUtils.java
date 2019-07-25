package com.miui.gallery.util;

import android.net.Uri;

public class UriUtils {
    public static String toSafeString(Uri uri) {
        String str;
        String scheme = uri.getScheme();
        String schemeSpecificPart = uri.getSchemeSpecificPart();
        if (scheme != null) {
            if (scheme.equalsIgnoreCase("tel") || scheme.equalsIgnoreCase("sip") || scheme.equalsIgnoreCase("sms") || scheme.equalsIgnoreCase("smsto") || scheme.equalsIgnoreCase("mailto")) {
                StringBuilder sb = new StringBuilder(64);
                sb.append(scheme);
                sb.append(':');
                if (schemeSpecificPart != null) {
                    for (int i = 0; i < schemeSpecificPart.length(); i++) {
                        char charAt = schemeSpecificPart.charAt(i);
                        if (charAt == '-' || charAt == '@' || charAt == '.') {
                            sb.append(charAt);
                        } else {
                            sb.append('x');
                        }
                    }
                }
                return sb.toString();
            } else if (scheme.equalsIgnoreCase("http") || scheme.equalsIgnoreCase("https") || scheme.equalsIgnoreCase("ftp")) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append("//");
                sb2.append(uri.getHost() != null ? uri.getHost() : "");
                if (uri.getPort() != -1) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append(":");
                    sb3.append(uri.getPort());
                    str = sb3.toString();
                } else {
                    str = "";
                }
                sb2.append(str);
                sb2.append("/...");
                schemeSpecificPart = sb2.toString();
            }
        }
        StringBuilder sb4 = new StringBuilder(64);
        if (scheme != null) {
            sb4.append(scheme);
            sb4.append(':');
        }
        if (schemeSpecificPart != null) {
            sb4.append(schemeSpecificPart);
        }
        return sb4.toString();
    }
}
