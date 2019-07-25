.class public Lcom/miui/gallery/activity/PhotoSlimActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "PhotoSlimActivity.java"


# instance fields
.field private mPhotoSlimFragment:Lcom/miui/gallery/ui/PhotoSlimFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoSlimActivity;->mPhotoSlimFragment:Lcom/miui/gallery/ui/PhotoSlimFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onBackPressed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onBackPressed()V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b010c

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/PhotoSlimActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PhotoSlimActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f09021d

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PhotoSlimFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/PhotoSlimActivity;->mPhotoSlimFragment:Lcom/miui/gallery/ui/PhotoSlimFragment;

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/activity/PhotoSlimActivity;->mPhotoSlimFragment:Lcom/miui/gallery/ui/PhotoSlimFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoSlimFragment;->onBackPressed()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method
