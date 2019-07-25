.class public Lcom/miui/gallery/ui/ProcessTask;
.super Landroid/os/AsyncTask;
.source "ProcessTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ProcessTask$OnCancelListener;,
        Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;,
        Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Landroid/os/AsyncTask<",
        "TParams;",
        "Ljava/lang/Void;",
        "TResult;>;"
    }
.end annotation


# instance fields
.field private mCompleteListener:Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener<",
            "TResult;>;"
        }
    .end annotation
.end field

.field private mIsCancelable:Z

.field private mOnCancelListener:Lcom/miui/gallery/ui/ProcessTask$OnCancelListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/ui/ProcessTask$OnCancelListener<",
            "TResult;>;"
        }
    .end annotation
.end field

.field private mProcessCallback:Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
            "TParams;TResult;>;"
        }
    .end annotation
.end field

.field private mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
            "TParams;TResult;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/ProcessTask;-><init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/ui/ProcessTask$ProcessCallback<",
            "TParams;TResult;>;",
            "Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener<",
            "TResult;>;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mProcessCallback:Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;

    iput-object p2, p0, Lcom/miui/gallery/ui/ProcessTask;->mCompleteListener:Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Null processCallback is not accepted!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method protected varargs doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mProcessCallback:Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/ProcessTask$ProcessCallback;->doProcess([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProcessTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    :cond_0
    return-object p1
.end method

.method protected onCancelled(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onCancelled(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mOnCancelListener:Lcom/miui/gallery/ui/ProcessTask$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mOnCancelListener:Lcom/miui/gallery/ui/ProcessTask$OnCancelListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/ProcessTask$OnCancelListener;->onCancelled(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method protected onPostExecute(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mCompleteListener:Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mCompleteListener:Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;

    invoke-interface {v0, p1}, Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;->onCompleteProcess(Ljava/lang/Object;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProgressDialogFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/ProgressDialogFragment;->dismissAllowingStateLoss()V

    :cond_1
    return-void
.end method

.method public setCancelable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mIsCancelable:Z

    return-void
.end method

.method public setCompleteListener(Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProcessTask;->mCompleteListener:Lcom/miui/gallery/ui/ProcessTask$OnCompleteListener;

    return-void
.end method

.method public showProgress(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2

    if-nez p1, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/ProgressDialogFragment;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setMessage(Ljava/lang/CharSequence;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/ProcessTask;->mIsCancelable:Z

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setCancelable(Z)V

    iget-boolean p2, p0, Lcom/miui/gallery/ui/ProcessTask;->mIsCancelable:Z

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    new-instance v0, Lcom/miui/gallery/ui/ProcessTask$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/ProcessTask$1;-><init>(Lcom/miui/gallery/ui/ProcessTask;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/ProgressDialogFragment;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/ProcessTask;->mProgressDialog:Lcom/miui/gallery/ui/ProgressDialogFragment;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string v0, "ProcessTask"

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/ui/ProgressDialogFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method
