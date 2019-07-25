package com.miui.gallery.util;

public class CounterUtil {
    private final String mTag;
    private long mTs;

    public CounterUtil(String str) {
        this.mTag = str;
        reset();
    }

    public void reset() {
        this.mTs = System.currentTimeMillis();
    }

    public void tick(String str) {
        long currentTimeMillis = System.currentTimeMillis();
        Log.i(this.mTag, "%s cost time:%d", str, Long.valueOf(currentTimeMillis - this.mTs));
        this.mTs = currentTimeMillis;
    }
}
