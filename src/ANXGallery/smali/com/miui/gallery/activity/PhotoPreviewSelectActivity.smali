.class public Lcom/miui/gallery/activity/PhotoPreviewSelectActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "PhotoPreviewSelectActivity.java"


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

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PhotoPreviewSelectActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;->newInstance(Landroid/net/Uri;Landroid/os/Bundle;)Lcom/miui/gallery/ui/PhotoPreviewSelectFragment;

    move-result-object p1

    const-string v0, "PhotoPreviewSelectFragment"

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, p1, v0, v1, v2}, Lcom/miui/gallery/activity/PhotoPreviewSelectActivity;->startFragment(Landroid/app/Fragment;Ljava/lang/String;ZZ)V

    return-void

    :cond_1
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/PhotoPreviewSelectActivity;->finish()V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onDestroy()V

    return-void
.end method
