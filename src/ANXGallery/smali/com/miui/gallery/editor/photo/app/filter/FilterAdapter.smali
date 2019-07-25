.class Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "FilterAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mEditMode:Z

.field private mEffects:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterData;",
            ">;"
        }
    .end annotation
.end field

.field private mHighlightColor:I

.field private mSelectedIndex:I

.field private mSubHighlightColor:I

.field private mSubItemSize:I


# direct methods
.method constructor <init>(Ljava/util/List;III)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterData;",
            ">;III)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mHighlightColor:I

    iput p3, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSubHighlightColor:I

    iput p4, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSubItemSize:I

    return-void
.end method


# virtual methods
.method clearSelected()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    iput v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method

.method enterEditMode()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method exitEditMode()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    return-void
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemData(I)Lcom/miui/gallery/editor/photo/core/common/model/FilterData;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method getValue()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    return v0
.end method

.method isInEditMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;I)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->bindData(Lcom/miui/gallery/editor/photo/core/common/model/FilterData;)V

    iget-boolean v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->setState(ZZ)V

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSubItemSize:I

    if-lez v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->getItemCount()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSubItemSize:I

    sub-int/2addr v1, v2

    if-lt p2, v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSubHighlightColor:I

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->setForegroundColor(I)V

    goto :goto_1

    :cond_1
    iget v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mHighlightColor:I

    invoke-virtual {p1, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->setForegroundColor(I)V

    :goto_1
    if-eqz v0, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->isNone()Z

    move-result p2

    if-nez p2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->getValue()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;->updateIndicator(I)V

    :cond_2
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;
    .locals 3

    new-instance p2, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0084

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterMenuItem;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method setSelectedIndex(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    const/4 p1, -0x1

    if-eq v0, p1, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    :cond_1
    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    if-eq v0, p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    :cond_2
    return-void
.end method

.method update(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEditMode:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mEffects:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;

    iput p1, v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterData;->progress:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->mSelectedIndex:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterAdapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method
