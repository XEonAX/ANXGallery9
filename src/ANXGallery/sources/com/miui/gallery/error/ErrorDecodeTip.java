package com.miui.gallery.error;

import android.content.Context;
import com.miui.gallery.R;
import com.miui.gallery.error.core.ErrorActionCallback;
import com.miui.gallery.error.core.ErrorCode;
import com.miui.gallery.error.core.ErrorTip;

public class ErrorDecodeTip extends ErrorTip {
    public ErrorDecodeTip(ErrorCode errorCode) {
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
        return context.getResources().getString(R.string.error_decode_tip);
    }
}
