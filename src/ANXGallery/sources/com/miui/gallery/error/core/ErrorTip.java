package com.miui.gallery.error.core;

import android.content.Context;

public abstract class ErrorTip {
    protected final ErrorCode mCode;

    public ErrorTip(ErrorCode errorCode) {
        this.mCode = errorCode;
    }

    public abstract void action(Context context, ErrorActionCallback errorActionCallback);

    public abstract CharSequence getActionStr(Context context);

    public ErrorCode getCode() {
        return this.mCode;
    }

    public abstract CharSequence getMessage(Context context);

    public abstract CharSequence getTitle(Context context);
}
