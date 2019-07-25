.class Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;
.super Landroid/os/AsyncTask;
.source "BaseAlbumOperationDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AlbumOperateTask"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "Landroid/os/Bundle;",
        ">;"
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAlbumName:Ljava/lang/String;

.field private mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

.field final synthetic this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;Landroid/app/Activity;Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->activityAlive()Z

    move-result p0

    return p0
.end method

.method private activityAlive()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private showAlbumConflictDialog(JLjava/lang/String;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;

    invoke-direct {v1, p0, p3, p1, p2}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask$1;-><init>(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;Ljava/lang/String;J)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/String;)Landroid/os/Bundle;
    .locals 3

    const/4 v0, 0x0

    aget-object v1, p1, v0

    iput-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mAlbumName:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->activityAlive()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iget-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->execAlbumOperation(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    const-string v1, "BaseAlbumOperationDialogFragment"

    const-string v2, "activity dead, abort album task(%d)"

    aget-object p1, p1, v0

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    return-object p1
.end method

.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->doInBackground([Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object p1

    return-object p1
.end method

.method protected onPostExecute(Landroid/os/Bundle;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getResultId(Landroid/os/Bundle;)J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v2, v2, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mConfirmButton:Landroid/widget/Button;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mOnAlbumOperationDoneListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    iget-object v4, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mAlbumName:Ljava/lang/String;

    invoke-interface {v2, v0, v1, v4}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;->onOperationDone(JLjava/lang/String;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->activityAlive()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->dismiss()V

    const-string p1, "BaseAlbumOperationDialogFragment"

    const-string v0, "activity dead, cancel toast"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    const-wide/16 v4, -0x67

    cmp-long v2, v0, v4

    const-wide/16 v4, 0x0

    if-eqz v2, :cond_3

    const-wide/16 v6, -0x69

    cmp-long v2, v0, v6

    if-nez v2, :cond_2

    goto :goto_0

    :cond_2
    cmp-long p1, v0, v4

    if-gez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getOperationFailedString()I

    move-result v2

    invoke-static {p1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->access$200(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V

    goto :goto_2

    :cond_3
    :goto_0
    const-string v2, "conflict_album_id"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long p1, v6, v4

    if-ltz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mAlbumName:Ljava/lang/String;

    invoke-direct {p0, v6, v7, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->showAlbumConflictDialog(JLjava/lang/String;)V

    goto :goto_1

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iget-object v2, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    const v6, 0x7f10002b

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mAlbumName:Ljava/lang/String;

    aput-object v8, v3, v7

    invoke-virtual {v2, v6, v3}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->access$200(Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;)V

    :cond_5
    :goto_2
    cmp-long p1, v0, v4

    if-lez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object p1, p1, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mDialog:Lmiui/app/AlertDialog;

    invoke-virtual {p1}, Lmiui/app/AlertDialog;->dismiss()V

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getOperationSucceededString()I

    move-result p1

    if-lez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->mActivity:Landroid/app/Activity;

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->getOperationSucceededString()I

    move-result v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    :cond_6
    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->onPostExecute(Landroid/os/Bundle;)V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$AlbumOperateTask;->this$0:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;

    iget-object v0, v0, Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment;->mConfirmButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    return-void
.end method
