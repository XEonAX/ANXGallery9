.class Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;
.super Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;
.source "EditAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/movie/ui/adapter/EditAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private mFromPosition:I

.field private mLastActive:Z

.field private mMove:Z

.field private mToPosition:I

.field private final sDragScrollInterpolator:Landroid/view/animation/Interpolator;

.field private final sDragViewScrollCapInterpolator:Landroid/view/animation/Interpolator;

.field final synthetic this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-direct {p0}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;-><init>()V

    new-instance p1, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$1;-><init>(Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->sDragViewScrollCapInterpolator:Landroid/view/animation/Interpolator;

    new-instance p1, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1$2;-><init>(Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->sDragScrollInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method


# virtual methods
.method public clearView(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->clearView(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object p2, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$000(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;Landroid/view/View;Z)V

    return-void
.end method

.method public getMovementFlags(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;)I
    .locals 0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->isAddItem(I)Z

    move-result p1

    const/4 p2, 0x0

    if-eqz p1, :cond_0

    invoke-static {p2, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->makeMovementFlags(II)I

    move-result p1

    return p1

    :cond_0
    const/16 p1, 0xf

    invoke-static {p1, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->makeMovementFlags(II)I

    move-result p1

    return p1
.end method

.method public interpolateOutOfBoundsScroll(Landroid/support/v7/widget/RecyclerView;IIIJ)I
    .locals 3

    invoke-static {p3}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p4, p3

    invoke-static {p4}, Ljava/lang/Math;->signum(F)F

    move-result p4

    float-to-int p4, p4

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p1, p1, v0

    int-to-float p2, p2

    div-float/2addr p1, p2

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    mul-int/lit8 p4, p4, 0x28

    int-to-float p2, p4

    iget-object p4, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->sDragViewScrollCapInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {p4, p1}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p1

    mul-float p2, p2, p1

    float-to-int p1, p2

    const-wide/16 v1, 0x1f4

    cmp-long p2, p5, v1

    if-lez p2, :cond_0

    goto :goto_0

    :cond_0
    long-to-float p2, p5

    const/high16 p4, 0x43fa0000    # 500.0f

    div-float v0, p2, p4

    :goto_0
    int-to-float p1, p1

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->sDragScrollInterpolator:Landroid/view/animation/Interpolator;

    invoke-interface {p2, v0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    move-result p2

    mul-float p1, p1, p2

    float-to-int p1, p1

    if-nez p1, :cond_2

    if-lez p3, :cond_1

    const/4 p1, 0x1

    goto :goto_1

    :cond_1
    const/4 p1, -0x1

    :goto_1
    return p1

    :cond_2
    return p1
.end method

.method public isItemViewSwipeEnabled()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isLongPressDragEnabled()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onChildDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;FFIZ)V
    .locals 0

    invoke-super/range {p0 .. p7}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onChildDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;FFIZ)V

    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mLastActive:Z

    if-eqz p1, :cond_0

    if-nez p7, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object p2, p3, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 p3, 0x0

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$000(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;Landroid/view/View;Z)V

    :cond_0
    iput-boolean p7, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mLastActive:Z

    return-void
.end method

.method public onMove(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p1

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->isAddItem(I)Z

    move-result p3

    if-eqz p3, :cond_0

    add-int/lit8 p2, p2, -0x1

    :cond_0
    iput p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mToPosition:I

    const/4 p3, 0x1

    if-ne p1, p2, :cond_1

    return p3

    :cond_1
    if-ge p1, p2, :cond_2

    move v0, p1

    :goto_0
    if-ge v0, p2, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getList()Ljava/util/List;

    move-result-object v1

    add-int/lit8 v2, v0, 0x1

    invoke-static {v1, v0, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$200(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;II)V

    move v0, v2

    goto :goto_0

    :cond_2
    move v0, p1

    :goto_1
    if-le v0, p2, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->getList()Ljava/util/List;

    move-result-object v1

    add-int/lit8 v2, v0, -0x1

    invoke-static {v1, v0, v2}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    iget-object v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$200(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;II)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->notifyItemMoved(II)V

    return p3
.end method

.method public onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;->onSelectedChanged(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->isAddItem(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    iget-object p1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$000(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;Landroid/view/View;Z)V

    iput-boolean v1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mMove:Z

    iput p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mFromPosition:I

    iput p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mToPosition:I

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mMove:Z

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mFromPosition:I

    iget p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mToPosition:I

    if-eq p1, p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$100(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter$OnActionListener;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->this$0:Lcom/miui/gallery/movie/ui/adapter/EditAdapter;

    invoke-static {p1}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter;->access$100(Lcom/miui/gallery/movie/ui/adapter/EditAdapter;)Lcom/miui/gallery/movie/ui/adapter/EditAdapter$OnActionListener;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mFromPosition:I

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$1;->mToPosition:I

    invoke-interface {p1, p2, v0}, Lcom/miui/gallery/movie/ui/adapter/EditAdapter$OnActionListener;->onMove(II)V

    :cond_1
    :goto_0
    return-void
.end method

.method public onSwiped(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    return-void
.end method
