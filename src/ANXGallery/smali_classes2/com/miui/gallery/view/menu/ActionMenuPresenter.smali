.class public Lcom/miui/gallery/view/menu/ActionMenuPresenter;
.super Lcom/miui/gallery/view/menu/BaseMenuPresenter;
.source "ActionMenuPresenter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;,
        Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;
    }
.end annotation


# instance fields
.field private final mActionButtonGroups:Landroid/util/SparseBooleanArray;

.field private mActionButtonPopup:Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

.field private mActionItemWidthLimit:I

.field private mExpandedActionViewsExclusive:Z

.field private mListItemLayoutRes:I

.field private mListLayoutRes:I

.field private mListOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

.field private mMaxItems:I

.field private mMaxItemsSet:Z

.field mOpenSubMenuId:I

.field private mOverflowButton:Landroid/view/View;

.field private mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

.field private mOverflowMenuAttrs:I

.field private mOverflowMenuItem:Lcom/miui/gallery/view/menu/MenuItemImpl;

.field final mPopupPresenterCallback:Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;

.field private mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

.field private mReserveOverflow:Z

.field private mReserveOverflowSet:Z

.field private mScrapActionButtonView:Landroid/view/View;

.field private mStrictWidthLimit:Z

.field private mWidthLimit:I

.field private mWidthLimitSet:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;IIII)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;-><init>(Landroid/content/Context;II)V

    const p1, 0x10102f6

    iput p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenuAttrs:I

    new-instance p1, Landroid/util/SparseBooleanArray;

    invoke-direct {p1}, Landroid/util/SparseBooleanArray;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mActionButtonGroups:Landroid/util/SparseBooleanArray;

    new-instance p1, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$1;)V

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPopupPresenterCallback:Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupPresenterCallback;

    iput p4, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListLayoutRes:I

    iput p5, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListItemLayoutRes:I

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenuAttrs:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Lcom/miui/gallery/view/menu/MenuItemImpl;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->getOverflowMenuItem()Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListLayoutRes:I

    return p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListItemLayoutRes:I

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;)Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    return-object p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$802(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;)Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mActionButtonPopup:Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    return-object p1
.end method

.method static synthetic access$902(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;)Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    return-object p1
.end method

.method private findViewForItem(Landroid/view/MenuItem;)Landroid/view/View;
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    instance-of v5, v4, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    if-eqz v5, :cond_1

    move-object v5, v4

    check-cast v5, Lcom/miui/gallery/view/menu/MenuView$ItemView;

    invoke-interface {v5}, Lcom/miui/gallery/view/menu/MenuView$ItemView;->getItemData()Lcom/miui/gallery/view/menu/MenuItemImpl;

    move-result-object v5

    if-ne v5, p1, :cond_1

    return-object v4

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v1
.end method

.method private getOverflowMenu()Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;
    .locals 7

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isTablet()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;

    iget-object v3, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-object v5, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    const/4 v6, 0x1

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$PopupOverflowMenu;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;Landroid/view/View;Z)V

    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ListOverflowMenu;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$1;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mListOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    return-object v0
.end method

.method private getOverflowMenuItem()Lcom/miui/gallery/view/menu/MenuItemImpl;
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenuItem:Lcom/miui/gallery/view/menu/MenuItemImpl;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/view/menu/MenuItemImpl;

    iget-object v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    const/4 v3, 0x0

    const v4, 0x7f0901e0

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mContext:Landroid/content/Context;

    const v7, 0x7f100477

    invoke-virtual {v1, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    move-object v1, v0

    invoke-direct/range {v1 .. v8}, Lcom/miui/gallery/view/menu/MenuItemImpl;-><init>(Lcom/miui/gallery/view/menu/MenuBuilder;IIIILjava/lang/CharSequence;I)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenuItem:Lcom/miui/gallery/view/menu/MenuItemImpl;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenuItem:Lcom/miui/gallery/view/menu/MenuItemImpl;

    return-object v0
.end method


# virtual methods
.method public bindItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Lcom/miui/gallery/view/menu/MenuView$ItemView;)V
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p2, p1, v0}, Lcom/miui/gallery/view/menu/MenuView$ItemView;->initialize(Lcom/miui/gallery/view/menu/MenuItemImpl;I)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;

    invoke-interface {p2, p1}, Lcom/miui/gallery/view/menu/MenuView$ItemView;->setItemInvoker(Lcom/miui/gallery/view/menu/MenuBuilder$ItemInvoker;)V

    return-void
