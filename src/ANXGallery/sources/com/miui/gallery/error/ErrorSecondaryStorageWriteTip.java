package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.IntentUtil;

public class ErrorSecondaryStorageWriteTip extends ErrorTip {
    public ErrorSecondaryStorageWriteTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        boolean gotoSettings = IntentUtil.gotoSettings(context);
        if (errorActionCallback != null) {
            errorActionCallback.onAction(getCode(), gotoSettings);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_external_sdcard_write_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_external_sdcard_write_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_external_sdcard_write_tip);
    }
}
