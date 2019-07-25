.class final Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;
.super Ljava/lang/Object;
.source "PullToRefreshBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SmoothScrollRunnable"
.end annotation


# instance fields
.field private mContinueRunning:Z

.field private mCurrentY:I

.field private final mDuration:J

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private mListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;

.field private final mScrollFromY:I

.field private final mScrollToY:I

.field private mStartTime:J

.field final synthetic this$0:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;IIJLcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mContinueRunning:Z

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mStartTime:J

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mCurrentY:I

    iput p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollFromY:I

    iput p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollToY:I

    invoke-static {p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->access$200(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)Landroid/view/animation/Interpolator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    iput-wide p4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mDuration:J

    iput-object p6, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    iget-wide v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mStartTime:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mStartTime:J

    goto :goto_0

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mStartTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x3e8

    mul-long v0, v0, v2

    iget-wide v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mDuration:J

    div-long/2addr v0, v4

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iget v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollFromY:I

    iget v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollToY:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    long-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    invoke-interface {v3, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result v0

    mul-float v2, v2, v0

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollFromY:I

    sub-int/2addr v1, v0

    iput v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mCurrentY:I

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;

    iget v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mCurrentY:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setHeaderScroll(I)V

    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mContinueRunning:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mScrollToY:I

    iget v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mCurrentY:I

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;

    invoke-static {v0, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/ViewCompat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;

    invoke-interface {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;->onSmoothScrollFinished()V

    :cond_2
    :goto_1
    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->mContinueRunning:Z

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->this$0:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method
