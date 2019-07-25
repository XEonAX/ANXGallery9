package com.xiaomi.micloudsdk.request.utils;

import java.io.File;

public class RequestConstants {
    public static final boolean USE_MEMBER_DAILY = new File("/data/system/micloud_member_daily").exists();
    public static final boolean USE_PREVIEW = new File("/data/system/xiaomi_account_preview").exists();

    public static class URL {
        private static final String CURRENT_VERSION;
        public static final String URL_GALLERY_BASE = (RequestConstants.USE_PREVIEW ? "http://micloud.preview.n.xiaomi.net" : "http://galleryapi.micloud.xiaomi.net");
        public static final String URL_MICLOUD_MEMBER_STATUS_QUERY;
        private static final String URL_MICLOUD_STATUS_BASE = (RequestConstants.USE_PREVIEW ? "http://statusapi.micloud.preview.n.xiaomi.net" : "http://statusapi.micloud.xiaomi.net");
        public static final String URL_MICLOUD_STATUS_QUERY;
        public static final String URL_RELOCATION_BASE = (RequestConstants.USE_PREVIEW ? "http://relocationapi.micloud.preview.n.xiaomi.net" : "http://relocationapi.micloud.xiaomi.net");
        public static final String URL_RICH_MEDIA_BASE = (RequestConstants.USE_PREVIEW ? "http://api.micloud.preview.n.xiaomi.net" : "http://fileapi.micloud.xiaomi.net");

        static {
            StringBuilder sb = new StringBuilder();
            sb.append(URL_MICLOUD_STATUS_BASE);
            sb.append("/mic/status/v2");
            CURRENT_VERSION = sb.toString();
            StringBuilder sb2 = new StringBuilder();
            sb2.append(CURRENT_VERSION);
            sb2.append("/user/overview");
            URL_MICLOUD_STATUS_QUERY = sb2.toString();
            StringBuilder sb3 = new StringBuilder();
            sb3.append(CURRENT_VERSION);
            sb3.append("/user/level");
            URL_MICLOUD_MEMBER_STATUS_QUERY = sb3.toString();
        }
    }
}
