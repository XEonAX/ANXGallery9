package com.nexstreaming.nexeditorsdk.exception;

public class nexSDKException extends RuntimeException {
    private static final long serialVersionUID = 1;

    public nexSDKException() {
    }

    public nexSDKException(String str) {
        super(str);
    }

    public nexSDKException(String str, Throwable th) {
        super(str, th);
    }

    public nexSDKException(Throwable th) {
        super(th);
    }
}
