.class public Lcom/miui/gallery/share/AlbumShareInvitationPopupActivity;
.super Lcom/miui/gallery/share/AlbumShareInvitationActivityBase;
.source "AlbumShareInvitationPopupActivity.java"


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

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationPopupActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationPopupActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    :cond_0
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    const-string v1, "path"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_1
    move-object p1, v0

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const-string p1, "AlbumShareInvitationPopupActivity"

    const-string v0, "bad path"

    invoke-static {p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0}, Lcom/miui/gallery/share/AlbumShareInvitationPopupActivity;->finish()V

    return-void

    :cond_2
    const v1, 0x7f100404

    invoke-virtual {p0, v1}, Lcom/miui/gallery/share/AlbumShareInvitationPopupActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase$OnBlockMessageCancelled;

    invoke-direct {v2, p0}, Lcom/miui/gallery/share/AlbumShareInvitationActivityBase$OnBlockMessageCancelled;-><init>(Landroid/app/Activity;)V

    const/4 v3, 0x1

    invoke-static {p0, v0, v1, v3, v2}, Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;->create(Landroid/app/Activity;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZLandroid/content/DialogInterface$OnCancelListener;)Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/share/Path;->fromString(Ljava/lang/String;)Lcom/miui/gallery/share/Path;

    move-result-object p1

    invoke-static {p0, p1, v3, v0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->applyToShareAlbum(Landroid/app/Activity;Lcom/miui/gallery/share/Path;ZLcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    return-void
.end method
