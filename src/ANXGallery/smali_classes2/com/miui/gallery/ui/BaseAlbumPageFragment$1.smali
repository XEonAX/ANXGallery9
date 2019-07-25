.class Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;
.super Ljava/lang/Object;
.source "BaseAlbumPageFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/BaseAlbumPageFragment;->doDelete(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

.field final synthetic val$addDeleteCloudOption:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/BaseAlbumPageFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    iput-boolean p2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->val$addDeleteCloudOption:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 5

    iget-boolean p2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->val$addDeleteCloudOption:Z

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    check-cast p1, Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    new-instance p2, Lcom/miui/gallery/ui/DeletionTask$Param;

    new-array v2, v0, [J

    iget-object v3, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    iget-object v3, v3, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->mSelectedAlbum:Lcom/miui/gallery/model/Album;

    invoke-virtual {v3}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v3

    aput-wide v3, v2, v1

    const/16 v3, 0x16

    invoke-direct {p2, v2, p1, v3}, Lcom/miui/gallery/ui/DeletionTask$Param;-><init>([JII)V

    new-instance p1, Lcom/miui/gallery/ui/DeletionTask;

    invoke-direct {p1}, Lcom/miui/gallery/ui/DeletionTask;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-static {v2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->access$000(Lcom/miui/gallery/ui/BaseAlbumPageFragment;)Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/DeletionTask;->setOnDeletionCompleteListener(Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumPageFragment$1;->this$0:Lcom/miui/gallery/ui/BaseAlbumPageFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/DeletionTask;->showProgress(Landroid/app/Activity;)V

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v0, v0, [Lcom/miui/gallery/ui/DeletionTask$Param;

    aput-object p2, v0, v1

    invoke-virtual {p1, v2, v0}, Lcom/miui/gallery/ui/DeletionTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method
