.class public Lcom/miui/gallery/picker/uri/PrepareProgressDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "PrepareProgressDialog.java"


# instance fields
.field private mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mMax:I

.field private mProgress:I

.field private mStage:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public getDialogMessageId()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mStage:I

    packed-switch v0, :pswitch_data_0

    const/4 v0, 0x0

    goto :goto_0

    :pswitch_0
    const v0, 0x7f10059b

    goto :goto_0

    :pswitch_1
    const v0, 0x7f100594

    :goto_0
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 6

    new-instance p1, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialogMessageId()I

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mProgress:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    iget v4, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mMax:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v0

    invoke-virtual {v2, v1, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_0
    return-object p1
.end method

.method public setCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method public setDialogMessage()V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialogMessageId()I

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v1

    check-cast v1, Landroid/app/ProgressDialog;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mProgress:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget v5, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mMax:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-virtual {v2, v0, v3}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setMax(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mMax:I

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setDialogMessage()V

    return-void
.end method

.method public setStage(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mStage:I

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setDialogMessage()V

    return-void
.end method

.method public updateProgress(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->mProgress:I

    invoke-virtual {p0}, Lcom/miui/gallery/picker/uri/PrepareProgressDialog;->setDialogMessage()V

    return-void
.end method
