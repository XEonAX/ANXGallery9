.class public abstract Lcom/miui/gallery/app/BottomMenuDelegateImpl;
.super Ljava/lang/Object;
.source "BottomMenuDelegateImpl.java"

# interfaces
.implements Lcom/miui/gallery/view/menu/MenuBuilder$Callback;
.implements Lcom/miui/gallery/view/menu/MenuPresenter$Callback;


# instance fields
.field private mActionBarWrapper:Lcom/miui/gallery/view/ActionBarWrapper;

.field final mActivity:Landroid/app/Activity;

.field mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

.field protected mIsBottomMenuInstalled:Z

.field protected mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

.field private mShowHideAnimationEnabled:Z


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mShowHideAnimationEnabled:Z

    iput-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActivity:Landroid/app/Activity;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/app/BottomMenuDelegateImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->onShowActionBar()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/app/BottomMenuDelegateImpl;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->onHideActionBar()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/app/BottomMenuDelegateImpl;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->onSetShowHideAnimationEnabled(Z)V

    return-void
.end method

.method private onHideActionBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    iget-boolean v1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mShowHideAnimationEnabled:Z

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/BottomMenu;->hide(Z)V

    :cond_0
    return-void
.end method

.method private onSetShowHideAnimationEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mShowHideAnimationEnabled:Z

    return-void
.end method

.method private onShowActionBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    iget-boolean v1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mShowHideAnimationEnabled:Z

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/BottomMenu;->show(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected createMenu()Lcom/miui/gallery/view/menu/MenuBuilder;
    .locals 2

    new-instance v0, Lcom/miui/gallery/view/menu/MenuBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->getActionBarThemedContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/view/menu/MenuBuilder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/view/menu/MenuBuilder;->setCallback(Lcom/miui/gallery/view/menu/MenuBuilder$Callback;)V

    return-object v0
.end method

.method protected final getActionBarThemedContext()Landroid/content/Context;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {v1}, Landroid/app/Activity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/ActionBar;->getThemedContext()Landroid/content/Context;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getMenuCollapsedHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->getCollapsedHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public onCloseMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActivity:Landroid/app/Activity;

    invoke-virtual {p1}, Landroid/app/Activity;->closeOptionsMenu()V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onMenuModeChange(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->reopenMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V

    return-void
.end method

.method public onOpenSubMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected reopenMenu(Lcom/miui/gallery/view/menu/MenuBuilder;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/BottomMenu;->isOverflowReserved()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu;->isOverflowMenuShowing()Z

    move-result p1

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu;->hideOverflowMenu()Z

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu;->getVisibility()I

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/BottomMenu;->showOverflowMenu()Z

    :cond_2
    :goto_1
    return-void

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/MenuBuilder;->close()V

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/BottomMenu;->setCustomView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method protected setMenu(Lcom/miui/gallery/view/menu/MenuBuilder;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    if-ne p1, v0, :cond_0

    return-void

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mMenu:Lcom/miui/gallery/view/menu/MenuBuilder;

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mIsBottomMenuInstalled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v0, p1, p0}, Lcom/miui/gallery/widget/BottomMenu;->setMenu(Landroid/view/Menu;Lcom/miui/gallery/view/menu/MenuPresenter$Callback;)V

    :cond_1
    return-void
.end method

.method public setVisible(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/BottomMenu;->show(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/BottomMenu;->hide(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected wrapActionBar(Lmiui/app/ActionBar;)Lmiui/app/ActionBar;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActionBarWrapper:Lcom/miui/gallery/view/ActionBarWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActionBarWrapper:Lcom/miui/gallery/view/ActionBarWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/view/ActionBarWrapper;->getWrapped()Lmiui/app/ActionBar;

    move-result-object v0

    if-eq v0, p1, :cond_2

    :cond_1
    new-instance v0, Lcom/miui/gallery/app/BottomMenuDelegateImpl$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/app/BottomMenuDelegateImpl$1;-><init>(Lcom/miui/gallery/app/BottomMenuDelegateImpl;Lmiui/app/ActionBar;)V

    iput-object v0, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActionBarWrapper:Lcom/miui/gallery/view/ActionBarWrapper;

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuDelegateImpl;->mActionBarWrapper:Lcom/miui/gallery/view/ActionBarWrapper;

    return-object p1
.end method
