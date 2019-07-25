.class Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;
.super Ljava/lang/Object;
.source "BaseAlbumOperationDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/app/DialogFragment;)V
    .locals 0

    invoke-virtual {p1}, Landroid/app/DialogFragment;->dismiss()V

    return-void
.end method

.method public onConfirm(Landroid/app/DialogFragment;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->this$1:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->this$1:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->this$1:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->dismiss()V

    :cond_0
    invoke-virtual {p1}, Landroid/app/DialogFragment;->dismiss()V

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Common;->URI_ALBUM_PAGE:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string v0, "id"

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    iget-wide v1, v1, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->val$conflictAlbumId:J

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1$1;->this$2:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;->this$1:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;)V

    return-void
.end method
