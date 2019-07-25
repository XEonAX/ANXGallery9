.class public Lcom/miui/gallery/activity/facebaby/FacePageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "FacePageActivity.java"


# instance fields
.field mFaceFragment:Lcom/miui/gallery/ui/FacePageFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->mFaceFragment:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/FacePageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b007b

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f09010e

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/FacePageFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->mFaceFragment:Lcom/miui/gallery/ui/FacePageFragment;

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0c0003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->mFaceFragment:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/FacePageFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPause()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onPause()V

    return-void
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->mFaceFragment:Lcom/miui/gallery/ui/FacePageFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/FacePageFragment;->isFaceDisplayMode()Z

    move-result v0

    const v1, 0x7f090007

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {v1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    const v1, 0x7f090006

    invoke-interface {p1, v1}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    const/4 v1, 0x1

    if-eqz p1, :cond_1

    xor-int/2addr v0, v1

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_1
    return v1
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/activity/facebaby/FacePageActivity;->setImmersionMenuEnabled(Z)V

    return-void
.end method
