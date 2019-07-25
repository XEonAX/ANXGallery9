package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;

public class ErrorOverQuotaTip extends ErrorTip {
    public ErrorOverQuotaTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        if (errorActionCallback != null) {
            errorActionCallback.onAction(this.mCode, false);
        }
    }

    public CharSequence getActionStr(Context context) {
        return null;
    }

    public CharSequence getMessage(Context context) {
        return null;
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_over_quota_tip);
    }
}
