.class public Lcom/miui/gallery/ui/AlbumRenameDialogFragment;
.super Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;
.source "AlbumRenameDialogFragment.java"


# instance fields
.field private mAlbumId:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(JLjava/lang/String;Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)Lcom/miui/gallery/ui/AlbumRenameDialogFragment;
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "key_album_id"

    invoke-virtual {v1, v2, p0, p1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    const-string p0, "key_album_default_name"

    invoke-virtual {v1, p0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p3}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->setOnAlbumOperationDoneListener(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V

    return-object v0
.end method


# virtual methods
.method protected execAlbumOperation(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->mAlbumId:J

    invoke-static {p1, v0, v1, p2}, Lcom/miui/gallery/provider/CloudUtils;->renameAlbum(Landroid/content/Context;JLjava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method protected getDialogTitle()I
    .locals 1

    const v0, 0x7f1005ed

    return v0
.end method

.method protected getOperationFailedString()I
    .locals 1

    const v0, 0x7f1005ee

    return v0
.end method

.method protected getOperationSucceededString()I
    .locals 1

    const v0, 0x7f1005ef

    return v0
.end method

.method protected getResultId(Landroid/os/Bundle;)J
    .locals 3

    if-nez p1, :cond_0

    const-wide/16 v0, -0x65

    goto :goto_0

    :cond_0
    const-string v0, "id"

    const-wide/16 v1, -0x1

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method protected parseArguments()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "key_album_id"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->mAlbumId:J

    const-string v1, "key_album_default_name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumRenameDialogFragment;->mDefaultName:Ljava/lang/String;

    return-void
.end method
