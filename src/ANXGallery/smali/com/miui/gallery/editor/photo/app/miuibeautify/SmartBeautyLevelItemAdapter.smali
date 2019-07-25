.class public Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;
.super Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;
.source "SmartBeautyLevelItemAdapter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;,
        Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;",
        ">;",
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;"
    }
.end annotation


# instance fields
.field private mBeautyItemList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;",
            ">;"
        }
    .end annotation
.end field

.field private mContext:Landroid/content/Context;

.field private mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mBeautyItemList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mBeautyItemList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mBeautyItemList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getSelection()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mBeautyItemList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->getNormalResource()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mBeautyItemList:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$LevelItem;->getPressedResource()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;->bind(II)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0036

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter$BeautyLevelItemHolder;-><init>(Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/SimpleRecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public setSelection(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/miuibeautify/SmartBeautyLevelItemAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->setSelection(I)V

    return-void
.end method
