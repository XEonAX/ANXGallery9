.class final Lcom/miui/gallery/util/MediaAndAlbumOperations$5;
.super Ljava/lang/Object;
.source "MediaAndAlbumOperations.java"

# interfaces
.implements Lcom/miui/gallery/ui/AddToAlbumDialogFragment$OnAlbumSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;ZZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$hasVideo:Z

.field final synthetic val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

.field final synthetic val$uris:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    iput-object p3, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$uris:Ljava/util/ArrayList;

    iput-boolean p4, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$hasVideo:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAlbumSelected(JZ)V
    .locals 6

    const-wide/16 v0, -0x3e8

    cmp-long v2, p1, v0

    if-nez v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$activity:Landroid/app/Activity;

    new-instance p2, Lcom/miui/gallery/util/MediaAndAlbumOperations$5$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/util/MediaAndAlbumOperations$5$1;-><init>(Lcom/miui/gallery/util/MediaAndAlbumOperations$5;)V

    iget-object p3, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$uris:Ljava/util/ArrayList;

    iget-boolean v0, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$hasVideo:Z

    invoke-static {p1, p2, p3, v0}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Ljava/util/ArrayList;Z)V

    return-void

    :cond_0
    if-eqz p3, :cond_1

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$activity:Landroid/app/Activity;

    const v0, 0x7f100013

    invoke-static {p3, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const/4 p3, 0x0

    const/4 v4, 0x0

    goto :goto_0

    :cond_1
    move v4, p3

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$activity:Landroid/app/Activity;

    iget-object v3, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$uris:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$5;->val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;

    move-wide v1, p1

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/CopyMoveDialogFragment;->show(Landroid/app/Activity;JLjava/util/ArrayList;ZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)V

    return-void
.end method
