.class public abstract Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;
.super Landroid/widget/LinearLayout;
.source "PullToRefreshBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;,
        Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/view/View;",
        ">",
        "Landroid/widget/LinearLayout;"
    }
.end annotation


# instance fields
.field private mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field private mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase<",
            "TT;>.SmoothScrollRunnable;"
        }
    .end annotation
.end field

.field private mFilterTouchEvents:Z

.field private mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

.field private mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mIsBeingDragged:Z

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mLayoutVisibilityChangesEnabled:Z

.field private mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

.field private mMaximumPullScroll:I

.field private mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

.field private mOnPullEventListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mOverScrollEnabled:Z

.field mRefreshableView:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mRefreshableViewWrapper:Landroid/widget/FrameLayout;

.field private mScrollAnimationInterpolator:Landroid/view/animation/Interpolator;

.field private mScrollingWhileRefreshingEnabled:Z

.field private mShowViewWhileRefreshing:Z

.field private mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

.field private mTouchSlop:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    iput-object p3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->callRefreshListener()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)Landroid/view/animation/Interpolator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollAnimationInterpolator:Landroid/view/animation/Interpolator;

    return-object p0
.end method

.method private addRefreshableView(Landroid/content/Context;Landroid/view/View;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "TT;)V"
        }
    .end annotation

    new-instance v0, Landroid/widget/FrameLayout;

    invoke-direct {v0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableViewWrapper:Landroid/widget/FrameLayout;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableViewWrapper:Landroid/widget/FrameLayout;

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;II)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableViewWrapper:Landroid/widget/FrameLayout;

    new-instance p2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {p2, v0, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->addViewInternal(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private callRefreshListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;->onRefresh(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    invoke-interface {v0, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;->onPullDownToRefresh(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne v0, v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    invoke-interface {v0, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;->onPullUpToRefresh(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private getLoadingLayoutLayoutParams()Landroid/widget/LinearLayout$LayoutParams;
    .locals 4

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, -0x2

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-eq v0, v3, :cond_0

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v2, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0

    :cond_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method private getMaximumPullScroll()I
    .locals 3

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    const/4 v2, 0x1

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMaximumPullScroll:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMaximumPullScroll:I

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getHeight()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 6

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setOrientation(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setOrientation(I)V

    :goto_0
    const/16 v0, 0x11

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setGravity(I)V

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mTouchSlop:I

    sget-object v3, Lcom/miui/gallery/R$styleable;->PullToRefresh:[I

    invoke-virtual {p1, p2, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object v3

    const/16 v4, 0xd

    invoke-virtual {v3, v4}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-virtual {v3, v4, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    invoke-static {v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v4

    iput-object v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    :cond_1
    invoke-virtual {v3, v1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v4

    invoke-static {v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    move-result-object v4

    iput-object v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    :cond_2
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableView:Landroid/view/View;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->addRefreshableView(Landroid/content/Context;Landroid/view/View;)V

    sget-object p2, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p0, p1, p2, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->createLoadingLayout(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Landroid/content/res/TypedArray;)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    sget-object p2, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p0, p1, p2, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->createLoadingLayout(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Landroid/content/res/TypedArray;)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    const/16 p1, 0xf

    invoke-virtual {v3, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {v3, p1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_3
    invoke-virtual {v3, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {v3, v2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableView:Landroid/view/View;

    invoke-virtual {p2, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_4
    :goto_1
    const/16 p1, 0xe

    invoke-virtual {v3, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-virtual {v3, p1, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    :cond_5
    invoke-virtual {v3, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p1

    if-eqz p1, :cond_6

    invoke-virtual {v3, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    :cond_6
    const/16 p1, 0xc

    invoke-virtual {v3, p1}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-virtual {v3, p1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMaximumPullScroll:I

    :cond_7
    invoke-virtual {p0, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->handleStyledAttributes(Landroid/content/res/TypedArray;)V

    invoke-virtual {v3}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->updateUIForMode()V

    return-void
.end method

.method private isReadyForPull()Z
    .locals 3

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x4

    const/4 v2, 0x0

    if-eq v0, v1, :cond_0

    packed-switch v0, :pswitch_data_0

    return v2

    :pswitch_0
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullStart()Z

    move-result v0

    return v0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullEnd()Z

    move-result v0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullEnd()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullStart()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v2, 0x1

    :cond_2
    return v2

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private pullEvent()V
    .locals 6

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionY:F

    iget v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionX:F

    iget v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    :goto_0
    sget-object v3, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/high16 v4, 0x40000000    # 2.0f

    const/4 v5, 0x0

    if-eq v3, v1, :cond_1

    sub-float/2addr v0, v2

    invoke-static {v0, v5}, Ljava/lang/Math;->min(FF)F

    move-result v0

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getHeaderSize()I

    move-result v2

    goto :goto_1

    :cond_1
    sub-float/2addr v0, v2

    invoke-static {v0, v5}, Ljava/lang/Math;->max(FF)F

    move-result v0

    div-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getFooterSize()I

    move-result v2

    :goto_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setHeaderScroll(I)V

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isRefreshing()Z

    move-result v3

    if-nez v3, :cond_4

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v3

    int-to-float v3, v3

    int-to-float v4, v2

    div-float/2addr v3, v4

    sget-object v4, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v5, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v5}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    if-eq v4, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->onPull(F)V

    goto :goto_2

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->onPull(F)V

    :goto_2
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v3, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const/4 v4, 0x0

    if-eq v1, v3, :cond_3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-lt v2, v1, :cond_3

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-array v1, v4, [Z

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    goto :goto_3

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v3, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->PULL_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-ne v1, v3, :cond_4

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    if-ge v2, v0, :cond_4

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RELEASE_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-array v1, v4, [Z

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    :cond_4
    :goto_3
    return-void
.end method

.method private final smoothScrollTo(IJ)V
    .locals 7

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(IJJLcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V

    return-void
.end method

.method private final smoothScrollTo(IJJLcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;->stop()V

    :cond_0
    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getScrollY()I

    move-result v0

    :goto_0
    move v3, v0

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getScrollX()I

    move-result v0

    goto :goto_0

    :goto_1
    if-eq v3, p1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollAnimationInterpolator:Landroid/view/animation/Interpolator;

    if-nez v0, :cond_2

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollAnimationInterpolator:Landroid/view/animation/Interpolator;

    :cond_2
    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    move-object v1, v0

    move-object v2, p0

    move v4, p1

    move-wide v5, p2

    move-object v7, p6

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;-><init>(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;IIJLcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    const-wide/16 p1, 0x0

    cmp-long p3, p4, p1

    if-lez p3, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    invoke-virtual {p0, p1, p4, p5}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentSmoothScrollRunnable:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$SmoothScrollRunnable;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->post(Ljava/lang/Runnable;)Z

    :cond_4
    :goto_2
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Refreshable View is not a ViewGroup so can\'t addView"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected final addViewInternal(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected final addViewInternal(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    const/4 v0, -0x1

    invoke-super {p0, p1, v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method protected createLoadingLayout(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Landroid/content/res/TypedArray;)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLoadingAnimationStyle:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1, p3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$AnimationStyle;->createLoadingLayout(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;Landroid/content/res/TypedArray;)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    move-result-object p1

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setVisibility(I)V

    return-object p1
.end method

.method protected createLoadingLayoutProxy(ZZ)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;
    .locals 1

    new-instance v0, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;

    invoke-direct {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;-><init>()V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;->addLayout(Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;)V

    :cond_0
    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;->addLayout(Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;)V

    :cond_1
    return-object v0
.end method

.method protected abstract createRefreshableView(Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/util/AttributeSet;",
            ")TT;"
        }
    .end annotation
.end method

.method public final getCurrentMode()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-object v0
.end method

.method public final getFilterTouchEvents()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    return v0
.end method

.method protected final getFooterLayout()Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    return-object v0
.end method

.method protected final getFooterSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getContentSize()I

    move-result v0

    return v0
.end method

.method protected final getHeaderLayout()Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    return-object v0
.end method

.method protected final getHeaderSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getContentSize()I

    move-result v0

    return v0
.end method

.method public final getLoadingLayoutProxy()Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy(ZZ)Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object v0

    return-object v0
.end method

.method public final getLoadingLayoutProxy(ZZ)Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->createLoadingLayoutProxy(ZZ)Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayoutProxy;

    move-result-object p1

    return-object p1
.end method

.method public final getMode()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-object v0
.end method

.method public abstract getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;
.end method

.method protected getPullToRefreshScrollDuration()I
    .locals 1

    const/16 v0, 0xc8

    return v0
.end method

.method protected getPullToRefreshScrollDurationLonger()I
    .locals 1

    const/16 v0, 0x145

    return v0
.end method

.method public final getRefreshableView()Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableView:Landroid/view/View;

    return-object v0
.end method

.method protected getRefreshableViewWrapper()Landroid/widget/FrameLayout;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mRefreshableViewWrapper:Landroid/widget/FrameLayout;

    return-object v0
.end method

.method public final getShowViewWhileRefreshing()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    return v0
.end method

.method public final getState()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    return-object v0
.end method

.method protected handleStyledAttributes(Landroid/content/res/TypedArray;)V
    .locals 0

    return-void
.end method

.method public final isPullToRefreshEnabled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->permitsPullToRefresh()Z

    move-result v0

    return v0
.end method

.method protected abstract isReadyForPullEnd()Z
.end method

.method protected abstract isReadyForPullStart()Z
.end method

.method public final isRefreshing()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public final onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isPullToRefreshEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x3

    if-eq v0, v2, :cond_9

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    goto/16 :goto_2

    :cond_1
    if-eqz v0, :cond_2

    iget-boolean v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    if-eqz v3, :cond_2

    return v2

    :cond_2
    if-eqz v0, :cond_7

    const/4 v1, 0x2

    if-eq v0, v1, :cond_3

    goto/16 :goto_1

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPull()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v3

    aget v1, v1, v3

    if-eq v1, v2, :cond_4

    iget v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    sub-float v1, v0, v1

    iget v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    sub-float v3, p1, v3

    goto :goto_0

    :cond_4
    iget v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    sub-float v1, p1, v1

    iget v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    sub-float v3, v0, v3

    :goto_0
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v4, v5

    if-lez v5, :cond_8

    iget-boolean v5, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    if-eqz v5, :cond_5

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v3, v4, v3

    if-lez v3, :cond_8

    :cond_5
    iget-object v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v3

    if-eqz v3, :cond_6

    const/high16 v3, 0x3f800000    # 1.0f

    cmpl-float v3, v1, v3

    if-ltz v3, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullStart()Z

    move-result v3

    if-eqz v3, :cond_6

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    iput-boolean v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne p1, v0, :cond_8

    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    goto :goto_1

    :cond_6
    iget-object v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result v3

    if-eqz v3, :cond_8

    const/high16 v3, -0x40800000    # -1.0f

    cmpg-float v1, v1, v3

    if-gtz v1, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPullEnd()Z

    move-result v1

    if-eqz v1, :cond_8

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    iput-boolean v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne p1, v0, :cond_8

    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_END:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    goto :goto_1

    :cond_7
    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPull()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionY:F

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionX:F

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    :cond_8
    :goto_1
    iget-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    return p1

    :cond_9
    :goto_2
    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    return v1
.end method

.method protected onPtrRestoreInstanceState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method protected onPtrSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method protected onPullToRefresh()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->pullToRefresh()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->pullToRefresh()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final onRefreshComplete()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isRefreshing()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const/4 v1, 0x0

    new-array v1, v1, [Z

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    :cond_0
    return-void
.end method

.method protected onRefreshing(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->refreshing()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->refreshing()V

    :cond_1
    if-eqz p1, :cond_4

    iget-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    if-eqz p1, :cond_3

    new-instance p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$1;-><init>(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;)V

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getHeaderSize()I

    move-result v0

    neg-int v0, v0

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(ILcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getFooterSize()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(ILcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(I)V

    goto :goto_0

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->callRefreshListener()V

    :goto_0
    return-void
.end method

.method protected onReleaseToRefresh()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->releaseToRefresh()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->releaseToRefresh()V

    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected onReset()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->reset()V

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->reset()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(I)V

    return-void
.end method

.method protected final onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 4

    instance-of v0, p1, Landroid/os/Bundle;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/os/Bundle;

    const-string v0, "ptr_mode"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setMode(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    const-string v0, "ptr_current_mode"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    const-string v0, "ptr_disable_scrolling"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    const-string v0, "ptr_show_refreshing_view"

    const/4 v2, 0x1

    invoke-virtual {p1, v0, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    const-string v0, "ptr_super"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/widget/LinearLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    const-string v0, "ptr_state"

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->mapIntToValue(I)Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    move-result-object v0

    sget-object v3, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-eq v0, v3, :cond_0

    sget-object v3, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-ne v0, v3, :cond_1

    :cond_0
    new-array v3, v2, [Z

    aput-boolean v2, v3, v1

    invoke-virtual {p0, v0, v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onPtrRestoreInstanceState(Landroid/os/Bundle;)V

    return-void

    :cond_2
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    return-void
.end method

.method protected final onSaveInstanceState()Landroid/os/Parcelable;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onPtrSaveInstanceState(Landroid/os/Bundle;)V

    const-string v1, "ptr_state"

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-virtual {v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->getIntValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "ptr_mode"

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getIntValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "ptr_current_mode"

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getIntValue()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "ptr_disable_scrolling"

    iget-boolean v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "ptr_show_refreshing_view"

    iget-boolean v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v1, "ptr_super"

    invoke-super {p0}, Landroid/widget/LinearLayout;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    return-object v0
.end method

.method protected final onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/LinearLayout;->onSizeChanged(IIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->refreshLoadingViewsSize()V

    return-void
.end method

.method public final onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isPullToRefreshEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->pullEvent()V

    return v2

    :pswitch_1
    iget-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    if-eqz p1, :cond_5

    iput-boolean v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mIsBeingDragged:Z

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RELEASE_TO_REFRESH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    if-ne p1, v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    if-eqz p1, :cond_3

    :cond_2
    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-array v0, v2, [Z

    aput-boolean v2, v0, v1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    return v2

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isRefreshing()Z

    move-result p1

    if-eqz p1, :cond_4

    invoke-virtual {p0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(I)V

    return v2

    :cond_4
    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->RESET:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    new-array v0, v1, [Z

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    return v2

    :pswitch_2
    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isReadyForPull()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionY:F

    iput v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionY:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mInitialMotionX:F

    iput p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLastMotionX:F

    return v2

    :cond_5
    :goto_0
    return v1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected final refreshLoadingViewsSize()V
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getMaximumPullScroll()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f99999a    # 1.2f

    mul-float v0, v0, v1

    float-to-int v0, v0

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPaddingLeft()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPaddingTop()I

    move-result v2

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPaddingRight()I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPaddingBottom()I

    move-result v4

    sget-object v5, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v6

    invoke-virtual {v6}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v6

    aget v5, v5, v6

    const/4 v6, 0x0

    packed-switch v5, :pswitch_data_0

    goto :goto_2

    :pswitch_0
    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setHeight(I)V

    neg-int v2, v0

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v4, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setHeight(I)V

    neg-int v4, v0

    goto :goto_2

    :cond_1
    const/4 v4, 0x0

    goto :goto_2

    :pswitch_1
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setWidth(I)V

    neg-int v1, v0

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v3}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v3, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setWidth(I)V

    neg-int v3, v0

    goto :goto_2

    :cond_3
    const/4 v3, 0x0

    :goto_2
    invoke-virtual {p0, v1, v2, v3, v4}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setPadding(IIII)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setDisableScrollingWhileRefreshing(Z)V
    .locals 0

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setScrollingWhileRefreshingEnabled(Z)V

    return-void
.end method

.method public final setFilterTouchEvents(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFilterTouchEvents:Z

    return-void
.end method

.method protected final setHeaderScroll(I)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getMaximumPullScroll()I

    move-result v0

    neg-int v1, v0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iget-boolean v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mLayoutVisibilityChangesEnabled:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    if-gez p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setVisibility(I)V

    goto :goto_0

    :cond_0
    if-lez p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setVisibility(I)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    const/4 v2, 0x4

    invoke-virtual {v0, v2}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->setVisibility(I)V

    :cond_2
    :goto_0
    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Orientation:[I

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDirection()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p0, v1, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->scrollTo(II)V

    goto :goto_1

    :pswitch_1
    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->scrollTo(II)V

    :goto_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setLastUpdatedLabel(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy()Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;->setLastUpdatedLabel(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setLoadingDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy()Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;->setLoadingDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setLongClickable(Z)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getRefreshableView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setLongClickable(Z)V

    return-void
.end method

.method public final setMode(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq p1, v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->updateUIForMode()V

    :cond_0
    return-void
.end method

.method public setOnPullEventListener(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnPullEventListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;

    return-void
.end method

.method public final setOnRefreshListener(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;

    return-void
.end method

.method public final setOnRefreshListener(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnRefreshListener2:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnRefreshListener2;

    return-void
.end method

.method public setPullLabel(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy()Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;->setPullLabel(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final setPullToRefreshEnabled(Z)V
    .locals 0

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->getDefault()Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    move-result-object p1

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->DISABLED:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setMode(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    return-void
.end method

.method public final setPullToRefreshOverScrollEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOverScrollEnabled:Z

    return-void
.end method

.method public final setRefreshing(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->isRefreshing()Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->MANUAL_REFRESHING:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    const/4 v1, 0x1

    new-array v1, v1, [Z

    const/4 v2, 0x0

    aput-boolean p1, v1, v2

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V

    :cond_0
    return-void
.end method

.method public setRefreshingLabel(Ljava/lang/CharSequence;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy()Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;->setRefreshingLabel(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setReleaseLabel(Ljava/lang/CharSequence;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->setReleaseLabel(Ljava/lang/CharSequence;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    return-void
.end method

.method public setReleaseLabel(Ljava/lang/CharSequence;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V
    .locals 1

    invoke-virtual {p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result p2

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutProxy(ZZ)Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;

    move-result-object p2

    invoke-interface {p2, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/ILoadingLayout;->setReleaseLabel(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setScrollAnimationInterpolator(Landroid/view/animation/Interpolator;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollAnimationInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public final setScrollingWhileRefreshingEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mScrollingWhileRefreshingEnabled:Z

    return-void
.end method

.method public final setShowViewWhileRefreshing(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mShowViewWhileRefreshing:Z

    return-void
.end method

.method final varargs setState(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;[Z)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$3;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$State:[I

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    invoke-virtual {v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;->ordinal()I

    move-result v0

    aget p1, p1, v0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 p1, 0x0

    aget-boolean p1, p2, p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onRefreshing(Z)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onReleaseToRefresh()V

    goto :goto_0

    :pswitch_2
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onPullToRefresh()V

    goto :goto_0

    :pswitch_3
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->onReset()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnPullEventListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mOnPullEventListener:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mState:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-interface {p1, p0, p2, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnPullEventListener;->onPullEvent(Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$State;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;)V

    :cond_0
    return-void

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected final smoothScrollTo(I)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDuration()I

    move-result v0

    int-to-long v0, v0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(IJ)V

    return-void
.end method

.method protected final smoothScrollTo(ILcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getPullToRefreshScrollDuration()I

    move-result v0

    int-to-long v3, v0

    const-wide/16 v5, 0x0

    move-object v1, p0

    move v2, p1

    move-object v7, p2

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->smoothScrollTo(IJJLcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$OnSmoothScrollFinishedListener;)V

    return-void
.end method

.method protected updateUIForMode()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->getLoadingLayoutLayoutParams()Landroid/widget/LinearLayout$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne p0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->removeView(Landroid/view/View;)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showHeaderLoadingLayout()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mHeaderLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    const/4 v2, 0x0

    invoke-virtual {p0, v1, v2, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->addViewInternal(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-ne p0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->removeView(Landroid/view/View;)V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->showFooterLoadingLayout()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mFooterLayout:Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->addViewInternal(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->refreshLoadingViewsSize()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->BOTH:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-eq v0, v1, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    goto :goto_0

    :cond_4
    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    :goto_0
    iput-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase;->mCurrentMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    return-void
.end method
