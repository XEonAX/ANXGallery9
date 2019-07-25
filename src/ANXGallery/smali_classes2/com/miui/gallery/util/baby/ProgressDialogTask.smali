.class abstract Lcom/miui/gallery/util/baby/ProgressDialogTask;
.super Landroid/os/AsyncTask;
.source "CopyFaceAlbumItemsToBabyAlbumTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask<",
        "Ljava/lang/Void;",
        "Ljava/lang/Integer;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mCancelable:Z

.field protected mContext:Landroid/content/Context;

.field private mDialog:Landroid/app/ProgressDialog;

.field private mMessageId:I

.field private mProgressMax:I

.field private mShowProgress:Z

.field private mTitleId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;IIIZZ)V
    .locals 0

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mContext:Landroid/content/Context;

    iput p2, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mProgressMax:I

    iput p3, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mTitleId:I

    iput p4, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mMessageId:I

    iput-boolean p5, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mCancelable:Z

    iput-boolean p6, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mShowProgress:Z

    return-void
.end method

.method public static showProgressDialog(Landroid/content/Context;IIIZ)Landroid/app/ProgressDialog;
    .locals 3

    new-instance v0, Landroid/app/ProgressDialog;

    invoke-direct {v0, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    if-nez p1, :cond_0

    move-object p1, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    if-nez p2, :cond_1

    move-object p1, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    :goto_1
    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, p4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setCanceledOnTouchOutside(Z)V

    if-eqz p4, :cond_2

    const/4 p1, -0x2

    const/high16 p2, 0x1040000

    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    check-cast v1, Landroid/os/Message;

    invoke-virtual {v0, p1, p0, v1}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/os/Message;)V

    :cond_2
    const/4 p0, 0x1

    if-le p3, p0, :cond_3

    invoke-virtual {v0, p3}, Landroid/app/ProgressDialog;->setMax(I)V

    invoke-virtual {v0, p0}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    :cond_3
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    return-object v0
.end method


# virtual methods
.method public dismissDialog()V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method protected isDialogShowing()Z
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method protected onCancelled()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->dismissDialog()V

    return-void
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->dismissDialog()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mShowProgress:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mContext:Landroid/content/Context;

    iget v1, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mTitleId:I

    iget v2, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mMessageId:I

    iget v3, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mProgressMax:I

    iget-boolean v4, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mCancelable:Z

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->showProgressDialog(Landroid/content/Context;IIIZ)Landroid/app/ProgressDialog;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    iget-boolean v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mCancelable:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    const/4 v1, -0x2

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/miui/gallery/util/baby/ProgressDialogTask$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask$1;-><init>(Lcom/miui/gallery/util/baby/ProgressDialogTask;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    new-instance v1, Lcom/miui/gallery/util/baby/ProgressDialogTask$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/util/baby/ProgressDialogTask$2;-><init>(Lcom/miui/gallery/util/baby/ProgressDialogTask;)V

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V

    :cond_2
    return-void
.end method

.method protected varargs onProgressUpdate([Ljava/lang/Integer;)V
    .locals 2

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/baby/ProgressDialogTask;->mDialog:Landroid/app/ProgressDialog;

    const/4 v1, 0x0

    aget-object p1, p1, v1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setProgress(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method protected bridge synthetic onProgressUpdate([Ljava/lang/Object;)V
    .locals 0

    check-cast p1, [Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/baby/ProgressDialogTask;->onProgressUpdate([Ljava/lang/Integer;)V

    return-void
.end method
