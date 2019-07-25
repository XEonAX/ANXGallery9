.class public Lcom/miui/gallery/activity/PhotoDetailActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "PhotoDetailActivity.java"


# instance fields
.field private mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PhotoDetailFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoDetailFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b00f0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/PhotoDetailActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PhotoDetailActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090219

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PhotoDetailFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PhotoDetailActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoDetailActivity;->mPhotoDetailFragment:Lcom/miui/gallery/ui/PhotoDetailFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PhotoDetailFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method protected supportShowOnScreenLocked()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
