package com.miui.gallery.hybrid;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnCancelListener;
import android.content.DialogInterface.OnClickListener;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.ConsoleMessage;
import android.webkit.GeolocationPermissions.Callback;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.SslErrorHandler;
import android.webkit.WebBackForwardList;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import com.miui.gallery.R;
import com.miui.gallery.cloud.NetworkUtils;
import com.miui.gallery.hybrid.HybridLoadingProgressView.HybridLoadingState;
import com.miui.gallery.hybrid.HybridLoadingProgressView.HybridOnRefreshListener;
import com.miui.gallery.hybrid.hybridclient.HybridClient;
import com.miui.gallery.hybrid.hybridclient.HybridClient.ActualPathCallback;
import com.miui.gallery.hybrid.hybridclient.HybridClient.JsInterfacePair;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.Mode;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshBase.OnRefreshListener;
import com.miui.gallery.hybrid.pulltorefresh.PullToRefreshWebView;
import com.miui.gallery.request.HostManager;
import com.miui.gallery.ui.BaseFragment;
import com.miui.gallery.util.Log;
import com.miui.gallery.util.MiscUtil;
import com.miui.os.Rom;
import java.util.List;
import miui.webkit.WebViewClient;

public class GalleryHybridFragment extends BaseFragment implements HybridOnRefreshListener {
    private HybridClient mHybridClient;
    /* access modifiers changed from: private */
    public HybridViewEventListener mHybridViewEventListener;
    /* access modifiers changed from: private */
    public HybridLoadingProgressView mLoadingProgressView;
    /* access modifiers changed from: private */
    public HybridLoadingState mLoadingState;
    /* access modifiers changed from: private */
    public boolean mNetworkConnected;
    private NetworkConnectivityChangedReceiver mNetworkConnectivityReceiver;
    /* access modifiers changed from: private */
    public PullToRefreshWebView mPullToRefreshWebView;
    /* access modifiers changed from: private */
    public WebView mWebview;

    private class GalleryHybridChromeClient extends WebChromeClient {
        private GalleryHybridChromeClient() {
        }

        public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
            return true;
        }

