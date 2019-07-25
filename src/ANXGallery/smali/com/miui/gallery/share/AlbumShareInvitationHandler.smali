.class public Lcom/miui/gallery/share/AlbumShareInvitationHandler;
.super Ljava/lang/Object;
.source "AlbumShareInvitationHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$CancelListener;,
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$ApplyListener;,
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$AcceptListener;,
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$DenyListener;,
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$AlreadyApplyListener;,
        Lcom/miui/gallery/share/AlbumShareInvitationHandler$AbsListener;
    }
.end annotation


# direct methods
.method public static acceptShareInvitation(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AcceptListener;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AcceptListener;-><init>(Landroid/app/Activity;Z)V

    new-instance v2, Lcom/miui/gallery/share/AlbumShareInvitationHandler$CancelListener;

    invoke-direct {v2, p0, v1}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$CancelListener;-><init>(Landroid/app/Activity;Z)V

    const/4 v1, 0x0

    invoke-static {p1, p0, v0, v2, v1}, Lcom/miui/gallery/share/AlbumShareUIManager;->tryToAccept(Lcom/miui/gallery/share/Path;Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;Landroid/app/Dialog;)V

    return-void
.end method

.method public static acceptShareInvitation(Landroid/app/Activity;Ljava/lang/String;ILcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/share/AlbumShareInvitationHandler$1;

    invoke-direct {v0, p0, p3}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$1;-><init>(Landroid/app/Activity;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V

    new-instance p0, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;

    invoke-direct {p0, p2, v0}, Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;-><init>(ILcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;)V

    const/4 p3, 0x0

    invoke-static {p1, p2, p3, p3, p0}, Lcom/miui/gallery/share/AlbumShareInvitationReceiver;->handleInvitation(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Lcom/miui/gallery/share/AlbumShareInvitationReceiver$AddListener;)V

    return-void
.end method

.method static synthetic access$000(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->startShareAlbumView(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V

    return-void
.end method

.method static synthetic access$100(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler;->startCloudPage(Landroid/app/Activity;)V

    return-void
.end method

.method public static applyToShareAlbum(Landroid/app/Activity;Lcom/miui/gallery/share/Path;ZLcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;)V
    .locals 8

    new-instance v2, Lcom/miui/gallery/share/AlbumShareInvitationHandler$ApplyListener;

    const/4 v0, 0x1

    invoke-direct {v2, p0, p2, v0}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$ApplyListener;-><init>(Landroid/app/Activity;ZZ)V

    new-instance v3, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AcceptListener;

    invoke-direct {v3, p0, p2}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$AcceptListener;-><init>(Landroid/app/Activity;Z)V

    new-instance v4, Lcom/miui/gallery/share/AlbumShareInvitationHandler$DenyListener;

    invoke-direct {v4, p0, p2}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$DenyListener;-><init>(Landroid/app/Activity;Z)V

    new-instance v5, Lcom/miui/gallery/share/AlbumShareInvitationHandler$CancelListener;

    invoke-direct {v5, p0, p2}, Lcom/miui/gallery/share/AlbumShareInvitationHandler$CancelListener;-><init>(Landroid/app/Activity;Z)V

    const/4 v7, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v6, p3

    invoke-static/range {v0 .. v7}, Lcom/miui/gallery/share/AlbumShareUIManager;->applyToShareAlbum(Landroid/app/Activity;Lcom/miui/gallery/share/Path;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Lcom/miui/gallery/share/AlbumShareUIManager$OnCompletionListener;Landroid/content/DialogInterface$OnCancelListener;Lcom/miui/gallery/share/AlbumShareUIManager$BlockMessage;Z)V

    return-void
.end method

.method private static startCloudPage(Landroid/app/Activity;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.action.VIEW_ALBUM"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method private static startShareAlbumView(Landroid/app/Activity;Lcom/miui/gallery/share/Path;)V
    .locals 4

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getSharerInfo()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "com.miui.gallery.action.VIEW_SHARED_BABY_ALBUM"

    goto :goto_0

    :cond_0
    const-string v0, "com.miui.gallery.action.VIEW_SHARED_ALBUM"

    :goto_0
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const/high16 v0, 0x10000000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const-string v0, "album_id"

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/ShareAlbumManager;->getUniformAlbumId(J)J

    move-result-wide v2

    invoke-virtual {v1, v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    const-string v0, "album_name"

    invoke-virtual {p1}, Lcom/miui/gallery/share/Path;->getMediaSet()Lcom/miui/gallery/share/CloudSharerMediaSet;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/share/CloudSharerMediaSet;->getDisplayName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "other_share_album"

    const/4 v0, 0x1

    invoke-virtual {v1, p1, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    :try_start_0
    invoke-virtual {p0, v1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    new-instance p0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p0

    const-wide/16 v0, 0x11

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1, p0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
