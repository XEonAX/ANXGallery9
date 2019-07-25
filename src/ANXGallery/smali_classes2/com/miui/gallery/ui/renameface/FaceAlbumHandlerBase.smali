.class public abstract Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;
.super Ljava/lang/Object;
.source "FaceAlbumHandlerBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;,
        Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItemImpl;,
        Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceNewFolerItem;,
        Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceFolderItem;
    }
.end annotation


# instance fields
.field protected mActivity:Landroid/app/Activity;

.field protected mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

.field protected mListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mActivity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    iput-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mListener:Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase$FaceAlbumHandlerListener;

    return-void
.end method


# virtual methods
.method protected showInputFolderNameDialog(ILjava/lang/String;Z)V
    .locals 4

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mActivity:Landroid/app/Activity;

    const-class v2, Lcom/miui/gallery/activity/facebaby/InputFaceNameActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "original_name"

    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "is_relation_setted"

    invoke-virtual {v1, p2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->hasName()Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "original_path_album_local_id"

    iget-object p3, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mFaceSet:Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;

    invoke-virtual {p3}, Lcom/miui/gallery/provider/deprecated/NormalPeopleFaceMediaSet;->getBucketId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {v1, p2, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const/16 p2, 0x13

    if-ne p1, p2, :cond_1

    const-string p2, "only_use_contact"

    const/4 p3, 0x1

    invoke-virtual {v1, p2, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_1
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    iget-object p2, p0, Lcom/miui/gallery/ui/renameface/FaceAlbumHandlerBase;->mActivity:Landroid/app/Activity;

    invoke-virtual {p2, v0, p1}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void
.end method
