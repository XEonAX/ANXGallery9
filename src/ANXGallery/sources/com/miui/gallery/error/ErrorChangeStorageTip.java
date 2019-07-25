package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.IntentUtil;

public class ErrorChangeStorageTip extends ErrorTip {
    public ErrorChangeStorageTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        boolean gotoSettings = IntentUtil.gotoSettings(context);
        if (errorActionCallback != null) {
            errorActionCallback.onAction(getCode(), gotoSettings);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_change_storage_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_change_storage_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_storage_full_tip);
    }
}
