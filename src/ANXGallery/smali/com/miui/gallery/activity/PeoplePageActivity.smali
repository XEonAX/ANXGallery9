.class public Lcom/miui/gallery/activity/PeoplePageActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "PeoplePageActivity.java"


# instance fields
.field private final mMainHandler:Landroid/os/Handler;

.field mPeopleFragment:Lcom/miui/gallery/ui/PeoplePageFragment;

.field private mRequestSyncRunnable:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mMainHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/activity/PeoplePageActivity$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/activity/PeoplePageActivity$1;-><init>(Lcom/miui/gallery/activity/PeoplePageActivity;)V

    iput-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mRequestSyncRunnable:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mPeopleFragment:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/ui/PeoplePageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b00e7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/PeoplePageActivity;->setContentView(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PeoplePageActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const v0, 0x7f090214

    invoke-virtual {p1, v0}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/PeoplePageFragment;

    iput-object p1, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mPeopleFragment:Lcom/miui/gallery/ui/PeoplePageFragment;

    iget-object p1, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mMainHandler:Landroid/os/Handler;

    iget-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mRequestSyncRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/activity/PeoplePageActivity;->setImmersionMenuEnabled(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/activity/PeoplePageActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f0c0007

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const/4 p1, 0x1

    return p1
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mRequestSyncRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/activity/PeoplePageActivity;->mPeopleFragment:Lcom/miui/gallery/ui/PeoplePageFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/PeoplePageFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/activity/BaseActivity;->onResume()V

    return-void
.end method
