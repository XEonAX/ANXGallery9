package com.miui.gallery.share;

public class AsyncResult<T> {
    public final T mData;
    public final int mError;

    private AsyncResult(int i, T t) {
        this.mError = i;
        this.mData = t;
    }

    public static <T> AsyncResult<T> create(int i) {
        return new AsyncResult<>(i, null);
    }

    public static <T> AsyncResult<T> create(int i, T t) {
        return new AsyncResult<>(i, t);
    }

    public String toString() {
        return String.format("[error code=%d, data=%s]", new Object[]{Integer.valueOf(this.mError), this.mData});
    }
}
