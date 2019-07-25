.class public abstract Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "BaseAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;,
        Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field protected mContext:Landroid/content/Context;

.field private mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

.field protected mLastSelectedItemPosition:I

.field protected mList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected mSelectedItemPosition:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mLastSelectedItemPosition:I

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mContext:Landroid/content/Context;

    return-void
.end method

.method private setSelected(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;Z)V
    .locals 1

    iget-object v0, p1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p2}, Landroid/view/View;->setSelected(Z)V

    iget-object p1, p1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->mSelected:Landroid/view/View;

    if-eqz p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    const/4 p2, 0x4

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method protected abstract getHolder(Landroid/view/View;)Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItemData(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getLayoutId()I
.end method

.method public getList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    return-object v0
.end method

.method public getSelectedItemPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->onBindViewHolder(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;I)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->onBindViewHolder(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;ILjava/util/List;)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;I)V
    .locals 1

    iget-object v0, p1, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setSelected(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;Z)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->bindView(I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    if-eqz p3, :cond_1

    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setSelected(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;Z)V

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->bindView(ILjava/lang/Object;)V

    goto :goto_1

    :cond_1
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V

    :goto_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f09018a

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;->getAdapterPosition()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    if-eq v2, v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    const/4 v3, 0x1

    invoke-interface {v2, p1, v0, v1, v3}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;->onItemSelect(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;IZ)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->setSelectedItemPosition(I)V

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    const/4 v3, 0x0

    invoke-interface {v2, p1, v0, v1, v3}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;->onItemSelect(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;IZ)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;
    .locals 2

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->getLayoutId()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->getHolder(Landroid/view/View;)Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$BaseHolder;

    move-result-object p1

    return-object p1
.end method

.method public setItemSelectChangeListener(Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/movie/ui/adapter/BaseAdapter$ItemSelectChangeListener;

    return-void
.end method

.method public setList(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mList:Ljava/util/List;

    return-void
.end method

.method public setSelectedItemPosition(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    iput v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mLastSelectedItemPosition:I

    iput p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    iget p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mLastSelectedItemPosition:I

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    iget p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public setSelectedItemPositionWithoutNotify(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    iput v0, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mLastSelectedItemPosition:I

    iput p1, p0, Lcom/miui/gallery/movie/ui/adapter/BaseAdapter;->mSelectedItemPosition:I

    return-void
.end method
