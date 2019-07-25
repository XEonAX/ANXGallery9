.class public Lcom/miui/gallery/ui/ConfirmDialog;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "ConfirmDialog.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;
    }
.end annotation


# instance fields
.field private mConfirmDialogInterface:Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/ConfirmDialog;)Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/ConfirmDialog;->mConfirmDialogInterface:Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;

    return-object p0
.end method

.method public static showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V
    .locals 2

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "title"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string p1, "msg"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "negativeButton"

    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "positiveButton"

    invoke-virtual {v0, p1, p4}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p1, Lcom/miui/gallery/ui/ConfirmDialog;

    invoke-direct {p1}, Lcom/miui/gallery/ui/ConfirmDialog;-><init>()V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/ConfirmDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {p1, p5}, Lcom/miui/gallery/ui/ConfirmDialog;->setConfirmDialogInterface(Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    const-string p2, "ConfirmDialog"

    invoke-virtual {p1, p0, p2}, Lcom/miui/gallery/ui/ConfirmDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/ConfirmDialog;->mConfirmDialogInterface:Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/ConfirmDialog;->mConfirmDialogInterface:Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;

    invoke-interface {p1, p0}, Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;->onCancel(Landroid/app/DialogFragment;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ConfirmDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/ConfirmDialog;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x1010355

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setIconAttribute(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "msg"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "negativeButton"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/ConfirmDialog$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/ConfirmDialog$2;-><init>(Lcom/miui/gallery/ui/ConfirmDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "positiveButton"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/ui/ConfirmDialog$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/ConfirmDialog$1;-><init>(Lcom/miui/gallery/ui/ConfirmDialog;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v1, "title"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    :cond_0
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    return-object p1
.end method

.method public setConfirmDialogInterface(Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ConfirmDialog;->mConfirmDialogInterface:Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;

    return-void
.end method
