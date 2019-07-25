package com.android.volley.toolbox;

import android.os.SystemClock;
import com.android.volley.Cache.Entry;
import com.android.volley.Header;
import com.android.volley.Network;
import com.android.volley.NetworkResponse;
import com.android.volley.Request;
import com.android.volley.RetryPolicy;
import com.android.volley.ServerError;
import com.android.volley.VolleyError;
import com.android.volley.VolleyLog;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.SocketTimeoutException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

public class BasicNetwork implements Network {
    protected static final boolean DEBUG = VolleyLog.DEBUG;
    private final BaseHttpStack mBaseHttpStack;
    @Deprecated
    protected final HttpStack mHttpStack;
    protected final ByteArrayPool mPool;

    public BasicNetwork(BaseHttpStack baseHttpStack) {
        this(baseHttpStack, new ByteArrayPool(4096));
    }

    public BasicNetwork(BaseHttpStack baseHttpStack, ByteArrayPool byteArrayPool) {
        this.mBaseHttpStack = baseHttpStack;
        this.mHttpStack = baseHttpStack;
        this.mPool = byteArrayPool;
    }

    private static void attemptRetryOnException(String str, Request<?> request, VolleyError volleyError) throws VolleyError {
        RetryPolicy retryPolicy = request.getRetryPolicy();
        int timeoutMs = request.getTimeoutMs();
        try {
            retryPolicy.retry(volleyError);
            request.addMarker(String.format("%s-retry [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
        } catch (VolleyError e) {
            request.addMarker(String.format("%s-timeout-giveup [timeout=%s]", new Object[]{str, Integer.valueOf(timeoutMs)}));
            throw e;
        }
    }

    private static List<Header> combineHeaders(List<Header> list, Entry entry) {
        TreeSet treeSet = new TreeSet(String.CASE_INSENSITIVE_ORDER);
        if (!list.isEmpty()) {
            for (Header name : list) {
                treeSet.add(name.getName());
            }
        }
        ArrayList arrayList = new ArrayList(list);
        if (entry.allResponseHeaders != null) {
            if (!entry.allResponseHeaders.isEmpty()) {
                for (Header header : entry.allResponseHeaders) {
                    if (!treeSet.contains(header.getName())) {
                        arrayList.add(header);
                    }
                }
            }
        } else if (!entry.responseHeaders.isEmpty()) {
            for (Map.Entry entry2 : entry.responseHeaders.entrySet()) {
                if (!treeSet.contains(entry2.getKey())) {
                    arrayList.add(new Header((String) entry2.getKey(), (String) entry2.getValue()));
                }
            }
        }
        return arrayList;
    }

    private Map<String, String> getCacheHeaders(Entry entry) {
        if (entry == null) {
            return Collections.emptyMap();
        }
        HashMap hashMap = new HashMap();
        if (entry.etag != null) {
            hashMap.put("If-None-Match", entry.etag);
        }
        if (entry.lastModified > 0) {
            hashMap.put("If-Modified-Since", HttpHeaderParser.formatEpochAsRfc1123(entry.lastModified));
        }
        return hashMap;
    }

    /* JADX WARNING: Removed duplicated region for block: B:23:0x0046 A[SYNTHETIC, Splitter:B:23:0x0046] */
    private byte[] inputStreamToBytes(InputStream inputStream, int i) throws IOException, ServerError {
        PoolingByteArrayOutputStream poolingByteArrayOutputStream = new PoolingByteArrayOutputStream(this.mPool, i);
        byte[] bArr = null;
        if (inputStream != null) {
            try {
                byte[] buf = this.mPool.getBuf(1024);
                while (true) {
                    try {
                        int read = inputStream.read(buf);
                        if (read == -1) {
                            break;
                        }
                        poolingByteArrayOutputStream.write(buf, 0, read);
                    } catch (Throwable th) {
                        byte[] bArr2 = buf;
                        th = th;
                        bArr = bArr2;
                        if (inputStream != null) {
                        }
                        this.mPool.returnBuf(bArr);
                        poolingByteArrayOutputStream.close();
                        throw th;
                    }
                }
                byte[] byteArray = poolingByteArrayOutputStream.toByteArray();
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException unused) {
                        VolleyLog.v("Error occurred when closing InputStream", new Object[0]);
                    }
                }
                this.mPool.returnBuf(buf);
                poolingByteArrayOutputStream.close();
                return byteArray;
            } catch (Throwable th2) {
                th = th2;
                if (inputStream != null) {
                    try {
                        inputStream.close();
                    } catch (IOException unused2) {
                        VolleyLog.v("Error occurred when closing InputStream", new Object[0]);
                    }
                }
                this.mPool.returnBuf(bArr);
                poolingByteArrayOutputStream.close();
                throw th;
            }
        } else {
            throw new ServerError();
        }
    }

