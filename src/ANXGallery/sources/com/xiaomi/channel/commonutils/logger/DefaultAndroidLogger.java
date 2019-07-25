package com.xiaomi.channel.commonutils.logger;

import android.util.Log;

public class DefaultAndroidLogger implements LoggerInterface {
    private String mTag = "xiaomi";

    public void log(String str) {
        Log.v(this.mTag, str);
    }

    public void log(String str, Throwable th) {
        Log.v(this.mTag, str, th);
    }
}
