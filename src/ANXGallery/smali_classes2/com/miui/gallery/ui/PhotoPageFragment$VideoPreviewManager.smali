.class Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;
.implements Lcom/miui/gallery/video/VideoFrameProvider$Listener;
.implements Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoPreviewManager"
.end annotation


# instance fields
.field private mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

.field private mDragStartTransitionY:F

.field private mDraggingIndex:I

.field private mDurationBar:Landroid/view/ViewGroup;

.field private mDurationBarHideRunnable:Ljava/lang/Runnable;

.field private mDurationBarMargin:I

.field private mDurationTextView:Landroid/widget/TextView;

.field private mLastRequestTime:J

.field private mPagerScrollState:I

.field private mProgressTextView:Landroid/widget/TextView;

.field private mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

.field private mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

.field private mSeekNeedCallback:Z

.field private mThumbItemHeight:I

.field private mThumbItemWidth:I

.field private mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

.field private mTotalDuration:J

.field private mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageFragment;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekNeedCallback:Z

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDraggingIndex:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDragStartTransitionY:F

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mPagerScrollState:I

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    new-instance v0, Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/VideoFrameProvider;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/VideoFrameProvider;->addListener(Lcom/miui/gallery/video/VideoFrameProvider$Listener;)V

    iget-object v0, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b018b

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/video/VideoFrameSeekBar;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06056b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbItemWidth:I

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06056a

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbItemHeight:I

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0604fe

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarMargin:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->setMenuCustomView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setOnSeekBarChangeListener(Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;)V

    return-void
.end method

.method static synthetic access$8600(Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;)Landroid/view/ViewGroup;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    return-object p0
.end method

.method private dismissDurationBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    :cond_0
    return-void
.end method

