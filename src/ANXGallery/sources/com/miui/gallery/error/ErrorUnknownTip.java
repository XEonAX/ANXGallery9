package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.IntentUtil;

public class ErrorUnknownTip extends ErrorTip {
    public ErrorUnknownTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        boolean gotoBugreport = IntentUtil.gotoBugreport(context);
        if (errorActionCallback != null) {
            errorActionCallback.onAction(getCode(), gotoBugreport);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_unknown_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_unknown_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_unknown_tip);
    }
}
