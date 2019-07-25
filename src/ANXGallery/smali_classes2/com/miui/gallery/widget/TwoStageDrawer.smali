.class public Lcom/miui/gallery/widget/TwoStageDrawer;
.super Landroid/widget/RelativeLayout;
.source "TwoStageDrawer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/TwoStageDrawer$RecyclerViewWrapper;,
        Lcom/miui/gallery/widget/TwoStageDrawer$FixedViewWrapper;,
        Lcom/miui/gallery/widget/TwoStageDrawer$ScrollViewWrapper;,
        Lcom/miui/gallery/widget/TwoStageDrawer$AdapterViewWrapper;,
        Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;,
        Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;,
        Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;,
        Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;,
        Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;
    }
.end annotation


# instance fields
.field private mActionPointerId:I

.field private mAlwaysShowTargetViewDivider:Z

.field private mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

.field private mAutoClose:Z

.field private mCanScrollDown:Z

.field private mContentViewBackground:Landroid/graphics/drawable/Drawable;

.field private mDetectMode:I

.field private mDividerHeight:I

.field private mDownTranslationY:F

.field private mDownView:Landroid/view/View;

.field private mDownX:F

.field private mDownY:F

.field private mDragEnabled:Z

.field private mDrawDividerWhenContentEmpty:Z

.field private mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

.field private mInitialDrawerState:I

.field private mIsFirstLayoutChanged:Z

.field private mLastY:F

.field private mMinimumFlingVelocity:I

.field private mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private mPendingScroll:Z

.field private mPendingTranslate:Z

.field private mPrimaryContentHeight:I

.field private mPrimaryContentHeightChanged:Z

.field private mPrimaryContentView:Landroid/view/View;

.field private mPrimaryContentViewId:I

.field private mScrollDivider:Landroid/graphics/drawable/Drawable;

.field private mScrollableViewId:I

.field private mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

.field private mScroller:Landroid/widget/Scroller;

.field private mScrolling:Z

.field private mSecondaryContentHeight:I

.field private mSecondaryContentHeightChanged:Z

.field private mSecondaryContentView:Landroid/view/View;

.field private mSecondaryContentViewId:I

.field private mSupportMultiPoint:Z

.field private mTargetView:Landroid/view/View;

.field private mTargetViewAncestor:Landroid/view/View;

.field private mTargetViewId:I

.field private mTouchMode:I

.field private mTouchSlop:I

.field private mTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

.field private mTriggerOn:Z

.field private mTriggerView:Landroid/view/View;

.field private mTriggerViewHeight:I

