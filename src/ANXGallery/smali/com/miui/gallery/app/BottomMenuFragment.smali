.class public abstract Lcom/miui/gallery/app/BottomMenuFragment;
.super Lcom/miui/gallery/app/Fragment;
.source "BottomMenuFragment.java"

# interfaces
.implements Lcom/miui/gallery/app/IBottomMenu;


# instance fields
.field private mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

.field private mHasMenu:Z

.field private mMenuVisible:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/app/Fragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    iput-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mMenuVisible:Z

    return-void
.end method


# virtual methods
.method public getActionBar()Lmiui/app/ActionBar;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-super {p0}, Lcom/miui/gallery/app/Fragment;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->wrapActionBar(Lmiui/app/ActionBar;)Lmiui/app/ActionBar;

    move-result-object v0

    return-object v0
.end method

.method public getMenuCollapsedHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->getMenuCollapsedHeight()I

    move-result v0

    return v0
.end method

.method public hideBottomMenu()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setVisible(Z)V

    :cond_0
    return-void
.end method

.method public invalidateOptionsMenu()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/app/Fragment;->invalidateOptionsMenu()V

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->updateOptionsMenu(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mMenuVisible:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->invalidateBottomMenu()V

    :cond_0
    return-void
.end method

.method public isMenuVisible()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mMenuVisible:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isHidden()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x0

    invoke-super {p0, v0}, Lcom/miui/gallery/app/Fragment;->setHasOptionsMenu(Z)V

    invoke-super {p0, v0}, Lcom/miui/gallery/app/Fragment;->setMenuVisibility(Z)V

    new-instance v0, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-direct {v0, p0}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;-><init>(Lmiui/app/Fragment;)V

    iput-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/app/Fragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    return-void
.end method

.method public setHasBottomMenu(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    iget-boolean p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mHasMenu:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isHidden()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {p1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->invalidateBottomMenu()V

    :cond_0
    return-void
.end method

.method public setHasOptionsMenu(Z)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/app/BottomMenuFragment;->setHasBottomMenu(Z)V

    return-void
.end method

.method public setMenuCustomView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setCustomView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setMenuVisibility(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mMenuVisible:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mMenuVisible:Z

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isHidden()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {p1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->invalidateBottomMenu()V

    :cond_0
    return-void
.end method

.method public setThemeRes(I)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/app/Fragment;->setThemeRes(I)V

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setExtraThemeRes(I)V

    return-void
.end method

.method public showBottomMenu()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/app/BottomMenuFragment;->mDelegate:Lcom/miui/gallery/app/BottomMenuFragmentDelegate;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/app/BottomMenuFragmentDelegate;->setVisible(Z)V

    :cond_0
    return-void
.end method
