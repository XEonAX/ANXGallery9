package com.miui.gallery.util;

public abstract class LazyValue<Param, Value> {
    private volatile boolean mResolved = false;
    private volatile Value mValue;

    private synchronized void init(Param param) {
        if (!this.mResolved) {
            this.mValue = onInit(param);
            this.mResolved = true;
        }
    }

    public final Value get(Param param) {
        if (!this.mResolved) {
            init(param);
        }
        return this.mValue;
    }

    /* access modifiers changed from: protected */
    public abstract Value onInit(Param param);
}
