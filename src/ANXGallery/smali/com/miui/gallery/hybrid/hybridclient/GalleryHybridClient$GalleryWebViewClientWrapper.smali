.class public Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;
.super Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;
.source "GalleryHybridClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "GalleryWebViewClientWrapper"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;Lmiui/webkit/WebViewClient;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;->this$0:Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;

    invoke-direct {p0, p2}, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;-><init>(Lmiui/webkit/WebViewClient;)V

    return-void
.end method

.method private tryToOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    invoke-static {p2, v1}, Landroid/content/Intent;->parseUri(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object p2
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_1

    const-string v2, "android.intent.category.BROWSABLE"

    invoke-virtual {p2, v2}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const/4 v2, 0x0

    invoke-virtual {p2, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    invoke-virtual {p2}, Landroid/content/Intent;->getSelector()Landroid/content/Intent;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v4, "android.intent.category.BROWSABLE"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v3, v2}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    :cond_0
    const-string v2, "com.android.browser.application_id"

    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :try_start_1
    invoke-virtual {p1}, Landroid/webkit/WebView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_1
    .catch Landroid/content/ActivityNotFoundException; {:try_start_1 .. :try_end_1} :catch_0

    return v1

    :catch_0
    move-exception p1

    const-string p2, "GalleryHybridClient"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0

    :catch_1
    move-exception p1

    const-string p2, "GalleryHybridClient"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method


# virtual methods
.method public onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;->this$0:Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;

    iput-object p2, v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->mCurrentUrl:Ljava/lang/String;

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->onPageStarted(Landroid/webkit/WebView;Ljava/lang/String;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebViewClientWrapper;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->access$000()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$GalleryWebViewClientWrapper;->tryToOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result p1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method
