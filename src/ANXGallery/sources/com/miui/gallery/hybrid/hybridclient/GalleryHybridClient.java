package com.miui.gallery.hybrid.hybridclient;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.webkit.DownloadListener;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.miui.gallery.hybrid.GalleryHybridFragment;
import com.miui.gallery.hybrid.hybridclient.HybridClient.ActualPathCallback;
import com.miui.gallery.hybrid.hybridclient.HybridClient.JsInterfacePair;
import com.miui.gallery.hybrid.hybridclient.wrapper.DownloadListenerWrapper;
import com.miui.gallery.hybrid.hybridclient.wrapper.WebChromeClientWrapper;
import com.miui.gallery.hybrid.hybridclient.wrapper.WebViewClientWrapper;
import com.miui.gallery.util.Log;
import java.io.File;
import java.net.URISyntaxException;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import miui.webkit.WebViewClient;

public class GalleryHybridClient implements HybridClient {
    /* access modifiers changed from: private */
    public static Set<String> sSchemes = new HashSet();
    protected Context mContext;
    protected String mCurrentUrl;
    protected String mUrl;
    protected WebView mWebView;
    protected GalleryHybridFragment mWebViewFragment;

    public class GalleryDownloadListenerWrapper extends DownloadListenerWrapper {
        public GalleryDownloadListenerWrapper(DownloadListener downloadListener) {
            super(downloadListener);
        }

        public void onDownloadStart(String str, String str2, String str3, String str4, long j) {
            if (getWrapped() == null) {
                GalleryHybridClient.this.mContext.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(str)));
                return;
            }
            super.onDownloadStart(str, str2, str3, str4, j);
        }
    }

    public class GalleryWebChromeClientWrapper extends WebChromeClientWrapper {
        public GalleryWebChromeClientWrapper(WebChromeClient webChromeClient) {
            super(webChromeClient);
        }
    }

    public class GalleryWebViewClientWrapper extends WebViewClientWrapper {
        public GalleryWebViewClientWrapper(WebViewClient webViewClient) {
            super(webViewClient);
        }

        private boolean tryToOverrideUrlLoading(WebView webView, String str) {
            try {
                Intent parseUri = Intent.parseUri(str, 1);
                parseUri.addCategory("android.intent.category.BROWSABLE");
                parseUri.setComponent(null);
                Intent selector = parseUri.getSelector();
                if (selector != null) {
                    selector.addCategory("android.intent.category.BROWSABLE");
                    selector.setComponent(null);
                }
                parseUri.putExtra("com.android.browser.application_id", webView.getContext().getPackageName());
                try {
                    webView.getContext().startActivity(parseUri);
                    return true;
                } catch (ActivityNotFoundException e) {
                    Log.w("GalleryHybridClient", (Throwable) e);
                    return false;
                }
            } catch (URISyntaxException e2) {
                Log.w("GalleryHybridClient", (Throwable) e2);
                return false;
            }
        }

        public void onPageStarted(WebView webView, String str, Bitmap bitmap) {
            GalleryHybridClient.this.mCurrentUrl = str;
            super.onPageStarted(webView, str, bitmap);
        }

        public boolean shouldOverrideUrlLoading(WebView webView, String str) {
            if (super.shouldOverrideUrlLoading(webView, str)) {
                return true;
            }
            if (GalleryHybridClient.sSchemes.contains(Uri.parse(str).getScheme())) {
                return tryToOverrideUrlLoading(webView, str);
            }
            return false;
        }
    }

    public interface ImageCountGotCallback {
        void onGetMaxImageCount(int i);
    }

    public static class ImageInfo {
        String data;
    }

    static {
        sSchemes.add("tel");
        sSchemes.add("sip");
        sSchemes.add("sms");
        sSchemes.add("smsto");
        sSchemes.add("mailto");
        sSchemes.add("micloud");
    }

    public GalleryHybridClient(Context context, String str) {
        this.mContext = context;
        this.mUrl = str;
    }

    private void ensureExistence(String str) {
        File file = new File(str);
        if (!file.exists()) {
            file.mkdirs();
        }
    }

    private void setAppCache(WebSettings webSettings) {
        webSettings.setAppCacheEnabled(true);
        String path = this.mContext.getDir("cache", 0).getPath();
        ensureExistence(path);
        webSettings.setAppCachePath(path);
    }

    private void setBrowserUA(WebSettings webSettings) {
        StringBuilder sb = new StringBuilder();
        sb.append(webSettings.getUserAgentString());
        sb.append(" ");
        sb.append("MiuiGallery");
        sb.append(" ");
        sb.append("lg/");
        sb.append(Locale.getDefault().toString());
        sb.append(" ");
        sb.append("XiaoMi/MiuiBrowser/4.3");
        webSettings.setUserAgentString(sb.toString());
    }

    private static void setDOMStorage(WebSettings webSettings) {
        webSettings.setDomStorageEnabled(true);
        webSettings.setDatabaseEnabled(true);
    }

    private void setGeoLocation(WebSettings webSettings) {
        webSettings.setGeolocationEnabled(true);
        webSettings.setGeolocationDatabasePath(this.mContext.getDir("geodatabase", 0).getPath());
    }

    public void bindWebViewFragment(GalleryHybridFragment galleryHybridFragment) {
        this.mWebViewFragment = galleryHybridFragment;
    }

    public void callJsMethod(final WebView webView, final String str, final ValueCallback<String> valueCallback) {
        if (webView != null) {
            webView.post(new Runnable() {
                public void run() {
                    webView.evaluateJavascript(str, valueCallback);
                }
            });
        }
    }

    public void getActualPath(ActualPathCallback actualPathCallback) {
        if (actualPathCallback != null) {
            actualPathCallback.onGetActualPath(this.mUrl);
        }
    }

    public DownloadListener getDownloadListener(DownloadListener downloadListener) {
        return new GalleryDownloadListenerWrapper(downloadListener);
    }

    public List<JsInterfacePair> getJavascriptInterfaces() {
        return null;
    }

    public String[] getRuntimePermissions() {
        return new String[0];
    }

    public WebChromeClientWrapper getWebChromeClient(WebChromeClient webChromeClient) {
        return new GalleryWebChromeClientWrapper(webChromeClient);
    }

    public WebViewClientWrapper getWebViewClient(WebViewClient webViewClient) {
        return new GalleryWebViewClientWrapper(webViewClient);
    }

    public boolean isSupportPullToRefresh() {
        return true;
    }

    public void onActivityResult(int i, int i2, Intent intent) {
    }

    public void onConfigWebSettings(WebSettings webSettings) {
        webSettings.setJavaScriptEnabled(true);
        webSettings.setCacheMode(-1);
        webSettings.setAllowFileAccessFromFileURLs(false);
        webSettings.setAllowUniversalAccessFromFileURLs(false);
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setUseWideViewPort(true);
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setTextZoom(100);
        setGeoLocation(webSettings);
        setAppCache(webSettings);
        setDOMStorage(webSettings);
        setBrowserUA(webSettings);
    }

    public void onPostConfigWebView(WebView webView) {
        webView.setOverScrollMode(2);
    }

    public void onStartConfigWebView(WebView webView) {
        this.mWebView = webView;
    }
}
