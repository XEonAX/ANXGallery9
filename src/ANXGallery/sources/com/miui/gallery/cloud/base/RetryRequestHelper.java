package com.miui.gallery.cloud.base;

import com.miui.gallery.cloud.base.GallerySyncResult.Builder;
import com.miui.gallery.threadpool.ThreadManager;
import com.miui.gallery.util.GallerySamplingStatHelper;
import com.miui.gallery.util.Log;
import com.xiaomi.opensdk.exception.RetriableException;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Locale;
import javax.net.ssl.SSLException;
import org.apache.http.conn.ConnectTimeoutException;

public class RetryRequestHelper {
    public static boolean isRetriableErrorCode(GallerySyncCode gallerySyncCode) {
        switch (gallerySyncCode) {
            case RETRY_ERROR:
            case NEED_RE_REQUEST:
            case TIMEOUT:
                return true;
            default:
                return false;
        }
    }

    public static boolean isRetriableException(Exception exc) {
        return (exc instanceof ConnectException) || (exc instanceof ConnectTimeoutException) || (exc instanceof SocketException) || (exc instanceof SocketTimeoutException) || (exc instanceof UnknownHostException) || (exc instanceof SSLException) || (exc instanceof RetriableException);
    }

    /* JADX WARNING: Code restructure failed: missing block: B:10:0x0016, code lost:
        r1 = r1.setCode(com.miui.gallery.cloud.base.GallerySyncCode.UNKNOWN).build();
     */
    /* JADX WARNING: Removed duplicated region for block: B:25:0x006f  */
    /* JADX WARNING: Removed duplicated region for block: B:39:0x00a2  */
    /* JADX WARNING: Removed duplicated region for block: B:44:0x00ab  */
    /* JADX WARNING: Removed duplicated region for block: B:53:0x00a0 A[SYNTHETIC] */
    public static <T> GallerySyncResult<T> retryTask(SyncTask<T> syncTask) {
        GallerySyncResult<T> gallerySyncResult;
        Exception e;
        GallerySyncResult<T> build;
        Builder builder;
        int i = 0;
        GallerySyncResult<T> gallerySyncResult2 = null;
        while (true) {
            if (i >= 3) {
                break;
            }
            try {
                gallerySyncResult = syncTask.run();
                try {
                    if (gallerySyncResult.code == GallerySyncCode.OK) {
                        if (gallerySyncResult == null) {
                            builder = new Builder();
                        }
                    } else if (isRetriableErrorCode(gallerySyncResult.code) && i < 2) {
                        if (gallerySyncResult.retryAfter > 0) {
                            Log.w("RetryRequestHelper", "%s retry after %s", syncTask.getIdentifier(), Long.valueOf(gallerySyncResult.retryAfter));
                            ThreadManager.sleepThread(Math.min(gallerySyncResult.retryAfter, 30) * 1000);
                        } else {
                            Log.d("RetryRequestHelper", "%s return %s, retry", syncTask.getIdentifier(), gallerySyncResult.code);
                        }
                        gallerySyncResult2 = gallerySyncResult;
                        i++;
                    } else if (gallerySyncResult == null) {
                        builder = new Builder();
                    }
                } catch (Exception e2) {
                    e = e2;
                    try {
                        Log.w("RetryRequestHelper", (Throwable) e);
                        build = new Builder().setCode(GallerySyncCode.UNKNOWN).setException(e).build();
                    } catch (Throwable th) {
                        th = th;
                        if (gallerySyncResult == null) {
                            gallerySyncResult = new Builder().setCode(GallerySyncCode.UNKNOWN).build();
                        }
                        statResult(syncTask.getIdentifier(), gallerySyncResult, i);
                        throw th;
                    }
                    try {
                        if (isRetriableException(e)) {
                        }
                    } catch (Throwable th2) {
                        th = th2;
                        gallerySyncResult = build;
                        if (gallerySyncResult == null) {
                        }
                        statResult(syncTask.getIdentifier(), gallerySyncResult, i);
                        throw th;
                    }
                }
            } catch (Exception e3) {
                Exception exc = e3;
                gallerySyncResult = gallerySyncResult2;
                e = exc;
                Log.w("RetryRequestHelper", (Throwable) e);
                build = new Builder().setCode(GallerySyncCode.UNKNOWN).setException(e).build();
                if (isRetriableException(e)) {
                    gallerySyncResult2 = build;
                    if (gallerySyncResult2 == null) {
                        gallerySyncResult2 = new Builder().setCode(GallerySyncCode.UNKNOWN).build();
                    }
                    statResult(syncTask.getIdentifier(), gallerySyncResult2, i);
                    return gallerySyncResult2;
                }
                gallerySyncResult2 = build;
                i++;
            } catch (Throwable th3) {
                Throwable th4 = th3;
                gallerySyncResult = gallerySyncResult2;
                th = th4;
                if (gallerySyncResult == null) {
                }
                statResult(syncTask.getIdentifier(), gallerySyncResult, i);
                throw th;
            }
        }
        if (gallerySyncResult == null) {
        }
        GallerySyncResult<T> gallerySyncResult3 = gallerySyncResult;
        statResult(syncTask.getIdentifier(), gallerySyncResult3, i);
        return gallerySyncResult;
    }

    private static void statResult(String str, GallerySyncResult gallerySyncResult, int i) {
        String format = String.format(Locale.US, "sync_request_result_%s", new Object[]{str});
        HashMap hashMap = new HashMap();
        hashMap.put("code", gallerySyncResult.code.name());
        if (gallerySyncResult.exception != null) {
            hashMap.put("exception", gallerySyncResult.exception.getMessage());
        }
        hashMap.put("retryTimes", String.valueOf(i));
        GallerySamplingStatHelper.recordCountEvent("Sync", format, hashMap);
    }
}