.end method

.method protected createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;
    .locals 1

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenuButton;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Landroid/content/Context;)V

    return-object v0
.end method

.method public dismissPopupMenus(Z)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    move-result p1

    return p1
.end method

.method public flagActionItems()Z
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/MenuBuilder;->getVisibleItems()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMaxItems:I

    const/4 v3, 0x1

    if-ge v2, v1, :cond_0

    iget v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMaxItems:I

    sub-int/2addr v2, v3

    goto :goto_0

    :cond_0
    iget v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMaxItems:I

    :goto_0
    const/4 v4, 0x0

    move v5, v2

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_4

    if-lez v5, :cond_4

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/view/menu/MenuItemImpl;

    invoke-virtual {v6}, Lcom/miui/gallery/view/menu/MenuItemImpl;->requestsActionButton()Z

    move-result v7

    if-nez v7, :cond_2

    invoke-virtual {v6}, Lcom/miui/gallery/view/menu/MenuItemImpl;->requiresActionButton()Z

    move-result v7

    if-eqz v7, :cond_1

    goto :goto_2

    :cond_1
    const/4 v7, 0x0

    goto :goto_3

    :cond_2
    :goto_2
    const/4 v7, 0x1

    :goto_3
    invoke-virtual {v6, v7}, Lcom/miui/gallery/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    if-eqz v7, :cond_3

    add-int/lit8 v5, v5, -0x1

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    :goto_4
    if-ge v2, v1, :cond_5

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/view/menu/MenuItemImpl;

    invoke-virtual {v5, v4}, Lcom/miui/gallery/view/menu/MenuItemImpl;->setIsActionButton(Z)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_5
    return v3
.end method

