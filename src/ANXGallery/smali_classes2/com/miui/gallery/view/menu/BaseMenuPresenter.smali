.class public abstract Lcom/miui/gallery/view/menu/BaseMenuPresenter;
.super Ljava/lang/Object;
.source "BaseMenuPresenter.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/MenuPresenter;


# instance fields
.field private mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

.field protected mContext:Landroid/content/Context;

.field private mId:I

.field protected mInflater:Landroid/view/LayoutInflater;

.field private mItemLayoutRes:I

.field protected mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field private mMenuLayoutRes:I

.field protected mMenuView:Lcom/miui/gallery/view/menu/MenuView;

.field protected mSystemContext:Landroid/content/Context;

.field protected mSystemInflater:Landroid/view/LayoutInflater;


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    iput p2, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuLayoutRes:I

    iput p3, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mItemLayoutRes:I

    return-void
.end method


# virtual methods
.method protected addItemView(Landroid/view/View;I)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public abstract bindItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Lcom/miui/gallery/view/menu/MenuView$ItemView;)V
.end method

.method public collapseItemActionView(Lcom/miui/gallery/view/menu/MenuBuilder;Lcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public createItemView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView$ItemView;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mItemLayoutRes:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    return-object p1
.end method

.method public expandItemActionView(Lcom/miui/gallery/view/menu/MenuBuilder;Lcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public flagActionItems()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    instance-of v0, p2, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    if-eqz v0, :cond_0

    check-cast p2, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p3}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->createItemView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView$ItemView;

    move-result-object p2

    :goto_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->bindItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Lcom/miui/gallery/view/menu/MenuView$ItemView;)V

    check-cast p2, Landroid/view/View;

    return-object p2
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mSystemInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuLayoutRes:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/view/menu/MenuView;

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-interface {p1, v0}, Lcom/miui/gallery/view/menu/MenuView;->initialize(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->updateMenuView(Z)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    return-object p1
.end method

.method public initForMenu(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    iput-object p2, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    return-void
.end method

.method public onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/view/menu/MenuPresenter$Callback;->onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V

    :cond_0
    return-void
.end method

.method public onSubMenuSelected(Lcom/miui/gallery/view/menu/SubMenuBuilder;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1}, Lcom/miui/gallery/view/menu/MenuPresenter$Callback;->onOpenSubMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public setCallback(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    return-void
.end method

.method public setId(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mId:I

    return-void
.end method

.method public shouldIncludeItem(ILcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public updateMenuView(Z)V
    .locals 6

    iget-object p1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Landroid/view/ViewGroup;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    invoke-interface {v0}, Lcom/miui/gallery/view/menu/MenuView;->hasBackgroundView()Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/MenuBuilder;->flagActionItems()V

    iget-object v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/view/menu/MenuItemImpl;

    invoke-virtual {p0, v0, v2}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->shouldIncludeItem(ILcom/miui/gallery/view/menu/MenuItemImpl;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    instance-of v4, v3, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    if-eqz v4, :cond_2

    move-object v4, v3

    check-cast v4, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    invoke-interface {v4}, Lcom/miui/gallery/view/menu/MenuView$ItemView;->getItemData()Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object v4

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    :goto_1
    invoke-virtual {p0, v2, v3, p1}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->getItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    if-eq v2, v4, :cond_3

    const/4 v2, 0x0

    invoke-virtual {v5, v2}, Landroid/view/View;->setPressed(Z)V

    :cond_3
    if-eq v5, v3, :cond_4

    invoke-virtual {p0, v5, v0}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->addItemView(Landroid/view/View;I)V

    :cond_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    invoke-interface {v1, v0}, Lcom/miui/gallery/view/menu/MenuView;->filterLeftoverView(I)Z

    move-result v1

    if-nez v1, :cond_5

    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    :cond_6
    return-void
.end method
