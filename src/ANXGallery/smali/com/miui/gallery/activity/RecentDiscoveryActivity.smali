.class public Lcom/miui/gallery/activity/RecentDiscoveryActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "RecentDiscoveryActivity.java"


# instance fields
.field private mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b011f

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090042

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {p0}, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onPrepareOptionsMenu(Landroid/view/Menu;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/RecentDiscoveryActivity;->mRecentDiscoveryFragment:Lcom/miui/gallery/ui/RecentDiscoveryFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->onPrepareOptionsMenu(Landroid/view/Menu;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onPrepareOptionsMenu(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method
