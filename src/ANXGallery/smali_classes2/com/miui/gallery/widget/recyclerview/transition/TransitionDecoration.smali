.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "TransitionDecoration.java"


# instance fields
.field private mDecorItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;",
            ">;"
        }
    .end annotation
.end field

.field private mProgress:F


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    return-void
.end method

.method private drawItems(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mProgress:F

    invoke-virtual {v1, p1, v2}, Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;->onDraw(Landroid/graphics/Canvas;F)V

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method getDecorItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->drawItems(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public updateItems(Landroid/support/v7/widget/RecyclerView;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/DecorItem;",
            ">;)V"
        }
    .end annotation

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    return-void
.end method

.method public updateProgress(Landroid/support/v7/widget/RecyclerView;F)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mDecorItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    invoke-static {p2, v1}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mProgress:F

    invoke-static {v0, p2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_1

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mProgress:F

    const-string p2, "TransitionDecoration"

    const-string v0, "update progress %s"

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionDecoration;->mProgress:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_1
    return-void

    :cond_2
    :goto_0
    const-string p1, "TransitionDecoration"

    const-string p2, "mDecorItems is empty"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
