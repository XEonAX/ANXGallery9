.class public Lcom/miui/gallery/search/SearchActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "SearchActivity.java"


# instance fields
.field mSearchFragment:Lcom/miui/gallery/search/SearchFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/search/SearchFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchFragment;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result v0

    if-nez v0, :cond_0

    const/high16 v0, 0x7f010000

    const v1, 0x7f010001

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/SearchActivity;->overridePendingTransition(II)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "RootFragment"

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/SearchFragment;

    iput-object p1, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    iget-object p1, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/search/SearchFragment;

    invoke-direct {p1}, Lcom/miui/gallery/search/SearchFragment;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    iget-object p1, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    const-string v2, "RootFragment"

    invoke-virtual {p0, p1, v2, v1, v0}, Lcom/miui/gallery/search/SearchActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v2, "usingSpecialAnimation"

    invoke-virtual {p1, v2, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    if-eqz v1, :cond_2

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/SearchFragment;->getSharedElementCallback(Z)Landroid/support/v4/app/SharedElementCallback;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/support/v4/app/ActivityCompat;->setEnterSharedElementCallback(Landroid/app/Activity;Landroid/support/v4/app/SharedElementCallback;)V

    invoke-static {p0}, Landroid/support/v4/app/ActivityCompat;->postponeEnterTransition(Landroid/app/Activity;)V

    :cond_2
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/SearchActivity;->setIntent(Landroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchActivity;->mSearchFragment:Lcom/miui/gallery/search/SearchFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/SearchFragment;->onNewIntent(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method
