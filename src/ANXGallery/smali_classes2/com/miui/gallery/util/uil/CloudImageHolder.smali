.class public Lcom/miui/gallery/util/uil/CloudImageHolder;
.super Ljava/lang/Object;
.source "CloudImageHolder.java"


# instance fields
.field private mDelayRequest:Z

.field private mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mImageLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mImageLoadingProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

.field private mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field private mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private mNeedDisplay:Z

.field private mRegionDecodeRect:Landroid/graphics/RectF;

.field private mShowLoadingImage:Z

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mNeedDisplay:Z

    iput-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mShowLoadingImage:Z

    return-void
.end method

.method public static getImageHolder(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 2

    const v0, 0x7f0902c9

    invoke-interface {p0, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageHolder;

    invoke-direct {v1}, Lcom/miui/gallery/util/uil/CloudImageHolder;-><init>()V

    invoke-interface {p0, v0, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setTag(ILjava/lang/Object;)V

    :cond_0
    check-cast v1, Lcom/miui/gallery/util/uil/CloudImageHolder;

    return-object v1
.end method


# virtual methods
.method public getDisplayImageOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object v0
.end method

.method public getImageLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object v0
.end method

.method public getImageLoadingProgressListener()Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageLoadingProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-object v0
.end method

.method public getImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public getImageType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public getRegionDecodeRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mRegionDecodeRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mUri:Landroid/net/Uri;

    return-object v0
.end method

.method public isDelayRequest()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mDelayRequest:Z

    return v0
.end method

.method public isShowLoadingImage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mShowLoadingImage:Z

    return v0
.end method

.method public needDisplay()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mNeedDisplay:Z

    return v0
.end method

.method public setDelayRequest(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mDelayRequest:Z

    return-object p0
.end method

.method public setDisplayImageOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p0
.end method

.method public setImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object p0
.end method

.method public setImageLoadingProgressListener(Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageLoadingProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-object p0
.end method

.method public setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object p0
.end method

.method public setImageType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mImageType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method public setNeedDisplay(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mNeedDisplay:Z

    return-object p0
.end method

.method public setRegionDecodeRect(Landroid/graphics/RectF;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mRegionDecodeRect:Landroid/graphics/RectF;

    return-object p0
.end method

.method public setShowLoadingImage(Z)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mShowLoadingImage:Z

    return-object p0
.end method

.method public setUri(Landroid/net/Uri;)Lcom/miui/gallery/util/uil/CloudImageHolder;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageHolder;->mUri:Landroid/net/Uri;

    return-object p0
.end method
