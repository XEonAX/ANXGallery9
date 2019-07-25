.class public Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "LoginAndSyncForInvitationFragment.java"


# instance fields
.field private mPath:Lcom/miui/gallery/share/Path;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    :cond_0
    return-void
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getThemeRes()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->mPath:Lcom/miui/gallery/share/Path;

    invoke-static {p1, p2}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->acceptShareInvitation(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->finish()V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string v0, "invitation_path"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/share/Path;

    iput-object p1, p0, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->mPath:Lcom/miui/gallery/share/Path;

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->mPath:Lcom/miui/gallery/share/Path;

    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/share/LoginAndSyncForInvitationFragment;->finish()V

    return-void

    :cond_1
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string v0, "key_check_gallery_sync"

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "cloud_guide_source"

    sget-object v1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SHARE_INVITATION:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected useImageLoader()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
