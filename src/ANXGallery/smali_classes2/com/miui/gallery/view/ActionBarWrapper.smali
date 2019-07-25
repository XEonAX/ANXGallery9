.class public Lcom/miui/gallery/view/ActionBarWrapper;
.super Lmiui/app/ActionBar;
.source "ActionBarWrapper.java"


# instance fields
.field protected mWrapped:Lmiui/app/ActionBar;


# direct methods
.method public constructor <init>(Lmiui/app/ActionBar;)V
    .locals 0

    invoke-direct {p0}, Lmiui/app/ActionBar;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    return-void
.end method


# virtual methods
.method public addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;ILjava/lang/Class;Landroid/os/Bundle;Z)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/ActionBar$Tab;",
            "I",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lmiui/app/ActionBar;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;ILjava/lang/Class;Landroid/os/Bundle;Z)I

    move-result p1

    return p1
.end method

.method public addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Landroid/app/ActionBar$Tab;",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Fragment;",
            ">;",
            "Landroid/os/Bundle;",
            "Z)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lmiui/app/ActionBar;->addFragmentTab(Ljava/lang/String;Landroid/app/ActionBar$Tab;Ljava/lang/Class;Landroid/os/Bundle;Z)I

    move-result p1

    return p1
.end method

.method public addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->addOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    return-void
.end method

.method public addOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->addOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V

    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;)V

    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;I)V

    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2, p3}, Lmiui/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;IZ)V

    return-void
.end method

