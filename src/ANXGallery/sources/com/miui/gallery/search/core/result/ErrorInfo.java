package com.miui.gallery.search.core.result;

public class ErrorInfo {
    private Object mErrorData;
    private int mErrorStatus;

    public ErrorInfo(int i) {
        this(i, null);
    }

    public ErrorInfo(int i, Object obj) {
        this.mErrorStatus = -1;
        this.mErrorStatus = i;
        this.mErrorData = obj;
    }

    public int getErrorStatus() {
        return this.mErrorStatus;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(super.toString());
        sb.append(" code : ");
        sb.append(this.mErrorStatus);
        sb.append(", message : ");
        sb.append(this.mErrorData);
        return sb.toString();
    }
}
