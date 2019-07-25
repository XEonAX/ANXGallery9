.class public Lcom/miui/gallery/activity/InternalPhotoPageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "InternalPhotoPageActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method

.method private repackageExtras()V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    const-string v1, "photo_data"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/net/Uri;

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    invoke-virtual {v2, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_0
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->overridePendingTransition(II)V

    return-void
.end method

.method protected getFragmentContainerId()I
    .locals 1

    const v0, 0x1020002

    return v0
.end method

.method public getRuntimePermissions()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onActivityReenter(ILandroid/content/Intent;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageFragment;->onActivityReenter(ILandroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/activity/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoPageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "PhotoPageFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/ui/PhotoPageFragment;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->isVisible()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->restoreInstance(Landroid/os/Bundle;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->repackageExtras()V

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p1, "InternalPhotoPageActivity"

    const-string v0, "uri shouldn\'t be null"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->finish()V

    return-void

    :cond_1
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const/4 v2, 0x1

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/ui/PhotoPageFragment;->newInstance(Landroid/net/Uri;Ljava/lang/String;Landroid/os/Bundle;I)Lcom/miui/gallery/ui/PhotoPageFragment;

    move-result-object p1

    const-string v0, "PhotoPageFragment"

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/miui/gallery/activity/InternalPhotoPageActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onDestroy()V

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->clear()V

    return-void
.end method

.method protected onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onPause()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->pause()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->resume()V

    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->getInstance()Lcom/miui/gallery/util/photoview/PhotoPageDataCache;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/photoview/PhotoPageDataCache;->saveInstance(Landroid/os/Bundle;)V

    return-void
.end method
