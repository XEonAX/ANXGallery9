package com.miui.gallery.stat;

import android.app.Activity;
import android.os.Build;
import android.os.Build.VERSION;
import com.miui.gallery.util.GalleryStatHelper;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class BaseSamplingStatHelper {
    private static String formatErrorCategoryKey(String str) {
        return String.format(Locale.US, "error_%s", new Object[]{str});
    }

    private static String formatSampledCategoryKey(String str) {
        return String.format(Locale.US, "sample_%s", new Object[]{str});
    }

    public static String formatValueStage(float f, int[] iArr) {
        int generatorValueStage = generatorValueStage(f, iArr);
        if (generatorValueStage != -1) {
            return String.format(Locale.US, "<=%d", new Object[]{Integer.valueOf(generatorValueStage)});
        }
        return String.format(Locale.US, ">%d", new Object[]{Integer.valueOf(iArr[iArr.length - 1])});
    }

    public static Map<String, String> generatorCommonParams() {
        HashMap hashMap = new HashMap();
        hashMap.put("model", Build.MODEL);
        hashMap.put("version", VERSION.INCREMENTAL);
        return hashMap;
    }

    public static int generatorValueStage(float f, int[] iArr) {
        int length = iArr.length;
        for (int i = 0; i < length; i++) {
            if (f <= ((float) iArr[i])) {
                return iArr[i];
            }
        }
        return -1;
    }

    private static boolean isEnabled() {
        return !StatSampling.FILTERED;
    }

    public static void recordCountEvent(String str, String str2) {
        if (isEnabled()) {
            GalleryStatHelper.recordCountEvent(formatSampledCategoryKey(str), str2);
        }
    }

    public static void recordCountEvent(String str, String str2, Map<String, String> map) {
        if (isEnabled()) {
            GalleryStatHelper.recordCountEvent(formatSampledCategoryKey(str), str2, map);
        }
    }

    public static void recordErrorEvent(String str, String str2) {
        GalleryStatHelper.recordCountEvent(formatErrorCategoryKey(str), str2);
    }

    public static void recordErrorEvent(String str, String str2, Map<String, String> map) {
        GalleryStatHelper.recordCountEvent(formatErrorCategoryKey(str), str2, map);
    }

    public static void recordNumericPropertyEvent(String str, String str2, long j) {
        if (isEnabled()) {
            GalleryStatHelper.recordNumericPropertyEvent(formatSampledCategoryKey(str), str2, j);
        }
    }

    public static void recordPageEnd(Activity activity, String str) {
        if (isEnabled()) {
            GalleryStatHelper.recordPageEnd(activity, formatSampledCategoryKey(str));
        }
    }

    public static void recordPageStart(Activity activity, String str) {
        if (isEnabled()) {
            GalleryStatHelper.recordPageStart(activity, formatSampledCategoryKey(str));
        }
    }

    public static void recordStringPropertyEvent(String str, String str2, String str3) {
        if (isEnabled()) {
            GalleryStatHelper.recordStringPropertyEvent(formatSampledCategoryKey(str), str2, str3);
        }
    }
}
