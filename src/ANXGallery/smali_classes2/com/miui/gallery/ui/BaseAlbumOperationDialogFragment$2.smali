.class Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;
.super Ljava/lang/Object;
.source "BaseAlbumOperationDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mInputView:Landroid/widget/EditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-static {v0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->access$100(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$2;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;-><init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;Landroid/app/Activity;Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
