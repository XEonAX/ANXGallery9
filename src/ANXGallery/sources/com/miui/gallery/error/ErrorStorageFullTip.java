package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;
import com.miui.gallery.util.IntentUtil;

public class ErrorStorageFullTip extends ErrorTip {
    public ErrorStorageFullTip(ErrorCode errorCode) {
        super(errorCode);
    }

    public void action(Context context, ErrorActionCallback errorActionCallback) {
        IntentUtil.gotoDeepClean(context);
        if (errorActionCallback != null) {
            errorActionCallback.onAction(this.mCode, true);
        }
    }

    public CharSequence getActionStr(Context context) {
        return context.getResources().getString(R.string.error_storage_full_action);
    }

    public CharSequence getMessage(Context context) {
        return context.getResources().getString(R.string.error_storage_full_msg);
    }

    public CharSequence getTitle(Context context) {
        return context.getResources().getString(R.string.error_storage_full_tip);
    }
}
