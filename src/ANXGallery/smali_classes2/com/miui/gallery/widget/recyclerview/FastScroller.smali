.class Lcom/miui/gallery/widget/recyclerview/FastScroller;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "FastScroller.java"

# interfaces
.implements Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;,
        Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorListener;
    }
.end annotation


# static fields
.field private static final EMPTY_STATE_SET:[I

.field private static final PRESSED_STATE_SET:[I


# instance fields
.field private mAnimTranslateX:I

.field private mAnimTranslateY:I

.field private mAnimationState:I

.field private mDefaultThumbHeight:I

.field private mDefaultThumbWidth:I

.field private mDragState:I

.field private final mHideRunnable:Ljava/lang/Runnable;

.field private mHorizontalDragInitX:I

.field mHorizontalDragX:F

.field private final mHorizontalRange:[I

.field private mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

.field private mHorizontalThumbHeight:I

.field private mHorizontalThumbWidth:I

.field mHorizontalThumbX:I

.field private mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

.field private mHorizontalTrackHeight:I

.field private mMargin:I

.field private mNeedDispatchFakeEvent:Z

.field private mNeedHorizontalScrollbar:Z

.field private mNeedVerticalScrollbar:Z

.field private final mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private final mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field private mRecyclerViewHeight:I

.field private mRecyclerViewWidth:I

.field private mScrollSlop:I

.field private mScrollbarMinimumRange:I

.field private final mShowHideAnimator:Landroid/animation/ValueAnimator;

.field private mState:I

.field private mTouchOffset:I

.field private mVerticalDragInitY:I

.field mVerticalDragY:F

.field private final mVerticalRange:[I

.field private mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

.field private mVerticalThumbHeight:I

.field private mVerticalThumbWidth:I

.field mVerticalThumbY:I

.field private mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

.field private mVerticalTrackWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x10100a7

    aput v2, v0, v1

    sput-object v0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->PRESSED_STATE_SET:[I

    new-array v0, v1, [I

    sput-object v0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->EMPTY_STATE_SET:[I

    return-void
.end method

.method constructor <init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V
    .locals 3

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    const/4 v1, 0x2

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalRange:[I

    new-array v2, v1, [I

    iput-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalRange:[I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateY:I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateX:I

    new-array v1, v1, [F

    fill-array-data v1, :array_0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    new-instance v1, Lcom/miui/gallery/widget/recyclerview/FastScroller$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller$1;-><init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHideRunnable:Ljava/lang/Runnable;

    new-instance v1, Lcom/miui/gallery/widget/recyclerview/FastScroller$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller$2;-><init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedDispatchFakeEvent:Z

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorListener;-><init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;Lcom/miui/gallery/widget/recyclerview/FastScroller$1;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    new-instance v1, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;-><init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;Lcom/miui/gallery/widget/recyclerview/FastScroller$1;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollSlop:I

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method static synthetic access$1000(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    return p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isLayoutRTL()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateY:I

    return p1
.end method

.method static synthetic access$1600(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbHeight:I

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/animation/ValueAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$302(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->requestRedraw()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateX:I

    return p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateX:I

    return p1
.end method

.method private cancelHide()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHideRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private destroyCallbacks()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->removeOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->cancelHide()V

    return-void
.end method

.method private dispatchFakeEventExceptSelf(Landroid/view/MotionEvent;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getItemTouchListenerCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    const-string v1, "FastScroller"

    const-string v2, "dispatch fake event %s"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v2, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getItemTouchListenerAt(I)Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    move-result-object v2

    if-eq v2, p0, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-interface {v2, v3, p1}, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;->onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private drawHorizontalScrollbar(Landroid/graphics/Canvas;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbHeight:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateY:I

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbWidth:I

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbHeight:I

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->setBounds(IIII)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackHeight:I

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_1
    int-to-float v2, v0

    const/4 v3, 0x0

    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_2
    int-to-float v2, v1

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    neg-int v1, v1

    int-to-float v1, v1

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    return-void
.end method

.method private drawVerticalScrollbar(Landroid/graphics/Canvas;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    sub-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbHeight:I

    const/4 v5, 0x0

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/drawable/StateListDrawable;->setBounds(IIII)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackWidth:I

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    invoke-virtual {v2, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->ensureLayoutDirection(Landroid/graphics/drawable/Drawable;)V

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->ensureLayoutDirection(Landroid/graphics/drawable/Drawable;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isLayoutRTL()Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_3
    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateX:I

    int-to-float v2, v0

    int-to-float v3, v1

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    neg-int v0, v0

    int-to-float v0, v0

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_0

    :cond_4
    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimTranslateX:I

    add-int/2addr v0, v2

    int-to-float v2, v0

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_5
    int-to-float v2, v1

    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    neg-int v0, v0

    int-to-float v0, v0

    neg-int v1, v1

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_0
    return-void
.end method

.method private ensureLayoutDirection(Landroid/graphics/drawable/Drawable;)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getLayoutDirection()I

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getLayoutDirection()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    :cond_0
    return-void
.end method

.method private getHorizontalRange()[I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalRange:[I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mMargin:I

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalRange:[I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mMargin:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbWidth:I

    sub-int/2addr v1, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalRange:[I

    return-object v0
.end method

.method private getVerticalRange()[I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalRange:[I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mMargin:I

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalRange:[I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mMargin:I

    sub-int/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbHeight:I

    sub-int/2addr v1, v2

    const/4 v2, 0x1

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalRange:[I

    return-object v0
.end method

.method private horizontalScrollTo(F)V
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->getHorizontalRange()[I

    move-result-object v3

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeHorizontalScrollRange()I

    move-result v4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeHorizontalScrollOffset()I

    move-result v5

    iget v6, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    move-object v0, p0

    move v2, p1

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->scrollTo(FF[IIII)I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->scrollBy(II)V

    :cond_0
    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    return-void
.end method

.method private isLayoutRTL()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-static {v0}, Landroid/support/v4/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private requestRedraw()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->invalidate()V

    return-void
.end method

.method private resetHideDelay(I)V
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->cancelHide()V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHideRunnable:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private scrollTo(FF[IIII)I
    .locals 2

    const/4 v0, 0x1

    aget v0, p3, v0

    const/4 v1, 0x0

    aget p3, p3, v1

    sub-int/2addr v0, p3

    if-nez v0, :cond_0

    return v1

    :cond_0
    sub-float/2addr p2, p1

    int-to-float p1, v0

    div-float/2addr p2, p1

    sub-int/2addr p4, p6

    int-to-float p1, p4

    mul-float p2, p2, p1

    float-to-int p1, p2

    add-int/2addr p5, p1

    if-ge p5, p4, :cond_1

    if-ltz p5, :cond_1

    return p1

    :cond_1
    return v1
.end method

.method private setState(I)V
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_2

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-eq v2, v1, :cond_2

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne v2, v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    sget-object v3, Lcom/miui/gallery/widget/recyclerview/FastScroller;->PRESSED_STATE_SET:[I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    :cond_0
    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne v2, v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    sget-object v3, Lcom/miui/gallery/widget/recyclerview/FastScroller;->PRESSED_STATE_SET:[I

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->cancelHide()V

    :cond_2
    if-nez p1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->requestRedraw()V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->show()V

    :goto_0
    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-ne v2, v1, :cond_6

    if-eq p1, v1, :cond_6

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne v2, v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    sget-object v2, Lcom/miui/gallery/widget/recyclerview/FastScroller;->EMPTY_STATE_SET:[I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    :cond_4
    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne v1, v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    sget-object v1, Lcom/miui/gallery/widget/recyclerview/FastScroller;->EMPTY_STATE_SET:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    :cond_5
    const/16 v0, 0x4b0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->resetHideDelay(I)V

    goto :goto_1

    :cond_6
    if-ne p1, v0, :cond_7

    const/16 v0, 0x5dc

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->resetHideDelay(I)V

    :cond_7
    :goto_1
    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    return-void
.end method

.method private setupCallbacks()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mOnScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-void
.end method

.method private updateAppearance()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    const/16 v1, 0xff

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbWidth:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbHeight:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicHeight()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbHeight:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbWidth:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackWidth:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbWidth:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbWidth:I

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbHeight:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbHeight:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbHeight:I

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackHeight:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeHorizontalScrollOffset()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeVerticalScrollOffset()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->updateThumbPositionByScrolling(II)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->requestRedraw()V

    return-void
.end method

.method private verticalScrollTo(F)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->getVerticalRange()[I

    move-result-object v0

    const/4 v1, 0x1

    aget v2, v0, v1

    const/4 v3, 0x0

    aget v4, v0, v3

    sub-int/2addr v2, v4

    if-nez v2, :cond_0

    return-void

    :cond_0
    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mTouchOffset:I

    int-to-float v4, v4

    sub-float v4, p1, v4

    int-to-float v2, v2

    div-float/2addr v4, v2

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v2

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    int-to-float v5, v2

    mul-float v5, v5, v4

    float-to-int v4, v5

    sub-int/2addr v2, v1

    invoke-static {v4, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->invalidateItemDecorations()V

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v4, v2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->scrollToPosition(I)V

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    const/4 v2, -0x1

    aget v1, v0, v1

    int-to-float v1, v1

    aget v0, v0, v3

    int-to-float v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, v2, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->updateThumbPositionByDragging(II)V

    return-void
.end method


# virtual methods
.method public attach()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setupCallbacks()V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeHorizontalScrollOffset()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeVerticalScrollOffset()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->updateThumbPositionByScrolling(II)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->requestRedraw()V

    return-void
.end method

.method public detach()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->destroyCallbacks()V

    return-void
.end method

.method hide(I)V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :pswitch_1
    const/4 v0, 0x3

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    aput v3, v1, v2

    const/4 v2, 0x1

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public isDragging()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method isPointInsideHorizontalThumb(FF)Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbHeight:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_0

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    int-to-float p2, p2

    cmpl-float p2, p1, p2

    if-ltz p2, :cond_0

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbWidth:I

    add-int/2addr p2, v0

    int-to-float p2, p2

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method isPointInsideVerticalThumb(FF)Z
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isLayoutRTL()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_1

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbWidth:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    :goto_0
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    int-to-float p1, p1

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbHeight:I

    add-int/2addr p1, v0

    int-to-float p1, p1

    cmpg-float p1, p2, p1

    if-gtz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 0

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getWidth()I

    move-result p3

    if-ne p2, p3, :cond_3

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getHeight()I

    move-result p3

    if-eq p2, p3, :cond_0

    goto :goto_0

    :cond_0
    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    if-eqz p2, :cond_2

    iget-boolean p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    if-eqz p2, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->drawVerticalScrollbar(Landroid/graphics/Canvas;)V

    :cond_1
    iget-boolean p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    if-eqz p2, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->drawHorizontalScrollbar(Landroid/graphics/Canvas;)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getWidth()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    if-eq p1, v0, :cond_0

    const/4 v1, 0x3

    if-ne p1, v1, :cond_1

    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    iput v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    :cond_1
    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    const/4 v2, 0x2

    const/4 v3, 0x0

    if-ne v1, v0, :cond_6

    if-nez p1, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isPointInsideVerticalThumb(FF)Z

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isPointInsideHorizontalThumb(FF)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    goto/16 :goto_2

    :cond_2
    if-eqz p1, :cond_7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    goto :goto_2

    :cond_3
    if-ne p1, v2, :cond_7

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    if-lez p1, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    int-to-float v1, v1

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollSlop:I

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_4

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    int-to-float p2, p2

    sub-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mTouchOffset:I

    :goto_0
    const/4 v3, 0x1

    goto :goto_1

    :cond_4
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    if-lez p1, :cond_5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    int-to-float v1, v1

    sub-float/2addr p1, v1

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollSlop:I

    int-to-float v1, v1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_5

    iput v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    int-to-float p2, p2

    sub-float/2addr p1, p2

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mTouchOffset:I

    goto :goto_0

    :cond_5
    :goto_1
    if-eqz v3, :cond_7

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedDispatchFakeEvent:Z

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    goto :goto_2

    :cond_6
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-ne p1, v2, :cond_7

    const/4 v3, 0x1

    :cond_7
    :goto_2
    return v3
.end method

.method public onRequestDisallowInterceptTouchEvent(Z)V
    .locals 0

    return-void
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 5

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    const/4 v0, 0x3

    const/4 v1, 0x0

    if-eqz p1, :cond_9

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p1

    const/4 v2, 0x1

    if-eqz p1, :cond_0

    if-eq p1, v2, :cond_0

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 v3, -0x1

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    :cond_1
    if-nez p1, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isPointInsideVerticalThumb(FF)Z

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->isPointInsideHorizontalThumb(FF)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    goto/16 :goto_1

    :cond_2
    if-eqz p1, :cond_9

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    goto/16 :goto_1

    :cond_3
    const/4 v3, 0x2

    if-ne p1, v3, :cond_8

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-eq p1, v3, :cond_6

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    if-lez p1, :cond_4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragInitX:I

    int-to-float v4, v4

    sub-float/2addr p1, v4

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollSlop:I

    int-to-float v4, v4

    cmpl-float p1, p1, v4

    if-lez p1, :cond_4

    iput v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    int-to-float v2, v2

    sub-float/2addr p1, v2

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mTouchOffset:I

    goto :goto_0

    :cond_4
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    if-lez p1, :cond_5

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragInitY:I

    int-to-float v2, v2

    sub-float/2addr p1, v2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollSlop:I

    int-to-float v2, v2

    cmpl-float p1, p1, v2

    if-lez p1, :cond_5

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    int-to-float v2, v2

    sub-float/2addr p1, v2

    float-to-int p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mTouchOffset:I

    :cond_5
    :goto_0
    invoke-direct {p0, v3}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    goto :goto_1

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->show()V

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne p1, v2, :cond_7

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->horizontalScrollTo(F)V

    :cond_7
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    if-ne p1, v3, :cond_9

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->verticalScrollTo(F)V

    goto :goto_1

    :cond_8
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v2, :cond_9

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-ne p1, v3, :cond_9

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalDragY:F

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalDragX:F

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    iput v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    :cond_9
    :goto_1
    iget-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedDispatchFakeEvent:Z

    if-eqz p1, :cond_a

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedDispatchFakeEvent:Z

    invoke-static {p2}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->setAction(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->dispatchFakeEventExceptSelf(Landroid/view/MotionEvent;)V

    :cond_a
    return-void
.end method

.method public setStyle(I)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/R$styleable;->CustomFastScroll:[I

    const/4 v2, 0x0

    const v3, 0x7f030020

    invoke-virtual {v0, v2, v1, v3, p1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalTrackDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    :pswitch_1
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/StateListDrawable;

    iput-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    goto :goto_1

    :pswitch_2
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollbarMinimumRange:I

    goto :goto_1

    :pswitch_3
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mMargin:I

    goto :goto_1

    :pswitch_4
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalTrackDrawable:Landroid/graphics/drawable/Drawable;

    goto :goto_1

    :pswitch_5
    invoke-virtual {p1, v3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/StateListDrawable;

    iput-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbDrawable:Landroid/graphics/drawable/StateListDrawable;

    goto :goto_1

    :pswitch_6
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbWidth:I

    goto :goto_1

    :pswitch_7
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDefaultThumbHeight:I

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->updateAppearance()V

    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public show()V
    .locals 5

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    if-eqz v0, :cond_1

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1
    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mAnimationState:I

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v4}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    aput v4, v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v2, v0

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x96

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mShowHideAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_0
    return-void
.end method

.method updateThumbPositionByDragging(II)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    :cond_0
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mDragState:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    :cond_1
    return-void
.end method

.method updateThumbPositionByScrolling(II)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeVerticalScrollRange()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    sub-int/2addr v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez v0, :cond_0

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewHeight:I

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollbarMinimumRange:I

    if-lt v3, v4, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    iput-boolean v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->computeHorizontalScrollRange()I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    sub-int/2addr v3, v4

    if-lez v3, :cond_1

    iget v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mRecyclerViewWidth:I

    iget v5, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mScrollbarMinimumRange:I

    if-lt v4, v5, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    iput-boolean v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    iget-boolean v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    if-nez v4, :cond_3

    iget-boolean v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    if-nez v4, :cond_3

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-eqz p1, :cond_2

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    :cond_2
    return-void

    :cond_3
    iget-boolean v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedVerticalScrollbar:Z

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v4, :cond_4

    int-to-float p2, p2

    mul-float p2, p2, v5

    int-to-float v0, v0

    div-float/2addr p2, v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->getVerticalRange()[I

    move-result-object v0

    aget v4, v0, v1

    aget v6, v0, v2

    sub-int/2addr v4, v6

    aget v0, v0, v2

    int-to-float v0, v0

    int-to-float v4, v4

    mul-float v4, v4, p2

    add-float/2addr v0, v4

    float-to-int p2, v0

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mVerticalThumbY:I

    :cond_4
    iget-boolean p2, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mNeedHorizontalScrollbar:Z

    if-eqz p2, :cond_5

    int-to-float p1, p1

    mul-float p1, p1, v5

    int-to-float p2, v3

    div-float/2addr p1, p2

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->getHorizontalRange()[I

    move-result-object p2

    aget v0, p2, v1

    aget v3, p2, v2

    sub-int/2addr v0, v3

    aget p2, p2, v2

    int-to-float p2, p2

    int-to-float v0, v0

    mul-float v0, v0, p1

    add-float/2addr p2, v0

    float-to-int p1, p2

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mHorizontalThumbX:I

    :cond_5
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-eqz p1, :cond_6

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller;->mState:I

    if-ne p1, v1, :cond_7

    :cond_6
    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setState(I)V

    :cond_7
    return-void
.end method
