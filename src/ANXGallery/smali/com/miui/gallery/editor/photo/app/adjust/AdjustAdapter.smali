.class Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "AdjustAdapter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;",
        ">;",
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;"
    }
.end annotation


# instance fields
.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
            ">;"
        }
    .end annotation
.end field

.field private mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

.field private mItemWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;",
            ">;",
            "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDataList:Ljava/util/List;

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    const/4 v0, -0x1

    invoke-direct {p2, v0, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;-><init>(ILcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p2

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p3, 0x7f060338

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    const/high16 p3, 0x40000000    # 2.0f

    mul-float p1, p1, p3

    sub-float/2addr p2, p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->getItemCount()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p2, p1

    float-to-int p1, p2

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mItemWidth:I

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSelection()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;->bind(Lcom/miui/gallery/editor/photo/core/common/model/AdjustData;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0007

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mItemWidth:I

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    new-instance p2, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter$AdjustAdapterItemHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public setSelection(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/adjust/AdjustAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->setSelection(I)V

    return-void
.end method
