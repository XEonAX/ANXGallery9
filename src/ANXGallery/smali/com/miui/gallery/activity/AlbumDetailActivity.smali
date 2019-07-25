.class public Lcom/miui/gallery/activity/AlbumDetailActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "AlbumDetailActivity.java"


# instance fields
.field private mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/activity/BaseActivity;->onActivityResult(IILandroid/content/Intent;)V

    iget-object v0, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b0009

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/AlbumDetailActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/AlbumDetailActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.action.VIEW"

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    const-string v1, "album_server_id"

    invoke-virtual {p1, v1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/activity/AlbumDetailActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090034

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {p0}, Lcom/miui/gallery/activity/AlbumDetailActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroy()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onDestroy()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

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

    iget-object v0, p0, Lcom/miui/gallery/activity/AlbumDetailActivity;->mAlbumDetailFragment:Lcom/miui/gallery/ui/AlbumDetailFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/AlbumDetailFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
