.class Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;
.super Landroid/view/GestureDetector$SimpleOnGestureListener;
.source "ClickItemTouchListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ItemClickGestureListener"
.end annotation


# instance fields
.field private final mHostView:Landroid/support/v7/widget/RecyclerView;

.field private mIsTapUpConsumed:Z

.field private mPressedViewRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;

    invoke-direct {p0}, Landroid/view/GestureDetector$SimpleOnGestureListener;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method

.method private resetPressState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mPressedViewRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mPressedViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setPressed(Z)V

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mPressedViewRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mPressedViewRef:Ljava/lang/ref/WeakReference;

    :cond_1
    return-void
.end method


# virtual methods
.method public dispatchResetPressState(Landroid/view/MotionEvent;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->resetPressState()V

    return-void
.end method

.method public dispatchSingleTapUpIfNeeded(Landroid/view/MotionEvent;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->onSingleTapUp(Landroid/view/MotionEvent;)Z

    :cond_0
    return-void
.end method

.method public onDown(Landroid/view/MotionEvent;)Z
    .locals 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v1, v2, p1}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method public onLongPress(Landroid/view/MotionEvent;)V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v0}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->isAttachedToWindow(Landroid/support/v7/widget/RecyclerView;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v5

    if-nez v5, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v5}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v6

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v2

    add-float/2addr v1, v2

    sub-float v9, v0, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v1

    add-float/2addr v0, v1

    sub-float v10, p1, v0

    const/4 p1, -0x1

    const/4 v0, 0x1

    if-eq v6, p1, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual/range {v3 .. v10}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->performItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_3

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    :cond_3
    return-void
.end method

.method public onScroll(Landroid/view/MotionEvent;Landroid/view/MotionEvent;FF)Z
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->resetPressState()V

    const/4 p1, 0x0

    return p1
.end method

.method public onShowPress(Landroid/view/MotionEvent;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->resetPressState()V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setPressed(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->setIsRecyclable(Z)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mPressedViewRef:Ljava/lang/ref/WeakReference;

    :cond_0
    return-void
.end method

.method public onSingleTapUp(Landroid/view/MotionEvent;)Z
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/support/v7/widget/RecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object v5

    const/4 v0, 0x0

    if-nez v5, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v5}, Landroid/support/v7/widget/RecyclerView;->getChildPosition(Landroid/view/View;)I

    move-result v6

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {v5}, Landroid/view/View;->getLeft()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v5}, Landroid/view/View;->getTranslationX()F

    move-result v3

    add-float/2addr v2, v3

    sub-float v9, v1, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v5}, Landroid/view/View;->getTop()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v5}, Landroid/view/View;->getTranslationY()F

    move-result v2

    add-float/2addr v1, v2

    sub-float v10, p1, v1

    const/4 p1, -0x1

    const/4 v1, 0x1

    if-eq v6, p1, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->this$0:Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mHostView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual/range {v3 .. v10}, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener;->performItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    if-eqz v0, :cond_2

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/ClickItemTouchListener$ItemClickGestureListener;->mIsTapUpConsumed:Z

    :cond_2
    return v0
.end method
