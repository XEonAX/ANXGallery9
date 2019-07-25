.class public Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;
.super Lmiui/webkit/WebViewClient;
.source "WebViewClientWrapper.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lmiui/webkit/WebViewClient;"
    }
.end annotation


# instance fields
.field private mWrappedWebViewClient:Lmiui/webkit/WebViewClient;


# direct methods
.method public constructor <init>(Lmiui/webkit/WebViewClient;)V
    .locals 0

    invoke-direct {p0}, Lmiui/webkit/WebViewClient;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2}, Lmiui/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Lmiui/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2, p3}, Lmiui/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lmiui/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    :goto_0
    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2, p3, p4}, Lmiui/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lmiui/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onReceivedLoginRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2, p3, p4}, Lmiui/webkit/WebViewClient;->onReceivedLoginRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lmiui/webkit/WebViewClient;->onReceivedLoginRequest(Landroid/webkit/WebView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2, p3}, Lmiui/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lmiui/webkit/WebViewClient;->onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V

    :goto_0
    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->mWrappedWebViewClient:Lmiui/webkit/WebViewClient;

    invoke-virtual {v0, p1, p2}, Lmiui/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    goto :goto_0

    :cond_0
    invoke-super {p0, p1, p2}, Lmiui/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    :goto_0
    return p1
.end method
