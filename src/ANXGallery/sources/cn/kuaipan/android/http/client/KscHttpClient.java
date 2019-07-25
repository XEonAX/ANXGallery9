package cn.kuaipan.android.http.client;

import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import cn.kuaipan.android.utils.ContextUtils;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URI;
import java.util.LinkedList;
import java.util.List;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpRequest;
import org.apache.http.HttpRequestInterceptor;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.client.protocol.RequestDefaultHeaders;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.params.ConnManagerParams;
import org.apache.http.conn.params.ConnPerRoute;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.DefaultConnectionReuseStrategy;
import org.apache.http.impl.NoConnectionReuseStrategy;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.RequestWrapper;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.BasicHttpProcessor;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.RequestConnControl;
import org.apache.http.protocol.RequestContent;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.keyczar.Keyczar;

public class KscHttpClient extends DefaultHttpClient {
    private static String sUserAgent;
    /* access modifiers changed from: private */
    public volatile LoggingConfiguration curlConfiguration;
    private final boolean mForKssTransmission;
    private final boolean mKeepAlive;
    private RuntimeException mLeakedException;
    private final boolean mRequestSentRetryEnabled;

    private class CurlLogger implements HttpRequestInterceptor {
        private CurlLogger() {
        }

        public void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException {
            LoggingConfiguration access$300 = KscHttpClient.this.curlConfiguration;
            boolean z = httpRequest instanceof HttpUriRequest;
            if (z) {
                Log.i("CurlLogger", KscHttpClient.toCurl((HttpUriRequest) httpRequest, false));
            }
            if (access$300 != null && access$300.isLoggable() && z) {
                access$300.println(KscHttpClient.toCurl((HttpUriRequest) httpRequest, false));
            }
        }
    }

    private static class LoggingConfiguration {
        private final int level;
        private final String tag;

        /* access modifiers changed from: private */
        public boolean isLoggable() {
            return Log.isLoggable(this.tag, this.level);
        }

        /* access modifiers changed from: private */
        public void println(String str) {
            Log.println(this.level, this.tag, str);
        }
    }

    private class TimeMarker implements HttpRequestInterceptor {
        private TimeMarker() {
        }

        public void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException {
            httpContext.setAttribute("ksc.connect_start", Long.valueOf(SystemClock.elapsedRealtime()));
            List list = (List) httpContext.getAttribute("ksc.message_list");
            if (list == null) {
                list = new LinkedList();
                httpContext.setAttribute("ksc.message_list", list);
            }
            list.add(httpRequest);
        }
    }

    private KscHttpClient(ClientConnectionManager clientConnectionManager, HttpParams httpParams) {
        super(clientConnectionManager, httpParams);
        this.mLeakedException = new IllegalStateException("AndroidHttpClient created and never closed");
        this.mForKssTransmission = true;
        this.mKeepAlive = true;
        this.mRequestSentRetryEnabled = true;
    }

    private KscHttpClient(ClientConnectionManager clientConnectionManager, HttpParams httpParams, boolean z, boolean z2) {
        super(clientConnectionManager, httpParams);
        this.mLeakedException = new IllegalStateException("AndroidHttpClient created and never closed");
        this.mForKssTransmission = false;
        this.mKeepAlive = z;
        this.mRequestSentRetryEnabled = z2;
    }

    private static String getDefaultUserAgent() {
        if (sUserAgent == null) {
            sUserAgent = String.format("KscClient/1.0 (Linux; U; Android %s)", new Object[]{ContextUtils.getFrameworkVersion()});
        }
        return sUserAgent;
    }

    private static HttpParams getHttpParams(String str) {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpConnectionParams.setStaleCheckingEnabled(basicHttpParams, false);
        HttpConnectionParams.setConnectionTimeout(basicHttpParams, 15000);
        HttpConnectionParams.setSoTimeout(basicHttpParams, 30000);
        HttpConnectionParams.setSocketBufferSize(basicHttpParams, 8192);
        ConnManagerParams.setTimeout(basicHttpParams, 30000);
        ConnManagerParams.setMaxTotalConnections(basicHttpParams, 30);
        ConnManagerParams.setMaxConnectionsPerRoute(basicHttpParams, new ConnPerRoute() {
            public int getMaxForRoute(HttpRoute httpRoute) {
                return 32;
            }
        });
        HttpClientParams.setRedirecting(basicHttpParams, true);
        HttpProtocolParams.setUseExpectContinue(basicHttpParams, false);
        HttpProtocolParams.setContentCharset(basicHttpParams, Keyczar.DEFAULT_ENCODING);
        HttpProtocolParams.setHttpElementCharset(basicHttpParams, Keyczar.DEFAULT_ENCODING);
        if (TextUtils.isEmpty(str)) {
            str = getDefaultUserAgent();
        }
        HttpProtocolParams.setUserAgent(basicHttpParams, str);
        return basicHttpParams;
    }

