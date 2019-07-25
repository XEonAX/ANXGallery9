.class public Lcom/miui/gallery/widget/slip/VerticalSlipLayout;
.super Landroid/widget/FrameLayout;
.source "VerticalSlipLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;,
        Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;
    }
.end annotation


# instance fields
.field private mActivePointerId:I

.field private mBottomView:Landroid/view/View;

.field private mDragEnable:Z

.field private mFixedSideSlipDis:I

.field private mFlingToSlipped:Z

.field private mInitialMotionX:F

.field private mInitialMotionY:F

.field private mIsBeingDragged:Z

.field private mIsSlipped:Z

.field private mIsSlippedWhenEnter:Z

.field private mLastMotionX:F

.field private mLastMotionY:F

.field private mMaxSlipY:I

.field private mMaximumVelocity:I

.field private mMinSlipY:I

.field private mMinimumVelocity:I

.field private mNonSlippedDrawable:Landroid/graphics/drawable/Drawable;

.field private mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

.field private mSlipMode:I

.field private mSlipRunnable:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;

.field private mSlipState:I

.field private mSlipViewInitialized:Z

.field private mSlippedDrawable:Landroid/graphics/drawable/Drawable;

.field private mTopVInitMarginBottom:I

.field private mTopVInitMarginTop:I

