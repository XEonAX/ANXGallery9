.class public Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;
.super Landroid/widget/LinearLayout;
.source "BabyAlbumDetailPageScrollView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;
    }
.end annotation


# instance fields
.field private isTopHidden:Z

.field private mActionBarHeight:I

.field mActionbarMask:Landroid/graphics/Rect;

.field private mDragging:Z

.field private mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

.field private mLastY:F

.field private mMaskColor:I

.field mMaskPaint:Landroid/graphics/Paint;

.field private mMaximumVelocity:I

.field private mMinimumVelocity:I

.field private mScroller:Landroid/widget/OverScroller;

.field private mTopViewHeight:I

.field private mTouchSlop:I

.field private mVelocityTracker:Landroid/view/VelocityTracker;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->setOrientation(I)V

    new-instance p2, Landroid/widget/OverScroller;

    invoke-direct {p2, p1}, Landroid/widget/OverScroller;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTouchSlop:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaximumVelocity:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMinimumVelocity:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f05001c

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskColor:I

    return-void
.end method


# virtual methods
.method public computeScroll()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v1}, Landroid/widget/OverScroller;->getCurrY()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->scrollTo(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->invalidate()V

    :cond_0
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 9

    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->dispatchDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    if-eqz v0, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionbarMask:Landroid/graphics/Rect;

    if-nez v0, :cond_1

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionBarHeight:I

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionbarMask:Landroid/graphics/Rect;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskPaint:Landroid/graphics/Paint;

    if-nez v0, :cond_2

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_2
    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v5, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v6, v0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getScrollY()I

    move-result v0

    mul-int/lit16 v0, v0, 0xff

    iget v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    div-int v7, v0, v1

    const/16 v8, 0x1f

    move-object v2, p1

    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->saveLayerAlpha(FFFFII)I

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getScrollY()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionbarMask:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaskPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public fling(I)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getScrollY()I

    move-result v2

    iget v8, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    const/4 v1, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v4, p1

    invoke-virtual/range {v0 .. v8}, Landroid/widget/OverScroller;->fling(IIIIIIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->invalidate()V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    const/4 v3, 0x2

    if-eq v0, v3, :cond_0

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mLastY:F

    sub-float/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTouchSlop:I

    int-to-float v3, v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_4

    iput-boolean v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    invoke-interface {v0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;->isScoll2Top()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    if-eqz v0, :cond_4

    const/4 v0, 0x0

    cmpl-float v0, v1, v0

    if-lez v0, :cond_4

    :cond_1
    return v2

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    invoke-interface {v0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;->disappearFloatingView()Z

    move-result v0

    if-eqz v0, :cond_3

    return v2

    :cond_3
    iput v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mLastY:F

    :cond_4
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method protected onMeasure(II)V
    .locals 5

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->onMeasure(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getChildCount()I

    move-result p2

    if-lez p2, :cond_5

    const/4 p2, 0x0

    const/4 v0, 0x0

    move-object v1, p2

    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getChildCount()I

    move-result v2

    if-ge p2, v2, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v2, v1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    if-eqz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    if-nez v1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getMeasuredHeight()I

    move-result p2

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    if-ge v2, p2, :cond_5

    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getPaddingLeft()I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getPaddingRight()I

    move-result v4

    add-int/2addr v3, v4

    iget v2, v2, Landroid/widget/LinearLayout$LayoutParams;->width:I

    invoke-static {p1, v3, v2}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getChildMeasureSpec(III)I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getPaddingTop()I

    move-result v2

    sub-int/2addr p2, v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getPaddingBottom()I

    move-result v2

    sub-int/2addr p2, v2

    iget-object v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    invoke-interface {v2}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;->getRecommendFaceButton()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eqz v3, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    :cond_4
    :goto_2
    iget v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionBarHeight:I

    mul-int/lit8 v2, v2, 0x2

    sub-int/2addr p2, v2

    sub-int/2addr p2, v0

    const/high16 v0, 0x40000000    # 2.0f

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {v1, p1, p2}, Landroid/view/View;->measure(II)V

    :cond_5
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iput-boolean v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    goto :goto_0

    :pswitch_1
    iget v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mLastY:F

    sub-float v0, v1, v0

    iget-boolean v4, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    if-nez v4, :cond_0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v4

    iget v5, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTouchSlop:I

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_0

    iput-boolean v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    :cond_0
    iget-boolean v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    if-eqz v2, :cond_3

    neg-float v0, v0

    float-to-int v0, v0

    invoke-virtual {p0, v3, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->scrollBy(II)V

    iput v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mLastY:F

    goto :goto_0

    :pswitch_2
    iput-boolean v3, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mDragging:Z

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    iget v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMaximumVelocity:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->getYVelocity()F

    move-result v0

    float-to-int v0, v0

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mMinimumVelocity:I

    if-le v1, v2, :cond_1

    neg-int v0, v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->fling(I)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mScroller:Landroid/widget/OverScroller;

    invoke-virtual {v0}, Landroid/widget/OverScroller;->abortAnimation()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iput v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mLastY:F

    return v2

    :cond_3
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public scrollTo(II)V
    .locals 2

    const/4 v0, 0x0

    if-gez p2, :cond_0

    const/4 p2, 0x0

    :cond_0
    iget v1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    if-le p2, v1, :cond_1

    iget p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getScrollY()I

    move-result v1

    if-eq p2, v1, :cond_2

    invoke-super {p0, p1, p2}, Landroid/widget/LinearLayout;->scrollTo(II)V

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getScrollY()I

    move-result p1

    iget p2, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    if-ne p1, p2, :cond_3

    const/4 v0, 0x1

    :cond_3
    iget-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    if-eq v0, p1, :cond_5

    iget-boolean p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    invoke-interface {p1}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;->setNormalActionBarBackground()V

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    invoke-interface {p1}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;->setNullActionBarBackground()V

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->isTopHidden:Z

    :cond_5
    return-void
.end method

.method public setInnerScollerMessager(Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mInnerScollerStateChangedMessager:Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView$InnerScollerStateChangedMessager;

    return-void
.end method

.method public setTopViewHeight(I)V
    .locals 2

    iput p1, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mActionBarHeight:I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060029

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/ui/BabyAlbumDetailPageScrollView;->mTopViewHeight:I

    return-void
.end method
