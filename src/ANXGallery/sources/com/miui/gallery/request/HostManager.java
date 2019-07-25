package com.miui.gallery.request;

import android.net.Uri;
import android.text.TextUtils;
import android.webkit.CookieManager;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.StorageUtils;
import java.io.File;

public class HostManager {
    private static final String MICLOUD_GALLERY_WEB_URL_BASE = (new File(URL_SWITCH_FILE).exists() ? "https://daily.i.mi.com/mobile/gallery" : "https://i.mi.com/mobile/gallery");
    private static final String URL_SWITCH_FILE = StorageUtils.getPathInPrimaryStorage("MIUI/Gallery/cloud/url_daily");

    public static void clearCookies() {
        try {
            if (CookieManager.getInstance().hasCookies()) {
                CookieManager.getInstance().removeAllCookie();
            }
        } catch (Exception e) {
            Log.e("HostManager", (Throwable) e);
        }
    }

    public static String getTrashBinUrl() {
        StringBuilder sb = new StringBuilder();
        sb.append(MICLOUD_GALLERY_WEB_URL_BASE);
        sb.append("/trash");
        return sb.toString();
    }

    public static boolean isGalleryUrl(String str) {
        if (isInternalUrl(str)) {
            String path = Uri.parse(str).getPath();
            if (!TextUtils.isEmpty(path)) {
                return path.contains("/mobile/gallery");
            }
        }
        return false;
    }

    public static boolean isInternalUrl(String str) {
        boolean z = false;
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        Uri parse = Uri.parse(str);
        if (parse.isOpaque() || parse.isRelative()) {
            return true;
        }
        String host = parse.getHost();
        if (host == null) {
            return false;
        }
        if (host.endsWith("miui.com") || host.endsWith("mi.com") || host.endsWith("xiaomi.com") || host.endsWith("xiaomi.net")) {
            z = true;
        }
        return z;
    }
}
