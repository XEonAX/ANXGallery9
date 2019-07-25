.class public Lcom/miui/gallery/ui/PhotoPageImageBaseItem;
.super Lcom/miui/gallery/ui/PhotoPageItem;
.source "PhotoPageImageBaseItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;,
        Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;
    }
.end annotation


# static fields
.field protected static sBitmapRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;


# instance fields
.field protected mIsImageFirstDisplay:Z

.field protected volatile mIsSupportRegion:Z

.field protected mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsImageFirstDisplay:Z

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    return-void
.end method

.method static synthetic access$400()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->getBitmapRecycleCallback()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    move-result-object v0

    return-object v0
.end method

.method private static getBitmapRecycleCallback()Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->sBitmapRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$1;

    invoke-direct {v0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->sBitmapRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    :cond_0
    sget-object v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->sBitmapRecycleCallback:Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;

    return-object v0
.end method


# virtual methods
.method protected createDownloadManager()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$ImageDownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;Lcom/miui/gallery/ui/PhotoPageImageBaseItem$1;)V

    return-object v0
.end method

.method protected displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setRegionDecodeEnable(Z)V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v2

    new-instance v4, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-direct {v4, v0}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object v3, p1

    move-object v5, p2

    move-object v6, p3

    move-object v7, p4

    move-object v8, p5

    invoke-virtual/range {v2 .. v8}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->isPagerSelected()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsImageFirstDisplay:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->resetRegionDecoderIfNeeded()V

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsImageFirstDisplay:Z

    return-void
.end method

.method protected doOnSelected(ZZZ)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnSelected(ZZZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onSelected()V

    return-void
.end method

.method protected doOnUnSelected(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnUnSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->onUnSelected()V

    return-void
.end method

.method protected getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    if-nez v0, :cond_0

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheBigPhoto(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    sget-object v0, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->NONE_SAFE:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {p1, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    :cond_0
    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->isMediaInProcessing()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/Config$BigPhotoConfig;->appendBlurOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->access$000(Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;)V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onFinishInflate()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageBaseItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    return-void
.end method

.method protected onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->isMediaInProcessing()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Luk/co/senab/photoview/PhotoView;->setRegionDecodeEnable(Z)V

    return-void
.end method

.method public swapItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsImageFirstDisplay:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->mIsSupportRegion:Z

    :cond_1
    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->swapItem(Lcom/miui/gallery/model/BaseDataItem;)V

    return-void
.end method
