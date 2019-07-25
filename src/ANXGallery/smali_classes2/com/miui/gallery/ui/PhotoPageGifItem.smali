.class public Lcom/miui/gallery/ui/PhotoPageGifItem;
.super Lcom/miui/gallery/ui/PhotoPageItem;
.source "PhotoPageGifItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageGifItem$GifDownloadManager;,
        Lcom/miui/gallery/ui/PhotoPageGifItem$GifJob;
    }
.end annotation


# instance fields
.field private mActionBarHeight:I

.field private mGifFuture:Lcom/miui/gallery/threadpool/Future;

.field private mGifListener:Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;

.field private mHandler:Landroid/os/Handler;

.field private mIndicator:Landroid/view/View;

.field private mIndicatorMargin:I

.field private mPlayIcon:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    :try_start_0
    const-string v0, "MiuiGalleryNSGIF"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PhotoPageGifItem"

    const-string v2, "load jni failed."

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageGifItem$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageGifItem$1;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/PhotoPageGifItem;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/PhotoPageGifItem;ZZ)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/PhotoPageGifItem;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageGifItem;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mHandler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/PhotoPageGifItem;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->tryPlayGif()V

    return-void
.end method

.method private adjustIndicatorLocation()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getIndicatorMargin()I

    move-result v1

    int-to-float v1, v1

    iget v0, v0, Landroid/graphics/RectF;->top:F

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isActionBarVisible()Z

    move-result v2

    if-eqz v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mActionBarHeight:I

    int-to-float v2, v2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getIndicatorMargin()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    move-result v2

    cmpl-float v2, v2, v1

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    move-result v2

    cmpl-float v2, v2, v0

    if-eqz v2, :cond_2

    :cond_1
    const-string v2, "PhotoPageGifItem"

    const-string v3, "setTranslation x %s, y %s"

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setTranslationX(F)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setTranslationY(F)V

    :cond_2
    return-void
.end method

.method private cancelGifDecoder()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifFuture:Lcom/miui/gallery/threadpool/Future;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mHandler:Landroid/os/Handler;

    const/16 v1, 0x3e8

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    return-void
.end method

.method private getIndicatorMargin()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicatorMargin:I

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060260

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicatorMargin:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicatorMargin:I

    return v0
.end method

.method private initIndicator()V
    .locals 3

    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070155

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0x9

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v2, 0xa

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v2, 0x8

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    return-void
.end method

.method private initPlayIcon()V
    .locals 3

    new-instance v0, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070333

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f1005a3

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setContentDescription(Ljava/lang/CharSequence;)V

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v2, 0xd

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageGifItem$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageGifItem$2;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private isOriginFileExist()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needShowIndicator()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isOriginFileExist()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isAnimExiting()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isActionBarVisible()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needShowPlayIcon()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isOriginFileExist()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isAnimExiting()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private setIndicatorVisible(ZZ)V
    .locals 1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->needShowIndicator()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->initIndicator()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->adjustIndicatorLocation()V

    if-eqz p2, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->generateShowAnimation()Landroid/view/animation/Animation;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result p1

    const/16 v0, 0x8

    if-eq p1, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    if-eqz p2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->generateHideAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/ui/PhotoPageGifItem$3;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/PhotoPageGifItem$3;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;)V

    invoke-virtual {p1, p2}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mIndicator:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_3
    :goto_0
    return-void
.end method

.method private setPlayIconVisible(Z)V
    .locals 1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->needShowPlayIcon()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->initPlayIcon()V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mPlayIcon:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method private tryPlayGif()V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->cancelGifDecoder()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->isOriginFileExist()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    invoke-direct {p0, v1, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageGifItem$GifJob;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mHandler:Landroid/os/Handler;

    invoke-direct {v1, p0, v2, v3}, Lcom/miui/gallery/ui/PhotoPageGifItem$GifJob;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;Lcom/miui/gallery/model/BaseDataItem;Landroid/os/Handler;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifFuture:Lcom/miui/gallery/threadpool/Future;

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    :goto_0
    return-void
.end method


# virtual methods
.method public animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageGifItem$5;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/ui/PhotoPageGifItem$5;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    const/4 p2, 0x0

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    invoke-direct {p0, p2, p2}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    invoke-super {p0, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    return-void
.end method

.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->cancelGifDecoder()V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    invoke-direct {p0, v0, v0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Lcom/miui/gallery/ui/PhotoPageItem$TransitionListener;)V

    return-void
.end method

.method protected createDownloadManager()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageGifItem$GifDownloadManager;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/PhotoPageGifItem$GifDownloadManager;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;Lcom/miui/gallery/ui/PhotoPageGifItem$1;)V

    return-object v0
.end method

.method protected doOnMatrixChanged(Landroid/graphics/RectF;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnMatrixChanged(Landroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->adjustIndicatorLocation()V

    return-void
.end method

.method protected doOnSelected(ZZZ)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->tryPlayGif()V

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnSelected(ZZZ)V

    return-void
.end method

.method protected doOnUnSelected(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem;->doOnUnSelected(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->cancelGifDecoder()V

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setPlayIconVisible(Z)V

    return-void
.end method

.method protected generateHideAnimation()Landroid/view/animation/Animation;
    .locals 3

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    return-object v0
.end method

.method protected generateShowAnimation()Landroid/view/animation/Animation;
    .locals 3

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    return-object v0
.end method

.method public getGifUpdateListener()Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifListener:Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageGifItem$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageGifItem$4;-><init>(Lcom/miui/gallery/ui/PhotoPageGifItem;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifListener:Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mGifListener:Lcom/miui/gallery/util/gifdecoder/NSGifDecode$GifFrameUpdateListener;

    return-object v0
.end method

.method public onActionBarVisibleChanged(Ljava/lang/Boolean;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->onActionBarVisibleChanged(Ljava/lang/Boolean;I)V

    iput p2, p0, Lcom/miui/gallery/ui/PhotoPageGifItem;->mActionBarHeight:I

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    const/4 p2, 0x1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageGifItem;->setIndicatorVisible(ZZ)V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageGifItem;->cancelGifDecoder()V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem;->onFinishInflate()V

    return-void
.end method
