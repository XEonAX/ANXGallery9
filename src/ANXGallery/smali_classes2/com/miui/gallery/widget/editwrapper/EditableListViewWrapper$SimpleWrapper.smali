.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "EditableListViewWrapper.java"

# interfaces
.implements Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState$Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SimpleWrapper"
.end annotation


# instance fields
.field private mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

.field final synthetic this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-void
.end method

.method private bindCheckState(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 2

    iget-object p1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    instance-of v0, p1, Lcom/miui/gallery/ui/Checkable;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/ui/Checkable;

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInChoiceMode()Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/ui/Checkable;->setCheckable(Z)V

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$700(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;

    move-result-object v1

    invoke-virtual {v1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(I)Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->this$0:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-static {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->access$500(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    move-result-object v0

    invoke-virtual {v0, p1, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->resetViewPropertyIfNeed(Landroid/view/View;Landroid/view/View;I)V

    :cond_0
    return-void
.end method

.method private getListHeadersCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    instance-of v0, v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getHeadersCount()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getSourceEncryptPosition(I)I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->getListHeadersCount()I

    move-result v0

    add-int/2addr p1, v0

    return p1
.end method

.method public getSourceItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    instance-of v0, v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->getWrappedAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    return v0
.end method

.method public getSourceItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getWrapped()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    return-object v0
.end method

.method public isHeaderOrFooterPosition(I)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    instance-of v0, v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    :cond_2
    return v1
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->bindCheckState(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->bindCheckState(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V

    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p1

    return p1
.end method

.method public onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method public registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    return-void
.end method

.method public unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$SimpleWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    return-void
.end method
