package cn.kuaipan.android.exception;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.security.InvalidKeyException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.conn.ConnectTimeoutException;
import org.apache.http.conn.HttpHostConnectException;

public class KscException extends Exception implements IKscError {
    private static final long serialVersionUID = 7461260166746901326L;
    protected final String detailMessage;
    private final int errCode;

    public KscException(int i, String str) {
        this(i, str, null);
    }

    public KscException(int i, String str, Throwable th) {
        String str2;
        StringBuilder sb = new StringBuilder();
        sb.append("ErrCode: ");
        sb.append(i);
        if (str == null) {
            str2 = "";
        } else {
            StringBuilder sb2 = new StringBuilder();
            sb2.append("\n");
            sb2.append(str);
            str2 = sb2.toString();
        }
        sb.append(str2);
        super(sb.toString(), getSerial(th));
        this.errCode = i;
        this.detailMessage = str;
    }

    static Throwable getSerial(Throwable th) {
        if (th == null) {
            return th;
        }
        if (th instanceof HttpHostConnectException) {
            th = new HttpHostConnectExceptionWrapper((HttpHostConnectException) th);
        }
        return th;
    }

    public static KscException newException(Throwable th, String str) throws InterruptedException {
        if (th instanceof KscException) {
            return (KscException) th;
        }
        ErrorHelper.handleInterruptException(th);
        if (th instanceof ConnectException) {
            return new NetworkException(504111, str, th);
        }
        if (th instanceof SocketException) {
            return new NetworkException(504000, str, th);
        }
        if (th instanceof SocketTimeoutException) {
            return new NetworkException(504400, str, th);
        }
        if (th instanceof ConnectTimeoutException) {
            return new NetworkException(504110, str, th);
        }
        if (th instanceof ClientProtocolException) {
            return new NetworkException(504500, str, th);
        }
        if (th instanceof UnknownHostException) {
            return new NetworkException(504501, str, th);
        }
        if (th instanceof InvalidKeyException) {
            return new KscException(500009, str, th);
        }
        if (th instanceof FileNotFoundException) {
            return new KscException(403001, str, th);
        }
        if (th instanceof IOException) {
            return new KscException(403000, str, th);
        }
        if (!(th instanceof RuntimeException)) {
            return new KscException(403999, str, th);
        }
        throw ((RuntimeException) th);
    }

    public int getErrorCode() {
        return this.errCode;
    }

    public String getSimpleMessage() {
        String name = getClass().getName();
        StringBuilder sb = new StringBuilder();
        sb.append(name);
        sb.append("(ErrCode: ");
        sb.append(this.errCode);
        sb.append(")");
        String sb2 = sb.toString();
        if (this.detailMessage == null || this.detailMessage.length() >= 100) {
            return sb2;
        }
        StringBuilder sb3 = new StringBuilder();
        sb3.append(sb2);
        sb3.append(": ");
        sb3.append(this.detailMessage);
        return sb3.toString();
    }
}
