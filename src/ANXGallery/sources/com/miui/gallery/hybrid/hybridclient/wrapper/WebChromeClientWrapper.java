package com.miui.gallery.hybrid.hybridclient.wrapper;

import android.webkit.ConsoleMessage;
import android.webkit.GeolocationPermissions.Callback;
import android.webkit.JsPromptResult;
import android.webkit.JsResult;
import android.webkit.WebChromeClient;
import android.webkit.WebView;

public class WebChromeClientWrapper extends WebChromeClient {
    private WebChromeClient mWrappedWebChromeClient;

    public WebChromeClientWrapper(WebChromeClient webChromeClient) {
        this.mWrappedWebChromeClient = webChromeClient;
    }

    public boolean onConsoleMessage(ConsoleMessage consoleMessage) {
        return this.mWrappedWebChromeClient != null ? this.mWrappedWebChromeClient.onConsoleMessage(consoleMessage) : super.onConsoleMessage(consoleMessage);
    }

    public void onGeolocationPermissionsShowPrompt(String str, Callback callback) {
        if (this.mWrappedWebChromeClient != null) {
            this.mWrappedWebChromeClient.onGeolocationPermissionsShowPrompt(str, callback);
        } else {
            super.onGeolocationPermissionsShowPrompt(str, callback);
        }
    }

    public boolean onJsAlert(WebView webView, String str, String str2, JsResult jsResult) {
        return this.mWrappedWebChromeClient != null ? this.mWrappedWebChromeClient.onJsAlert(webView, str, str2, jsResult) : super.onJsAlert(webView, str, str2, jsResult);
    }

    public boolean onJsConfirm(WebView webView, String str, String str2, JsResult jsResult) {
        return this.mWrappedWebChromeClient != null ? this.mWrappedWebChromeClient.onJsConfirm(webView, str, str2, jsResult) : super.onJsConfirm(webView, str, str2, jsResult);
    }

    public boolean onJsPrompt(WebView webView, String str, String str2, String str3, JsPromptResult jsPromptResult) {
        return this.mWrappedWebChromeClient != null ? this.mWrappedWebChromeClient.onJsPrompt(webView, str, str2, str3, jsPromptResult) : super.onJsPrompt(webView, str, str2, str3, jsPromptResult);
    }

    public void onProgressChanged(WebView webView, int i) {
        if (this.mWrappedWebChromeClient != null) {
            this.mWrappedWebChromeClient.onProgressChanged(webView, i);
        } else {
            super.onProgressChanged(webView, i);
        }
    }

    public void onReceivedTitle(WebView webView, String str) {
        if (this.mWrappedWebChromeClient != null) {
            this.mWrappedWebChromeClient.onReceivedTitle(webView, str);
        } else {
            super.onReceivedTitle(webView, str);
        }
    }
}
