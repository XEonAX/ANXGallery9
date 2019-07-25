.class public Lcom/miui/gallery/activity/BurstPhotoActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "BurstPhotoActivity.java"


# instance fields
.field private mFragment:Lcom/miui/gallery/ui/BurstPhotoFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->finish()V

    const/4 v0, 0x0

    invoke-virtual {p0, v0, v0}, Lcom/miui/gallery/activity/BurstPhotoActivity;->overridePendingTransition(II)V

    return-void
.end method

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

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/BurstPhotoActivity;->mFragment:Lcom/miui/gallery/ui/BurstPhotoFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoFragment;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/BurstPhotoActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/BurstPhotoFragment;->newInstance(Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/ui/BurstPhotoFragment;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/activity/BurstPhotoActivity;->mFragment:Lcom/miui/gallery/ui/BurstPhotoFragment;

    iget-object v0, p0, Lcom/miui/gallery/activity/BurstPhotoActivity;->mFragment:Lcom/miui/gallery/ui/BurstPhotoFragment;

    const-string v1, "BurstPhotoFragment"

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v1, v3, v2}, Lcom/miui/gallery/activity/BurstPhotoActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    const-string v0, "has_transition"

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/compat/app/ActivityCompat;->startPostponedEnterTransition(Landroid/app/Activity;)V

    :cond_1
    return-void

    :cond_2
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/BurstPhotoActivity;->finish()V

    return-void
.end method
