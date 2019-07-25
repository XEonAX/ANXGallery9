package com.xiaomi.micloudsdk.provider;

import android.content.Context;
import android.provider.Settings.System;
import miui.cloud.AppConstants;

public class GdprUtils {
    public static boolean isGdprAvailable(Context context) {
        return ((Integer) AppConstants.CLOUD_SDK_LEVEL.get(context)).intValue() > 23;
    }

    public static boolean isPermissionGranted(Context context) {
        boolean z = true;
        if (!isGdprAvailable(context)) {
            return true;
        }
        if (System.getInt(context.getContentResolver(), "micloud_gdpr_permission_granted", 1) == 0) {
            z = false;
        }
        return z;
    }
}
