.class public abstract Lcom/miui/gallery/ui/BaseBottomMenuFragment;
.super Lcom/miui/gallery/app/BottomMenuFragment;
.source "BaseBottomMenuFragment.java"


# instance fields
.field protected mActivity:Lcom/miui/gallery/activity/BaseActivity;

.field protected mUserFirstVisible:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/app/BottomMenuFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mUserFirstVisible:Z

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->getBackStackEntryCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->popBackStack()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :goto_0
    return-void
.end method

.method public abstract getPageName()Ljava/lang/String;
.end method

.method protected getThemeRes()I
    .locals 1

    const v0, 0x7f11009f

    return v0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/app/BottomMenuFragment;->onAttach(Landroid/app/Activity;)V

    check-cast p1, Lcom/miui/gallery/activity/BaseActivity;

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/app/BottomMenuFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->getThemeRes()I

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->setThemeRes(I)V

    :cond_0
    return-void
.end method

.method public onDetach()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->onPause()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->useImageLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->onPagePause()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->recordPageByDefault()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageEnd(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/app/BottomMenuFragment;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->useImageLoader()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->onPageResume()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->recordPageByDefault()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->getPageName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordPageStart(Landroid/app/Activity;Ljava/lang/String;)V

    :cond_1
    return-void
.end method

.method protected onUserFirstVisible()V
    .locals 0

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/app/BottomMenuFragment;->setUserVisibleHint(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mUserFirstVisible:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->onUserFirstVisible()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BaseBottomMenuFragment;->mUserFirstVisible:Z

    :cond_0
    return-void
.end method

.method protected useImageLoader()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
