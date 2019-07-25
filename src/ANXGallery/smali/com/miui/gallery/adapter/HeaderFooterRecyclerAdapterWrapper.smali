.class public abstract Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;
.super Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;
.source "HeaderFooterRecyclerAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ADAPTER:",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "TVH;>;VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Lcom/miui/gallery/adapter/RecyclerAdapterWrapper<",
        "TADAPTER;TVH;>;"
    }
.end annotation


# instance fields
.field private mFooterViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TADAPTER;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;Ljava/util/List;Ljava/util/List;)V

    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$Adapter;Ljava/util/List;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TADAPTER;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-virtual {p1, p3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_1
    return-void
.end method

.method private mapPosition2ViewType(I)I
    .locals 1

    const/high16 v0, -0x80000000

    add-int/2addr p1, v0

    return p1
.end method

.method private mapViewType2Position(I)I
    .locals 1

    const/high16 v0, -0x80000000

    sub-int/2addr p1, v0

    return p1
.end method

.method private static removeFromParentFor(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getFootersCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterItemCount()I

    move-result v1

    add-int/2addr p1, v1

    add-int/2addr p1, v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemInserted(I)V

    return-void
.end method

.method public addHeaderView(Landroid/view/View;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemInserted(I)V

    return-void
.end method

.method public getFootersCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getHeadersCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterItemCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getFootersCount()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItemId(I)J
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    return-wide v1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result v0

    if-eqz v0, :cond_1

    return-wide v1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result p1

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapPosition2ViewType(I)I

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapPosition2ViewType(I)I

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result p1

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getWrappedAdapterPosition(I)I
    .locals 2

    const/4 v0, -0x1

    if-ltz p1, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getItemCount()I

    move-result v1

    if-lt p1, v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    sub-int/2addr p1, v0

    return p1

    :cond_2
    :goto_0
    return v0

    :cond_3
    :goto_1
    return v0
.end method

.method public isFooterPosition(I)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getItemCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getFootersCount()I

    move-result v1

    sub-int/2addr v0, v1

    if-lt p1, v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isFooterViewType(I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapViewType2Position(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result p1

    return p1
.end method

.method public isHeaderPosition(I)Z
    .locals 1

    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isHeaderViewType(I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapViewType2Position(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result p1

    return p1
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    instance-of p1, p1, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    check-cast p1, Landroid/support/v7/widget/GridLayoutManager;

    new-instance v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;

    invoke-virtual {p1}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSizeLookup()Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    move-result-object v1

    invoke-virtual {p1}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v2

    invoke-direct {v0, v1, p0, v2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;-><init>(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;I)V

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result p2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method protected abstract onCreateHeaderFooterViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            ")TVH;"
        }
    .end annotation
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TVH;"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderViewType(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapViewType2Position(I)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterViewType(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mapViewType2Position(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterItemCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_4

    invoke-static {v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->removeFromParentFor(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    instance-of p1, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    if-eqz p1, :cond_3

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    if-eqz p1, :cond_2

    new-instance p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    invoke-direct {p2, v1, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    goto :goto_1

    :cond_2
    new-instance p2, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;

    const/4 p1, -0x1

    const/4 v1, -0x2

    invoke-direct {p2, p1, v1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;-><init>(II)V

    :goto_1
    const/4 p1, 0x1

    invoke-virtual {p2, p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager$LayoutParams;->setFullSpan(Z)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_3
    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->onCreateHeaderFooterViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/adapter/RecyclerAdapterWrapper;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method protected onHandleWrappedAdapterItemRangeChanged(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemRangeChanged(II)V

    return-void
.end method

.method protected onHandleWrappedAdapterItemRangeInserted(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemRangeInserted(II)V

    return-void
.end method

.method protected onHandleWrappedAdapterItemRangeMoved(III)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result p3

    add-int/2addr p1, p3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result p3

    add-int/2addr p2, p3

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemMoved(II)V

    return-void
.end method

.method protected onHandleWrappedAdapterItemRangeRemoved(II)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemRangeRemoved(II)V

    return-void
.end method

.method public removeFooterView(Landroid/view/View;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->removeFromParentFor(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mFooterViews:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapterItemCount()I

    move-result v0

    add-int/2addr p1, v0

    add-int/2addr p1, v1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemRemoved(I)V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method

.method public removeHeaderView(Landroid/view/View;)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->removeFromParentFor(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->mHeaderViews:Ljava/util/ArrayList;

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->notifyItemRemoved(I)V

    const/4 p1, 0x1

    return p1

    :cond_1
    return v0
.end method
