package cn.kuaipan.android.http.client;

import cn.kuaipan.android.utils.NetworkHelpers;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.conn.params.ConnRouteParams;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.impl.conn.DefaultHttpRoutePlanner;
import org.apache.http.params.AbstractHttpParams;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpParams;
import org.apache.http.protocol.HttpContext;

public class KscHttpRoutePlanner extends DefaultHttpRoutePlanner {

    private class KscHttpParams extends AbstractHttpParams {
        private final HttpParams mExtParams;
        private final HttpParams mOrgParams;

        public KscHttpParams(HttpParams httpParams) {
            this.mOrgParams = httpParams;
            this.mExtParams = new BasicHttpParams();
        }

        private KscHttpParams(HttpParams httpParams, HttpParams httpParams2) {
            this.mOrgParams = httpParams;
            this.mExtParams = httpParams2;
        }

        /* JADX WARNING: type inference failed for: r0v0, types: [org.apache.http.params.HttpParams, cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v0, types: [org.apache.http.params.HttpParams, cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams]
  assigns: [cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams]
  uses: [org.apache.http.params.HttpParams]
  mth insns count: 6
        	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
        	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
        	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$0(DepthTraversal.java:13)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:13)
        	at jadx.core.ProcessClass.process(ProcessClass.java:30)
        	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
        	at java.util.ArrayList.forEach(Unknown Source)
        	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
        	at jadx.core.ProcessClass.process(ProcessClass.java:35)
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public HttpParams copy() {
            return new KscHttpParams(this.mOrgParams, this.mExtParams.copy());
        }

        public Object getParameter(String str) {
            Object parameter = this.mExtParams.getParameter(str);
            return parameter == null ? this.mOrgParams.getParameter(str) : parameter;
        }

        public boolean removeParameter(String str) {
            boolean removeParameter = this.mExtParams.removeParameter(str);
            if (!removeParameter) {
                try {
                    return this.mOrgParams.removeParameter(str);
                } catch (Exception unused) {
                }
            }
            return removeParameter;
        }

        /* JADX WARNING: type inference failed for: r1v0, types: [org.apache.http.params.HttpParams, cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams] */
        public HttpParams setParameter(String str, Object obj) {
            this.mExtParams.setParameter(str, obj);
            return this;
        }
    }

    public KscHttpRoutePlanner(SchemeRegistry schemeRegistry) {
        super(schemeRegistry);
    }

    /* JADX WARNING: type inference failed for: r1v0, types: [org.apache.http.params.HttpParams, cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v0, types: [org.apache.http.params.HttpParams, cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams]
  assigns: [cn.kuaipan.android.http.client.KscHttpRoutePlanner$KscHttpParams]
  uses: [org.apache.http.params.HttpParams]
  mth insns count: 8
    	at jadx.core.dex.visitors.typeinference.TypeSearch.fillTypeCandidates(TypeSearch.java:237)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.typeinference.TypeSearch.run(TypeSearch.java:53)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.runMultiVariableSearch(TypeInferenceVisitor.java:99)
    	at jadx.core.dex.visitors.typeinference.TypeInferenceVisitor.visit(TypeInferenceVisitor.java:92)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:27)
    	at jadx.core.dex.visitors.DepthTraversal.lambda$visit$1(DepthTraversal.java:14)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.dex.visitors.DepthTraversal.visit(DepthTraversal.java:14)
    	at jadx.core.ProcessClass.process(ProcessClass.java:30)
    	at jadx.core.ProcessClass.lambda$processDependencies$0(ProcessClass.java:49)
    	at java.util.ArrayList.forEach(Unknown Source)
    	at jadx.core.ProcessClass.processDependencies(ProcessClass.java:49)
    	at jadx.core.ProcessClass.process(ProcessClass.java:35)
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    public HttpRoute determineRoute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws HttpException {
        HttpHost currentProxy = NetworkHelpers.getCurrentProxy();
        if (currentProxy != null) {
            ? kscHttpParams = new KscHttpParams(httpRequest.getParams());
            ConnRouteParams.setDefaultProxy(kscHttpParams, currentProxy);
            httpRequest.setParams(kscHttpParams);
        }
        return KscHttpRoutePlanner.super.determineRoute(httpHost, httpRequest, httpContext);
    }
}