    private static Scheme ignoreAllCertificate() {
        TrustManager[] trustManagerArr = {new IgnoreCertificationTrustManger()};
        try {
            SSLContext instance = SSLContext.getInstance("TLS");
            instance.init(null, trustManagerArr, null);
            return new Scheme("https", new SSLSocketFactory(instance.getSocketFactory()), 443);
        } catch (Exception unused) {
            Log.println(7, "KscHttpClient", "System can't support TLS.");
            return null;
        }
    }

    public static KscHttpClient newInstance(String str, boolean z, boolean z2) {
        HttpParams httpParams = getHttpParams(str);
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(ignoreAllCertificate());
        return new KscHttpClient(new ThreadSafeClientConnManager(httpParams, schemeRegistry), httpParams, z, z2);
    }

    public static KscHttpClient newKssInstance(String str) {
        HttpParams httpParams = getHttpParams(str);
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
        return new KscHttpClient(new ThreadSafeClientConnManager(httpParams, schemeRegistry), httpParams);
    }

    /* access modifiers changed from: private */
    public static String toCurl(HttpUriRequest httpUriRequest, boolean z) throws IOException {
        Header[] allHeaders;
        StringBuilder sb = new StringBuilder();
        sb.append("curl ");
        for (Header header : httpUriRequest.getAllHeaders()) {
            if (z || (!header.getName().equals("Authorization") && !header.getName().equals("Cookie"))) {
                sb.append("--header \"");
                sb.append(header.toString().trim());
                sb.append("\" ");
            }
        }
        URI uri = httpUriRequest.getURI();
        if (httpUriRequest instanceof RequestWrapper) {
            HttpUriRequest original = ((RequestWrapper) httpUriRequest).getOriginal();
            if (original instanceof HttpUriRequest) {
                uri = original.getURI();
            }
        }
        sb.append("\"");
        sb.append(uri);
        sb.append("\"");
        if (httpUriRequest instanceof HttpEntityEnclosingRequest) {
            HttpEntity entity = ((HttpEntityEnclosingRequest) httpUriRequest).getEntity();
            if (entity != null && entity.isRepeatable()) {
                if (entity.getContentLength() < 1024) {
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    entity.writeTo(byteArrayOutputStream);
                    String byteArrayOutputStream2 = byteArrayOutputStream.toString();
                    sb.append(" --data-ascii \"");
                    sb.append(byteArrayOutputStream2);
                    sb.append("\"");
                } else {
                    sb.append(" [TOO MUCH DATA TO INCLUDE]");
                }
            }
        }
        return sb.toString();
    }

    /* access modifiers changed from: protected */
    public ConnectionReuseStrategy createConnectionReuseStrategy() {
        return this.mKeepAlive ? new DefaultConnectionReuseStrategy() : new NoConnectionReuseStrategy();
    }

    /* access modifiers changed from: protected */
    public BasicHttpProcessor createHttpProcessor() {
        BasicHttpProcessor basicHttpProcessor;
        if (this.mForKssTransmission) {
            basicHttpProcessor = new BasicHttpProcessor();
            basicHttpProcessor.addInterceptor(new RequestDefaultHeaders());
            basicHttpProcessor.addInterceptor(new RequestContent());
            basicHttpProcessor.addInterceptor(new RequestTargetHost());
            basicHttpProcessor.addInterceptor(new RequestConnControl());
            basicHttpProcessor.addInterceptor(new RequestUserAgent());
        } else {
            basicHttpProcessor = KscHttpClient.super.createHttpProcessor();
        }
        basicHttpProcessor.addRequestInterceptor(new TimeMarker());
        basicHttpProcessor.addRequestInterceptor(new CurlLogger());
        return basicHttpProcessor;
    }

    /* access modifiers changed from: protected */
    public HttpRequestRetryHandler createHttpRequestRetryHandler() {
        return new KscHttpRequestRetryHandler(3, this.mRequestSentRetryEnabled, 10000);
    }

    /* access modifiers changed from: protected */
    public HttpRoutePlanner createHttpRoutePlanner() {
        return new KscHttpRoutePlanner(getConnectionManager().getSchemeRegistry());
    }

    /* access modifiers changed from: protected */
    public RedirectHandler createRedirectHandler() {
        return new KscRedirectHandler();
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        KscHttpClient.super.finalize();
    }
}
