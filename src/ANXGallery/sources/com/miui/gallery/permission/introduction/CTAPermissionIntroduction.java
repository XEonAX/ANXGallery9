package com.miui.gallery.permission.introduction;

import android.app.Activity;
import android.app.DialogFragment;
import com.miui.gallery.permission.core.OnPermissionIntroduced;
import com.miui.gallery.permission.cta.CtaPermissionIntroduceDialog;
import com.miui.gallery.permission.cta.CtaPermissions;

public class CTAPermissionIntroduction {
    public void introduce(Activity activity, String str, final OnPermissionIntroduced onPermissionIntroduced) {
        if (CtaPermissions.isPrivacyAllowed(str)) {
            onPermissionIntroduced.onPermissionIntroduced(true);
            return;
        }
        StringBuilder sb = new StringBuilder();
        sb.append("cta_privacy_permission_dialog_");
        sb.append(str);
        String sb2 = sb.toString();
        DialogFragment dialogFragment = (DialogFragment) activity.getFragmentManager().findFragmentByTag(sb2);
        if (dialogFragment == null) {
            dialogFragment = CtaPermissionIntroduceDialog.newInstance(str, new OnPermissionIntroduced() {
                public void onPermissionIntroduced(boolean z) {
                    onPermissionIntroduced.onPermissionIntroduced(z);
                }
            });
        }
        if (!dialogFragment.isAdded()) {
            dialogFragment.show(activity.getFragmentManager(), sb2);
        }
    }
}
