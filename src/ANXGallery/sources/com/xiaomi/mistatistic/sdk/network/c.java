package com.xiaomi.mistatistic.sdk.network;

import android.os.SystemClock;
import android.text.TextUtils;
import com.xiaomi.mistatistic.sdk.controller.i;
import com.xiaomi.mistatistic.sdk.controller.j;
import com.xiaomi.mistatistic.sdk.data.HttpEvent;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.ProtocolException;
import java.net.URL;
import java.security.Permission;
import java.util.List;
import java.util.Map;

/* compiled from: MIHttpConnection */
public class c extends HttpURLConnection {
    private int a = -1;
    private long b = SystemClock.elapsedRealtime();
    private long c;
    private long d;
    private boolean e = false;
    private String f = null;
    private String g = null;
    private f h;
    private e i;
    private HttpURLConnection j;

    public c(HttpURLConnection httpURLConnection) {
        super(httpURLConnection.getURL());
        this.j = httpURLConnection;
    }

    private boolean a(String str) {
        return b.a(str) || b.d(str);
    }

    private int c() {
        int i2 = 0;
        int a2 = this.i != null ? this.i.a() : 0;
        if (this.h != null) {
            i2 = this.h.a();
        }
        return a2 + 1100 + i2 + getURL().toString().getBytes().length;
    }

