package com.miui.gallery.hybrid.hybridclient;

import android.content.Intent;
import android.webkit.DownloadListener;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.miui.gallery.hybrid.GalleryHybridFragment;
import com.miui.gallery.hybrid.hybridclient.wrapper.WebChromeClientWrapper;
import com.miui.gallery.hybrid.hybridclient.wrapper.WebViewClientWrapper;
import java.util.List;
import miui.webkit.WebViewClient;

public interface HybridClient {

    public interface ActualPathCallback {
        void onGetActualPath(String str);
    }

    public static class JsInterfacePair {
        public String name;
        public Object obj;

        public JsInterfacePair(String str, Object obj2) {
            this.name = str;
            this.obj = obj2;
        }
    }

    void bindWebViewFragment(GalleryHybridFragment galleryHybridFragment);

    void getActualPath(ActualPathCallback actualPathCallback);

    DownloadListener getDownloadListener(DownloadListener downloadListener);

    List<JsInterfacePair> getJavascriptInterfaces();

    String[] getRuntimePermissions();

    WebChromeClientWrapper getWebChromeClient(WebChromeClient webChromeClient);

    WebViewClientWrapper getWebViewClient(WebViewClient webViewClient);

    boolean isSupportPullToRefresh();

    void onActivityResult(int i, int i2, Intent intent);

    void onConfigWebSettings(WebSettings webSettings);

    void onPostConfigWebView(WebView webView);

    void onStartConfigWebView(WebView webView);
}
