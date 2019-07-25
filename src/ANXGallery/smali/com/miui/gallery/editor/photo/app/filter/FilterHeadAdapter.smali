.class Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "FilterHeadAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mCategories:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;",
            ">;"
        }
    .end annotation
.end field

.field protected mLastSelectedItemPosition:I

.field protected mSelectedItemPosition:I


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mLastSelectedItemPosition:I

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mCategories:Ljava/util/List;

    return-void
.end method

.method private setSelected(Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;Z)V
    .locals 0

    iget-object p1, p1, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setSelected(Z)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mCategories:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mCategories:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mCategories:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;->bind(Lcom/miui/gallery/editor/photo/core/common/model/FilterCategory;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    if-ne p2, v0, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->setSelected(Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;Z)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;
    .locals 3

    new-instance p2, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0082

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter$HeaderHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public setSelectedItemPosition(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mLastSelectedItemPosition:I

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mLastSelectedItemPosition:I

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->mSelectedItemPosition:I

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/app/filter/FilterHeadAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