    private void d() {
        String host = this.url.getHost();
        if (this.f == null && host != null && !a(host)) {
            a.a().execute(new Runnable() {
                public void run() {
                    c.this.e();
                }
            });
        }
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Code restructure failed: missing block: B:21:0x0049, code lost:
        return;
     */
    public synchronized void e() {
        if (TextUtils.isEmpty(this.f)) {
            if (!this.e) {
                String host = this.url.getHost();
                if (this.f == null && host != null && !a(host)) {
                    try {
                        this.f = InetAddress.getByName(host).getHostAddress();
                    } catch (Exception e2) {
                        String str = "MHC";
                        StringBuilder sb = new StringBuilder();
                        sb.append("can not get Ip exception: ");
                        sb.append(e2.getMessage());
                        j.d(str, sb.toString());
                    }
                }
            }
        }
        return;
    }

    private int f() {
        if (this.a != -1) {
            return this.a;
        }
        try {
            return this.j.getResponseCode();
        } catch (Exception unused) {
            return -1;
        }
    }

    private synchronized void g() {
        if (this.c == 0) {
            this.c = SystemClock.elapsedRealtime();
            this.b = this.c;
        }
    }

    private synchronized void h() {
        if (this.d == 0 && this.c != 0) {
            this.d = SystemClock.elapsedRealtime() - this.c;
        }
    }

    public void a() {
        b();
    }

    public void a(long j2) {
        this.b = j2;
    }

    /* access modifiers changed from: 0000 */
    public void a(Exception exc) {
        if (!this.e) {
            this.e = true;
            HttpEvent httpEvent = new HttpEvent(getURL().toString(), -1, f(), exc.getClass().getSimpleName());
            httpEvent.setIp(this.f);
            httpEvent.setRequestId(this.g);
            i.a().a(httpEvent);
        }
    }

    public void addRequestProperty(String str, String str2) {
        this.j.addRequestProperty(str, str2);
    }

    /* access modifiers changed from: 0000 */
    public void b() {
        if (!this.e) {
            this.e = true;
            HttpEvent httpEvent = new HttpEvent(getURL().toString(), SystemClock.elapsedRealtime() - this.b, (long) c(), f());
            httpEvent.setIp(this.f);
            httpEvent.setFirstPacketCost(this.d);
            httpEvent.setRequestId(this.g);
            i.a().a(httpEvent);
        }
    }

    public void connect() throws IOException {
        try {
            this.j.connect();
        } catch (IOException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public void disconnect() {
        this.j.disconnect();
        b();
    }

    public boolean getAllowUserInteraction() {
        return this.j.getAllowUserInteraction();
    }

    public int getConnectTimeout() {
        return this.j.getConnectTimeout();
    }

    public Object getContent() throws IOException {
        try {
            return this.j.getContent();
        } catch (IOException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public Object getContent(Class[] clsArr) throws IOException {
        try {
            return this.j.getContent(clsArr);
        } catch (IOException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public String getContentEncoding() {
        return this.j.getContentEncoding();
    }

    public int getContentLength() {
        return this.j.getContentLength();
    }

    public String getContentType() {
        return this.j.getContentType();
    }

    public long getDate() {
        return this.j.getDate();
    }

    public boolean getDefaultUseCaches() {
        return this.j.getDefaultUseCaches();
    }

    public boolean getDoInput() {
        return this.j.getDoInput();
    }

    public boolean getDoOutput() {
        return this.j.getDoOutput();
    }

    public InputStream getErrorStream() {
        return this.j.getErrorStream();
    }

    public long getExpiration() {
        return this.j.getExpiration();
    }

    public String getHeaderField(int i2) {
        return this.j.getHeaderField(i2);
    }

    public String getHeaderField(String str) {
        return this.j.getHeaderField(str);
    }

    public long getHeaderFieldDate(String str, long j2) {
        return this.j.getHeaderFieldDate(str, j2);
    }

    public int getHeaderFieldInt(String str, int i2) {
        return this.j.getHeaderFieldInt(str, i2);
    }

    public String getHeaderFieldKey(int i2) {
        return this.j.getHeaderFieldKey(i2);
    }

    public Map<String, List<String>> getHeaderFields() {
        return this.j.getHeaderFields();
    }

    public long getIfModifiedSince() {
        return this.j.getIfModifiedSince();
    }

    public InputStream getInputStream() throws IOException {
        try {
            g();
            this.i = new e(this, this.j.getInputStream());
            h();
            d();
            return this.i;
        } catch (IOException e2) {
            e();
            a((Exception) e2);
            throw e2;
        }
    }

    public boolean getInstanceFollowRedirects() {
        return this.j.getInstanceFollowRedirects();
    }

    public long getLastModified() {
        return this.j.getLastModified();
    }

    public OutputStream getOutputStream() throws IOException {
        try {
            g();
            this.h = new f(this, this.j.getOutputStream());
            h();
            d();
            return this.h;
        } catch (IOException e2) {
            e();
            a((Exception) e2);
            throw e2;
        }
    }

    public Permission getPermission() throws IOException {
        try {
            return this.j.getPermission();
        } catch (ProtocolException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public int getReadTimeout() {
        return this.j.getReadTimeout();
    }

    public String getRequestMethod() {
        return this.j.getRequestMethod();
    }

    public Map<String, List<String>> getRequestProperties() {
        return this.j.getRequestProperties();
    }

    public String getRequestProperty(String str) {
        return this.j.getRequestProperty(str);
    }

    public int getResponseCode() throws IOException {
        try {
            g();
            this.a = this.j.getResponseCode();
            h();
            return this.a;
        } catch (ProtocolException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public String getResponseMessage() throws IOException {
        try {
            return this.j.getResponseMessage();
        } catch (ProtocolException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public URL getURL() {
        return this.j.getURL();
    }

    public boolean getUseCaches() {
        return this.j.getUseCaches();
    }

    public void setAllowUserInteraction(boolean z) {
        this.j.setAllowUserInteraction(z);
    }

    public void setChunkedStreamingMode(int i2) {
        this.j.setChunkedStreamingMode(i2);
    }

    public void setConnectTimeout(int i2) {
        this.j.setConnectTimeout(i2);
    }

    public void setDefaultUseCaches(boolean z) {
        this.j.setDefaultUseCaches(z);
    }

    public void setDoInput(boolean z) {
        this.j.setDoInput(z);
    }

    public void setDoOutput(boolean z) {
        this.j.setDoOutput(z);
    }

    public void setFixedLengthStreamingMode(int i2) {
        this.j.setFixedLengthStreamingMode(i2);
    }

    public void setFixedLengthStreamingMode(long j2) {
        try {
            this.j.getClass().getDeclaredMethod("setFixedLengthStreamingMode", new Class[]{Long.TYPE}).invoke(this.j, new Object[]{Long.valueOf(j2)});
        } catch (Exception e2) {
            throw new UnsupportedOperationException(e2);
        }
    }

    public void setIfModifiedSince(long j2) {
        this.j.setIfModifiedSince(j2);
    }

    public void setInstanceFollowRedirects(boolean z) {
        this.j.setInstanceFollowRedirects(z);
    }

    public void setReadTimeout(int i2) {
        this.j.setReadTimeout(i2);
    }

    public void setRequestMethod(String str) throws ProtocolException {
        try {
            this.j.setRequestMethod(str);
        } catch (ProtocolException e2) {
            a((Exception) e2);
            throw e2;
        }
    }

    public void setRequestProperty(String str, String str2) {
        if ("x-mistats-header".equals(str)) {
            this.g = str2;
        }
        this.j.setRequestProperty(str, str2);
    }

    public void setUseCaches(boolean z) {
        this.j.setUseCaches(z);
    }

    public String toString() {
        return this.j.toString();
    }

    public boolean usingProxy() {
        return this.j.usingProxy();
    }
}
