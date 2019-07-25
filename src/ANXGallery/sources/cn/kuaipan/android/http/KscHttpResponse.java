package cn.kuaipan.android.http;

import android.util.Log;
import cn.kuaipan.android.utils.HttpUtils;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;
import java.util.List;
import java.util.zip.GZIPInputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpMessage;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.methods.HttpUriRequest;

public class KscHttpResponse {
    private final NetCacheManager mCache;
    private Throwable mError;
    private List<HttpMessage> mMessages;
    private HttpUriRequest mOrigRequest;
    private HttpResponse mResponse;

    public KscHttpResponse(NetCacheManager netCacheManager) {
        this.mCache = netCacheManager;
    }

    public String dump() {
        StringBuilder sb = new StringBuilder();
        int i = 0;
        if (this.mMessages != null) {
            Iterator it = this.mMessages.iterator();
            int i2 = 0;
            while (it.hasNext()) {
                HttpRequest httpRequest = (HttpMessage) it.next();
                if (httpRequest instanceof HttpRequest) {
                    StringBuilder sb2 = new StringBuilder();
                    sb2.append("[Request ");
                    int i3 = i2 + 1;
                    sb2.append(i2);
                    sb2.append("]\n");
                    sb.append(sb2.toString());
                    sb.append(HttpUtils.toString(httpRequest));
                    i2 = i3;
                } else if (httpRequest instanceof HttpResponse) {
                    StringBuilder sb3 = new StringBuilder();
                    sb3.append("[Response ");
                    int i4 = i + 1;
                    sb3.append(i);
                    sb3.append("]\n");
                    sb.append(sb3.toString());
                    sb.append(HttpUtils.toString((HttpResponse) httpRequest));
                    i = i4;
                }
            }
        }
        if (sb.length() <= 0) {
            sb.append("[Origin Request]\n");
            sb.append(HttpUtils.toString((HttpRequest) this.mOrigRequest));
        }
        StringBuilder sb4 = new StringBuilder();
        sb4.append("\n[Response ");
        sb4.append(i);
        sb4.append("]\n");
        sb.append(sb4.toString());
        sb.append(HttpUtils.toString(this.mResponse));
        if (this.mError != null) {
            sb.append("\n[Error]\n");
            sb.append(Log.getStackTraceString(this.mError));
        }
        return sb.toString().replaceAll("password=.*&", "password=[secData]&");
    }

    public InputStream getContent() throws IllegalStateException, IOException {
        String str = null;
        HttpEntity entity = this.mResponse == null ? null : this.mResponse.getEntity();
        if (entity == null) {
            return null;
        }
        InputStream content = entity.getContent();
        Header contentEncoding = entity.getContentEncoding();
        if (contentEncoding != null) {
            str = contentEncoding.getValue();
        }
        return (str == null || !str.contains("gzip")) ? content : new GZIPInputStream(content);
    }

    public Throwable getError() {
        return this.mError;
    }

    public HttpResponse getResponse() {
        return this.mResponse;
    }

    public int getStatusCode() {
        if (this.mResponse != null) {
            StatusLine statusLine = this.mResponse.getStatusLine();
            if (statusLine != null) {
                return statusLine.getStatusCode();
            }
        }
        return -1;
    }

    /* access modifiers changed from: 0000 */
    public void handleResponse(KscHttpRequest kscHttpRequest, HttpResponse httpResponse, boolean z) {
        this.mOrigRequest = kscHttpRequest.getRequest();
        this.mResponse = httpResponse;
        IKscDecoder decoder = kscHttpRequest.getDecoder();
        HttpEntity entity = httpResponse.getEntity();
        if (entity == null) {
            return;
        }
        if (z) {
            httpResponse.setEntity(KscHttpEntity.getRepeatableEntity(entity, decoder, this.mCache));
        } else if (decoder != null) {
            httpResponse.setEntity(new KscHttpEntity(entity, decoder));
        }
    }

    public void release() throws IOException {
        if (this.mResponse != null && this.mResponse.getEntity() != null) {
            try {
                this.mResponse.getEntity().consumeContent();
            } catch (IOException e) {
                throw e;
            } catch (Exception e2) {
                Log.w("KscHttpResponse", "Meet exception when release a KscHttpResponse.", e2);
            } catch (Throwable th) {
                this.mResponse = null;
                throw th;
            }
            this.mResponse = null;
        }
    }

    /* access modifiers changed from: 0000 */
    public void setError(Throwable th) {
        this.mError = th;
    }

    /* access modifiers changed from: 0000 */
    public void setMessage(List<HttpMessage> list) {
        this.mMessages = list;
    }

    /* access modifiers changed from: 0000 */
    public void setOrigRequest(HttpUriRequest httpUriRequest) {
        this.mOrigRequest = httpUriRequest;
    }
}
