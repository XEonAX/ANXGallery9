package com.miui.gallery.cloud.base;

import android.text.TextUtils;
import com.xiaomi.micloudsdk.data.ExtendedAuthToken;

public class GalleryExtendedAuthToken {
    private ExtendedAuthToken mToken;

    public GalleryExtendedAuthToken(ExtendedAuthToken extendedAuthToken) {
        this.mToken = extendedAuthToken;
    }

    public static GalleryExtendedAuthToken parse(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        ExtendedAuthToken parse = ExtendedAuthToken.parse(str);
        if (parse == null) {
            return null;
        }
        return new GalleryExtendedAuthToken(parse);
    }

    public String getSecurity() {
        return this.mToken.security;
    }
}
