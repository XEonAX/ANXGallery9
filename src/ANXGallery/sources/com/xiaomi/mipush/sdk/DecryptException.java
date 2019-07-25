package com.xiaomi.mipush.sdk;

public class DecryptException extends Exception {
    public DecryptException() {
    }

    public DecryptException(String str, Throwable th) {
        super(str, th);
    }
}
