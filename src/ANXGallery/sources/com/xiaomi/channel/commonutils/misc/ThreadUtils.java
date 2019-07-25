package com.xiaomi.channel.commonutils.misc;

import android.os.Looper;

public class ThreadUtils {
    public static void checkNotUIThread() {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            throw new RuntimeException("can't do this on ui thread");
        }
    }
}
