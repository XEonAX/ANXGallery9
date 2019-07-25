package com.miui.gallery.permission.cta;

import android.text.TextUtils;
import com.miui.gallery.preference.BaseGalleryPreferences.PermissionIntroduction;

public class CtaPermissions {
    private static final String[] CTA_PRIVACY_PERMISSIONS = {"android.permission.READ_CONTACTS", "android.permission.WRITE_CONTACTS", "android.permission.CAMERA", "android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION", "android.permission.SEND_SMS", "android.permission.RECEIVE_SMS", "android.permission.READ_SMS", "android.permission.RECORD_AUDIO", "android.permission.READ_CALL_LOG", "android.permission.WRITE_CALL_LOG"};

    public static boolean isPrivacyAllowed(String str) {
        if (TextUtils.isEmpty(str)) {
            return true;
        }
        for (String equals : CTA_PRIVACY_PERMISSIONS) {
            if (TextUtils.equals(str, equals)) {
                return PermissionIntroduction.isCtaPrivacyPermissionsAllowed(str);
            }
        }
        return true;
    }
}
