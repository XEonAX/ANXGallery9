.class public Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;
.super Landroid/webkit/WebChromeClient;
.source "WebChromeClientWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/webkit/WebChromeClient;"
    }
.end annotation


# instance fields
.field private mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;


# direct methods
.method public constructor <init>(Landroid/webkit/WebChromeClient;)V
    .locals 0

    invoke-direct {p0}, Landroid/webkit/WebChromeClient;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    return-void
.end method


# virtual methods
.method public onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/webkit/WebChromeClient;->onConsoleMessage(Landroid/webkit/ConsoleMessage;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onGeolocationPermissionsShowPrompt(Ljava/lang/String;Landroid/webkit/GeolocationPermissions$Callback;)V

    :goto_0
    return-void
.end method

.method public onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsAlert(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Landroid/webkit/WebChromeClient;->onJsConfirm(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsResult;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-virtual/range {v1 .. v6}, Landroid/webkit/WebChromeClient;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-super/range {p0 .. p5}, Landroid/webkit/WebChromeClient;->onJsPrompt(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/webkit/JsPromptResult;)Z

    move-result p1

    :goto_0
    return p1
.end method

.method public onProgressChanged(Landroid/webkit/WebView;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onProgressChanged(Landroid/webkit/WebView;I)V

    :goto_0
    return-void
.end method

.method public onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;->mWrappedWebChromeClient:Landroid/webkit/WebChromeClient;

    invoke-virtual {v0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Landroid/webkit/WebChromeClient;->onReceivedTitle(Landroid/webkit/WebView;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
