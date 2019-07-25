.class public Lcom/miui/gallery/widget/ScrollableViewDrawer;
.super Landroid/widget/FrameLayout;
.source "ScrollableViewDrawer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/ScrollableViewDrawer$ScrollViewWrapper;,
        Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;,
        Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;,
        Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;,
        Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;
    }
.end annotation


# static fields
.field private static final DEBUGGABLE:Z


# instance fields
.field private mActionPointerId:I

.field private mAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

.field private mContentView:Landroid/view/View;

.field private mContentViewId:I

.field private mDetermineHorizontal:Z

.field private mDetermineVertical:Z

.field private mDetermineVerticalDrag:Z

.field private mDividerHeight:I

.field private mDownX:F

.field private mDownY:F

.field private mDragEnabled:Z

.field private mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

.field private mLastMotionY:F

.field private mOnContentViewLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

.field private mPendingOpenDrawerAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

.field private mPendingOpenDrawerBeforeLaidOut:Z

.field private mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

.field private mPendingOpenDrawerWithAnimation:Z

.field private mPendingTranslate:Z

.field private mScrollDivider:Landroid/graphics/drawable/Drawable;

.field private mScrollableViewId:I

.field private mScrollableViewWrapper:Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

.field private mScroller:Landroid/widget/Scroller;

.field private mState:I

.field private mTargetView:Landroid/view/View;

.field private mTargetViewId:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;

.field private mVerticalRange:I

