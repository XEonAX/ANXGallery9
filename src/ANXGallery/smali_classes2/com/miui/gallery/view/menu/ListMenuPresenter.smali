.class public Lcom/miui/gallery/view/menu/ListMenuPresenter;
.super Ljava/lang/Object;
.source "ListMenuPresenter.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/miui/gallery/view/menu/MenuPresenter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;
    }
.end annotation


# instance fields
.field mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

.field private mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

.field mContext:Landroid/content/Context;

.field mInflater:Landroid/view/LayoutInflater;

.field private mItemIndexOffset:I

.field mItemLayoutRes:I

.field mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field mMenuLayout:I

.field mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

.field mThemeRes:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    const v0, 0x7f0b0075

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/view/menu/ListMenuPresenter;-><init>(III)V

    return-void
.end method

.method public constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mItemLayoutRes:I

    iput p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuLayout:I

    iput p3, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mThemeRes:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p2, p3, v0}, Lcom/miui/gallery/view/menu/ListMenuPresenter;-><init>(III)V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/view/menu/ListMenuPresenter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mItemIndexOffset:I

    return p0
.end method


# virtual methods
.method public collapseItemActionView(Lcom/miui/gallery/view/menu/MenuBuilder;Lcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
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

.method public getAdapter()Landroid/widget/ListAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-direct {v0, p0}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;-><init>(Lcom/miui/gallery/view/menu/ListMenuPresenter;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    return-object v0
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-direct {v0, p0}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;-><init>(Lcom/miui/gallery/view/menu/ListMenuPresenter;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuLayout:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/view/menu/ExpandedMenuView;

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ExpandedMenuView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/view/menu/ExpandedMenuView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/ExpandedMenuView;

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public initForMenu(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mThemeRes:I

    if-eqz v0, :cond_0

    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget v1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mThemeRes:I

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    if-eqz v0, :cond_1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mInflater:Landroid/view/LayoutInflater;

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/view/menu/MenuBuilder;->removeMenuPresenter(Lcom/miui/gallery/view/menu/MenuPresenter;)V

    :cond_2
    iput-object p2, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method

.method public onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/view/menu/MenuPresenter$Callback;->onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V

    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object p2, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;->getItem(I)Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/view/menu/MenuBuilder;->performItemAction(Landroid/view/MenuItem;I)Z

    return-void
.end method

.method public onSubMenuSelected(Lcom/miui/gallery/view/menu/SubMenuBuilder;)Z
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    new-instance v0, Lcom/miui/gallery/view/menu/MenuDialogHelper;

    invoke-direct {v0, p1}, Lcom/miui/gallery/view/menu/MenuDialogHelper;-><init>(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/MenuDialogHelper;->show(Landroid/os/IBinder;)V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    invoke-interface {v0, p1}, Lcom/miui/gallery/view/menu/MenuPresenter$Callback;->onOpenSubMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)Z

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public setCallback(Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mCallback:Lcom/miui/gallery/view/menu/MenuPresenter$Callback;

    return-void
.end method

.method public updateMenuView(Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ListMenuPresenter;->mAdapter:Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ListMenuPresenter$MenuAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
