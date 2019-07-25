package com.miui.gallery.sdk.download.assist;

import android.util.Log;
import com.miui.gallery.error.core.ErrorCode;

public class DownloadFailReason {
    private final Throwable mCause;
    private final ErrorCode mCode;
    private final String mDesc;

    public DownloadFailReason(ErrorCode errorCode, String str, Throwable th) {
        this.mCode = errorCode;
        this.mDesc = str;
        this.mCause = th;
    }

    public Throwable getCause() {
        return this.mCause;
    }

    public ErrorCode getCode() {
        return this.mCode;
    }

    public String getDesc() {
        return this.mDesc;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("code: ");
        sb.append(this.mCode);
        sb.append(" desc: ");
        sb.append(this.mDesc);
        sb.append(" cause: ");
        sb.append(Log.getStackTraceString(this.mCause));
        return sb.toString();
    }
}
