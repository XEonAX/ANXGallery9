.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;
.super Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;
.source "ScreenNavAdapter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter<",
        "Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;",
        ">;",
        "Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable;"
    }
.end annotation


# instance fields
.field private mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

.field private mItemWidth:I

.field private mScreenNavigatorData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;",
            ">;"
        }
    .end annotation
.end field

.field private mStartMargin:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mScreenNavigatorData:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->getItemCount()I

    move-result p2

    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0603fb

    :goto_0
    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    goto :goto_1

    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0603fa

    goto :goto_0

    :goto_1
    float-to-int p2, p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mStartMargin:I

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mStartMargin:I

    mul-int/lit8 v0, v0, 0x2

    sub-int/2addr p2, v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->getItemCount()I

    move-result v0

    div-int/2addr p2, v0

    iput p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mItemWidth:I

    new-instance p2, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    const/4 v0, -0x1

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v2, 0x7f0500f8

    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    invoke-direct {v1, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;-><init>(I)V

    invoke-direct {p2, v0, v1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;-><init>(ILcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Selector;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mScreenNavigatorData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getSelection()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    return v0
.end method

.method public getStartMargin()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mStartMargin:I

    return v0
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->onBindViewHolder(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;I)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    if-ne v0, p2, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mScreenNavigatorData:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;->bind(ZLcom/miui/gallery/editor/photo/screen/entity/ScreenNavigatorData;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->getInflater()Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0132

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p2

    iget v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mItemWidth:I

    iput v0, p2, Landroid/view/ViewGroup$LayoutParams;->width:I

    new-instance p2, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;

    invoke-direct {p2, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter$ScreenNavigatorHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public setSelection(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->getSelection()I

    move-result v0

    if-eq v0, p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->mDelegator:Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/Selectable$Delegator;->setSelection(I)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->notifyItemChanged(I)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenNavAdapter;->notifyItemChanged(I)V

    :cond_0
    return-void
.end method
