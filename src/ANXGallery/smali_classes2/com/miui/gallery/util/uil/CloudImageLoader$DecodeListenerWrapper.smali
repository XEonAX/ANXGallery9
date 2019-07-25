.class Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DecodeListenerWrapper"
.end annotation


# instance fields
.field private mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

.field private final mType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private final mUri:Landroid/net/Uri;

.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getUri()Landroid/net/Uri;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mUri:Landroid/net/Uri;

    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    return-void
.end method

.method private isViewReused()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getKey()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mUri:Landroid/net/Uri;

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v1, v2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$000(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private translateFailReason(Lcom/nostra13/universalimageloader/core/assist/FailReason;)Lcom/miui/gallery/error/core/ErrorCode;
    .locals 0

    sget-object p1, Lcom/miui/gallery/error/core/ErrorCode;->DECODE_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    return-object p1
.end method


# virtual methods
.method public onLoadingCancelled(Ljava/lang/String;Landroid/view/View;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->isViewReused()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-interface {p1, v0, v1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingCancelled(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public onLoadingComplete(Ljava/lang/String;Landroid/view/View;Landroid/graphics/Bitmap;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->isViewReused()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-interface {p1, v0, v1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingComplete(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Landroid/graphics/Bitmap;)V

    :cond_0
    return-void
.end method

.method public onLoadingFailed(Ljava/lang/String;Landroid/view/View;Lcom/nostra13/universalimageloader/core/assist/FailReason;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->isViewReused()Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mAware:Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mUri:Landroid/net/Uri;

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->mType:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;->translateFailReason(Lcom/nostra13/universalimageloader/core/assist/FailReason;)Lcom/miui/gallery/error/core/ErrorCode;

    move-result-object p3

    invoke-interface {p1, v0, v1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V

    :cond_0
    return-void
.end method

.method public onLoadingStarted(Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    return-void
.end method
