.class Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;
.super Lmiui/webkit/WebViewClient;
.source "GalleryHybridFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/GalleryHybridFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GalleryHybridWebViewClient"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-direct {p0}, Lmiui/webkit/WebViewClient;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$600(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onPageFinished: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2}, Lmiui/webkit/WebViewClient;->onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->onRefreshComplete()V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$400(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    const/16 v0, 0x8

    const/4 v1, 0x0

    if-eq p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$400(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    move-result-object p2

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->onError(ZLcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->onStopLoading(Z)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->setVisibility(I)V

    :goto_0
    return-void
.end method

.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lmiui/webkit/WebViewClient;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$800(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    if-nez v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "onReceivedError: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-super {p0, p1, p2, p3, p4}, Lmiui/webkit/WebViewClient;->onReceivedError(Landroid/webkit/WebView;ILjava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {p1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->onRefreshComplete()V

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    sget-object p2, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->SERVICE_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    invoke-static {p1, p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$402(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    sget-object p2, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->NETWORK_ERROR:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    invoke-static {p1, p2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$402(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    :goto_0
    return-void
.end method

.method public onReceivedSslError(Landroid/webkit/WebView;Landroid/webkit/SslErrorHandler;Landroid/net/http/SslError;)V
    .locals 0

    invoke-virtual {p2}, Landroid/webkit/SslErrorHandler;->proceed()V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$300(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string p2, "shouldOverrideUrlLoading: already detached, do nothing"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    sget-object v2, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    invoke-static {v0, v2}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$402(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object v0

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->setProgress(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;->this$0:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-static {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->onStartLoading(Z)V

    invoke-static {p2}, Lcom/miui/gallery/request/HostManager;->isGalleryUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1, p2}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1

    :cond_1
    invoke-super {p0, p1, p2}, Lmiui/webkit/WebViewClient;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
