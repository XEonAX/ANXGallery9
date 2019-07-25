.class public Lcom/miui/gallery/ui/PhotoPageImageItem;
.super Lcom/miui/gallery/ui/PhotoPageImageBaseItem;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;,
        Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;,
        Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;,
        Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;,
        Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;
    }
.end annotation


# static fields
.field private static final DEBUG_ENABLE:Z


# instance fields
.field private mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

.field private mEchoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

.field private mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

.field private mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

.field private mMaxScale:F

.field private mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "PhotoPageImageItem"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->DEBUG_ENABLE:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    return-object p0
.end method

.method static synthetic access$1900()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->DEBUG_ENABLE:Z

    return v0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PhotoPageImageItem;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    return-object p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;)Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/PhotoPageImageItem;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->releaseRenderer()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageImageItem;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isRenderable()Z

    move-result p0

    return p0
.end method

.method private isRenderable()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private releaseRenderer()V
    .locals 2

    const-string v0, "PhotoPageImageItem"

    const-string v1, "releasing renderer"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mAutoRenderer:Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/sdk/AutoRenderer;->release()V

    :cond_0
    return-void
.end method

.method private statMaxScale()V
    .locals 4

    const-string v0, "photo"

    const-string v1, "photo_item_select_count"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "maxScale"

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    invoke-static {v2}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getBaseDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "maxScaleToOrigin"

    iget v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    mul-float v3, v3, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getWidth()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v3, v1

    invoke-static {v3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const-string v1, "photo"

    const-string v2, "photo_max_scale"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onUnSelected()V

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->onUnSelected()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->statMaxScale()V

    return-void
.end method

.method protected createCheckManager()Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    return-object v0
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onTouch(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    or-int/2addr p1, v0

    return p1
.end method

.method protected displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V
    .locals 17

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Luk/co/senab/photoview/PhotoView;->setRegionDecodeEnable(Z)V

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mCheckManager:Lcom/miui/gallery/ui/PhotoPageItem$CheckManager;

    check-cast v1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;

    if-eqz v1, :cond_1

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->access$300(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v4

    new-instance v6, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v3, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-direct {v6, v3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    iget-object v9, v1, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageCheckManager;->mPostLoadListener:Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;

    move-object/from16 v5, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    move-object/from16 v10, p5

    invoke-virtual/range {v4 .. v10}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v10

    new-instance v12, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-direct {v12, v1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object/from16 v11, p1

    move-object/from16 v13, p2

    move-object/from16 v14, p3

    move-object/from16 v15, p4

    move-object/from16 v16, p5

    invoke-virtual/range {v10 .. v16}, Lcom/nostra13/universalimageloader/core/ImageLoader;->displayImage(Ljava/lang/String;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingListener;Lcom/nostra13/universalimageloader/core/listener/ImageLoadingProgressListener;)V

    :goto_1
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isPagerSelected()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mIsImageFirstDisplay:Z

    if-nez v1, :cond_2

    iget-object v1, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mRegionManager:Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem$RegionDecoderManager;->resetRegionDecoderIfNeeded()V

    :cond_2
    iput-boolean v2, v0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mIsImageFirstDisplay:Z

    return-void
.end method

.method protected doOnMatrixChanged(Landroid/graphics/RectF;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->doOnMatrixChanged(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->onMatrixChanged(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onMatrixChanged()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getBaseDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz p1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    :cond_0
    return-void
.end method

.method protected doOnSelected(ZZZ)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->doOnSelected(ZZZ)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mEchoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->onSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->onSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->onSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onSelected(ZZZ)V

    return-void
.end method

.method protected doOnUnSelected(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->doOnUnSelected(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mEchoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->onUnSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->onUnSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->onUnSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onUnSelected()V

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->statMaxScale()V

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMaxScale:F

    :cond_0
    return-void
.end method

.method protected getCacheDisplayImageOptions(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->getCacheDisplayImageOptions(Lcom/miui/gallery/model/ImageLoadParams;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p2

    invoke-static {}, Lcom/miui/gallery/util/ProcessingMediaHelper;->getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/ImageLoadParams;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/ProcessingMediaHelper;->isMediaInProcessing(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p2}, Lcom/miui/gallery/Config$ThumbConfig;->appendBlurOptions(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p2

    :cond_0
    return-object p2
.end method

.method public getProcessingMedia()Lcom/miui/gallery/provider/ProcessingMedia;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getProcessingMedia()Lcom/miui/gallery/provider/ProcessingMedia;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method protected isMediaInProcessing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->access$2200(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onActionBarOperationClick()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onActionBarOperationClick()V

    return-void
.end method

.method public onActionBarVisibleChanged(Ljava/lang/Boolean;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onActionBarVisibleChanged(Ljava/lang/Boolean;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->onActionBarVisibleChanged(Ljava/lang/Boolean;I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p2, p1, v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    return-void
.end method

.method public onActivityTransition()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onActivityTransition()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onActivityTransition()V

    return-void
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isActionBarVisible()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onConfigurationChanged()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mEchoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;->release()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;->release()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->release()V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onFinishInflate()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mEchoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ExtraPhotoEchoManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mHigherDefinitionManager:Lcom/miui/gallery/ui/PhotoPageImageItem$HigherDefinitionManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    return-void
.end method

.method protected onPageScrollDragging()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onPageScrollDragging()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onPageScrollDragging()V

    return-void
.end method

.method protected onPageScrollIdle()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onPageScrollIdle()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onPageScrollIdle()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onPause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mMotionPhotoManager:Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$MotionPhotoManager;->onResume()V

    return-void
.end method

.method public setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageBaseItem;->setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem;->mImageProcessingManager:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V

    :cond_0
    return-void
.end method
