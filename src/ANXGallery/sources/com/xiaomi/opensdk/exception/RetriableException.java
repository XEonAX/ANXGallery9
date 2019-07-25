package com.xiaomi.opensdk.exception;

import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import javax.net.ssl.SSLException;
import org.apache.http.conn.ConnectTimeoutException;

public class RetriableException extends Exception {
    private static final long serialVersionUID = 1;
    private final int ERRORCODE_NOT_DEFINE = -1;
    private final String mDescription;
    private int mErrorCode = -1;
    private final long mRetrytime;

    public RetriableException(String str, long j) {
        this.mDescription = str;
        this.mRetrytime = j;
    }

    public static boolean isRetriableException(Throwable th) {
        return (th instanceof ConnectException) || (th instanceof ConnectTimeoutException) || (th instanceof SocketException) || (th instanceof SocketTimeoutException) || (th instanceof UnknownHostException) || (th instanceof SSLException);
    }

    public String toString() {
        String simpleName = getClass().getSimpleName();
        if (this.mDescription == null) {
            return simpleName;
        }
        StringBuilder sb = new StringBuilder();
        sb.append(simpleName);
        sb.append(": ");
        sb.append(this.mDescription);
        sb.append(", retry after ");
        sb.append(this.mRetrytime / 1000);
        sb.append(" seconds");
        return sb.toString();
    }
}
