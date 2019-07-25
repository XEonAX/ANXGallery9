package com.xiaomi.opensdk.exception;

public class ServerException extends Exception {
    private int statusCode;

    public ServerException(String str) {
        super(str);
    }

    public ServerException(String str, Throwable th) {
        super(str, th);
    }

    public int getStatusCode() {
        return this.statusCode;
    }
}