.method private dismissSeekBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setFrameList(Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setVisibility(I)V

    return-void
.end method

.method private hideDurationBar(Z)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0x7d0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method private onRequestFrameFailed()V
    .locals 2

    const-string v0, "VideoPreviewManager"

    const-string v1, "onRequestFrameFailed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onSeekFinish()V

    return-void
.end method

.method private onSeekFinish()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekNeedCallback:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$8500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$8500(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPlayerManager;->prepareFinish(Landroid/content/Context;)V

    const-string v0, "VideoPreviewManager"

    const-string v1, "onSeekFinish"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekNeedCallback:Z

    return-void
.end method

.method private pauseSeekBarAnim()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getTranslationY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDragStartTransitionY:F

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private requestFrame(J)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    if-eqz v0, :cond_2

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    cmp-long v2, p1, v0

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getPreviewSurface()Landroid/view/Surface;

    move-result-object v7

    if-nez v7, :cond_1

    return-void

    :cond_1
    iput-wide p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mLastRequestTime:J

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->getWidth()I

    move-result v3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->getHeight()I

    move-result v4

    move-wide v5, p1

    invoke-virtual/range {v1 .. v7}, Lcom/miui/gallery/video/VideoFrameProvider;->requestSingleFrame(Ljava/lang/String;IIJLandroid/view/Surface;)V

    return-void

    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onRequestFrameFailed()V

    return-void
.end method

.method private showDurationBar()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090329

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const v1, 0x7f090344

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProgressTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const v1, 0x7f090328

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationTextView:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setAlpha(F)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setVisibility(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateDuration()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateDurationBarLayout()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x104

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_1
    return-void
.end method

.method private translateSeekBar(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getHeight()I

    move-result v0

    int-to-float v0, v0

    mul-float p1, p1, v0

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDragStartTransitionY:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDragStartTransitionY:F

    add-float/2addr v1, p1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setTranslationY(F)V

    return-void
.end method

.method private updateAndShowSeekBar(Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;)V
    .locals 3

    const-string v0, "VideoPreviewManager"

    const-string v1, "updateAndShowSeekBar"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->getDuration()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;->getThumbList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setFrameList(Ljava/util/List;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getVisibility()I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setTranslationY(F)V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getTranslationY()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float v1, p1, v0

    if-lez v1, :cond_4

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float p1, p1, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getHeight()I

    move-result v1

    int-to-float v1, v1

    div-float/2addr p1, v1

    const/high16 v1, 0x437a0000    # 250.0f

    mul-float p1, p1, v1

    float-to-int p1, p1

    const/16 v1, 0x96

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_4
    return-void
.end method

.method private updateDuration()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getProgress()F

    move-result v0

    iget-wide v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    long-to-float v1, v1

    mul-float v0, v0, v1

    float-to-double v0, v0

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProgressTextView:Landroid/widget/TextView;

    const-wide v3, 0x408f400000000000L    # 1000.0

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v0, v3

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-long v0, v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationTextView:Landroid/widget/TextView;

    iget-wide v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    long-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-long v1, v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/FormatUtil;->formatVideoDuration(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private updateDurationBarLayout()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2000(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageFragment$PhotoMaskManager;->getSplitBarHeight()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v2}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getHeight()I

    move-result v2

    add-int/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBarMargin:I

    add-int/2addr v1, v2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDurationBar:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getSeekTime()J
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getProgress()F

    move-result v0

    iget-wide v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    long-to-float v1, v1

    mul-float v0, v0, v1

    float-to-int v0, v0

    int-to-long v0, v0

    iget-wide v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method onActionBarVisibilityChanged(Z)V
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->hideDurationBar(Z)V

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider;->release()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissDurationBar()V

    return-void
.end method

.method onOrientationChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissDurationBar()V

    return-void
.end method

.method public onPageScrollStateChanged(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mPagerScrollState:I

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    const-string p1, "VideoPreviewManager"

    const-string v0, "onPageScrollIdle"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->settleItem()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/PhotoPageFragment;->mPager:Lcom/miui/gallery/widget/ViewPager;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/ViewPager;->getCurrentItem()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDraggingIndex:I

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->hideDurationBar(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->pauseSeekBarAnim()V

    :cond_2
    :goto_0
    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    invoke-virtual {p3}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getVisibility()I

    move-result p3

    if-eqz p3, :cond_0

    return-void

    :cond_0
    iget p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDraggingIndex:I

    if-eq p3, p1, :cond_1

    iget p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDraggingIndex:I

    add-int/lit8 p3, p3, -0x1

    if-ne p3, p1, :cond_3

    :cond_1
    iget p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mDraggingIndex:I

    if-eq p3, p1, :cond_2

    const/high16 p1, 0x3f800000    # 1.0f

    sub-float p2, p1, p2

    :cond_2
    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->translateSeekBar(F)V

    :cond_3
    return-void
.end method

.method public onProgressChanged(F)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateDuration()V

    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    long-to-float v0, v0

    mul-float p1, p1, v0

    float-to-int p1, p1

    int-to-long v0, p1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->requestFrame(J)V

    return-void
.end method

.method public onScrollStateChanged(Z)V
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->showDurationBar()V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->onPreviewStart()V

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->hideDurationBar(Z)V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->onPreviewStop()V

    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/PhotoPageFragment;->access$2300(Lcom/miui/gallery/ui/PhotoPageFragment;)Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;

    move-result-object v1

    xor-int/2addr p1, v0

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeManager;->setEnterVisible(Z)V

    :cond_2
    return-void
.end method

.method public onSingleFrameResponse(Ljava/lang/String;J)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "VideoPreviewManager"

    const-string v0, "onSingleFrameResponse %d"

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mLastRequestTime:J

    cmp-long v2, p2, v0

    if-nez v2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->onPreviewUpdate(Z)V

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onSeekFinish()V

    return-void
.end method

.method public onStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider;->onStart()V

    return-void
.end method

.method public onStop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {v0}, Lcom/miui/gallery/video/VideoFrameProvider;->onStop()V

    return-void
.end method

.method public onSurfacePrepared(Landroid/view/Surface;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/video/VideoFrameProvider;->setSurfaceForVideo(Ljava/lang/String;Landroid/view/Surface;)V

    return-void
.end method

.method public onThumbListResponse(Ljava/lang/String;Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;)V
    .locals 2

    const-string v0, "VideoPreviewManager"

    const-string v1, "onThumbListResponse"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mPagerScrollState:I

    if-nez p1, :cond_1

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateAndShowSeekBar(Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method seekTo(JZ)V
    .locals 4

    iput-boolean p3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekNeedCallback:Z

    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    const-wide/16 v2, 0x0

    cmp-long p3, v0, v2

    if-lez p3, :cond_2

    cmp-long p3, p1, v2

    if-gez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-wide v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    invoke-static {v2, v3, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    long-to-float p3, p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p3, p3, v0

    iget-wide v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    long-to-float v1, v1

    div-float/2addr p3, v1

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mSeekBar:Lcom/miui/gallery/video/VideoFrameSeekBar;

    const/4 v2, 0x0

    invoke-static {v0, p3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setProgress(F)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->requestFrame(J)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->onPreviewStop()V

    :cond_1
    const-string v0, "VideoPreviewManager"

    const-string v1, "seekTo %d, total %d, percent %f"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    iget-wide v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mTotalDuration:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_2
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->onSeekFinish()V

    return-void
.end method

.method settleItem()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissSeekBar()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissDurationBar()V

    return-void

    :cond_0
    const-string v0, "VideoPreviewManager"

    const-string v1, "onSettleItem"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->getPreviewSurface()Landroid/view/Surface;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameProvider;->getThumbListInfo(Ljava/lang/String;)Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    move-result-object v0

    :cond_2
    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissSeekBar()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->dismissDurationBar()V

    goto :goto_0

    :cond_3
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->updateAndShowSeekBar(Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;)V

    :goto_0
    return-void
.end method

.method updateItem(Lcom/miui/gallery/model/BaseDataItem;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameProvider;->releaseForVideo(Ljava/lang/String;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->setOnSurfacePreparedListener(Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;)V

    :cond_1
    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbListInfo:Lcom/miui/gallery/video/VideoFrameProvider$ThumbListInfo;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->this$0:Lcom/miui/gallery/ui/PhotoPageFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageFragment;->mPagerHelper:Lcom/miui/gallery/ui/PhotoPagerHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPagerHelper;->getCurrentItem()Lcom/miui/gallery/ui/PhotoPageItem;

    move-result-object v0

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    instance-of v2, v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    const-string v1, "VideoPreviewManager"

    const-string v2, "updateItem"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/ui/PhotoPageVideoItem;->setOnSurfacePreparedListener(Lcom/miui/gallery/ui/PhotoPageVideoItem$OnSurfacePreparedListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/VideoFrameProvider;->prepareForVideo(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mProvider:Lcom/miui/gallery/video/VideoFrameProvider;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    iget v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbItemWidth:I

    iget v2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mThumbItemHeight:I

    invoke-virtual {v0, p1, v1, v2}, Lcom/miui/gallery/video/VideoFrameProvider;->requestThumbList(Ljava/lang/String;II)V

    goto :goto_1

    :cond_3
    :goto_0
    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mCurrentItem:Lcom/miui/gallery/model/BaseDataItem;

    iput-object v1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$VideoPreviewManager;->mVideoPageItem:Lcom/miui/gallery/ui/PhotoPageVideoItem;

    :goto_1
    return-void
.end method