.field private mYOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "ScrollableViewDrawer"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->DEBUGGABLE:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerBeforeLaidOut:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerWithAnimation:Z

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTouchSlop:I

    new-instance v1, Landroid/widget/Scroller;

    invoke-direct {v1, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    new-instance v1, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;-><init>(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mOnContentViewLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    sget-object v1, Lcom/miui/gallery/R$styleable;->ScrollableViewDrawer:[I

    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentViewId:I

    iget p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentViewId:I

    if-eqz p3, :cond_4

    const/4 p3, 0x4

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetViewId:I

    iget p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetViewId:I

    if-eqz p3, :cond_3

    const/4 p3, 0x3

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewId:I

    iget p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewId:I

    if-eqz p3, :cond_2

    const/4 p3, 0x2

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p3

    iput-object p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget-object p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    if-nez p3, :cond_0

    const p3, 0x7f0300c3

    invoke-static {p1, p3}, Lmiui/util/AttributeResolver;->resolveDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDividerHeight:I

    :cond_1
    const/4 p1, 0x1

    invoke-virtual {p2, p1, p1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDragEnabled:Z

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The scrollableView attribute is required and must refer to a valid child."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The targetView attribute is required and must refer to a valid child."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "The contentView attribute is required and must refer to a valid child."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/ScrollableViewDrawer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/widget/ScrollableViewDrawer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Landroid/widget/Scroller;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/ScrollableViewDrawer;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mState:I

    return p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/widget/ScrollableViewDrawer;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    return p1
.end method

.method static synthetic access$402(Lcom/miui/gallery/widget/ScrollableViewDrawer;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->onTranslationYChange()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerWithAnimation:Z

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->clearPendingOpenDrawerInfo()V

    return-void
.end method

.method private clearPendingOpenDrawerInfo()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerBeforeLaidOut:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerBeforeLaidOut:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerWithAnimation:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    iget-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    :cond_0
    return-void
.end method

.method private computeStateChanged()V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v2

    if-ne v0, v2, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-nez v0, :cond_1

    const/4 v0, 0x2

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mState:I

    if-eq v2, v0, :cond_2

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mState:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->notifyStateChanged()V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mState:I

    if-ne v0, v1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->notifyStateChanged()V

    :cond_3
    :goto_1
    return-void
.end method

.method private getVerticalRange()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    return v0
.end method

.method private internalOpenDrawer(ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V
    .locals 6

    iput-object p2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x0

    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    sub-int v4, p1, p2

    const/16 v5, 0x320

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/widget/Scroller;->forceFinished(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->onTranslationYChange()V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->invalidate()V

    return-void
.end method

.method private notifyStateChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mState:I

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;->onDrawerOpened(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->onTranslationYChange()V

    iput-boolean v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

    iget v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    int-to-float v1, v1

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    invoke-interface {v0, p0, v1}, Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;->onDrawerSlide(Lcom/miui/gallery/widget/ScrollableViewDrawer;F)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

    invoke-interface {v0, p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;->onDrawerClosed(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVerticalRange:I

    iput-boolean v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingTranslate:Z

    :cond_0
    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onTranslationYChange()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDragEnabled:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->computeStateChanged()V

    :cond_0
    return-void
.end method

.method private shouldInterceptDown()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    invoke-interface {v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;->canScroll()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public computeScroll()V
    .locals 2

    invoke-super {p0}, Landroid/widget/FrameLayout;->computeScroll()V

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrY()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->onTranslationYChange()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->postInvalidateOnAnimation()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->isDrawerOpen()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;->onDrawerAnimEnd(Z)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    :cond_1
    :goto_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDragEnabled:Z

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x6

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_8

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    const/4 v0, 0x0

    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownX:F

    sub-float/2addr v1, v4

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownY:F

    sub-float/2addr v4, v5

    iget-boolean v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-nez v5, :cond_6

    iget-boolean v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineHorizontal:Z

    if-nez v5, :cond_6

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v6

    if-ne v5, v6, :cond_2

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTouchSlop:I

    neg-int v5, v5

    int-to-float v5, v5

    cmpg-float v5, v4, v5

    if-gez v5, :cond_2

    iput-boolean v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    const-string v5, "ScrollableViewDrawer"

    const-string v6, "determine vertical up dragging"

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v5, v4, v5

    if-lez v5, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->shouldInterceptDown()Z

    move-result v5

    iput-boolean v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    const-string v5, "ScrollableViewDrawer"

    const-string v6, "determine vertical down dragging %s"

    iget-boolean v7, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    :goto_0
    iget-boolean v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-eqz v5, :cond_4

    const-string v5, "ScrollableViewDrawer"

    const-string v6, "determine vertical drag"

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getParent()Landroid/view/ViewParent;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-interface {v5, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_4
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_5

    iget-boolean v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineHorizontal:Z

    if-nez v4, :cond_5

    iput-boolean v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVertical:Z

    :cond_5
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTouchSlop:I

    int-to-float v4, v4

    cmpl-float v1, v1, v4

    if-lez v1, :cond_6

    iget-boolean v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVertical:Z

    if-nez v1, :cond_6

    iput-boolean v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineHorizontal:Z

    :cond_6
    iget-boolean v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-nez v1, :cond_a

    iget-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mLastMotionY:F

    goto :goto_2

    :pswitch_1
    iget-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    :cond_7
    iput-boolean v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    iput-boolean v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineHorizontal:Z

    iput-boolean v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVertical:Z

    goto :goto_2

    :pswitch_2
    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    iput-boolean v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownX:F

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownY:F

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mLastMotionY:F

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTranslationY()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    goto :goto_2

    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    if-ne v1, v4, :cond_a

    if-nez v0, :cond_9

    const/4 v0, 0x1

    goto :goto_1

    :cond_9
    const/4 v0, 0x0

    :goto_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownX:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDownY:F

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mLastMotionY:F

    :cond_a
    :goto_2
    sget-boolean v0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->DEBUGGABLE:Z

    if-eqz v0, :cond_b

    const-string v0, "ScrollableViewDrawer"

    const-string v1, "dispatchTouchEvent:action=%s, mYOffset=%s"

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v0, v1, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_b
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-nez p1, :cond_d

    iget-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-eqz p1, :cond_c

    goto :goto_3

    :cond_c
    const/4 v2, 0x0

    :cond_d
    :goto_3
    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    if-ne p2, v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result v2

    iget v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    add-int/2addr v3, v2

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDividerHeight:I

    if-lez v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    iget v5, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDividerHeight:I

    sub-int v5, v3, v5

    invoke-virtual {v4, v0, v5, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollDivider:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDividerHeight:I

    sub-int/2addr v3, v4

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    :cond_1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    move-result p3

    iget-object p4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    if-ne p2, p4, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_2
    return p3
.end method

.method public isDrawerOpen()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected onFinishInflate()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-ne v0, p0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mContentView:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mOnContentViewLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetViewId:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mTargetView:Landroid/view/View;

    iget v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewId:I

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_3

    instance-of v1, v0, Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    iput-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    goto :goto_0

    :cond_0
    instance-of v1, v0, Landroid/widget/ScrollView;

    if-eqz v1, :cond_1

    new-instance v1, Lcom/miui/gallery/widget/ScrollableViewDrawer$ScrollViewWrapper;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-direct {v1, v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$ScrollViewWrapper;-><init>(Landroid/widget/ScrollView;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    goto :goto_0

    :cond_1
    instance-of v1, v0, Landroid/widget/AdapterView;

    if-eqz v1, :cond_2

    new-instance v1, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;

    check-cast v0, Landroid/widget/AdapterView;

    invoke-direct {v1, v0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$AdapterViewWrapper;-><init>(Landroid/widget/AdapterView;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScrollableViewWrapper:Lcom/miui/gallery/widget/ScrollableViewDrawer$IScrollableView;

    :goto_0
    return-void

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The scrollableView attribute is must refer to an ScrollView or AdapterView or IScrollableViewWrapper."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The scrollableView attribute is must refer to an existing child of targetView."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The targetView attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The contentView attribute is must be a direct child of ScrollableViewDrawer."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "The contentView attribute is must refer to an existing child."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDragEnabled:Z

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDetermineVerticalDrag:Z

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v2

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    iget v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    neg-int v3, v3

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/Scroller;->startScroll(IIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->invalidate()V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->computeStateChanged()V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    goto/16 :goto_3

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_1

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mActionPointerId:I

    const/4 v0, 0x0

    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mLastMotionY:F

    sub-float v2, v0, v2

    float-to-int v2, v2

    iget v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    add-int/2addr v2, v3

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    iput v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mLastMotionY:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->onTranslationYChange()V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->invalidate()V

    goto :goto_3

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    invoke-virtual {v0, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v2

    if-eq v0, v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v0

    const/high16 v2, 0x40a00000    # 5.0f

    cmpl-float v0, v0, v2

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->getVerticalRange()I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    sub-int/2addr v3, v4

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/Scroller;->startScroll(IIII)V

    goto :goto_1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mScroller:Landroid/widget/Scroller;

    iget v2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    iget v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    neg-int v3, v3

    invoke-virtual {v0, v1, v2, v1, v3}, Landroid/widget/Scroller;->startScroll(IIII)V

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->invalidate()V

    goto :goto_2

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->computeStateChanged()V

    :goto_2
    iget-object v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    :goto_3
    :pswitch_3
    sget-boolean v0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->DEBUGGABLE:Z

    if-eqz v0, :cond_4

    const-string v0, "ScrollableViewDrawer"

    const-string v1, "onTouchEvent:action=%s, mYOffset=%s"

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mYOffset:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_4
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public openDrawer()V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->openDrawer(ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V

    return-void
.end method

.method public openDrawer(ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->isLaidOut()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->clearPendingOpenDrawerInfo()V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->internalOpenDrawer(ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerBeforeLaidOut:Z

    iput-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerWithAnimation:Z

    iput-object p2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerAnimEndListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    new-instance p1, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;-><init>(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mPendingOpenDrawerLayoutChangeListener:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :goto_0
    return-void
.end method

.method public setDragEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDragEnabled:Z

    return-void
.end method

.method public setDrawerListener(Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer;->mDrawerListener:Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerListener;

    return-void
.end method
