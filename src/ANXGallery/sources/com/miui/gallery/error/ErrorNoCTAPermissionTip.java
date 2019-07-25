package com.miui.gallery.error;

import android.app.Activity;
import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.agreement.AgreementsUtils;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;

public class ErrorNoCTAPermissionTip extends ErrorTip {
    public ErrorNoCTAPermissionTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        boolean z;
        if (context instanceof Activity) {
            AgreementsUtils.showNetworkingAgreement((Activity) context, null);
            z = true;
        } else {
            z = false;
        }
        if (errorActionCallback != null) {
            errorActionCallback.onAction(this.mCode, z);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_no_cta_permission_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_no_cta_permission_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_no_cta_permission_tip);
    }
}
