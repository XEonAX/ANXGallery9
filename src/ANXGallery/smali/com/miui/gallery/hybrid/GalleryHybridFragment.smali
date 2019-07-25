.class public Lcom/miui/gallery/hybrid/GalleryHybridFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "GalleryHybridFragment.java"

# interfaces
.implements Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridOnRefreshListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;,
        Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;,
        Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;,
        Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;
    }
.end annotation


# instance fields
.field private mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

.field private mHybridViewEventListener:Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

.field private mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

.field private mLoadingState:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

.field private mNetworkConnected:Z

.field private mNetworkConnectivityReceiver:Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

.field private mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

.field private mWebview:Landroid/webkit/WebView;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    :cond_1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Landroid/webkit/WebView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridViewEventListener:Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnected:Z

    return p0
.end method

.method static synthetic access$2002(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnected:Z

    return p1
.end method

.method static synthetic access$2100(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->reload()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingState:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingState:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/HybridLoadingProgressView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method private configureWebView()V
    .locals 4
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "JavascriptInterface"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-interface {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->onStartConfigWebView(Landroid/webkit/WebView;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v1}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->onConfigWebSettings(Landroid/webkit/WebSettings;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    new-instance v2, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridWebViewClient;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V

    invoke-interface {v1, v2}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getWebViewClient(Lmiui/webkit/WebViewClient;)Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    new-instance v2, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$GalleryHybridChromeClient;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V

    invoke-interface {v1, v2}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getWebChromeClient(Landroid/webkit/WebChromeClient;)Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setWebChromeClient(Landroid/webkit/WebChromeClient;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {v1, v3}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getDownloadListener(Landroid/webkit/DownloadListener;)Landroid/webkit/DownloadListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->setDownloadListener(Landroid/webkit/DownloadListener;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {v0}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getJavascriptInterfaces()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;

    iget-object v2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    iget-object v3, v1, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;->obj:Ljava/lang/Object;

    iget-object v1, v1, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;->name:Ljava/lang/String;

    invoke-virtual {v2, v3, v1}, Landroid/webkit/WebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {v0}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->isSupportPullToRefresh()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->setMode(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-interface {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->onPostConfigWebView(Landroid/webkit/WebView;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->requestFocus()Z

    :cond_2
    return-void
.end method

.method private initLoadingState()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    const/16 v2, 0xa

    invoke-virtual {v0, v2}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->setProgress(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->onStartLoading(Z)V

    sget-object v0, Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;->OK:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    iput-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingState:Lcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridLoadingState;

    return-void
.end method

.method private registerConnectivityReceiver()V
    .locals 3

    const-string v0, "GalleryHybridFragment"

    const-string v1, "Register network connectivity changed receiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnectivityReceiver:Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnectivityReceiver:Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

    :cond_0
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnectivityReceiver:Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/activity/BaseActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    return-void
.end method

.method private reload()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->loadUrl(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private stepsToGoBack()I
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getCurrentIndex()I

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    :goto_0
    if-gt v3, v1, :cond_0

    sub-int v4, v1, v3

    invoke-virtual {v0, v4}, Landroid/webkit/WebBackForwardList;->getItemAtIndex(I)Landroid/webkit/WebHistoryItem;

    move-result-object v4

    invoke-virtual {v4}, Landroid/webkit/WebHistoryItem;->getUrl()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v5}, Landroid/webkit/WebView;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    return v2
.end method

.method private unregisterConnectivityReceiver()V
    .locals 2

    const-string v0, "GalleryHybridFragment"

    const-string v1, "Unregister network connectivity changed receiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mNetworkConnectivityReceiver:Lcom/miui/gallery/hybrid/GalleryHybridFragment$NetworkConnectivityChangedReceiver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/activity/BaseActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "hybrid"

    return-object v0
.end method

.method public load()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    if-nez v0, :cond_0

    const-string v0, "GalleryHybridFragment"

    const-string v1, "HybridClient is null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    new-instance v1, Lcom/miui/gallery/hybrid/GalleryHybridFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$2;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    invoke-interface {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->getActualPath(Lcom/miui/gallery/hybrid/hybridclient/HybridClient$ActualPathCallback;)V

    return-void
.end method

.method public loadUrl(Ljava/lang/String;)V
    .locals 1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "GalleryHybridFragment"

    const-string v0, "The url should not be null, load nothing"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->initLoadingState()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0, p1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const-string v0, "GalleryHybridFragment"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onAttach(Landroid/app/Activity;)V

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->registerConnectivityReceiver()V

    return-void
.end method

.method public onBackPressed()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->canGoBack()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->copyBackForwardList()Landroid/webkit/WebBackForwardList;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->stepsToGoBack()I

    move-result v2

    invoke-virtual {v0}, Landroid/webkit/WebBackForwardList;->getCurrentIndex()I

    move-result v3

    if-le v2, v3, :cond_0

    return v1

    :cond_0
    sub-int/2addr v3, v2

    invoke-virtual {v0, v3}, Landroid/webkit/WebBackForwardList;->getItemAtIndex(I)Landroid/webkit/WebHistoryItem;

    move-result-object v0

    invoke-virtual {v0}, Landroid/webkit/WebHistoryItem;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridViewEventListener:Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridViewEventListener:Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    invoke-interface {v1, v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;->onReceivedTitle(Ljava/lang/String;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    neg-int v1, v2

    invoke-virtual {v0, v1}, Landroid/webkit/WebView;->goBackOrForward(I)V

    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->destroy()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    return-void
.end method

.method public onDetach()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->unregisterConnectivityReceiver()V

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDetach()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const/4 p3, 0x0

    const v0, 0x7f0b0095

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090168

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    new-instance v0, Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment$1;-><init>(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->setOnRefreshListener(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;)V

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mPullToRefreshWebView:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;

    invoke-virtual {p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshWebView;->getRefreshableView()Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    const p2, 0x7f0901b5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    iget-object p2, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mLoadingProgressView:Lcom/miui/gallery/hybrid/HybridLoadingProgressView;

    invoke-virtual {p2, p3, p3, p0}, Lcom/miui/gallery/hybrid/HybridLoadingProgressView;->onInit(ZZLcom/miui/gallery/hybrid/HybridLoadingProgressView$HybridOnRefreshListener;)V

    return-object p1
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onPause()V

    return-void
.end method

.method public onRefresh()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->reload()V

    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mWebview:Landroid/webkit/WebView;

    invoke-virtual {v0}, Landroid/webkit/WebView;->onResume()V

    return-void
.end method

.method public setHybridClient(Lcom/miui/gallery/hybrid/hybridclient/HybridClient;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridClient:Lcom/miui/gallery/hybrid/hybridclient/HybridClient;

    invoke-interface {p1, p0}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient;->bindWebViewFragment(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->configureWebView()V

    return-void
.end method

.method public setHybridViewEventListener(Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->mHybridViewEventListener:Lcom/miui/gallery/hybrid/GalleryHybridFragment$HybridViewEventListener;

    return-void
.end method
