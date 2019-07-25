.class public abstract Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "SingleChoiceRecyclerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SingleChoiceRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "SingleChoiceRecyclerViewAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;,
        Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<SCVH:",
        "Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "TSCVH;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private lastSelectedItemPosition:I

.field private mItemSelectChangeListener:Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;

.field private selectedItemPosition:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->lastSelectedItemPosition:I

    return-void
.end method


# virtual methods
.method public clearLastSelectedPostion()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->lastSelectedItemPosition:I

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method

.method public getSelectedItemPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    return v0
.end method

.method public abstract onBindView(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSCVH;I)V"
        }
    .end annotation
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->onBindViewHolder(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TSCVH;I)V"
        }
    .end annotation

    iget v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;->setSelect(Z)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;->setItemPosition(I)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->onBindView(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;I)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2

    sget v0, Lcom/miui/gallery/baseui/R$id;->editor_viewHolder:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;->getItemPosition()I

    move-result p1

    iget v0, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    if-eq v0, p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    iget v1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    iput v1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->lastSelectedItemPosition:I

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;

    invoke-interface {v1, p0, p1, v0}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;->onItemSelect(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;IZ)Z

    :cond_2
    return-void
.end method

.method public abstract onCreateSingleChoiceViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TSCVH;"
        }
    .end annotation
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TSCVH;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->onCreateSingleChoiceViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;

    move-result-object p1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$SingleChoiceViewHolder;->setItemViewOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public setItemSelectChangeListener(Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->mItemSelectChangeListener:Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter$ItemSelectChangeListener;

    return-void
.end method

.method public setSelectedItemPosition(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->selectedItemPosition:I

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/ui/SingleChoiceRecyclerView$SingleChoiceRecyclerViewAdapter;->notifyItemChanged(ILjava/lang/Object;)V

    return-void
.end method