.field private mTopView:Landroid/view/View;

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mDragEnable:Z

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    const/4 v2, 0x0

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipState:I

    iput-boolean v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaxSlipY:I

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    iput-boolean v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlipped:Z

    sget-object v1, Lcom/miui/gallery/R$styleable;->VerticalSlipLayout:[I

    invoke-virtual {p1, p2, v1, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 p2, 0x3

    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    invoke-virtual {p1, v2, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    if-eqz p2, :cond_0

    iput-object p2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlippedDrawable:Landroid/graphics/drawable/Drawable;

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->initViewPager()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlipped:Z

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlippedDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;F)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->performSlipTo(F)V

    return-void
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->refreshSlipStatusByTarget(I)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->onSlipEnd()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getSlipY()I

    move-result p0

    return p0
.end method

.method static synthetic access$1402(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFlingToSlipped:Z

    return p1
.end method

.method static synthetic access$1500(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getSlippedY()I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mNonSlippedDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setBottomViewVisible(Z)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Landroid/view/View;F)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->notifySlipAnimChildren(Landroid/view/View;F)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipState:I

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipState(I)V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->onSlipStart()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipRunnable:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;)Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipRunnable:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;

    return-object p1
.end method

.method private calculateSlipTo(FI)I
    .locals 4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinimumVelocity:I

    mul-int/lit8 v1, v1, 0xa

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaximumVelocity:I

    div-int/lit8 v2, v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    const/4 v2, 0x0

    cmpl-float p1, p1, v2

    const v2, 0x3d4ccccd    # 0.05f

    const v3, 0x3e4ccccd    # 0.2f

    if-lez p1, :cond_4

    cmpl-float p1, v0, v3

    if-lez p1, :cond_1

    int-to-float p1, p2

    neg-float p2, v1

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result p1

    :goto_0
    return p1

    :cond_1
    cmpl-float p1, v0, v2

    if-lez p1, :cond_3

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinimumVelocity:I

    if-le p2, p1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result p1

    goto :goto_1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    :goto_1
    return p1

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    return p1

    :cond_4
    cmpl-float p1, v0, v3

    if-lez p1, :cond_6

    int-to-float p1, p2

    cmpl-float p1, p1, v1

    if-lez p1, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result p1

    goto :goto_2

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    :goto_2
    return p1

    :cond_6
    cmpl-float p1, v0, v2

    if-lez p1, :cond_8

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinimumVelocity:I

    neg-int p1, p1

    if-ge p2, p1, :cond_7

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    goto :goto_3

    :cond_7
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result p1

    :goto_3
    return p1

    :cond_8
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result p1

    return p1
.end method

.method private canSlip()Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mDragEnable:Z

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipViewInitialized:Z

    if-nez v0, :cond_2

    return v1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v2

    if-lt v0, v2, :cond_3

    return v1

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method private endDrag()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method

.method private ensureVelocityTracker()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method

.method private getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;
    .locals 0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout$LayoutParams;

    return-object p1
.end method

.method private getMaxSlipY()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaxSlipY:I

    return v0
.end method

.method private getMinSlipY()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    return v0
.end method

.method private getSlipY()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    return v0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    return v0

    :cond_1
    const/4 v0, -0x1

    return v0
.end method

.method private getSlippedY()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    return v0

    :pswitch_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v0

    return v0

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v0

    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private initSlipParams()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mBottomView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    add-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v1

    iget v1, v1, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopVInitMarginBottom:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaxSlipY:I

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopVInitMarginTop:I

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mBottomView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaxSlipY:I

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private initSlipView()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getChildCount()I

    move-result v0

    const/4 v1, 0x2

    if-ge v0, v1, :cond_0

    return-void

    :cond_0
    add-int/lit8 v2, v0, -0x1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mBottomView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopVInitMarginTop:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopVInitMarginBottom:I

    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setBottomViewVisible(Z)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipViewInitialized:Z

    return-void
.end method

.method private initViewPager()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTouchSlop:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinimumVelocity:I

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaximumVelocity:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mNonSlippedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method private needInitSlipParams()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needIntercept(FF)Z
    .locals 9

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v0, v0, v1

    const/4 v1, 0x0

    if-lez v0, :cond_0

    return v1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v2, 0x2

    const-wide v3, 0x3fd41b2f769cf0e0L    # 0.3141592653589793

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne v0, v2, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_2

    cmpl-float p1, p2, v5

    if-lez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1

    :cond_2
    cmpg-float v0, p2, v5

    if-gez v0, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    float-to-double v7, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->tan(D)D

    move-result-wide v2

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double p1, p1

    cmpl-double v0, v7, p1

    if-lez v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    :cond_4
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    if-ne v0, v6, :cond_8

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_6

    cmpg-float p1, p2, v5

    if-gez p1, :cond_5

    const/4 v1, 0x1

    :cond_5
    return v1

    :cond_6
    cmpl-float v0, p2, v5

    if-lez v0, :cond_7

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    float-to-double v7, p2

    invoke-static {v3, v4}, Ljava/lang/Math;->tan(D)D

    move-result-wide v2

    invoke-static {v7, v8}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v7, v7, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    float-to-double p1, p1

    cmpl-double v0, v7, p1

    if-lez v0, :cond_7

    const/4 v1, 0x1

    :cond_7
    return v1

    :cond_8
    return v1
.end method

.method private notifySlipAnimChildren(Landroid/view/View;F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    invoke-interface {v0, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;->onSlipping(F)V

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/widget/slip/ISlipAnimView;

    if-eqz v0, :cond_1

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/widget/slip/ISlipAnimView;

    invoke-interface {v0, p2}, Lcom/miui/gallery/widget/slip/ISlipAnimView;->onSlipping(F)V

    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_2

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->notifySlipAnimChildren(Landroid/view/View;F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method private onSlipEnd()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$1;-><init>(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private onSlipStart()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlippedDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setBottomViewVisible(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    invoke-interface {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;->onSlipStart()V

    :cond_0
    return-void
.end method

.method private performSlipBy(F)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getSlipY()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr v0, p1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result p1

    int-to-float p1, p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v0

    int-to-float v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->performSlipTo(F)V

    return-void
.end method

.method private performSlipTo(F)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getLayoutParams(Landroid/view/View;)Landroid/widget/FrameLayout$LayoutParams;

    move-result-object v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v1

    int-to-float v1, v1

    sub-float v1, p1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float v1, v1, v2

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v3

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v4

    sub-int/2addr v3, v4

    int-to-float v3, v3

    div-float/2addr v1, v3

    iget v3, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const-wide/high16 v4, 0x4032000000000000L    # 18.0

    const/4 v6, 0x1

    if-ne v3, v6, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, p1

    float-to-int p1, v2

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    int-to-double v2, p1

    cmpl-double p1, v2, v4

    if-lez p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    int-to-float p1, p1

    mul-float p1, p1, v1

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    goto :goto_0

    :cond_0
    iget v3, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v6, 0x2

    if-ne v3, v6, :cond_1

    sub-float v1, v2, v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getHeight()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, p1

    float-to-int p1, v2

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    int-to-double v2, p1

    cmpl-double p1, v2, v4

    if-lez p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    int-to-float p1, p1

    mul-float p1, p1, v1

    float-to-int p1, p1

    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    :cond_1
    :goto_0
    invoke-direct {p0, p0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->notifySlipAnimChildren(Landroid/view/View;F)V

    iget-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTopView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method private refreshSlipStatusByTarget(I)V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v0

    if-le p1, v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlipped:Z

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v0

    if-ge p1, v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    iput-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlipped:Z

    :cond_3
    :goto_0
    return-void
.end method

.method private resetSlipParams()V
    .locals 1

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaxSlipY:I

    return-void
.end method

.method private setBottomViewVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mBottomView:Landroid/view/View;

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method private setSlipState(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipState:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipState:I

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;->onSlipStateChanged(I)V

    :cond_0
    return-void
.end method

.method private setSlippedInternal(Z)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    :cond_1
    :goto_0
    return-void
.end method

.method private setUnSlippedInternal(Z)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMinSlipY()I

    move-result v0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipMode:I

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->getMaxSlipY()I

    move-result v0

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    :cond_1
    :goto_0
    return-void
.end method

.method private slipTo(IIZ)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$2;

    invoke-direct {v0, p0, p3, p1, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$2;-><init>(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;ZII)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private startDrag()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipState(I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->onSlipStart()V

    return-void
.end method

.method private translateTouchDistance(F)F
    .locals 1

    const v0, 0x3f19999a    # 0.6f

    mul-float p1, p1, v0

    return p1
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public isFlingToSlipped()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFlingToSlipped:Z

    return v0
.end method

.method public isSlipped()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlipped:Z

    return v0
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipRunnable:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipRunnable:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->abort()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    return-void
.end method

.method protected onFinishInflate()V
    .locals 1

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipViewInitialized:Z

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->initSlipView()V

    :cond_0
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->canSlip()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v2, 0x1

    if-le v0, v2, :cond_1

    return v1

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    :pswitch_0
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    goto/16 :goto_1

    :cond_2
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_3

    goto :goto_1

    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget-boolean v3, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-nez v3, :cond_5

    iget v3, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float v3, v0, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTouchSlop:I

    mul-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_5

    iget v3, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    sub-float v3, v2, v3

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float v4, v0, v4

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->needIntercept(FF)Z

    move-result v3

    if-eqz v3, :cond_4

    iget v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iget v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->startDrag()V

    const-string v1, "VerticalSlipLayout"

    const-string v3, "onSlipStart"

    invoke-static {v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    :cond_5
    :goto_0
    iget-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v1, :cond_6

    iget v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    sub-float v1, v0, v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->translateTouchDistance(F)F

    move-result v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->performSlipBy(F)V

    :cond_6
    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    goto :goto_1

    :pswitch_1
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->endDrag()V

    return v1

    :pswitch_2
    iput-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    :goto_1
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v0, :cond_7

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->ensureVelocityTracker()V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_7
    iget-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    iget-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipViewInitialized:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->needInitSlipParams()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->initSlipParams()V

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlippedInternal(Z)V

    :cond_1
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->resetSlipParams()V

    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->onSizeChanged(IIII)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->canSlip()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    and-int/lit16 v0, v0, 0xff

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getEdgeFlags()I

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->endDrag()V

    return v1

    :cond_1
    const/4 v2, -0x1

    const/4 v3, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_3

    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    if-ne v4, v2, :cond_e

    if-nez v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v0

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    iget-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-nez v1, :cond_e

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    goto/16 :goto_3

    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-nez v0, :cond_e

    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    goto/16 :goto_3

    :pswitch_3
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    if-eq v0, v2, :cond_4

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_3

    goto/16 :goto_3

    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float/2addr v0, v2

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->translateTouchDistance(F)F

    move-result v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->calculateSlipTo(FI)I

    move-result v0

    invoke-direct {p0, v0, v1, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setUnSlipped(Z)V

    :cond_5
    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->endDrag()V

    goto/16 :goto_3

    :pswitch_4
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    if-ne v0, v2, :cond_6

    goto/16 :goto_3

    :cond_6
    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_7

    goto/16 :goto_3

    :cond_7
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget-boolean v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-nez v4, :cond_9

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float v4, v0, v4

    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mTouchSlop:I

    mul-int/lit8 v5, v5, 0x2

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_9

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    sub-float v4, v1, v4

    iget v5, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float v5, v0, v5

    invoke-direct {p0, v4, v5}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->needIntercept(FF)Z

    move-result v4

    if-eqz v4, :cond_8

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->startDrag()V

    const-string v2, "VerticalSlipLayout"

    const-string v4, "onSlipStart"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_8
    iput v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    :cond_9
    :goto_1
    iget-boolean v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v2, :cond_a

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    sub-float v2, v0, v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->translateTouchDistance(F)F

    move-result v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->performSlipBy(F)V

    :cond_a
    iput v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    goto :goto_3

    :pswitch_5
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v0, :cond_d

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    if-eq v0, v2, :cond_c

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    if-gez v0, :cond_b

    goto :goto_3

    :cond_b
    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    iget v4, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMaximumVelocity:I

    int-to-float v4, v4

    invoke-virtual {v1, v2, v4}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v1

    float-to-int v1, v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    sub-float/2addr v0, v2

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->translateTouchDistance(F)F

    move-result v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->calculateSlipTo(FI)I

    move-result v0

    invoke-direct {p0, v0, v1, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->slipTo(IIZ)V

    goto :goto_2

    :cond_c
    invoke-virtual {p0, v3}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setUnSlipped(Z)V

    :cond_d
    :goto_2
    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->endDrag()V

    goto :goto_3

    :pswitch_6
    iput-boolean v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionX:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionX:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mInitialMotionY:F

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mLastMotionY:F

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mActivePointerId:I

    :cond_e
    :goto_3
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsBeingDragged:Z

    if-eqz v0, :cond_f

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->ensureVelocityTracker()V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    :cond_f
    return v3

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setDraggable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mDragEnable:Z

    return-void
.end method

.method public setFixedSideSlipDistance(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mFixedSideSlipDis:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlippedInternal(Z)V

    :cond_0
    return-void
.end method

.method public setOnSlipListener(Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mSlipListener:Lcom/miui/gallery/widget/slip/VerticalSlipLayout$OnSlipListener;

    return-void
.end method

.method public setSlipped(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->canSlip()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlippedInternal(Z)V

    :cond_0
    return-void
.end method

.method public setSlippedWhenEnter(Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mMinSlipY:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setSlipped(Z)V

    goto :goto_0

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->mIsSlippedWhenEnter:Z

    :goto_0
    return-void
.end method

.method public setUnSlipped(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->canSlip()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->isSlipped()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->setUnSlippedInternal(Z)V

    :cond_0
    return-void
.end method
