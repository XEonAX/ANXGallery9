.class public Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;
.super Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;
.source "OperationHybridClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;,
        Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;
    }
.end annotation


# instance fields
.field private mMaxSelectCount:I

.field private mValueCallback:Landroid/webkit/ValueCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/webkit/ValueCallback<",
            "[",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;Landroid/webkit/ValueCallback;)Landroid/webkit/ValueCallback;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mValueCallback:Landroid/webkit/ValueCallback;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mMaxSelectCount:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mMaxSelectCount:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->gotoPhotoPage(Ljava/lang/String;)V

    return-void
.end method

.method private gotoPhotoPage(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/activity/ExternalPhotoPageActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mWebViewFragment:Lcom/miui/gallery/hybrid/GalleryHybridFragment;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/hybrid/GalleryHybridFragment;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method private receiveImages(Landroid/content/Intent;)V
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/content/Intent;->getClipData()Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Landroid/content/ClipData;->getItemCount()I

    move-result p1

    new-array v3, p1, [Landroid/net/Uri;

    iget v4, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mMaxSelectCount:I

    invoke-static {p1, v4}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_0
    if-ge v2, p1, :cond_0

    invoke-virtual {v1, v2}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getUri()Landroid/net/Uri;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->resolveUri(Landroid/net/Uri;)Landroid/net/Uri;

    move-result-object v4

    aput-object v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move-object v1, v3

    goto :goto_1

    :cond_1
    if-eqz p1, :cond_2

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/net/Uri;

    aput-object p1, v1, v2

    goto :goto_1

    :cond_2
    move-object v1, v0

    :goto_1
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt p1, v2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mValueCallback:Landroid/webkit/ValueCallback;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mValueCallback:Landroid/webkit/ValueCallback;

    invoke-interface {p1, v1}, Landroid/webkit/ValueCallback;->onReceiveValue(Ljava/lang/Object;)V

    :cond_3
    iput-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mValueCallback:Landroid/webkit/ValueCallback;

    :cond_4
    return-void
.end method

.method private resolveUri(Landroid/net/Uri;)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p1}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.miui.gallery.open"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    return-object p1

    :cond_0
    return-object p1
.end method


# virtual methods
.method public getJavascriptInterfaces()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;",
            ">;"
        }
    .end annotation

    invoke-super {p0}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->getJavascriptInterfaces()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    :cond_0
    new-instance v1, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;

    const-string v2, "MiuiGalleryOperationStoryJSBridge"

    new-instance v3, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;

    invoke-direct {v3, p0}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;-><init>(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;)V

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/hybrid/hybridclient/HybridClient$JsInterfacePair;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getWebChromeClient(Landroid/webkit/WebChromeClient;)Lcom/miui/gallery/hybrid/hybridclient/wrapper/WebChromeClientWrapper;
    .locals 1

    new-instance v0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationWebChromeClientWrapper;-><init>(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;Landroid/webkit/WebChromeClient;)V

    return-object v0
.end method

.method public isSupportPullToRefresh()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient;->onActivityResult(IILandroid/content/Intent;)V

    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    if-eq p2, p1, :cond_1

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->receiveImages(Landroid/content/Intent;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p3}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->receiveImages(Landroid/content/Intent;)V

    :goto_0
    return-void
.end method

.method public recordSaveEvent(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "save_action"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "assistant"

    const-string v1, "assistant_operation_card_image_save_success"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
