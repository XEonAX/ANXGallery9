.class public Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;
.super Ljava/lang/Object;
.source "GalleryHybridClient.java"

# interfaces
.implements Lcom/miui/gallery/hybrid/hybridclient/HybridClient;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageCountGotCallback;,
        Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageInfo;,
        Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebChromeClientWrapper;,
        Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;,
        Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryDownloadListenerWrapper;
    }
.end annotation


# static fields
.field private static sSchemes:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mCurrentUrl:Ljava/lang/String;

.field protected mUrl:Ljava/lang/String;

.field protected mWebView:Landroid/webkit/WebView;

.field protected mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sput-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "tel"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "sip"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "sms"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "smsto"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "mailto"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    const-string v1, "micloud"

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mUrl:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000()Ljava/util/Set;
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->sSchemes:Ljava/util/Set;

    return-object v0
.end method

.method private ensureExistence(Ljava/lang/String;)V
    .locals 1

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    :cond_0
    return-void
.end method

.method private setAppCache(Landroid/webkit/WebSettings;)V
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setAppCacheEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mContext:Landroid/content/Context;

    const-string v1, "cache"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->ensureExistence(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setAppCachePath(Ljava/lang/String;)V

    return-void
.end method

.method private setBrowserUA(Landroid/webkit/WebSettings;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/webkit/WebSettings;->getUserAgentString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "MiuiGallery"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "lg/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "XiaoMi/MiuiBrowser/4.3"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V

    return-void
.end method

.method private static setDOMStorage(Landroid/webkit/WebSettings;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setDomStorageEnabled(Z)V

    invoke-virtual {p0, v0}, Landroid/webkit/WebSettings;->setDatabaseEnabled(Z)V

    return-void
.end method

.method private setGeoLocation(Landroid/webkit/WebSettings;)V
    .locals 3

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setGeolocationEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mContext:Landroid/content/Context;

    const-string v1, "geodatabase"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setGeolocationDatabasePath(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bindWebViewFragment(Lcom/miui/gallery/hybrid/GalleryHybridFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    return-void
.end method

.method public callJsMethod(Landroid/webkit/WebView;Ljava/lang/String;Landroid/webkit/ValueCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/webkit/WebView;",
            "Ljava/lang/String;",
            "Landroid/webkit/ValueCallback<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    new-instance v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$1;-><init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Landroid/webkit/WebView;Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public getActualPath(Lcom/miui/gallery/hybrid/hybridclient/HybridClient$ActualPathCallback;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mUrl:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$ActualPathCallback;->onGetActualPath(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public getDownloadListener(Landroid/webkit/DownloadListener;)Landroid/webkit/DownloadListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryDownloadListenerWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryDownloadListenerWrapper;-><init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Landroid/webkit/DownloadListener;)V

    return-object v0
.end method

.method public getJavascriptInterfaces()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    return-object v0
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getWebChromeClient(Landroid/webkit/WebChromeClient;)Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;
    .locals 1

    new-instance v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebChromeClientWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebChromeClientWrapper;-><init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Landroid/webkit/WebChromeClient;)V

    return-object v0
.end method

.method public getWebViewClient(Lmiui/webkit/WebViewClient;)Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;
    .locals 1

    new-instance v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;-><init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Lmiui/webkit/WebViewClient;)V

    return-object v0
.end method

.method public isSupportPullToRefresh()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    return-void
.end method

.method public onConfigWebSettings(Landroid/webkit/WebSettings;)V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setAllowFileAccessFromFileURLs(Z)V

    invoke-virtual {p1, v1}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setJavaScriptCanOpenWindowsAutomatically(Z)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setLoadWithOverviewMode(Z)V

    const/16 v0, 0x64

    invoke-virtual {p1, v0}, Landroid/webkit/WebSettings;->setTextZoom(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->setGeoLocation(Landroid/webkit/WebSettings;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->setAppCache(Landroid/webkit/WebSettings;)V

    invoke-static {p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->setDOMStorage(Landroid/webkit/WebSettings;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->setBrowserUA(Landroid/webkit/WebSettings;)V

    return-void
.end method

.method public onPostConfigWebView(Landroid/webkit/WebView;)V
    .locals 1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->setOverScrollMode(I)V

    return-void
.end method

.method public onStartConfigWebView(Landroid/webkit/WebView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mWebView:Landroid/webkit/WebView;

    return-void
.end method
