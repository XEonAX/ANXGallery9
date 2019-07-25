.class public abstract Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "SimpleRecyclerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "Adapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "TVH;>;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private mInflater:Landroid/view/LayoutInflater;

.field private mOnItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method


# virtual methods
.method protected final getInflater()Landroid/view/LayoutInflater;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mInflater:Landroid/view/LayoutInflater;

    return-object v0
.end method

.method public getItemCount()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation

    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mOnItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mOnItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v1, p1, v2}, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;->OnItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;I)Z

    :cond_0
    return-void
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method public setOnItemClickListener(Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$Adapter;->mOnItemClickListener:Lcom/miui/gallery/video/editor/ui/SimpleRecyclerView$OnItemClickListener;

    return-void
.end method
