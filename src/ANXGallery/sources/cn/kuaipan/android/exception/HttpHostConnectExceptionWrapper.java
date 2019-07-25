package cn.kuaipan.android.exception;

import java.net.ConnectException;
import org.apache.http.conn.HttpHostConnectException;

public class HttpHostConnectExceptionWrapper extends ConnectException {
    private static final long serialVersionUID = 5881503577351939800L;

    public HttpHostConnectExceptionWrapper(HttpHostConnectException httpHostConnectException) {
        super(httpHostConnectException.getMessage());
        Throwable cause = httpHostConnectException.getCause();
        if (cause != null) {
            initCause(cause);
        }
    }
}
