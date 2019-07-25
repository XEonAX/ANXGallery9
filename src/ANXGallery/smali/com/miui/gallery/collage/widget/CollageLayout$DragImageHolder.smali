.class Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;
.super Ljava/lang/Object;
.source "CollageLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/CollageLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DragImageHolder"
.end annotation


# instance fields
.field private mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

.field private mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

.field private mDragEnable:Z

.field private mExchangeEnable:Z

.field private mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

.field private mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field final synthetic this$0:Lcom/miui/gallery/collage/widget/CollageLayout;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragEnable:Z

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mExchangeEnable:Z

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout$1;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-direct {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout$1;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    new-instance p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$3;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)V

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout;Lcom/miui/gallery/collage/widget/CollageLayout$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageImageView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    return-object p0
.end method

.method static synthetic access$1602(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mExchangeEnable:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    return-object p0
.end method


# virtual methods
.method disableDragMode()V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragEnable:Z

    iput-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mExchangeEnable:Z

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {v1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$402(Lcom/miui/gallery/collage/widget/CollageLayout;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    return-void
.end method

.method draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragEnable:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mExchangeEnable:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->draw(Landroid/graphics/Canvas;)V

    return-void
.end method

.method enableDragMode(Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->setCollageImageView(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragEnable:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mExchangeEnable:Z

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->show(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method

.method exchangeBitmapWithAnim(Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->setCollageImageView(Lcom/miui/gallery/collage/widget/CollageImageView;)V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDownView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$1500(Landroid/graphics/RectF;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mTargetBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->getTransitionAnimator(Landroid/graphics/RectF;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    invoke-static {v1, p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$1500(Landroid/graphics/RectF;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    iget-object v3, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v2, v1, v3}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->getTransitionAnimator(Landroid/graphics/RectF;Landroid/animation/ValueAnimator$AnimatorUpdateListener;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v3, 0x15e

    invoke-virtual {v2, v3, v4}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance v3, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v3, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;

    invoke-direct {v3, p0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;Lcom/miui/gallery/collage/widget/CollageImageView;)V

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const/4 p1, 0x2

    new-array p1, p1, [Landroid/animation/Animator;

    const/4 v3, 0x0

    aput-object v1, p1, v3

    const/4 v1, 0x1

    aput-object v0, p1, v1

    invoke-virtual {v2, p1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method receiveScrollEvent(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->receiveScrollEvent(FF)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->invalidate()V

    return-void
.end method

.method resetBitmapWithAnim()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mDragBitmapItem:Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->mUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance v2, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;-><init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->reset(Landroid/animation/ValueAnimator$AnimatorUpdateListener;Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method