.method public getItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->getActionView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->hasCollapsibleActionView()Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    instance-of v0, p2, Lcom/miui/gallery/view/menu/ActionMenuItemView;

    if-nez v0, :cond_1

    const/4 p2, 0x0

    :cond_1
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->getItemView(Lcom/miui/gallery/view/menu/MenuItemImpl;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result p1

    if-eqz p1, :cond_3

    const/16 p1, 0x8

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    check-cast p3, Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    invoke-virtual {p3, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z

    move-result p2

    if-nez p2, :cond_4

    invoke-virtual {p3, p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_4
    return-object v0
.end method

.method public getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->getMenuView(Landroid/view/ViewGroup;)Lcom/miui/gallery/view/menu/MenuView;

    move-result-object p1

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/view/menu/ActionMenuView;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/view/menu/ActionMenuView;->setPresenter(Lcom/miui/gallery/view/menu/ActionMenuPresenter;)V

    return-object p1
.end method

.method public hideOverflowMenu(Z)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1, v1}, Landroid/view/View;->setSelected(Z)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    const/4 p1, 0x1

    return p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setSelected(Z)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v1, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;->dismiss(Z)V

    return v0

    :cond_2
    return v1
.end method

.method public initForMenu(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->initForMenu(Landroid/content/Context;Lcom/miui/gallery/view/menu/MenuBuilder;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    invoke-static {p1}, Lcom/miui/gallery/view/ActionBarPolicy;->get(Landroid/content/Context;)Lcom/miui/gallery/view/ActionBarPolicy;

    move-result-object p1

    iget-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflowSet:Z

    if-nez p2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/view/ActionBarPolicy;->showsOverflowMenuButton()Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    :cond_0
    iget-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mWidthLimitSet:Z

    if-nez p2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/view/ActionBarPolicy;->getEmbeddedMenuWidthLimit()I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mWidthLimit:I

    :cond_1
    iget-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMaxItemsSet:Z

    if-nez p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/view/ActionBarPolicy;->getMaxActionButtons()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMaxItems:I

    :cond_2
    iget p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mWidthLimit:I

    iget-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    const/4 v0, 0x0

    if-eqz p2, :cond_4

    iget-object p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    const/4 p2, 0x0

    invoke-static {p2, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    iget-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {v1, p2, p2}, Landroid/view/View;->measure(II)V

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    move-result p2

    sub-int/2addr p1, p2

    goto :goto_0

    :cond_4
    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    :goto_0
    iput p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mActionItemWidthLimit:I

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mScrapActionButtonView:Landroid/view/View;

    return-void
.end method

.method public isOverflowMenuShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowMenu:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    invoke-interface {v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isOverflowReserved()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    return v0
.end method

.method public onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->dismissPopupMenus(Z)Z

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V

    return-void
.end method

.method public onSubMenuSelected(Lcom/miui/gallery/view/menu/SubMenuBuilder;)Z
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->hasVisibleItems()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    move-object v0, p1

    :goto_0
    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eq v2, v3, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->getParentMenu()Landroid/view/Menu;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/view/menu/SubMenuBuilder;

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->findViewForItem(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    if-nez v0, :cond_2

    return v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/SubMenuBuilder;->getItem()Landroid/view/MenuItem;

    move-result-object v0

    invoke-interface {v0}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOpenSubMenuId:I

    new-instance v0, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/SubMenuBuilder;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mActionButtonPopup:Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mActionButtonPopup:Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$ActionButtonSubMenu;->show(Landroid/os/IBinder;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->onSubMenuSelected(Lcom/miui/gallery/view/menu/SubMenuBuilder;)Z

    const/4 p1, 0x1

    return p1
.end method

.method public setExpandedActionViewsExclusive(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mExpandedActionViewsExclusive:Z

    return-void
.end method

.method public setWidthLimit(IZ)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mWidthLimit:I

    iput-boolean p2, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mStrictWidthLimit:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mWidthLimitSet:Z

    return-void
.end method

.method public shouldIncludeItem(ILcom/miui/gallery/view/menu/MenuItemImpl;)Z
    .locals 0

    invoke-virtual {p2}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isActionButton()Z

    move-result p1

    return p1
.end method

.method public showOverflowMenu()Z
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->isOverflowMenuShowing()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->getOverflowMenu()Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;-><init>(Lcom/miui/gallery/view/menu/ActionMenuPresenter;Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;)V

    iput-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast v0, Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mPostedOpenRunnable:Lcom/miui/gallery/view/menu/ActionMenuPresenter$OpenOverflowRunnable;

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->onSubMenuSelected(Lcom/miui/gallery/view/menu/SubMenuBuilder;)Z

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    return v1

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public updateMenuView(Z)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/view/menu/BaseMenuPresenter;->updateMenuView(Z)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuBuilder;->getNonActionItems()Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    if-eqz p1, :cond_3

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_2

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/view/menu/MenuItemImpl;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuItemImpl;->isActionViewExpanded()Z

    move-result p1

    xor-int/lit8 v1, p1, 0x1

    goto :goto_1

    :cond_2
    if-lez v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    :goto_1
    if-eqz v1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    if-nez p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mSystemContext:Landroid/content/Context;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->createOverflowMenuButton(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    goto :goto_2

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setTranslationY(F)V

    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-eq p1, v0, :cond_7

    if-eqz p1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Lcom/miui/gallery/view/menu/ActionMenuView;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->generateOverflowButtonLayoutParams()Lcom/miui/gallery/view/menu/ActionMenuView$LayoutParams;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/view/menu/ActionMenuView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_3

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    if-ne p1, v0, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mOverflowButton:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_7
    :goto_3
    iget-object p1, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenuView:Lcom/miui/gallery/view/menu/MenuView;

    check-cast p1, Lcom/miui/gallery/view/menu/ActionMenuView;

    iget-boolean v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mReserveOverflow:Z

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuView;->setOverflowReserved(Z)V

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isTablet()Z

    move-result p1

    if-nez p1, :cond_8

    invoke-direct {p0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->getOverflowMenu()Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-interface {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter$OverflowMenu;->update(Lcom/miui/gallery/view/menu/MenuBuilder;)V

    :cond_8
    return-void
.end method
