.class public Lcom/miui/gallery/ui/ProgressDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ProgressDialogFragment.java"


# instance fields
.field private mIndeterminate:Z

.field private mMessage:Ljava/lang/CharSequence;

.field private mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 1

    new-instance p1, Lmiui/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ProgressDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mIndeterminate:Z

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setIndeterminate(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lmiui/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    return-object p1
.end method

.method public setIndeterminate(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mIndeterminate:Z

    return-void
.end method

.method public setMessage(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mMessage:Ljava/lang/CharSequence;

    return-void
.end method

.method public setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mOnCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ProgressDialogFragment;->mTitle:Ljava/lang/CharSequence;

    return-void
.end method
