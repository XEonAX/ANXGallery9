.class public Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;
.super Landroid/view/View;
.source "PaintSelectView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;,
        Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;,
        Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;
    }
.end annotation


# instance fields
.field private mBasePaintRect:Landroid/graphics/Rect;

.field private mContext:Landroid/content/Context;

.field private mCurrentPaintIndex:I

.field private mDoodlePaintItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;",
            ">;"
        }
    .end annotation
.end field

.field private mGesListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHandler:Landroid/os/Handler;

.field private mInterpolator:Landroid/view/animation/DecelerateInterpolator;

.field private mIsSelectMode:Z

.field private mItemOffset:I

.field private mPaintAnimator:Landroid/animation/ValueAnimator;

.field private mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

.field private mPaintBottomOffset:I

.field private mPaintDrawableWidth:I

.field private mPaintRightOffset:I

.field private mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mInterpolator:Landroid/view/animation/DecelerateInterpolator;

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGesListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mIsSelectMode:Z

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mHandler:Landroid/os/Handler;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mInterpolator:Landroid/view/animation/DecelerateInterpolator;

    const/4 p2, 0x1

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGesListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mIsSelectMode:Z

    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mHandler:Landroid/os/Handler;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    new-instance p2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {p2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mInterpolator:Landroid/view/animation/DecelerateInterpolator;

    const/4 p2, 0x1

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    new-instance p2, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGesListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mIsSelectMode:Z

    new-instance p2, Landroid/os/Handler;

    invoke-direct {p2}, Landroid/os/Handler;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mHandler:Landroid/os/Handler;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->init(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;FF)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->findTouchIndex(FF)I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mIsSelectMode:Z

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->setSelectIndex(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;[F)Landroid/animation/ValueAnimator;
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->getDoodlePaintItemSizeAnim(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;[F)Landroid/animation/ValueAnimator;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;)Ljava/util/List;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    return-object p0
.end method

.method private doSelectAnimator(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;)V
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->getDoodlePaintItemSizeAnim(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;[F)Landroid/animation/ValueAnimator;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$1;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f8ccccd    # 1.1f
    .end array-data
.end method

.method private drawPaint(Landroid/graphics/Canvas;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    if-eq v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method private findTouchIndex(FF)I
    .locals 2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->isContain(FF)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method private varargs getDoodlePaintItemSizeAnim(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;[F)Landroid/animation/ValueAnimator;
    .locals 2

    invoke-static {p2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p2

    new-instance v0, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v0, 0x96

    invoke-virtual {p2, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$2;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$2;-><init>(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;)V

    invoke-virtual {p2, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object p2
.end method

.method private init(Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mContext:Landroid/content/Context;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->initPaint()V

    new-instance p1, Landroid/view/GestureDetector;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGesListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$GesListener;

    invoke-direct {p1, v0, v1}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    return-void
.end method

.method private initPaint()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getList(Landroid/content/res/Resources;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->getIntrinsicWidth()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintDrawableWidth:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06012c

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintRightOffset:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06012b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintBottomOffset:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setSelect(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060127

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mItemOffset:I

    return-void
.end method

.method private setPaintLocation(II)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintDrawableWidth:I

    sub-int v1, p1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintDrawableWidth:I

    sub-int v2, p2, v2

    invoke-virtual {v0, v1, v2, p1, p2}, Landroid/graphics/Rect;->set(IIII)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    iget p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintRightOffset:I

    neg-int p2, p2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintBottomOffset:I

    neg-int v0, v0

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Rect;->offset(II)V

    const/4 p1, 0x0

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    if-ge p1, p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setBounds(Landroid/graphics/Rect;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private setSelectIndex(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setSelect(Z)V

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setSelect(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;

    iget-object v1, p1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->paintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    iget v1, v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->paintSize:F

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;->onPaintSizeChange(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mHandler:Landroid/os/Handler;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->invalidate()V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->doSelectAnimator(Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;)V

    return-void
.end method


# virtual methods
.method public expansionPaint(Z)V
    .locals 9

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mIsSelectMode:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    goto :goto_0

    :cond_0
    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    new-array v0, v0, [Landroid/animation/PropertyValuesHolder;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x2

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->centerX()I

    move-result v4

    if-eqz p1, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    iget v7, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintDrawableWidth:I

    iget v8, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mItemOffset:I

    add-int/2addr v7, v8

    mul-int v7, v7, v3

    sub-int/2addr v6, v7

    goto :goto_2

    :cond_1
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mBasePaintRect:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v6

    :goto_2
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    new-array v5, v5, [F

    int-to-float v4, v4

    aput v4, v5, v2

    int-to-float v4, v6

    aput v4, v5, v1

    invoke-static {v7, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    aput-object v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    if-eqz p1, :cond_3

    array-length p1, v0

    sub-int/2addr p1, v1

    const-string v1, "progress"

    new-array v2, v5, [F

    fill-array-data v2, :array_0

    invoke-static {v1, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, p1

    goto :goto_3

    :cond_3
    array-length p1, v0

    sub-int/2addr p1, v1

    const-string v1, "progress"

    new-array v2, v5, [F

    fill-array-data v2, :array_1

    invoke-static {v1, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    aput-object v1, v0, p1

    :goto_3
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimatorListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintAnimatorListener;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mInterpolator:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->drawPaint(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->setPaintLocation(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public setPaintColor(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->setCurrentColor(I)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->invalidate()V

    return-void
.end method

.method public setPaintSizeChangeListener(Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;)V
    .locals 2

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mPaintSizeChangeListener:Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mDoodlePaintItemList:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView;->mCurrentPaintIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem;->paintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;

    iget v0, v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintItem$PaintType;->paintSize:F

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/app/doodle/PaintSelectView$PaintSizeChangeListener;->onPaintSizeChange(F)V

    :cond_0
    return-void
.end method
