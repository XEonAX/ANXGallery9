package com.miui.gallery.editor.photo.utils;

import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.content.Context;
import android.os.Build;
import android.os.Build.VERSION;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import java.util.HashMap;

public class BigBitmapLoadUtils {
    private static final String[] sSpecialWhiteList = {"davinci", "davinciin"};

    public static int calculateInSampleSize(Context context, int i, int i2) {
        int i3;
        long j = ((long) i) * ((long) i2) * 4;
        if (VERSION.SDK_INT < 26) {
            long maxMemory = ((((long) getMaxMemory(context)) * 1024) * 1024) / 3;
            int i4 = 1;
            while (true) {
                long j2 = (long) i3;
                if (maxMemory >= (j / j2) / j2) {
                    break;
                }
                i4 = i3 * 2;
            }
        } else {
            long j3 = 96000000;
            if (j > 96000000) {
                if (isMemoryBeyond3G(context) && isBigMemoryApp(context)) {
                    j3 = 192000000;
                }
                i3 = 1;
                while (true) {
                    long j4 = (long) i3;
                    if (j3 >= (j / j4) / j4) {
                        break;
                    }
                    i3 *= 2;
                }
            } else {
                i3 = 1;
            }
        }
        if (i3 != 1) {
            Log.i("BigBitmapLoadUtils", "decoding original bitmap,inSampleSize:%d", (Object) Integer.valueOf(i3));
            HashMap hashMap = new HashMap();
            hashMap.put("inSampleSize", String.valueOf(i3));
            hashMap.put("size", String.format("%dk*%dk", new Object[]{Integer.valueOf(i / 1000), Integer.valueOf(i2 / 1000)}));
            hashMap.put("model", Build.MODEL);
            GallerySamplingStatHelper.recordCountEvent("photo_editor", "decode_resize", hashMap);
        }
        return i3;
    }

    public static int getMaxMemory(Context context) {
        int largeMemoryClass = ((ActivityManager) context.getSystemService("activity")).getLargeMemoryClass();
        Log.d("BigBitmapLoadUtils", "max memory:%dM", (Object) Integer.valueOf(largeMemoryClass));
        return largeMemoryClass;
    }

    private static long getPhoneTotalMem(Context context) {
        ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
        MemoryInfo memoryInfo = new MemoryInfo();
        activityManager.getMemoryInfo(memoryInfo);
        Log.d("BigBitmapLoadUtils", "phone total memory:%d", (Object) Long.valueOf(memoryInfo.totalMem));
        return memoryInfo.totalMem;
    }

    public static boolean isBigMemoryApp(Context context) {
        return isSpecialBigMemoryDevices() || getMaxMemory(context) >= 512;
    }

    private static boolean isMemoryBeyond3G(Context context) {
        return getPhoneTotalMem(context) > 3435973836L;
    }

    public static boolean isSpecialBigMemoryDevices() {
        for (String equals : sSpecialWhiteList) {
            if (equals.equals(Build.DEVICE)) {
                return true;
            }
        }
        return false;
    }
}
