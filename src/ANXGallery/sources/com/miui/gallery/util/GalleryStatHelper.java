package com.miui.gallery.util;

import android.app.Activity;
import android.content.Context;
import com.miui.gallery.preference.BaseGalleryPreferences.CTA;
import com.xiaomi.mistatistic.sdk.MiStatInterface;
import com.xiaomi.mistatistic.sdk.URLStatsRecorder;
import com.xiaomi.mistatistic.sdk.data.HttpEvent;
import java.util.Map;

public class GalleryStatHelper {
    private static boolean sInitialized;

    public static void addHttpEvent(String str, long j, long j2, int i) {
        if (isUsable()) {
            HttpEvent httpEvent = new HttpEvent(str, j, j2, i);
            URLStatsRecorder.addHttpEvent(httpEvent);
        }
    }

    public static void addHttpEvent(String str, long j, long j2, int i, String str2) {
        if (isUsable()) {
            HttpEvent httpEvent = new HttpEvent(str, j, j2, i, str2);
            URLStatsRecorder.addHttpEvent(httpEvent);
        }
    }

    public static void addHttpEvent(String str, String str2) {
        if (isUsable()) {
            URLStatsRecorder.addHttpEvent(new HttpEvent(str, str2));
        }
    }

    public static void init(Context context) {
        if (!sInitialized && CTA.canConnectNetwork()) {
            sInitialized = true;
            try {
                MiStatInterface.initialize(context, "2882303761517492012", "5601749292012", "com.miui.gallery");
                MiStatInterface.setUploadPolicy(0, 300000);
                URLStatsRecorder.enableAutoRecord();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private static boolean isUsable() {
        return sInitialized;
    }

    public static void recordCountEvent(String str, String str2) {
        if (isUsable()) {
            try {
                MiStatInterface.recordCountEvent(str, str2);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void recordCountEvent(String str, String str2, Map<String, String> map) {
        if (isUsable()) {
            try {
                MiStatInterface.recordCountEvent(str, str2, map);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void recordNumericPropertyEvent(String str, String str2, long j) {
        if (isUsable()) {
            try {
                MiStatInterface.recordNumericPropertyEvent(str, str2, j);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void recordPageEnd(Activity activity, String str) {
        if (isUsable()) {
            try {
                MiStatInterface.recordPageEnd(activity, str);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void recordPageStart(Activity activity, String str) {
        if (isUsable()) {
            try {
                MiStatInterface.recordPageStart(activity, str);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static void recordStringPropertyEvent(String str, String str2, String str3) {
        if (isUsable()) {
            try {
                MiStatInterface.recordStringPropertyEvent(str, str2, str3);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
