.class public Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;
.super Ljava/lang/Object;
.source "OperationHybridClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "OperationStoryJSBridge"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;


# direct methods
.method constructor <init>(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public saveImage(Ljava/lang/String;)Z
    .locals 6
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    const-string v1, "save_click"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->recordSaveEvent(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object v0, v0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mCurrentUrl:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/request/HostManager;->isInternalUrl(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const-class v0, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageInfo;

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageInfo;

    if-eqz p1, :cond_3

    iget-object v0, p1, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageInfo;->data:Ljava/lang/String;

    if-eqz v0, :cond_3

    :try_start_0
    iget-object p1, p1, Lcom/miui/gallery/hybrid/hybridclient/GalleryHybridClient$ImageInfo;->data:Ljava/lang/String;

    invoke-static {p1, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p1

    array-length v0, p1

    invoke-static {p1, v1, v0}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    const/4 v0, 0x1

    if-eqz p1, :cond_2

    const-string v2, "OperationHybridClient"

    const-string v3, "save image from html,image size: %d X %d"

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v2, "yyyyMMdd_HHmmss"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-static {v2, v3, v4}, Landroid/text/format/DateFormat;->format(Ljava/lang/CharSequence;J)Ljava/lang/CharSequence;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "IMG_%s.jpg"

    new-array v5, v0, [Ljava/lang/Object;

    aput-object v2, v5, v1

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getCreativeDirectory()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge$1;

    invoke-direct {v4, p0, p1}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge$1;-><init>(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;Landroid/graphics/Bitmap;)V

    invoke-static {v2, v4}, Lcom/miui/gallery/util/DocumentProviderUtils;->safeWriteFile(Ljava/lang/String;Lcom/miui/gallery/util/BaseDocumentProviderUtils$WriteHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object v2, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object v2, v2, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mWebView:Landroid/webkit/WebView;

    const-string v4, "javascript:onImageSaveResult()"

    const/4 v5, 0x0

    invoke-virtual {p1, v2, v4, v5}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->callJsMethod(Landroid/webkit/WebView;Ljava/lang/String;Landroid/webkit/ValueCallback;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object p1, p1, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/scanner/MediaScanner;->scanSingleFile(Landroid/content/Context;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object p1, p1, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mContext:Landroid/content/Context;

    invoke-static {p1, v3, v0}, Lcom/miui/gallery/util/MediaStoreUtils;->insert(Landroid/content/Context;Ljava/io/File;I)Landroid/net/Uri;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    const-string v2, "save_success"

    invoke-virtual {p1, v2}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->recordSaveEvent(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->access$200(Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient$OperationStoryJSBridge;->this$0:Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;

    iget-object p1, p1, Lcom/miui/gallery/hybrid/hybridclient/OperationHybridClient;->mContext:Landroid/content/Context;

    const v2, 0x7f100462

    invoke-static {p1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string p1, "OperationHybridClient"

    const-string v2, "save image fail,bitmap compress error"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    const-string p1, "OperationHybridClient"

    const-string v2, "save image fail,no bitmap got from web"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return v0

    :catch_0
    move-exception p1

    const-string v0, "OperationHybridClient"

    const-string v2, "saveImage %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_1
    move-exception p1

    const-string v0, "OperationHybridClient"

    const-string v2, "saveImage %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_2
    move-exception p1

    const-string v0, "OperationHybridClient"

    const-string v2, "saveImage() failed %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :catch_3
    move-exception p1

    const-string v0, "OperationHybridClient"

    const-string v2, "saveImage() failed %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    :goto_1
    return v1
.end method
