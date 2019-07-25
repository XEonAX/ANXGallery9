.class Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;
.super Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;
.source "CloudImageLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/util/uil/CloudImageLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WeakRefViewAwareImpl"
.end annotation


# instance fields
.field private mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

.field final synthetic this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;)V
    .locals 11

    const/4 v10, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    invoke-direct/range {v0 .. v10}, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;Z)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->this$0:Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {p4}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p3}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p5}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p6}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p7}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p8}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setImageLoadingProgressListener(Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p9}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setRegionDecodeRect(Landroid/graphics/RectF;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object p1

    invoke-virtual {p1, p10}, Lcom/miui/gallery/util/uil/CloudImageHolder;->setNeedDisplay(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;

    iput-object p4, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    return-void
.end method


# virtual methods
.method public getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getDisplayImageOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    return-object v0
.end method

.method public getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    return-object v0
.end method

.method public getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    return-object v0
.end method

.method public getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v0

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->getUri()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->access$000(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v0

    return-object v0
.end method

.method public getLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    move-result-object v0

    return-object v0
.end method

.method public getRegionDecodeRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getRegionDecodeRect()Landroid/graphics/RectF;

    move-result-object v0

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getUri()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public needDisplay()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;->mImageAware:Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/uil/CloudImageHolder;->needDisplay()Z

    move-result v0

    return v0
.end method