        public void onGeolocationPermissionsShowPrompt(String str, Callback callback) {
            callback.invoke(str, true, false);
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 21
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public boolean onJsAlert(WebView webView, String str, String str2, final JsResult jsResult) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onJsAlert: already detached, do nothing");
                return false;
            }
            Builder builder = new Builder(GalleryHybridFragment.this.mActivity);
            String title = webView.getTitle();
            if (!TextUtils.isEmpty(title)) {
                builder.setTitle(title);
            }
            builder.setMessage(str2);
            builder.setPositiveButton(17039370, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    jsResult.confirm();
                }
            });
            builder.setOnCancelListener(new OnCancelListener() {
                public void onCancel(DialogInterface dialogInterface) {
                    jsResult.cancel();
                }
            });
            builder.show();
            return true;
        }

        /* JADX WARNING: type inference failed for: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context] */
        /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r0v1, types: [com.miui.gallery.activity.BaseActivity, android.content.Context]
  assigns: [com.miui.gallery.activity.BaseActivity]
  uses: [android.content.Context]
  mth insns count: 23
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
        	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
        	at jadx.api.JavaClass.decompile(JavaClass.java:62)
        	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
         */
        /* JADX WARNING: Unknown variable types count: 1 */
        public boolean onJsConfirm(WebView webView, String str, String str2, final JsResult jsResult) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onJsConfirm: already detached, do nothing");
                return false;
            }
            Builder builder = new Builder(GalleryHybridFragment.this.mActivity);
            String title = webView.getTitle();
            if (!TextUtils.isEmpty(title)) {
                builder.setTitle(title);
            }
            builder.setMessage(str2);
            builder.setPositiveButton(17039370, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    jsResult.confirm();
                }
            });
            builder.setNegativeButton(17039360, new OnClickListener() {
                public void onClick(DialogInterface dialogInterface, int i) {
                    jsResult.cancel();
                }
            });
            builder.setOnCancelListener(new OnCancelListener() {
                public void onCancel(DialogInterface dialogInterface) {
                    jsResult.cancel();
                }
            });
            builder.show();
            return true;
        }

        public boolean onJsPrompt(WebView webView, String str, String str2, String str3, JsPromptResult jsPromptResult) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onJsPrompt: already detached, do nothing");
                return false;
            } else if (!"MiuiGallery-finish-queuing".equals(str2)) {
                return false;
            } else {
                GalleryHybridFragment.this.mActivity.setResult(-1, null);
                GalleryHybridFragment.this.mActivity.finish();
                jsPromptResult.confirm();
                return true;
            }
        }

        public void onProgressChanged(WebView webView, int i) {
            StringBuilder sb = new StringBuilder();
            sb.append("onProgressChanged: ");
            sb.append(i);
            Log.d("GalleryHybridFragment", sb.toString());
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onProgressChanged: already detached, do nothing");
                return;
            }
            super.onProgressChanged(webView, i);
            if (GalleryHybridFragment.this.mLoadingProgressView != null && i - GalleryHybridFragment.this.mLoadingProgressView.getProgress() > 0 && i >= 0 && i <= 100) {
                GalleryHybridFragment.this.mLoadingProgressView.setProgress(i);
            }
        }

        public void onReceivedTitle(WebView webView, String str) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onReceivedTitle: already detached, do nothing");
                return;
            }
            super.onReceivedTitle(webView, str);
            if (GalleryHybridFragment.this.mHybridViewEventListener != null) {
                GalleryHybridFragment.this.mHybridViewEventListener.onReceivedTitle(str);
            }
        }
    }

    private class GalleryHybridWebViewClient extends WebViewClient {
        private GalleryHybridWebViewClient() {
        }

        public void onPageFinished(WebView webView, String str) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onPageFinished: already detached, do nothing");
                return;
            }
            GalleryHybridFragment.super.onPageFinished(webView, str);
            GalleryHybridFragment.this.mPullToRefreshWebView.onRefreshComplete();
            if (GalleryHybridFragment.this.mLoadingState != HybridLoadingState.OK) {
                GalleryHybridFragment.this.mLoadingProgressView.onError(false, GalleryHybridFragment.this.mLoadingState, null);
                GalleryHybridFragment.this.mPullToRefreshWebView.setVisibility(8);
            } else {
                GalleryHybridFragment.this.mLoadingProgressView.onStopLoading(false);
                GalleryHybridFragment.this.mLoadingProgressView.setVisibility(8);
                GalleryHybridFragment.this.mPullToRefreshWebView.setVisibility(0);
            }
        }

        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            GalleryHybridFragment.super.onPageStarted(webView, str, bitmap);
        }

        public void onReceivedError(WebView webView, int i, String str, String str2) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "onReceivedError: already detached, do nothing");
                return;
            }
            GalleryHybridFragment.super.onReceivedError(webView, i, str, str2);
            GalleryHybridFragment.this.mPullToRefreshWebView.onRefreshComplete();
            if (NetworkUtils.isNetworkConnected()) {
                GalleryHybridFragment.this.mLoadingState = HybridLoadingState.SERVICE_ERROR;
            } else {
                GalleryHybridFragment.this.mLoadingState = HybridLoadingState.NETWORK_ERROR;
            }
        }

        public void onReceivedSslError(WebView webView, SslErrorHandler sslErrorHandler, SslError sslError) {
            sslErrorHandler.proceed();
        }

        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            if (GalleryHybridFragment.this.mActivity == null) {
                Log.d("GalleryHybridFragment", "shouldOverrideUrlLoading: already detached, do nothing");
                return false;
            }
            GalleryHybridFragment.this.mLoadingState = HybridLoadingState.OK;
            GalleryHybridFragment.this.mLoadingProgressView.setProgress(10);
            GalleryHybridFragment.this.mLoadingProgressView.onStartLoading(false);
            if (!HostManager.isGalleryUrl(str)) {
                return GalleryHybridFragment.super.shouldOverrideUrlLoading(webView, str);
            }
            webView.loadUrl(str);
            return true;
        }
    }

    public interface HybridViewEventListener {
        void onReceivedTitle(String str);
    }

    private class NetworkConnectivityChangedReceiver extends BroadcastReceiver {
        private NetworkConnectivityChangedReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            boolean isNetworkConnected = NetworkUtils.isNetworkConnected();
            if (!GalleryHybridFragment.this.mNetworkConnected && isNetworkConnected) {
                GalleryHybridFragment.this.reload();
            }
            GalleryHybridFragment.this.mNetworkConnected = isNetworkConnected;
        }
    }

    static {
        if (Rom.IS_ALPHA || Rom.IS_DEV) {
            WebView.setWebContentsDebuggingEnabled(true);
        }
    }

    /* JADX WARNING: type inference failed for: r1v4, types: [com.miui.gallery.hybrid.hybridclient.wrapper.WebViewClientWrapper, android.webkit.WebViewClient] */
    /* JADX WARNING: Multi-variable type inference failed. Error: jadx.core.utils.exceptions.JadxRuntimeException: No candidate types for var: r1v4, types: [com.miui.gallery.hybrid.hybridclient.wrapper.WebViewClientWrapper, android.webkit.WebViewClient]
  assigns: [com.miui.gallery.hybrid.hybridclient.wrapper.WebViewClientWrapper]
  uses: [android.webkit.WebViewClient]
  mth insns count: 52
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
    	at jadx.api.JadxDecompiler.processClass(JadxDecompiler.java:311)
    	at jadx.api.JavaClass.decompile(JavaClass.java:62)
    	at jadx.api.JadxDecompiler.lambda$appendSourcesSave$0(JadxDecompiler.java:217)
     */
    /* JADX WARNING: Unknown variable types count: 1 */
    @SuppressLint({"JavascriptInterface"})
    private void configureWebView() {
        if (this.mHybridClient != null && this.mWebview != null) {
            this.mHybridClient.onStartConfigWebView(this.mWebview);
            this.mHybridClient.onConfigWebSettings(this.mWebview.getSettings());
            this.mWebview.setWebViewClient(this.mHybridClient.getWebViewClient(new GalleryHybridWebViewClient()));
            this.mWebview.setWebChromeClient(this.mHybridClient.getWebChromeClient(new GalleryHybridChromeClient()));
            this.mWebview.setDownloadListener(this.mHybridClient.getDownloadListener(null));
            List<JsInterfacePair> javascriptInterfaces = this.mHybridClient.getJavascriptInterfaces();
            if (MiscUtil.isValid(javascriptInterfaces)) {
                for (JsInterfacePair jsInterfacePair : javascriptInterfaces) {
                    this.mWebview.addJavascriptInterface(jsInterfacePair.obj, jsInterfacePair.name);
                }
            }
            if (!this.mHybridClient.isSupportPullToRefresh()) {
                this.mPullToRefreshWebView.setMode(Mode.DISABLED);
            }
            this.mHybridClient.onPostConfigWebView(this.mWebview);
            this.mWebview.requestFocus();
        }
    }

    private void initLoadingState() {
        this.mLoadingProgressView.setIndeterminate(false);
        this.mLoadingProgressView.setProgress(10);
        this.mLoadingProgressView.onStartLoading(false);
        this.mLoadingState = HybridLoadingState.OK;
    }

    private void registerConnectivityReceiver() {
        Log.d("GalleryHybridFragment", "Register network connectivity changed receiver");
        if (this.mNetworkConnectivityReceiver == null) {
            this.mNetworkConnectivityReceiver = new NetworkConnectivityChangedReceiver();
        }
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.net.conn.CONNECTIVITY_CHANGE");
        this.mActivity.registerReceiver(this.mNetworkConnectivityReceiver, intentFilter);
    }

    /* access modifiers changed from: private */
    public void reload() {
        if (!TextUtils.isEmpty(this.mWebview.getUrl())) {
            loadUrl(this.mWebview.getUrl());
        }
    }

    private int stepsToGoBack() {
        WebBackForwardList copyBackForwardList = this.mWebview.copyBackForwardList();
        int currentIndex = copyBackForwardList.getCurrentIndex();
        int i = 1;
        for (int i2 = 0; i2 <= currentIndex; i2++) {
            if (TextUtils.equals(this.mWebview.getUrl(), copyBackForwardList.getItemAtIndex(currentIndex - i2).getUrl())) {
                break;
            }
            i++;
        }
        return i;
    }

    private void unregisterConnectivityReceiver() {
        Log.d("GalleryHybridFragment", "Unregister network connectivity changed receiver");
        this.mActivity.unregisterReceiver(this.mNetworkConnectivityReceiver);
    }

    public String getPageName() {
        return "hybrid";
    }

    public void load() {
        if (this.mHybridClient == null) {
            Log.e("GalleryHybridFragment", "HybridClient is null");
        } else {
            this.mHybridClient.getActualPath(new ActualPathCallback() {
                public void onGetActualPath(String str) {
                    if (TextUtils.isEmpty(str)) {
                        Log.e("GalleryHybridFragment", "The url should not be null, load nothing");
                    } else {
                        GalleryHybridFragment.this.loadUrl(str);
                    }
                }
            });
        }
    }

    public void loadUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            Log.e("GalleryHybridFragment", "The url should not be null, load nothing");
            return;
        }
        initLoadingState();
        this.mWebview.loadUrl(str);
    }

    public void onActivityResult(int i, int i2, Intent intent) {
        Log.d("GalleryHybridFragment", "onActivityResult");
        this.mHybridClient.onActivityResult(i, i2, intent);
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
        registerConnectivityReceiver();
    }

    public boolean onBackPressed() {
        if (!this.mWebview.canGoBack()) {
            return false;
        }
        WebBackForwardList copyBackForwardList = this.mWebview.copyBackForwardList();
        int stepsToGoBack = stepsToGoBack();
        int currentIndex = copyBackForwardList.getCurrentIndex();
        if (stepsToGoBack > currentIndex) {
            return false;
        }
        String title = copyBackForwardList.getItemAtIndex(currentIndex - stepsToGoBack).getTitle();
        if (!TextUtils.isEmpty(title) && this.mHybridViewEventListener != null) {
            this.mHybridViewEventListener.onReceivedTitle(title);
        }
        this.mWebview.goBackOrForward(-stepsToGoBack);
        return true;
    }

    public void onDestroy() {
        if (this.mWebview != null) {
            ((ViewGroup) this.mWebview.getParent()).removeView(this.mWebview);
            this.mWebview.destroy();
            this.mWebview = null;
        }
        super.onDestroy();
    }

    public void onDetach() {
        unregisterConnectivityReceiver();
        super.onDetach();
    }

    public View onInflateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.hybrid_view, viewGroup, false);
        this.mPullToRefreshWebView = (PullToRefreshWebView) inflate.findViewById(R.id.hybrid_view);
        this.mPullToRefreshWebView.setOnRefreshListener((OnRefreshListener<T>) new OnRefreshListener<WebView>() {
            public void onRefresh(PullToRefreshBase<WebView> pullToRefreshBase) {
                GalleryHybridFragment.this.mWebview.reload();
            }
        });
        this.mWebview = (WebView) this.mPullToRefreshWebView.getRefreshableView();
        this.mLoadingProgressView = (HybridLoadingProgressView) inflate.findViewById(R.id.loading_view);
        this.mLoadingProgressView.onInit(false, false, this);
        return inflate;
    }

    public void onPause() {
        super.onPause();
        this.mWebview.onPause();
    }

    public void onRefresh() {
        reload();
    }

    public void onResume() {
        super.onResume();
        this.mWebview.onResume();
    }

    public void setHybridClient(HybridClient hybridClient) {
        this.mHybridClient = hybridClient;
        this.mHybridClient.bindWebViewFragment(this);
        configureWebView();
    }

    public void setHybridViewEventListener(HybridViewEventListener hybridViewEventListener) {
        this.mHybridViewEventListener = hybridViewEventListener;
    }
}