.method public addTab(Landroid/app/ActionBar$Tab;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->addTab(Landroid/app/ActionBar$Tab;Z)V

    return-void
.end method

.method public getCustomView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getCustomView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getDisplayOptions()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getDisplayOptions()I

    move-result v0

    return v0
.end method

.method public getFragmentAt(I)Landroid/app/Fragment;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->getFragmentAt(I)Landroid/app/Fragment;

    move-result-object p1

    return-object p1
.end method

.method public getFragmentTabCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getFragmentTabCount()I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getHeight()I

    move-result v0

    return v0
.end method

.method public getNavigationItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getNavigationItemCount()I

    move-result v0

    return v0
.end method

.method public getNavigationMode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getNavigationMode()I

    move-result v0

    return v0
.end method

.method public getSelectedNavigationIndex()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getSelectedNavigationIndex()I

    move-result v0

    return v0
.end method

.method public getSelectedTab()Landroid/app/ActionBar$Tab;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getSelectedTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public getSubtitle()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getTabAt(I)Landroid/app/ActionBar$Tab;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->getTabAt(I)Landroid/app/ActionBar$Tab;

    move-result-object p1

    return-object p1
.end method

.method public getTabCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getTabCount()I

    move-result v0

    return v0
.end method

.method public getTitle()Ljava/lang/CharSequence;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public getViewPagerOffscreenPageLimit()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->getViewPagerOffscreenPageLimit()I

    move-result v0

    return v0
.end method

.method public getWrapped()Lmiui/app/ActionBar;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    return-object v0
.end method

.method public hide()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->hide()V

    return-void
.end method

.method public isFragmentViewPagerMode()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->isFragmentViewPagerMode()Z

    move-result v0

    return v0
.end method

.method public isShowing()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->isShowing()Z

    move-result v0

    return v0
.end method

.method public newTab()Landroid/app/ActionBar$Tab;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->newTab()Landroid/app/ActionBar$Tab;

    move-result-object v0

    return-object v0
.end method

.method public removeAllFragmentTab()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->removeAllFragmentTab()V

    return-void
.end method

.method public removeAllTabs()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->removeAllTabs()V

    return-void
.end method

.method public removeFragmentTab(Landroid/app/ActionBar$Tab;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeFragmentTab(Landroid/app/ActionBar$Tab;)V

    return-void
.end method

.method public removeFragmentTab(Landroid/app/Fragment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeFragmentTab(Landroid/app/Fragment;)V

    return-void
.end method

.method public removeFragmentTab(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeFragmentTab(Ljava/lang/String;)V

    return-void
.end method

.method public removeFragmentTabAt(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeFragmentTabAt(I)V

    return-void
.end method

.method public removeOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeOnFragmentViewPagerChangeListener(Lmiui/app/ActionBar$FragmentViewPagerChangeListener;)V

    return-void
.end method

.method public removeOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeOnMenuVisibilityListener(Landroid/app/ActionBar$OnMenuVisibilityListener;)V

    return-void
.end method

.method public removeTab(Landroid/app/ActionBar$Tab;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeTab(Landroid/app/ActionBar$Tab;)V

    return-void
.end method

.method public removeTabAt(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->removeTabAt(I)V

    return-void
.end method

.method public selectTab(Landroid/app/ActionBar$Tab;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->selectTab(Landroid/app/ActionBar$Tab;)V

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setCustomView(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setCustomView(I)V

    return-void
.end method

.method public setCustomView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;)V

    return-void
.end method

.method public setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    return-void
.end method

.method public setDisplayHomeAsUpEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    return-void
.end method

.method public setDisplayOptions(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayOptions(I)V

    return-void
.end method

.method public setDisplayOptions(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setDisplayOptions(II)V

    return-void
.end method

.method public setDisplayShowCustomEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    return-void
.end method

.method public setDisplayShowHomeEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayShowHomeEnabled(Z)V

    return-void
.end method

.method public setDisplayShowTitleEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    return-void
.end method

.method public setDisplayUseLogoEnabled(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setDisplayUseLogoEnabled(Z)V

    return-void
.end method

.method public setEndView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setEndView(Landroid/view/View;)V

    return-void
.end method

.method public setFragmentActionMenuAt(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setFragmentActionMenuAt(IZ)V

    return-void
.end method

.method public setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;)V

    return-void
.end method

.method public setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2, p3}, Lmiui/app/ActionBar;->setFragmentViewPagerMode(Landroid/content/Context;Landroid/app/FragmentManager;Z)V

    return-void
.end method

.method public setIcon(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setIcon(I)V

    return-void
.end method

.method public setIcon(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setIcon(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setListNavigationCallbacks(Landroid/widget/SpinnerAdapter;Landroid/app/ActionBar$OnNavigationListener;)V

    return-void
.end method

.method public setLogo(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setLogo(I)V

    return-void
.end method

.method public setLogo(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setLogo(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setNavigationMode(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setNavigationMode(I)V

    return-void
.end method

.method public setProgress(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setProgress(I)V

    return-void
.end method

.method public setProgressBarIndeterminate(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setProgressBarIndeterminate(Z)V

    return-void
.end method

.method public setProgressBarIndeterminateVisibility(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setProgressBarIndeterminateVisibility(Z)V

    return-void
.end method

.method public setProgressBarVisibility(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setProgressBarVisibility(Z)V

    return-void
.end method

.method public setSelectedNavigationItem(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setSelectedNavigationItem(I)V

    return-void
.end method

.method public setShowHideAnimationEnabled(Z)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    const-string v1, "setShowHideAnimationEnabled"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v2, v5

    invoke-static {v0, v1, v3, v2}, Lcom/miui/gallery/util/MiscUtil;->invokeSafely(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public setStartView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setStartView(Landroid/view/View;)V

    return-void
.end method

.method public setSubtitle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setSubtitle(I)V

    return-void
.end method

.method public setSubtitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setSubtitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTabBadgeVisibility(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->setTabBadgeVisibility(IZ)V

    return-void
.end method

.method public setTabsMode(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setTabsMode(Z)V

    return-void
.end method

.method public setTitle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setTitle(I)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setViewPagerDecor(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setViewPagerDecor(Landroid/view/View;)V

    return-void
.end method

.method public setViewPagerOffscreenPageLimit(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->setViewPagerOffscreenPageLimit(I)V

    return-void
.end method

.method public show()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0}, Lmiui/app/ActionBar;->show()V

    return-void
.end method

.method public showActionBarShadow(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1}, Lmiui/app/ActionBar;->showActionBarShadow(Z)V

    return-void
.end method

.method public showSplitActionBar(ZZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/view/ActionBarWrapper;->mWrapped:Lmiui/app/ActionBar;

    invoke-virtual {v0, p1, p2}, Lmiui/app/ActionBar;->showSplitActionBar(ZZ)V

    return-void
.end method
