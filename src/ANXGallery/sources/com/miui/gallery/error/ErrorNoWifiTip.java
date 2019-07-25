package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;

public class ErrorNoWifiTip extends ErrorTip {
    public ErrorNoWifiTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        if (errorActionCallback != null) {
            errorActionCallback.onAction(this.mCode, false);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_no_wifi_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_no_wifi_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_no_wifi_tip);
    }
}
