package com.miui.extraphoto.sdk;

import android.content.Context;
import android.content.Intent;
import android.text.TextUtils;
import com.miui.gallery.util.BuildUtil;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.LazyValue;
import com.nexstreaming.nexeditorsdk.nexExportFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ExtraPhotoSDK {
    private static final DeviceSupportMotionPhoto DEVICE_SUPPORT_MOTION_PHOTO = new DeviceSupportMotionPhoto();
    private static final DeviceSupportRefocus DEVICE_SUPPORT_REFOCUS = new DeviceSupportRefocus();

    private static class DeviceSupportMotionPhoto extends LazyValue<Context, Boolean> {
        private DeviceSupportMotionPhoto() {
        }

        /* access modifiers changed from: protected */
        public Boolean onInit(Context context) {
            Intent intent = new Intent("com.miui.extraphoto.action.MOTION_PHOTO_REPICK");
            intent.setPackage("com.miui.extraphoto");
            List queryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 65536);
            return Boolean.valueOf(queryIntentActivities != null && !queryIntentActivities.isEmpty());
        }
    }

    private static class DeviceSupportRefocus extends LazyValue<Context, Boolean> {
        private DeviceSupportRefocus() {
        }

        /* access modifiers changed from: protected */
        public Boolean onInit(Context context) {
            Intent intent = new Intent("com.miui.extraphoto.action.VIEW_ADVANCED_REFOCUS");
            intent.setPackage("com.miui.extraphoto");
            List queryIntentActivities = context.getPackageManager().queryIntentActivities(intent, 65536);
            return Boolean.valueOf(queryIntentActivities != null && !queryIntentActivities.isEmpty());
        }
    }

    private static String getType(long j) {
        if ((32 & j) > 0) {
            return "motion";
        }
        if ((j & 1) > 0) {
            return "refocus";
        }
        return null;
    }

    public static boolean isDeviceSupportMotionPhoto(Context context) {
        return !BuildUtil.isInternational() && ((Boolean) DEVICE_SUPPORT_MOTION_PHOTO.get(context)).booleanValue();
    }

    public static boolean isDeviceSupportRefocus(Context context) {
        return ((Boolean) DEVICE_SUPPORT_REFOCUS.get(context)).booleanValue();
    }

    public static void sendDeletePhotoStatic(long j) {
        sendTypedPhotoStatic("extra_photo_delete", j);
    }

    public static void sendEnterStatic() {
        GallerySamplingStatHelper.recordCountEvent("photo_extra", "refocus_enter");
    }

    public static void sendExposureStatic() {
        GallerySamplingStatHelper.recordCountEvent("photo_extra", "refocus_exposure");
    }

    public static void sendNewPhotoStatic(long j) {
        sendTypedPhotoStatic("extra_photo_new", j);
    }

    public static void sendResultStatic(Intent intent) {
        HashMap hashMap = new HashMap();
        if (intent == null) {
            hashMap.put("save_type", "NONE");
            sendResultStatic((Map<String, String>) hashMap);
            return;
        }
        String stringExtra = intent.getStringExtra("save_type");
        hashMap.put(stringExtra, intent.getStringExtra("save_explain"));
        hashMap.put("save_type", stringExtra);
        sendResultStatic((Map<String, String>) hashMap);
    }

    private static void sendResultStatic(Map<String, String> map) {
        GallerySamplingStatHelper.recordCountEvent("photo_extra", "refocus_save", map);
    }

    public static void sendSharePhotoStatic(long j) {
        sendTypedPhotoStatic("extra_photo_share", j);
    }

    private static void sendTypedPhotoStatic(String str, long j) {
        if (j > 0 && !TextUtils.isEmpty(str)) {
            String type = getType(j);
            if (type != null) {
                HashMap hashMap = new HashMap();
                hashMap.put(nexExportFormat.TAG_FORMAT_TYPE, type);
                GallerySamplingStatHelper.recordCountEvent("photo_extra", str, hashMap);
            }
        }
    }
}