.field private mTriggerViewId:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mIsFirstLayoutChanged:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mInitialDrawerState:I

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSupportMultiPoint:Z

    new-instance v2, Lcom/miui/gallery/widget/TwoStageDrawer$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$1;-><init>(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    iput-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchSlop:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mMinimumFlingVelocity:I

    new-instance v2, Landroid/widget/Scroller;

    invoke-direct {v2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    sget-object v2, Lcom/miui/gallery/R$styleable;->TwoStageDrawer:[I

    invoke-virtual {p1, p2, v2, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x6

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentViewId:I

    const/16 p2, 0x9

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentViewId:I

    const/16 p2, 0xa

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewId:I

    const/16 p2, 0x8

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewId:I

    const/4 p2, 0x7

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    :cond_0
    const/4 p2, 0x3

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewId:I

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x5

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDragEnabled:Z

    invoke-virtual {p1, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAlwaysShowTargetViewDivider:Z

    invoke-virtual {p1, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawDividerWhenContentEmpty:Z

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/TwoStageDrawer;Landroid/view/View;)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->getViewHeight(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->onFirstLayoutChanged()V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/TwoStageDrawer;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrolling:Z

    return p0
.end method

.method static synthetic access$1202(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingTranslate:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->adaptiveTranslate()V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/widget/TwoStageDrawer;)Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/widget/TwoStageDrawer;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mCanScrollDown:Z

    return p0
.end method

.method static synthetic access$1602(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mCanScrollDown:Z

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/TwoStageDrawer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/widget/TwoStageDrawer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeightChanged:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/TwoStageDrawer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    return p0
.end method

.method static synthetic access$502(Lcom/miui/gallery/widget/TwoStageDrawer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    return p1
.end method

.method static synthetic access$602(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeightChanged:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/TwoStageDrawer;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/TwoStageDrawer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    return p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/widget/TwoStageDrawer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    return p1
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/TwoStageDrawer;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mIsFirstLayoutChanged:Z

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mIsFirstLayoutChanged:Z

    return p1
.end method

.method private adaptiveTranslate()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v0, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    sub-int/2addr v1, v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(II)V

    goto :goto_0

    :cond_1
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v1, v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(II)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    cmpl-float v1, v1, v2

    if-nez v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v1, v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(II)V

    :cond_3
    :goto_0
    return-void
.end method

.method private computeScrollDuration(IF)I
    .locals 1

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x447a0000    # 1000.0f

    int-to-float p1, p1

    div-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    mul-float p1, p1, v0

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    mul-int/lit8 p1, p1, 0x4

    :goto_0
    const/16 p2, 0x320

    if-le p1, p2, :cond_1

    const/16 p1, 0x320

    :cond_1
    return p1
.end method

.method private dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result v1

    add-float/2addr v0, v1

    neg-float v0, v0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v2

    add-float/2addr v1, v2

    neg-float v1, v1

    invoke-virtual {p2, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    invoke-virtual {p1, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    neg-float p1, v0

    neg-float v0, v1

    invoke-virtual {p2, p1, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    return-void
.end method

.method private dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;IZ)V

    return-void
.end method

.method private dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;IZ)V
    .locals 8

    if-eqz p4, :cond_0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getMetaState()I

    move-result v7

    move v4, p3

    invoke-static/range {v0 .. v7}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object p2

    goto :goto_0

    :cond_0
    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p2

    invoke-virtual {p2, p3}, Landroid/view/MotionEvent;->setAction(I)V

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;)V

    invoke-virtual {p2}, Landroid/view/MotionEvent;->recycle()V

    return-void
.end method

.method private drawPrimaryContentView(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    if-gtz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getWidth()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    const/4 v3, 0x0

    if-lez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    add-int/2addr v4, v3

    invoke-virtual {v2, v3, v3, v1, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    add-int/2addr v2, v3

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v3, v2, v1, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v3, v2, v1, v0}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return p2
.end method

.method private drawSecondaryContentView(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-gt v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-le v0, v4, :cond_1

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v5, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v4, v5

    if-ge v0, v4, :cond_1

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    add-int/2addr v5, v3

    invoke-virtual {v4, v1, v3, v2, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    add-int/2addr v3, v4

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v1, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v1, v3, v2, v0}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return p2
.end method

.method private drawTargetViewAncestor(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 3

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getTranslationY()F

    move-result p3

    float-to-int p3, p3

    iget-boolean p4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAlwaysShowTargetViewDivider:Z

    if-nez p4, :cond_1

    if-gtz p3, :cond_0

    iget-boolean p4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mCanScrollDown:Z

    if-nez p4, :cond_1

    :cond_0
    iget-boolean p4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawDividerWhenContentEmpty:Z

    if-eqz p4, :cond_2

    iget p4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-nez p4, :cond_2

    iget p4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    if-nez p4, :cond_2

    :cond_1
    const/4 p4, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getWidth()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    add-int/2addr v2, p3

    invoke-virtual {v1, p4, p3, v0, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object p3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    return p2
.end method

.method private drawTriggerView(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    if-gt v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getWidth()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v3, v4

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, v1, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v1, v3, v2, v0}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return p2
.end method

.method private getTouchDownView(II)Landroid/view/View;
    .locals 9

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    const/4 v1, 0x4

    new-array v1, v1, [Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    const/4 v4, 0x2

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    const/4 v4, 0x3

    aput-object v2, v1, v4

    array-length v2, v1

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v4}, Landroid/view/View;->getX()F

    move-result v5

    float-to-int v5, v5

    invoke-virtual {v4}, Landroid/view/View;->getY()F

    move-result v6

    float-to-int v6, v6

    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    move-result v8

    add-int/2addr v8, v6

    invoke-virtual {v0, v5, v6, v7, v8}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    move-result v5

    if-eqz v5, :cond_0

    return-object v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getViewHeight(Landroid/view/View;)I
    .locals 2

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    instance-of v1, p1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr v1, p1

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :cond_1
    :goto_0
    return v0
.end method

.method private notifyDrawerStateChanged()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v0, :cond_6

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_1

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-interface {v1, p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerSlide(Lcom/miui/gallery/widget/TwoStageDrawer;F)V

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerClose(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_0

    :cond_2
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-ne v0, v1, :cond_4

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_0

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerHalfOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_0

    :cond_4
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    if-ne v0, v1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_0

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v2, v3

    int-to-float v2, v2

    div-float/2addr v0, v2

    invoke-interface {v1, p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;->onDrawerSlide(Lcom/miui/gallery/widget/TwoStageDrawer;F)V

    :cond_6
    :goto_0
    return-void
.end method

.method private notifyTriggerStateChanged()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    float-to-int v1, v1

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    int-to-float v3, v1

    int-to-float v4, v0

    div-float/2addr v3, v4

    invoke-interface {v2, p0, v3}, Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;->onTriggerSlide(Lcom/miui/gallery/widget/TwoStageDrawer;F)V

    if-lt v1, v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerOn:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerOn:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;->onTriggerOpen(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    goto :goto_0

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerOn:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerOn:Z

    :cond_1
    :goto_0
    return-void
.end method

.method private offsetTranslationAnimation(FF)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    if-le v0, v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v3

    int-to-float v1, v1

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v0, v3

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v0, v3

    int-to-float v0, v0

    mul-float v0, v0, v2

    add-float/2addr v1, v0

    goto :goto_0

    :cond_0
    int-to-float v1, v0

    :goto_0
    add-float/2addr v1, p1

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownTranslationY:F

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    int-to-float v3, v3

    cmpg-float p1, p1, v3

    if-gtz p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mMinimumFlingVelocity:I

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    :goto_1
    int-to-float p1, p1

    goto :goto_2

    :cond_1
    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    goto :goto_1

    :goto_2
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    goto :goto_4

    :cond_2
    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    if-gtz p1, :cond_3

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr p1, p2

    int-to-float p1, p1

    goto :goto_3

    :cond_3
    const/high16 p1, 0x4f000000

    :goto_3
    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :goto_4
    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr p2, v0

    int-to-float p2, p2

    cmpl-float p2, p1, p2

    if-lez p2, :cond_4

    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr p2, v0

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    int-to-float v0, v0

    sub-float/2addr p1, v0

    div-float/2addr p1, v2

    float-to-int p1, p1

    add-int/2addr p2, p1

    goto :goto_5

    :cond_4
    float-to-int p2, p1

    :goto_5
    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    return-void
.end method

.method private onFirstLayoutChanged()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mInitialDrawerState:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v0

    :goto_0
    :pswitch_2
    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method private startScroll(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1, v1, p2}, Landroid/widget/Scroller;->startScroll(IIII)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrolling:Z

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    return-void
.end method

.method private startScroll(IIF)V
    .locals 0

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/widget/TwoStageDrawer;->computeScrollDuration(IF)I

    move-result p3

    if-lez p3, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(III)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(II)V

    :goto_0
    return-void
.end method

.method private startScroll(III)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x0

    const/4 v3, 0x0

    move v2, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrolling:Z

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    return-void
.end method

.method private updateTranslationAnimation(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    int-to-float v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getFinalY()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    const/4 v2, 0x0

    if-eqz v1, :cond_3

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeightChanged:Z

    if-nez v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int v3, p1, v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_0

    :cond_1
    if-nez v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    neg-int v3, v3

    int-to-float v3, v3

    invoke-virtual {v1, v3}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setTranslationY(F)V

    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v1, :cond_8

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeightChanged:Z

    if-nez v1, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-gt p1, v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    rsub-int/lit8 v1, v1, 0x0

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_2

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int v1, p1, v1

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_2

    :cond_5
    if-eqz v0, :cond_7

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-ne v0, v1, :cond_6

    goto :goto_1

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_2

    :cond_7
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v3

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    :cond_8
    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-eqz v0, :cond_a

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v0, v1

    if-gt p1, v0, :cond_9

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    rsub-int/lit8 v0, v0, 0x0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    goto :goto_3

    :cond_9
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    invoke-virtual {p1, v2}, Landroid/view/View;->setTranslationY(F)V

    :cond_a
    :goto_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyTriggerStateChanged()V

    return-void
.end method


# virtual methods
.method public closeDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 1

    iput-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    float-to-int p1, p1

    neg-int p2, p1

    const/16 v0, 0x1f4

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(III)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    :goto_0
    return-void
.end method

.method public computeScroll()V
    .locals 2

    invoke-super {p0}, Landroid/widget/RelativeLayout;->computeScroll()V

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->postInvalidateOnAnimation()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->isDrawerOpen()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;->onDrawerAnimEnd(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrolling:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrolling:Z

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingTranslate:Z

    if-eqz v1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->adaptiveTranslate()V

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingTranslate:Z

    goto :goto_0

    :cond_2
    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeightChanged:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeightChanged:Z

    :cond_3
    :goto_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 12

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSupportMultiPoint:Z

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    if-le v1, v3, :cond_0

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDragEnabled:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-eqz v1, :cond_3

    :cond_1
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-gtz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    if-gtz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    if-lez v1, :cond_3

    :cond_2
    if-eqz v0, :cond_4

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    if-nez v1, :cond_4

    :cond_3
    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_4
    const/16 v1, 0x3e8

    const/4 v4, 0x3

    const/4 v5, 0x2

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_8

    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    if-ne v6, v7, :cond_6

    if-nez v1, :cond_5

    const/4 v1, 0x1

    goto :goto_0

    :cond_5
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownX:F

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    :cond_6
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto/16 :goto_8

    :pswitch_2
    iget-object v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTranslationY()F

    move-result v6

    float-to-int v6, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    if-eqz v6, :cond_1f

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAutoClose:Z

    if-nez v1, :cond_7

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-eq v6, v1, :cond_1f

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v7

    if-eq v6, v1, :cond_1f

    :cond_7
    neg-int v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto/16 :goto_8

    :pswitch_3
    iget v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v6

    const/4 v7, -0x1

    if-ne v6, v7, :cond_8

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    const/4 v6, 0x0

    :cond_8
    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getX(I)F

    move-result v7

    invoke-virtual {p1, v6}, Landroid/view/MotionEvent;->getY(I)F

    move-result v6

    iget v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownX:F

    sub-float v8, v7, v8

    invoke-static {v8}, Ljava/lang/Math;->abs(F)F

    move-result v8

    iget v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    sub-float v9, v6, v9

    invoke-static {v9}, Ljava/lang/Math;->abs(F)F

    move-result v9

    iget v10, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    const/4 v11, 0x0

    if-ne v10, v3, :cond_d

    iget v10, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchSlop:I

    int-to-float v10, v10

    cmpl-float v10, v8, v10

    if-lez v10, :cond_9

    cmpl-float v8, v8, v9

    if-lez v8, :cond_9

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    goto :goto_1

    :cond_9
    iget v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchSlop:I

    int-to-float v8, v8

    cmpl-float v8, v9, v8

    if-lez v8, :cond_d

    iget-boolean v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDragEnabled:Z

    if-nez v8, :cond_a

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-eqz v8, :cond_a

    iget v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    sub-float v8, v6, v8

    cmpg-float v8, v8, v11

    if-gez v8, :cond_a

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    goto/16 :goto_8

    :cond_a
    iput v5, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getParent()Landroid/view/ViewParent;

    move-result-object v8

    invoke-interface {v8, v3}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz v8, :cond_b

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iget-object v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-ne v8, v9, :cond_b

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-direct {p0, v8, p1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V

    :cond_b
    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v8, :cond_c

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iget-object v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-ne v8, v9, :cond_c

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    invoke-direct {p0, v8, p1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V

    :cond_c
    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-eqz v8, :cond_d

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iget-object v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-ne v8, v9, :cond_d

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    invoke-direct {p0, v8, p1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V

    :cond_d
    :goto_1
    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v8, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    sub-float v1, v6, v1

    iget v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    if-ne v8, v5, :cond_1f

    const/high16 v8, 0x3f800000    # 1.0f

    cmpl-float v8, v1, v8

    if-gez v8, :cond_e

    const/high16 v8, -0x40800000    # -1.0f

    cmpg-float v8, v1, v8

    if-gtz v8, :cond_1f

    :cond_e
    iget v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    cmpl-float v9, v1, v11

    if-lez v9, :cond_11

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    move-result v8

    iget v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v10, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v9, v10

    iget v10, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewHeight:I

    add-int/2addr v9, v10

    int-to-float v9, v9

    cmpl-float v8, v8, v9

    if-gez v8, :cond_10

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    if-eqz v8, :cond_f

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    invoke-interface {v8}, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;->canScrollDown()Z

    move-result v8

    if-eqz v8, :cond_f

    goto :goto_3

    :cond_f
    :goto_2
    const/4 v8, 0x1

    goto :goto_4

    :cond_10
    :goto_3
    const/4 v8, 0x2

    goto :goto_4

    :cond_11
    cmpg-float v9, v1, v11

    if-gez v9, :cond_12

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v8}, Landroid/view/View;->getTranslationY()F

    move-result v8

    cmpl-float v8, v8, v11

    if-gtz v8, :cond_f

    iget-object v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    if-nez v8, :cond_10

    goto :goto_2

    :cond_12
    :goto_4
    if-ne v8, v3, :cond_15

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-ne v7, v5, :cond_13

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v7, p1, v3}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V

    goto :goto_5

    :cond_13
    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iget-object v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    if-ne v7, v9, :cond_14

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-nez v7, :cond_14

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v7, p1, v4}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;I)V

    :cond_14
    :goto_5
    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->offsetTranslationAnimation(FF)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    goto :goto_7

    :cond_15
    if-ne v8, v5, :cond_19

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-eq v1, v3, :cond_17

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iget-object v9, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    if-eq v1, v9, :cond_16

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-nez v1, :cond_16

    goto :goto_6

    :cond_16
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;)V

    goto :goto_7

    :cond_17
    :goto_6
    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    if-eqz v1, :cond_18

    iput-boolean v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    sub-float/2addr v1, v6

    invoke-virtual {p1, v11, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v1, p1, v2, v3}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;IZ)V

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-ne v1, v3, :cond_19

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    sub-float v1, v6, v1

    invoke-virtual {p1, v11, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v1, p1, v5, v3}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;IZ)V

    goto :goto_7

    :cond_18
    iput v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownX:F

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    iput v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    iput-boolean v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    const/4 v8, 0x1

    :cond_19
    :goto_7
    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    if-eqz v1, :cond_1a

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    if-ne v1, v5, :cond_1a

    iput-boolean v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    :cond_1a
    iput v8, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    goto/16 :goto_8

    :pswitch_4
    iget-object v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getTranslationY()F

    move-result v6

    float-to-int v6, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7, v1}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-boolean v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAutoClose:Z

    if-eqz v1, :cond_1b

    if-eqz v6, :cond_1b

    neg-int v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto/16 :goto_8

    :cond_1b
    if-eqz v6, :cond_1f

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-ge v6, v1, :cond_1d

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v1

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mMinimumFlingVelocity:I

    int-to-float v7, v7

    cmpl-float v1, v1, v7

    if-lez v1, :cond_1c

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto/16 :goto_8

    :cond_1c
    neg-int v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto :goto_8

    :cond_1d
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    if-le v6, v1, :cond_1f

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v7

    if-eq v6, v1, :cond_1f

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v1

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mMinimumFlingVelocity:I

    int-to-float v7, v7

    cmpl-float v1, v1, v7

    if-lez v1, :cond_1e

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v7

    sub-int/2addr v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto :goto_8

    :cond_1e
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v1, v6

    iget-object v7, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v7}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v7

    invoke-direct {p0, v6, v1, v7}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(IIF)V

    goto :goto_8

    :pswitch_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v6

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mActionPointerId:I

    iget-object v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6}, Landroid/view/VelocityTracker;->clear()V

    iget-object v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v6, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    iput v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownX:F

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mLastY:F

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getTranslationY()F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownTranslationY:F

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownX:F

    float-to-int v1, v1

    iget v6, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownY:F

    float-to-int v6, v6

    invoke-direct {p0, v1, v6}, Lcom/miui/gallery/widget/TwoStageDrawer;->getTouchDownView(II)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDownView:Landroid/view/View;

    iput v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    iput-boolean v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    :cond_1f
    :goto_8
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    if-ne v1, v5, :cond_22

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-ne v1, v5, :cond_20

    if-eq v0, v5, :cond_23

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->dispatchTouchEventToChild(Landroid/view/View;Landroid/view/MotionEvent;)V

    goto :goto_9

    :cond_20
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-ne v1, v3, :cond_21

    goto :goto_9

    :cond_21
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    if-nez v1, :cond_23

    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_9

    :cond_22
    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    if-ne v1, v3, :cond_23

    invoke-super {p0, p1}, Landroid/widget/RelativeLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_23
    :goto_9
    if-eq v0, v3, :cond_24

    if-ne v0, v4, :cond_25

    :cond_24
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    iput v3, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDetectMode:I

    iput v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTouchMode:I

    iput-boolean v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPendingScroll:Z

    iput-boolean v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerOn:Z

    :cond_25
    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_0
        :pswitch_5
        :pswitch_1
    .end packed-switch
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-ne p2, v0, :cond_0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/TwoStageDrawer;->drawPrimaryContentView(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-ne p2, v0, :cond_1

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/TwoStageDrawer;->drawSecondaryContentView(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    if-ne p2, v0, :cond_2

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/TwoStageDrawer;->drawTargetViewAncestor(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-ne p2, v0, :cond_3

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/TwoStageDrawer;->drawTriggerView(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1

    :cond_3
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/RelativeLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p1

    return p1
.end method

.method public halfCloseDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    iput-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    float-to-int p1, p1

    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr p2, p1

    const/16 v0, 0x1f4

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(III)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public halfOpenDrawer()V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->halfOpenDrawer(Z)V

    return-void
.end method

.method public halfOpenDrawer(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->dispatchOnGlobalLayout()V

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    float-to-int p1, p1

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    sub-int/2addr v0, p1

    const/16 v1, 0x320

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(III)V

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    :goto_0
    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public isAnimating()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isDrawerHalfOpen()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isDrawerOpen()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-eqz v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr v1, v2

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onFinishInflate()V
    .locals 2

    invoke-super {p0}, Landroid/widget/RelativeLayout;->onFinishInflate()V

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentViewId:I

    if-lez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The primaryContentView attribute is must be a direct child of TwoStageDrawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The primaryContentView attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    :goto_0
    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentViewId:I

    if-lez v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_3

    goto :goto_1

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The secondaryContentView attribute is must be a direct child of TwoStageDrawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The secondaryContentView attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    :goto_1
    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewId:I

    if-lez v0, :cond_6

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setTargetView(Landroid/view/View;)V

    :cond_6
    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewId:I

    if-lez v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewId:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setScrollableView(Landroid/view/View;)V

    :cond_7
    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewId:I

    if-lez v0, :cond_a

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_8

    goto :goto_2

    :cond_8
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The triggerView attribute is must be a direct child of TwoStageDrawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The triggerView attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_a
    :goto_2
    return-void
.end method

.method public openDrawer()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->openDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V

    return-void
.end method

.method public openDrawer(ZLcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewTreeObserver;->dispatchOnGlobalLayout()V

    iput-object p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerAnimEndListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    float-to-int p1, p1

    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr p2, v0

    sub-int/2addr p2, p1

    const/16 v0, 0x320

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->startScroll(III)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentHeight:I

    iget p2, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentHeight:I

    add-int/2addr p1, p2

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->notifyDrawerStateChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    :goto_0
    return-void
.end method

.method public setAlwaysShowTargetViewDivider(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAlwaysShowTargetViewDivider:Z

    return-void
.end method

.method public setAutoClose(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mAutoClose:Z

    return-void
.end method

.method public setContentViewBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mContentViewBackground:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setDragEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDragEnabled:Z

    return-void
.end method

.method public setDrawerListener(Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDrawerListener:Lcom/miui/gallery/widget/TwoStageDrawer$DrawerListener;

    return-void
.end method

.method public setInitialDrawerState(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mInitialDrawerState:I

    return-void
.end method

.method public setPrimaryContentView(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mPrimaryContentView:Landroid/view/View;

    return-void
.end method

.method public setScrollDivider(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mDividerHeight:I

    :goto_0
    return-void
.end method

.method public setScrollableView(Landroid/view/View;)V
    .locals 2

    if-eqz p1, :cond_4

    instance-of v0, p1, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    goto :goto_0

    :cond_0
    instance-of v0, p1, Landroid/widget/ScrollView;

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollViewWrapper;

    move-object v1, p1

    check-cast v1, Landroid/widget/ScrollView;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollViewWrapper;-><init>(Landroid/widget/ScrollView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    goto :goto_0

    :cond_1
    instance-of v0, p1, Landroid/widget/AdapterView;

    if-eqz v0, :cond_2

    new-instance v0, Lcom/miui/gallery/widget/TwoStageDrawer$AdapterViewWrapper;

    move-object v1, p1

    check-cast v1, Landroid/widget/AdapterView;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer$AdapterViewWrapper;-><init>(Landroid/widget/AdapterView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    goto :goto_0

    :cond_2
    instance-of v0, p1, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_3

    new-instance v0, Lcom/miui/gallery/widget/TwoStageDrawer$RecyclerViewWrapper;

    move-object v1, p1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer$RecyclerViewWrapper;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    goto :goto_0

    :cond_3
    const-string v0, "TwoStageDrawer"

    const-string v1, "The scrollableView is a fixed view that can\'t scroll all the time"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/widget/TwoStageDrawer$FixedViewWrapper;

    invoke-direct {v0}, Lcom/miui/gallery/widget/TwoStageDrawer$FixedViewWrapper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;-><init>(Lcom/miui/gallery/widget/TwoStageDrawer;Lcom/miui/gallery/widget/TwoStageDrawer$1;)V

    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnScrollChangedListener(Landroid/view/ViewTreeObserver$OnScrollChangedListener;)V

    return-void

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The scrollableView attribute is must refer to an existing child of targetView."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setSecondaryContentView(Landroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSecondaryContentView:Landroid/view/View;

    return-void
.end method

.method public setSupportMultiPoint(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mSupportMultiPoint:Z

    return-void
.end method

.method public setTargetView(Landroid/view/View;)V
    .locals 1

    if-eqz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    if-eq v0, p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetView:Landroid/view/View;

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    if-eq p1, p0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTargetViewAncestor:Landroid/view/View;

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result p1

    float-to-int p1, p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer;->updateTranslationAnimation(I)V

    :cond_1
    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "The targetView attribute is must refer to an existing child."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setTriggerListener(Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer;->mTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    return-void
.end method
