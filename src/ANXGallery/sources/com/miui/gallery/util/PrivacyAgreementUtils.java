package com.miui.gallery.util;

import android.content.Context;
import com.miui.os.Rom;
import com.xiaomi.micloudsdk.provider.GdprUtils;

public class PrivacyAgreementUtils {
    private static final boolean PRIVACY_ENABLE = (Rom.IS_MIUI && Rom.IS_INTERNATIONAL);

    static class CloudAgreementHelper {
        static boolean isCloudServiceAgreementEnable(Context context) {
            try {
                return GdprUtils.isPermissionGranted(context);
            } catch (Exception e) {
                e.printStackTrace();
                return true;
            }
        }
    }

    public static boolean isCloudServiceAgreementEnable(Context context) {
        if (!PRIVACY_ENABLE) {
            return true;
        }
        return CloudAgreementHelper.isCloudServiceAgreementEnable(context);
    }

    public static boolean isGalleryAgreementEnable(Context context) {
        return !PRIVACY_ENABLE;
    }
}