    private void logSlowRequests(long j, Request<?> request, byte[] bArr, int i) {
        if (DEBUG || j > 3000) {
            String str = "HTTP response for request=<%s> [lifetime=%d], [size=%s], [rc=%d], [retryCount=%s]";
            Object[] objArr = new Object[5];
            objArr[0] = request;
            objArr[1] = Long.valueOf(j);
            objArr[2] = bArr != null ? Integer.valueOf(bArr.length) : "null";
            objArr[3] = Integer.valueOf(i);
            objArr[4] = Integer.valueOf(request.getRetryPolicy().getCurrentRetryCount());
            VolleyLog.d(str, objArr);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:15:0x005f, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x0060, code lost:
        r15 = null;
        r19 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:37:0x00ad, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:38:0x00af, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:39:0x00b0, code lost:
        r1 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:40:0x00b1, code lost:
        r19 = r1;
        r15 = r20;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:41:0x00b6, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:42:0x00b7, code lost:
        r1 = r13;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:45:0x00be, code lost:
        r0 = e;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:46:0x00bf, code lost:
        r19 = r1;
        r12 = null;
        r15 = null;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:48:0x00c5, code lost:
        r0 = r12.getStatusCode();
        com.android.volley.VolleyLog.e("Unexpected response code %d for %s", java.lang.Integer.valueOf(r0), r29.getUrl());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:49:0x00de, code lost:
        if (r15 != null) goto L_0x00e0;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:50:0x00e0, code lost:
        r13 = new com.android.volley.NetworkResponse(r0, r15, false, android.os.SystemClock.elapsedRealtime() - r9, r19);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:51:0x00f1, code lost:
        if (r0 == 401) goto L_0x012d;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:55:0x00fa, code lost:
        if (r0 < 400) goto L_0x0107;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:59:0x0106, code lost:
        throw new com.android.volley.ClientError(r13);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:61:0x0109, code lost:
        if (r0 < 500) goto L_0x0127;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:65:0x0113, code lost:
        if (r29.shouldRetryServerErrors() != false) goto L_0x0115;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:66:0x0115, code lost:
        attemptRetryOnException("server", r8, new com.android.volley.ServerError(r13));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:68:0x0126, code lost:
        throw new com.android.volley.ServerError(r13);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:70:0x012c, code lost:
        throw new com.android.volley.ServerError(r13);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:71:0x012d, code lost:
        attemptRetryOnException("auth", r8, new com.android.volley.AuthFailureError(r13));
     */
    /* JADX WARNING: Code restructure failed: missing block: B:72:0x0139, code lost:
        attemptRetryOnException("network", r8, new com.android.volley.NetworkError());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:74:0x014a, code lost:
        throw new com.android.volley.NoConnectionError(r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:75:0x014b, code lost:
        r0 = move-exception;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:76:0x014c, code lost:
        r2 = new java.lang.StringBuilder();
        r2.append("Bad URL ");
        r2.append(r29.getUrl());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:77:0x0166, code lost:
        throw new java.lang.RuntimeException(r2.toString(), r0);
     */
    /* JADX WARNING: Code restructure failed: missing block: B:78:0x0167, code lost:
        attemptRetryOnException("socket", r8, new com.android.volley.TimeoutError());
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:48:0x00c5  */
    /* JADX WARNING: Removed duplicated region for block: B:75:0x014b A[ExcHandler: MalformedURLException (r0v1 'e' java.net.MalformedURLException A[CUSTOM_DECLARE]), Splitter:B:2:0x000e] */
    /* JADX WARNING: Removed duplicated region for block: B:79:? A[ExcHandler: SocketTimeoutException (unused java.net.SocketTimeoutException), SYNTHETIC, Splitter:B:2:0x000e] */
    /* JADX WARNING: Removed duplicated region for block: B:86:0x0145 A[SYNTHETIC] */
    public NetworkResponse performRequest(Request<?> request) throws VolleyError {
        HttpResponse httpResponse;
        List headers;
        Request<?> request2 = request;
        long elapsedRealtime = SystemClock.elapsedRealtime();
        while (true) {
            List emptyList = Collections.emptyList();
            try {
                httpResponse = this.mBaseHttpStack.executeRequest(request2, getCacheHeaders(request.getCacheEntry()));
                int statusCode = httpResponse.getStatusCode();
                headers = httpResponse.getHeaders();
                if (statusCode == 304) {
                    Entry cacheEntry = request.getCacheEntry();
                    if (cacheEntry == null) {
                        NetworkResponse networkResponse = new NetworkResponse(304, (byte[]) null, true, SystemClock.elapsedRealtime() - elapsedRealtime, headers);
                        return networkResponse;
                    }
                    NetworkResponse networkResponse2 = new NetworkResponse(304, cacheEntry.data, true, SystemClock.elapsedRealtime() - elapsedRealtime, combineHeaders(headers, cacheEntry));
                    return networkResponse2;
                }
                InputStream content = httpResponse.getContent();
                byte[] inputStreamToBytes = content != null ? inputStreamToBytes(content, httpResponse.getContentLength()) : new byte[0];
                logSlowRequests(SystemClock.elapsedRealtime() - elapsedRealtime, request, inputStreamToBytes, statusCode);
                if (statusCode < 200 || statusCode > 299) {
                    List list = headers;
                } else {
                    List list2 = headers;
                    r13 = r13;
                    NetworkResponse networkResponse3 = new NetworkResponse(statusCode, inputStreamToBytes, false, SystemClock.elapsedRealtime() - elapsedRealtime, list2);
                    return networkResponse3;
                }
            } catch (SocketTimeoutException unused) {
            } catch (MalformedURLException e) {
            } catch (IOException e2) {
                e = e2;
                List list3 = emptyList;
                byte[] bArr = null;
                if (httpResponse == null) {
                }
            }
        }
        List list4 = headers;
        throw new IOException();
    }
}
