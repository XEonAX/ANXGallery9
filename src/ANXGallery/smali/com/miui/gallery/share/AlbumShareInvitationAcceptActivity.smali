.class public Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;
.super Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;
.source "AlbumShareInvitationAcceptActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;->onCreate(Landroid/os/Bundle;)V

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->supportShare()Z

    move-result v0

    if-nez v0, :cond_0

    const p1, 0x7f100368

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;->finish()V

    return-void

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    :cond_1
    if-eqz p1, :cond_2

    const-string v0, "invitation-url"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string v0, "invitation-url"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/lib/MiuiGalleryUtils;->isAlbumShareInvitationUrl(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    const/4 v0, 0x0

    const v1, 0x7f100404

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    new-instance v3, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase$OnBlockMessageCancelled;

    invoke-direct {v3, p0}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase$OnBlockMessageCancelled;-><init>(Landroid/app/Activity;)V

    invoke-static {p0, v0, v1, v2, v3}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object v0

    const/16 v1, 0x10

    invoke-static {p0, p1, v1, v0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->acceptShareInvitation(Landroid/app/Activity;Ljava/lang/String;ILcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    return-void

    :cond_2
    const p1, 0x7f100437

    invoke-static {p0, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationAcceptActivity;->finish()V

    return-void
.end method
