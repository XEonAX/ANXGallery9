.class final Lcom/miui/gallery/util/MediaAndAlbumOperations$1;
.super Ljava/lang/Object;
.source "MediaAndAlbumOperations.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToSecretAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$activity:Landroid/app/Activity;

.field final synthetic val$hasVideo:Z

.field final synthetic val$ids:[J

.field final synthetic val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;


# direct methods
.method constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$activity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    iput-boolean p3, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$hasVideo:Z

    iput-object p4, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$ids:[J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$activity:Landroid/app/Activity;

    iget-object p2, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$listener:Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;

    iget-boolean v0, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$hasVideo:Z

    iget-object v1, p0, Lcom/miui/gallery/util/MediaAndAlbumOperations$1;->val$ids:[J

    invoke-static {p1, p2, v0, v1}, Lcom/miui/gallery/ui/AddRemoveSecretDialogFragment;->add(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Z[J)V

    return-void
.end method
