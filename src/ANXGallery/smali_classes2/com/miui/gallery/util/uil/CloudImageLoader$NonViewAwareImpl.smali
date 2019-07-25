.class Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;
.super Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;
.source "CloudImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NonViewAwareImpl"
.end annotation


# instance fields
.field private mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iput-object p4, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    iput-object p5, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-void
.end method


# virtual methods
.method public getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    return-object v0
.end method

.method public getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$000(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object v0
.end method

.method public getLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;->getInternalUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public needDisplay()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
