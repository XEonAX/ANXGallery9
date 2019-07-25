.class Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;
.super Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;
.source "StickyHeaderDecoration.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderMotionEventDispatch"
.end annotation


# instance fields
.field private mEnqueuingFakeEvent:Z

.field private mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

.field private mInterceptEvent:Z

.field private mTouchHeader:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
            ">;"
        }
    .end annotation
.end field

.field private mTouchTarget:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$SimpleOnItemTouchListener;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mEnqueuingFakeEvent:Z

    return p1
.end method

.method private clearTouchTargets()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    iput-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    iput-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    :cond_1
    return-void
.end method

.method private enqueueFakeEvent(Landroid/support/v7/widget/RecyclerView;)V
    .locals 2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getHandler()Landroid/os/Handler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch$1;-><init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    return-void
.end method

.method private findTouchTarget(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;FF)Landroid/view/View;
    .locals 5

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->transformTouchPoint(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;FF)[F

    move-result-object p2

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p3, :cond_1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->isValidTouchTarget(Landroid/view/View;)Z

    move-result v3

    if-eqz v3, :cond_0

    aget v3, p2, v0

    const/4 v4, 0x1

    aget v4, p2, v4

    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->isPointInView(Landroid/view/View;FF)Z

    move-result v3

    if-eqz v3, :cond_0

    return-object v2

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getTouchHeader()Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    :goto_0
    return-object v0
.end method

.method private getTouchTarget()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    :goto_0
    return-object v0
.end method

.method private isPointInView(Landroid/view/View;FF)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    int-to-float v0, v0

    cmpl-float v0, p2, v0

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getRight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float p2, p2, v0

    if-gez p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p2

    int-to-float p2, p2

    cmpl-float p2, p3, p2

    if-lez p2, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    move-result p1

    int-to-float p1, p1

    cmpg-float p1, p3, p1

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isValidTouchTarget(Landroid/view/View;)Z
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->isClickable()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private setPressed(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Z)V
    .locals 0

    invoke-virtual {p2, p3}, Landroid/view/View;->setPressed(Z)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    return-void
.end method

.method private transformTouchPoint(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;FF)[F
    .locals 6

    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p2, v0, v1

    const/4 v2, 0x1

    aput p3, v0, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->getHeaderBoundsInLayout(J)Landroid/graphics/Rect;

    move-result-object p1

    if-eqz p1, :cond_0

    iget v3, p1, Landroid/graphics/Rect;->left:I

    int-to-float v3, v3

    sub-float/2addr p2, v3

    aput p2, v0, v1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    sub-float/2addr p3, p1

    aput p3, v0, v2

    :cond_0
    return-object v0
.end method


# virtual methods
.method handleTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->clearTouchTargets()V

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchHeader:Ljava/lang/ref/WeakReference;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->findTouchTarget(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;FF)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mTouchTarget:Ljava/lang/ref/WeakReference;

    :cond_0
    const/4 v1, 0x3

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eq v0, v1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchHeader()Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchTarget()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {v1, v4, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchHeader()Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v4

    if-ne v4, v1, :cond_3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p2

    invoke-direct {p0, v1, v4, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->findTouchTarget(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;FF)Landroid/view/View;

    move-result-object p2

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchTarget()Landroid/view/View;

    move-result-object v1

    if-ne v1, p2, :cond_3

    if-nez v0, :cond_1

    invoke-direct {p0, p1, p2, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->setPressed(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Z)V

    :cond_1
    if-ne v0, v2, :cond_2

    invoke-direct {p0, p1, p2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->setPressed(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Z)V

    invoke-virtual {p2}, Landroid/view/View;->performClick()Z

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->playSoundEffect(I)V

    :cond_2
    const/4 p2, 0x1

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_4

    if-ne v0, v2, :cond_6

    :cond_4
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchTarget()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p1, v0, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->setPressed(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Z)V

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->clearTouchTargets()V

    :cond_6
    return p2
.end method

.method public onInterceptTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mEnqueuingFakeEvent:Z

    if-eqz v0, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mInterceptEvent:Z

    return p1

    :cond_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->handleTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result p2

    if-nez p2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->getTouchHeader()Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p2

    if-eqz p2, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->isStickyHeader()Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    iput-boolean p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mInterceptEvent:Z

    iget-boolean p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mInterceptEvent:Z

    if-eqz p2, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->enqueueFakeEvent(Landroid/support/v7/widget/RecyclerView;)V

    :cond_2
    iget-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->mInterceptEvent:Z

    return p1
.end method

.method public onTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;->handleTouchEvent(Landroid/support/v7/widget/RecyclerView;Landroid/view/MotionEvent;)Z

    return-void
.end method
