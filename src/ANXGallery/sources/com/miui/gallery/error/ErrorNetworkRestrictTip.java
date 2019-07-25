package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.IntentUtil;

public class ErrorNetworkRestrictTip extends ErrorTip {
    public ErrorNetworkRestrictTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        boolean gotoAppDetailTraffic = IntentUtil.gotoAppDetailTraffic(context);
        if (errorActionCallback != null) {
            errorActionCallback.onAction(getCode(), gotoAppDetailTraffic);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_network_restrict_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_network_restrict_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_network_restrict_tip);
    }
}
