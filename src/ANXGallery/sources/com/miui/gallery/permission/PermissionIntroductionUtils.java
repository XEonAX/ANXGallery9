package com.miui.gallery.permission;

import android.app.Activity;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.introduction.CTAPermissionIntroduction;
import com.miui.gallery.permission.introduction.RuntimePermissionsIntroduction;
import com.miui.gallery.util.BaseBuildUtil;

public class PermissionIntroductionUtils {
    public static void showPermissionIntroduction(Activity activity, String str, OnPermissionIntroduced onPermissionIntroduced) {
        if (AgreementsUtils.isKoreaRegion()) {
            new RuntimePermissionsIntroduction().introduce(activity, str, onPermissionIntroduced);
        } else if (!BaseBuildUtil.isInternational()) {
            new CTAPermissionIntroduction().introduce(activity, str, onPermissionIntroduced);
        } else {
            onPermissionIntroduced.onPermissionIntroduced(true);
        }
    }
}
