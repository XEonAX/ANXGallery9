.class public abstract Lcom/miui/gallery/ui/BaseMediaFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "BaseMediaFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;
    }
.end annotation


# instance fields
.field private mInPhotoPage:Z

.field private mPhotoPageReceiver:Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract getLoader()Landroid/content/Loader;
.end method

.method protected getLoaders()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/Loader;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getLoader()Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method protected isInPhotoPage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mInPhotoPage:Z

    return v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;-><init>(Lcom/miui/gallery/ui/BaseMediaFragment;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mPhotoPageReceiver:Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onPause()V

    invoke-static {}, Lcom/nostra13/universalimageloader/core/ImageLoader;->getInstance()Lcom/nostra13/universalimageloader/core/ImageLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->clearHardMemoryCache()V

    return-void
.end method

.method protected onPhotoPageCreate(Landroid/content/Intent;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->isAdded()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getLoaders()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Loader;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Loader;->stopLoading()V

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mInPhotoPage:Z

    return-void
.end method

.method protected onPhotoPageDestroy(Landroid/content/Intent;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "photo_result_code"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    if-ne p1, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->getLoaders()Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_2

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Loader;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/content/Loader;->startLoading()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->finish()V

    :cond_2
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mInPhotoPage:Z

    return-void
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onResume()V

    return-void
.end method

.method public onStart()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStart()V

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "com.miu.gallery.action.ENTER_PHOTO_PAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "com.miui.gallery.action.EXIT_PHOTO_PAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mPhotoPageReceiver:Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method public onStop()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onStop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseMediaFragment;->mPhotoPageReceiver:Lcom/miui/gallery/ui/BaseMediaFragment$PhotoPageReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    return-void
.end method
