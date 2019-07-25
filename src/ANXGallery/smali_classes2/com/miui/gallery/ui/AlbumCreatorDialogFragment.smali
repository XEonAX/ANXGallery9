.class public Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;
.super Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;
.source "AlbumCreatorDialogFragment.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected execAlbumOperation(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 0

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/CloudUtils;->create(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method protected getDialogTitle()I
    .locals 1

    const v0, 0x7f1002e2

    return v0
.end method

.method protected getOperationFailedString()I
    .locals 1

    const v0, 0x7f1002e3

    return v0
.end method

.method protected getOperationSucceededString()I
    .locals 1

    const/4 v0, 0x0

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

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method protected parseArguments()V
    .locals 1

    const-string v0, ""

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumCreatorDialogFragment;->mDefaultName:Ljava/lang/String;

    return-void
.end method
