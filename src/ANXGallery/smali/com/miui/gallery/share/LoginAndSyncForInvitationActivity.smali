.class public Lcom/miui/gallery/share/LoginAndSyncForInvitationActivity;
.super Lcom/miui/gallery/activity/BaseActivity;
.source "LoginAndSyncForInvitationActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/activity/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method protected allowUseOnOffline()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected hasCustomContentView()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/activity/BaseActivity;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;

    invoke-direct {p1}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    const-string v1, "LoginAndSyncForInvitationFragment"

    invoke-virtual {v0, p1, v1}, Landroid/app/FragmentTransaction;->add(Landroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    return-void
.end method
