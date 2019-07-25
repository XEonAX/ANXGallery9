package cn.kuaipan.android.http.client;

import android.os.SystemClock;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.SocketException;
import java.net.UnknownHostException;
import javax.net.ssl.SSLHandshakeException;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.impl.client.RequestWrapper;
import org.apache.http.protocol.HttpContext;

public class KscHttpRequestRetryHandler implements HttpRequestRetryHandler {
    private final int errorTimeOut;
    private final boolean requestSentRetryEnabled;
    private final int retryCount;

    public KscHttpRequestRetryHandler() {
        this(3, false, 0);
    }

    public KscHttpRequestRetryHandler(int i, boolean z, int i2) {
        this.retryCount = i;
        this.requestSentRetryEnabled = z;
        this.errorTimeOut = i2;
    }

    public boolean retryRequest(IOException iOException, int i, HttpContext httpContext) {
        if (iOException == null) {
            throw new IllegalArgumentException("Exception parameter may not be null");
        } else if (httpContext == null) {
            throw new IllegalArgumentException("HTTP context may not be null");
        } else if (i > this.retryCount) {
            return false;
        } else {
            if (iOException instanceof NoHttpResponseException) {
                return true;
            }
            if ((iOException instanceof InterruptedIOException) || (iOException instanceof UnknownHostException) || (iOException instanceof SSLHandshakeException)) {
                return false;
            }
            Boolean bool = (Boolean) httpContext.getAttribute("http.request_sent");
            Long l = (Long) httpContext.getAttribute("ksc.connect_start");
            RequestWrapper requestWrapper = (RequestWrapper) httpContext.getAttribute("http.request");
            URIRedirector uRIRedirector = (URIRedirector) httpContext.getAttribute("ksc.connect_redirector");
            boolean z = bool != null && bool.booleanValue();
            long longValue = l != null ? l.longValue() : 0;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            if (z && ((!this.requestSentRetryEnabled || !requestWrapper.isRepeatable()) && (!(iOException instanceof SocketException) || elapsedRealtime - longValue > ((long) this.errorTimeOut)))) {
                return false;
            }
            if (uRIRedirector != null) {
                return uRIRedirector.redirect(httpContext);
            }
            return true;
        }
    }
}
