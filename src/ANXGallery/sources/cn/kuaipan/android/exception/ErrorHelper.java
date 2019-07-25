package cn.kuaipan.android.exception;

import cn.kuaipan.android.http.KscHttpResponse;
import java.io.InterruptedIOException;
import java.net.HttpRetryException;
import java.net.ProtocolException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.net.UnknownServiceException;
import java.nio.channels.ClosedByInterruptException;
import java.nio.channels.ConnectionPendingException;
import javax.net.ssl.SSLException;
import org.apache.http.ConnectionClosedException;
import org.apache.http.HttpException;
import org.apache.http.NoHttpResponseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.conn.ConnectTimeoutException;

public class ErrorHelper {
    public static void handleInterruptException(Throwable th) throws InterruptedException {
        if (th != null) {
            if (th instanceof InterruptedException) {
                throw ((InterruptedException) th);
            } else if (th instanceof ClosedByInterruptException) {
                throw ((InterruptedException) new InterruptedException().initCause(th));
            } else if ((th instanceof InterruptedIOException) && !(th instanceof ConnectTimeoutException) && !(th instanceof SocketTimeoutException)) {
                throw ((InterruptedException) new InterruptedException().initCause(th));
            }
        }
    }

    public static InterruptedException isInterrupted(Throwable th) {
        if (th == null) {
            return null;
        }
        if (th instanceof InterruptedException) {
            return (InterruptedException) th;
        }
        if (th instanceof ClosedByInterruptException) {
            return (InterruptedException) new InterruptedException().initCause(th);
        }
        if (!(th instanceof InterruptedIOException) || (th instanceof ConnectTimeoutException) || (th instanceof SocketTimeoutException)) {
            return null;
        }
        return (InterruptedException) new InterruptedException().initCause(th);
    }

    public static boolean isNetworkException(Throwable th) {
        boolean z = false;
        if (th == null) {
            return false;
        }
        if ((th instanceof IKscError) && th.getCause() != null) {
            th = th.getCause();
        }
        if ((th instanceof SocketException) || (th instanceof ConnectTimeoutException) || (th instanceof ConnectionPendingException) || (th instanceof SocketTimeoutException) || (th instanceof ConnectionClosedException) || (th instanceof HttpRetryException) || (th instanceof NoHttpResponseException) || (th instanceof ProtocolException) || (th instanceof ClientProtocolException) || (th instanceof SSLException) || (th instanceof UnknownHostException) || (th instanceof UnknownServiceException) || (th instanceof HttpException) || (th instanceof NetworkException)) {
            z = true;
        }
        return z;
    }

    public static void throwError(KscHttpResponse kscHttpResponse) throws KscException, InterruptedException {
        Throwable error = kscHttpResponse == null ? null : kscHttpResponse.getError();
        if (error == null) {
            return;
        }
        if (!(error instanceof RuntimeException)) {
            throw KscException.newException(error, kscHttpResponse == null ? "No response." : kscHttpResponse.dump());
        }
        throw ((RuntimeException) error);
    }
}
