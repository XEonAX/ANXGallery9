.class Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;
.source "PhotoPageImageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageImageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImageProcessingManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;
    }
.end annotation


# instance fields
.field private mAdjustX:F

.field private mAdjustY:F

.field private mAnimator:Landroid/animation/Animator;

.field private mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

.field private mHasShowProgress:Z

.field private mIndeterminateProgress:Landroid/widget/ProgressBar;

.field private mLoadingView:Landroid/view/View;

.field private mNextQueryRunnable:Ljava/lang/Runnable;

.field private mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

.field private mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/PhotoPageImageItem;Lcom/miui/gallery/ui/PhotoPageImageItem$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$2000(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->fetchNext()V

    return-void
.end method

.method static synthetic access$2100(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;Landroid/net/Uri;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->onProgressPercentageUpdated(Landroid/net/Uri;I)V

    return-void
.end method

.method static synthetic access$2200(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->isMediaInProcessing()Z

    move-result p0

    return p0
.end method

.method private cancelQueryTask()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    :cond_0
    return-void
.end method

.method private doAdjustLocation(ZLandroid/graphics/RectF;Z)V
    .locals 8

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->endAnim()V

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getActionBarHeight()I

    move-result v1

    int-to-float v1, v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-eqz p2, :cond_1

    iget v2, p2, Landroid/graphics/RectF;->top:F

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    if-eqz p2, :cond_2

    iget p2, p2, Landroid/graphics/RectF;->right:F

    goto :goto_2

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getWidth()I

    move-result p2

    int-to-float p2, p2

    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getMaxTranslationY()F

    move-result v3

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getVerticalMargin()I

    move-result v2

    int-to-float v2, v2

    add-float/2addr v1, v2

    invoke-static {v3, v1}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getLeftInset()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getMaxTranslationX()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getWidth()I

    move-result v4

    int-to-float v4, v4

    sub-float/2addr v4, p2

    invoke-static {v4, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getHorizontalMargin()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    invoke-static {v3, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    sub-float/2addr v2, p2

    iget p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAdjustY:F

    cmpl-float p2, p2, v1

    if-nez p2, :cond_3

    iget p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAdjustX:F

    cmpl-float p2, p2, v2

    if-eqz p2, :cond_5

    :cond_3
    iput v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAdjustX:F

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAdjustY:F

    if-eqz p3, :cond_4

    new-instance p2, Landroid/animation/AnimatorSet;

    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    const-string v0, "TranslationY"

    const/4 v3, 0x2

    new-array v4, v3, [F

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v5

    const/4 v6, 0x0

    aput v5, v4, v6

    const/4 v5, 0x1

    aput v1, v4, v5

    invoke-static {p3, v0, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    const-string v1, "TranslationX"

    new-array v4, v3, [F

    iget-object v7, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getAdjustAnimDuration(Z)I

    move-result p3

    int-to-long v0, p3

    invoke-virtual {p2, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getAdjustAnimInterpolator(Z)Landroid/view/animation/Interpolator;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    goto :goto_3

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationX(F)V

    :cond_5
    :goto_3
    return-void
.end method

.method private endAnim()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mAnimator:Landroid/animation/Animator;

    :cond_0
    return-void
.end method

.method private fetchNext()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->cancelQueryTask()V

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    invoke-virtual {v2}, Lcom/miui/gallery/provider/ProcessingMedia;->getUri()Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;Landroid/content/Context;Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mQueryTask:Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$QueryProgressAsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method private getNextQueryRunnable()Ljava/lang/Runnable;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mNextQueryRunnable:Ljava/lang/Runnable;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$2;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mNextQueryRunnable:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mNextQueryRunnable:Ljava/lang/Runnable;

    return-object v0
.end method

.method private hideLoading(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->generateHideAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;)V

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method private isMediaInProcessing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onProgressPercentageUpdated(Landroid/net/Uri;I)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/ui/PhotoPageImageItem;->access$1900()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "PhotoPageImageItem"

    const-string v1, "Updating progress for: %s to: %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setProgress(I)V

    :cond_1
    const/16 p1, 0x64

    if-ge p2, p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->getNextQueryRunnable()Ljava/lang/Runnable;

    move-result-object p2

    const-wide/16 v0, 0x64

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_2
    return-void
.end method

.method private showLoading(Z)V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->needShowProcessingView()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->ensureInflated()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mHasShowProgress:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/ProcessingMedia;->getProcessingMetadata()Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;

    move-result-object v0

    const/16 v1, 0x8

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;->getProgressStatus()Lcom/miui/gallery/photosapi/ProcessingMetadataQuery$ProgressStatus;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/photosapi/ProcessingMetadataQuery$ProgressStatus;->DETERMINATE:Lcom/miui/gallery/photosapi/ProcessingMetadataQuery$ProgressStatus;

    const/4 v4, 0x0

    if-ne v2, v3, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mIndeterminateProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    invoke-virtual {v1, v4}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    const/16 v2, 0x64

    invoke-virtual {v1, v2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setMax(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/ProcessingMedia$ProcessingMetadata;->getProgressPercentage()I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setProgress(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->fetchNext()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mIndeterminateProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isActionBarVisible()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageImageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-direct {p0, v0, v1, v4}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->doAdjustLocation(ZLandroid/graphics/RectF;Z)V

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->generateShowAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_2
    :goto_1
    return-void
.end method

.method private updateProgress()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->showLoading(Z)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->hideLoading(Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public adjustLocation(ZLandroid/graphics/RectF;Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mHasShowProgress:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->doAdjustLocation(ZLandroid/graphics/RectF;Z)V

    :cond_1
    return-void
.end method

.method protected changeVisibilityForSpecialScene()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->needShowProcessingView()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isPagerSelected()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->updateProgress()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->hideLoading(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected ensureInflated()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0106

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    const/16 v1, 0xb

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    const v2, 0x7f0900d2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    const/4 v2, 0x1

    new-array v4, v2, [I

    const v5, 0x7f0701fb

    aput v5, v4, v3

    new-array v5, v2, [I

    const v6, 0x7f0701fd

    aput v6, v5, v3

    const/4 v6, 0x0

    invoke-virtual {v1, v4, v5, v6}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setDrawablesForLevels([I[I[I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    new-array v2, v2, [I

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f050083

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v4

    aput v4, v2, v3

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v3}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f06012f

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setMiddleStrokeColors([IF)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mDeterminateProgress:Lcom/miui/gallery/widget/CircleStrokeProgressBar;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/miui/gallery/widget/CircleStrokeProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    const v3, 0x7f090177

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ProgressBar;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mIndeterminateProgress:Landroid/widget/ProgressBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mIndeterminateProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mLoadingView:Landroid/view/View;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
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

    const-wide/16 v1, 0x15e

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    const-wide/16 v1, 0x32

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setStartOffset(J)V

    return-object v0
.end method

.method public getProcessingMedia()Lcom/miui/gallery/provider/ProcessingMedia;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    return-object v0
.end method

.method protected getVerticalMargin()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mMargin:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0603ac

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mMargin:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mMargin:I

    return v0
.end method

.method protected needShowProcessingView()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isAnimEntering()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isAnimExiting()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->isMediaInProcessing()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->isRotating()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->isDrawableDisplayInside()Z

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

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->updateProgress()V

    return-void
.end method

.method public onUnSelected()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->cancelQueryTask()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mNextQueryRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mNextQueryRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->hideLoading(Z)V

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onUnSelected()V

    return-void
.end method

.method public setProcessingMedia(Lcom/miui/gallery/provider/ProcessingMedia;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->mProcessingMedia:Lcom/miui/gallery/provider/ProcessingMedia;

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->this$0:Lcom/miui/gallery/ui/PhotoPageImageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageImageItem;->isPagerSelected()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageImageItem$ImageProcessingManager;->updateProgress()V

    :cond_0
    return-void
.end method
