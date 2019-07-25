.class Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "HeaderItemClickHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ClickGestureDetector"
.end annotation


# instance fields
.field private mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

.field private mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

.field private mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

.field private mIsTapUpConsumed:Z

.field private mPressedHolderRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V
    .locals 1

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    new-instance v0, Landroid/support/v4/view/GestureDetectorCompat;

    invoke-direct {v0, p1, p0}, Landroid/support/v4/view/GestureDetectorCompat;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    iput-object p2, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    return-void
.end method

.method private dispatchResetPressState(Landroid/view/MotionEvent;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->resetPressState()V

    return-void
.end method

.method private dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    :cond_0
    return-void
.end method

.method private performItemClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;->onHeaderClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->playSoundEffect(I)V

    :cond_0
    return v0

    :cond_1
    return v1
.end method

.method private performItemLongClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;->onHeaderLongClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->performHapticFeedback(I)Z

    :cond_0
    return v0

    :cond_1
    return v1
.end method

.method private resetPressState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mPressedHolderRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mPressedHolderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    if-eqz v0, :cond_0

    iget-object v1, v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    if-eqz v1, :cond_0

    iget-object v0, v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mPressedHolderRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mPressedHolderRef:Ljava/lang/ref/WeakReference;

    :cond_1
    return-void
.end method


# virtual methods
.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->performItemLongClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    :cond_1
    return-void

    :cond_2
    :goto_0
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->resetPressState()V

    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->resetPressState()V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mPressedHolderRef:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->performItemClick(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mIsTapUpConsumed:Z

    :cond_1
    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mGestureDetector:Landroid/support/v4/view/GestureDetectorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/view/GestureDetectorCompat;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_1

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->dispatchResetPressState(Landroid/view/MotionEvent;)V

    :goto_0
    return v0
.end method

.method public setOnHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$ClickGestureDetector;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    return-void
.end method
