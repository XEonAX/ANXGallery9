.class public Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;
.source "PhotoPageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "DownloadManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;,
        Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;
    }
.end annotation


# instance fields
.field private isUserDownload:Z

.field private mAdjustX:F

.field private mAdjustY:F

.field private mAnimator:Landroid/animation/Animator;

.field mBulkDownloadListener:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;

.field private mDownloadError:Landroid/view/View;

.field private mDownloadProgress:Landroid/widget/ProgressBar;

.field private mDownloadRoot:Landroid/view/View;

.field private mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

.field private mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

.field private mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mHasShowError:Z

.field private mHasShowProgress:Z

.field private mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

.field private mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mBulkDownloadListener:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    new-instance p1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$3;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onLoadFail(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onCancel(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onDownloading(Lcom/miui/gallery/sdk/download/DownloadType;F)V

    return-void
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processThumbnail()V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->showProgress(Z)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2100(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->statClickError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V

    return-void
.end method

.method static synthetic access$2400(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->statActionError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V

    return-void
.end method

.method static synthetic access$2500(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onLoadStart(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method private cancelAnim()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustX:F

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustY:F

    :cond_0
    return-void
.end method

.method private doAdjustLocation(ZLandroid/graphics/RectF;Z)V
    .locals 8

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->cancelAnim()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getMenuBarHeight()I

    move-result v1

    int-to-float v1, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz p2, :cond_1

    iget v2, p2, Landroid/graphics/RectF;->bottom:F

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageItem;->getHeight()I

    move-result v2

    int-to-float v2, v2

    :goto_1
    if-eqz p2, :cond_2

    iget p2, p2, Landroid/graphics/RectF;->right:F

    goto :goto_2

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageItem;->getWidth()I

    move-result p2

    int-to-float p2, p2

    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getMaxTranslationY()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageItem;->getHeight()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, v2

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getVerticalMargin()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    sub-float v1, v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getLeftInset()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getMaxTranslationX()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageItem;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, p2

    invoke-static {v4, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getHorizontalMargin()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    invoke-static {v3, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    sub-float/2addr v2, p2

    iget p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustY:F

    cmpl-float p2, p2, v1

    if-nez p2, :cond_3

    iget p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustX:F

    cmpl-float p2, p2, v2

    if-eqz p2, :cond_5

    :cond_3
    iput v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustX:F

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustY:F

    if-eqz p3, :cond_4

    new-instance p2, Landroid/animation/AnimatorSet;

    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    const-string v0, "TranslationY"

    const/4 v3, 0x2

    new-array v4, v3, [F

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v5

    const/4 v6, 0x0

    aput v5, v4, v6

    const/4 v5, 0x1

    aput v1, v4, v5

    invoke-static {p3, v0, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    const-string v1, "TranslationX"

    new-array v4, v3, [F

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {v7}, Landroid/view/View;->getTranslationX()F

    move-result v7

    aput v7, v4, v6

    aput v2, v4, v5

    invoke-static {v0, v1, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    new-array v1, v3, [Landroid/animation/Animator;

    aput-object v0, v1, v6

    aput-object p3, v1, v5

    invoke-virtual {p2, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getAdjustAnimDuration(Z)I

    move-result p3

    int-to-long v0, p3

    invoke-virtual {p2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getAdjustAnimInterpolator(Z)Landroid/view/animation/Interpolator;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    goto :goto_3

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationX(F)V

    :cond_5
    :goto_3
    return-void
.end method

.method private hideErrorView(Z)Z
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowError:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getErrorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->generateHideAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$5;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    invoke-virtual {p1, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    invoke-virtual {v0, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private hideProgress(Z)Z
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowProgress:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-eq v2, v3, :cond_1

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->clearAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->generateHideAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$4;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    invoke-virtual {p1, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnProgressVisibilityChanged(Z)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method private initDownloadLayout()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const v2, 0x7f0b0102

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v1, 0xc

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private initErrorView()Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->initDownloadLayout()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    const v1, 0x7f0900e8

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method

.method private initProgressBar()Landroid/widget/ProgressBar;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->initDownloadLayout()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadRoot:Landroid/view/View;

    const v1, 0x7f0900e9

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    const/4 v1, 0x1

    new-array v2, v1, [I

    const v3, 0x7f0701fb

    const/4 v4, 0x0

    aput v3, v2, v4

    new-array v3, v1, [I

    const v5, 0x7f0701fd

    aput v5, v3, v4

    const/4 v5, 0x0

    invoke-virtual {v0, v2, v3, v5}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setDrawablesForLevels([I[I[I)V

    new-array v1, v1, [I

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050083

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    aput v2, v1, v4

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f06012f

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setMiddleStrokeColors([IF)V

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setVisibility(I)V

    return-object v0
.end method

.method private isOriginDownloaded()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_1
    return v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/2addr v0, v1

    return v0
.end method

.method private isOriginRequestForce()Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v0, v2, v3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isRequesting(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    return v2

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/BaseDataItem;

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v4

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    sget-object v5, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v4, v3, v5}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isRequesting(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v3

    if-eqz v3, :cond_2

    return v2

    :cond_3
    return v1
.end method

.method private needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private onCancel(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isUserDownload:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnCancel(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method private onDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    :cond_0
    return-void
.end method

.method private onDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :cond_1
    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V

    return-void
.end method

.method private onDownloading(Lcom/miui/gallery/sdk/download/DownloadType;F)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->setProgress(F)V

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnDownloading(Lcom/miui/gallery/sdk/download/DownloadType;F)V

    return-void
.end method

.method private onLoadFail(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needRefreshUI(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->filterError(Lcom/miui/gallery/error/core/ErrorCode;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->createErrorDisplayer()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;->handleError(Lcom/miui/gallery/error/core/ErrorCode;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->showErrorView(Z)Z

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->statShowError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V

    :cond_1
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isUserDownload:Z

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnLoadFail(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-void
.end method

.method private onLoadStart(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnLoadStart(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method private onLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isUserDownload:Z

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    sget-object p2, Lcom/miui/gallery/error/core/ErrorCode;->NO_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem;->onImageLoadFinish(Lcom/miui/gallery/error/core/ErrorCode;)V

    return-void
.end method

.method private processThumbnail()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$7;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1, v2, v3, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getStatusAsync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_0
    return-void
.end method

.method private setProgress(F)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v1, p1, v1

    if-gtz v1, :cond_0

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    mul-float p1, p1, v1

    float-to-int p1, p1

    invoke-virtual {v0, p1}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_0
    return-void
.end method

.method private showErrorView(Z)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needShowDownloadView()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowError:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getErrorView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_2

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    invoke-virtual {v2}, Landroid/view/View;->clearAnimation()V

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p0, v3, v4, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustErrorViewLocation(ZLandroid/graphics/RectF;Z)V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->generateShowAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isUserDownload:Z

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getErrorTip()Ljava/lang/CharSequence;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :cond_1
    return v0

    :cond_2
    return v1
.end method

.method private showProgress(Z)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needShowDownloadView()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowProgress:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getProgressBar()Landroid/widget/ProgressBar;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_1

    const/4 v3, 0x0

    invoke-direct {p0, v3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->setProgress(F)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    invoke-virtual {v2}, Landroid/widget/ProgressBar;->clearAnimation()V

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v4, v4, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p0, v3, v4, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustProgressBarLocation(ZLandroid/graphics/RectF;Z)V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->generateShowAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    invoke-virtual {v2, p1}, Landroid/widget/ProgressBar;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doOnProgressVisibilityChanged(Z)V

    return v0

    :cond_1
    return v1
.end method

.method private statActionError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "errorTip"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "photo_download_click_error_action_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {p2, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "photo"

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private statClickError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorTip;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "errorTip"

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "photo_download_click_error_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {p2, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "photo"

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private statShowError(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "errorcode"

    invoke-virtual {p2}, Lcom/miui/gallery/error/core/ErrorCode;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "photo_download_show_error_%s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    invoke-static {p2, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "photo"

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method protected adjustErrorViewLocation(ZLandroid/graphics/RectF;Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowError:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getErrorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doAdjustLocation(ZLandroid/graphics/RectF;Z)V

    :cond_1
    return-void
.end method

.method public final adjustLocation(ZLandroid/graphics/RectF;Z)V
    .locals 0

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustProgressBarLocation(ZLandroid/graphics/RectF;Z)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->adjustErrorViewLocation(ZLandroid/graphics/RectF;Z)V

    return-void
.end method

.method protected adjustProgressBarLocation(ZLandroid/graphics/RectF;Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowProgress:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->getProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/ProgressBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->doAdjustLocation(ZLandroid/graphics/RectF;Z)V

    :cond_1
    return-void
.end method

.method protected changeVisibilityForSpecialScene()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->needShowDownloadView()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processDownload()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    :cond_1
    :goto_0
    return-void
.end method

.method protected createErrorDisplayer()Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    return-object v0
.end method

.method protected doOnCancel(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    return-void
.end method

.method protected doOnDownloaded(Lcom/miui/gallery/sdk/download/DownloadType;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method protected doOnDownloading(Lcom/miui/gallery/sdk/download/DownloadType;F)V
    .locals 0

    return-void
.end method

.method protected doOnLoadFail(Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/error/core/ErrorCode;)V
    .locals 0

    return-void
.end method

.method protected doOnLoadStart(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    return-void
.end method

.method protected doOnLoaded(Lcom/miui/gallery/sdk/download/DownloadType;Landroid/graphics/Bitmap;)V
    .locals 0

    return-void
.end method

.method protected doOnProgressVisibilityChanged(Z)V
    .locals 0

    return-void
.end method

.method public downloadOrigin()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    const-string v0, "PhotoPageItem"

    const-string v1, "data is null while downloading original file"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isUserDownload:Z

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f100321

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f100322

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x104000a

    const/high16 v5, 0x1040000

    new-instance v6, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$8;

    invoke-direct {v6, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$8;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    new-instance v7, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$9;

    invoke-direct {v7, p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$9;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;)V

    invoke-static/range {v1 .. v7}, Lcom/miui/gallery/util/DialogUtil;->showInfoDialog(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IILandroid/content/DialogInterface$OnClickListener;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)V

    :goto_0
    return-void
.end method

.method public downloadOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v1, 0x1

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->showProgress(Z)Z

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object v6, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v6, v6, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v6}, Lcom/miui/gallery/model/BaseDataItem;->getSize()J

    move-result-wide v6

    invoke-direct {v4, v3, v5, v6, v7}, Lcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadItem;-><init>(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;J)V

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    const/4 v3, 0x0

    invoke-interface {v0, v3, p1, v3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mBulkDownloadListener:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;->setDownloadType(Lcom/miui/gallery/sdk/download/DownloadType;)V

    new-instance p1, Lcom/miui/gallery/util/BulkDownloadHelper;

    invoke-direct {p1}, Lcom/miui/gallery/util/BulkDownloadHelper;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mBulkDownloadListener:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$PhotoItemBulkDownloadListener;

    invoke-virtual {p1, v2, v1, v0}, Lcom/miui/gallery/util/BulkDownloadHelper;->download(Ljava/util/List;ZLcom/miui/gallery/util/BulkDownloadHelper$BulkDownloadListener;)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v2, v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getDisplayImageOptions(Lcom/miui/gallery/model/BaseDataItem;Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->setManual(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBigPhotoImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mLoadingListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mProgressListener:Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    invoke-virtual/range {v0 .. v7}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)V

    :cond_4
    :goto_1
    return-void
.end method

.method protected filterError(Lcom/miui/gallery/error/core/ErrorCode;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected final getCurDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method protected getErrorTip()Ljava/lang/CharSequence;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getErrorView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadError:Landroid/view/View;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->initErrorView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadError:Landroid/view/View;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadError:Landroid/view/View;

    return-object v0
.end method

.method protected getProgressBar()Landroid/widget/ProgressBar;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadProgress:Landroid/widget/ProgressBar;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->initProgressBar()Landroid/widget/ProgressBar;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadProgress:Landroid/widget/ProgressBar;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadProgress:Landroid/widget/ProgressBar;

    return-object v0
.end method

.method protected needShowDownloadView()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->isInActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isRotating()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isDrawableDisplayInside()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onSelected()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onSelected()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->processDownload()V

    return-void
.end method

.method public onUnSelected()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideProgress(Z)Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->hideErrorView(Z)Z

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onUnSelected()V

    return-void
.end method

.method protected processDownload()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isOriginDownloaded()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->isOriginRequestForce()Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :cond_1
    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq v0, v1, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isRequesting(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne v1, v2, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    new-instance v1, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$6;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getStatusAsync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;)V

    goto :goto_2

    :cond_3
    :goto_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->downloadOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v2, v2, Lcom/miui/gallery/ui/PhotoPageItem;->mDataItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v2}, Lcom/miui/gallery/model/BaseDataItem;->getDownloadUri()Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-interface {v1, v2, v0, v3}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingStarted(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;)V

    :cond_4
    :goto_2
    return-void

    :cond_5
    :goto_3
    return-void
.end method

.method public release()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->onUnSelected()V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mDownloadingType:Lcom/miui/gallery/sdk/download/DownloadType;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustX:F

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mAdjustY:F

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowProgress:Z

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mHasShowError:Z

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mErrorDisplayer:Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager$DownloadErrorDisplayer;

    return-void
.end method

.method public setCloudImageLoadingListener(Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$DownloadManager;->mExternalListener:Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    return-void
.end method
