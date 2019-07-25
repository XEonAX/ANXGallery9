.class public Lcom/miui/gallery/ui/AlertDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "AlertDialogFragment.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xb
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlertDialogFragment$Builder;
    }
.end annotation


# instance fields
.field private mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

.field private mCheckBoxMessage:Ljava/lang/CharSequence;

.field private mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mIsChecked:Z

.field private mMessage:Ljava/lang/CharSequence;

.field private mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field private mNegativeButtonText:Ljava/lang/CharSequence;

.field private mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

.field private mPositiveButtonText:Ljava/lang/CharSequence;

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

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnCancelListener;->onCancel(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlertDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mMessage:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mIsChecked:Z

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mCheckBoxMessage:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setCheckBox(ZLjava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mPositiveButtonText:Ljava/lang/CharSequence;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mNegativeButtonText:Ljava/lang/CharSequence;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    :cond_0
    return-void
.end method

.method setCheckBox(ZLjava/lang/CharSequence;)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mIsChecked:Z

    iput-object p2, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mCheckBoxMessage:Ljava/lang/CharSequence;

    return-void
.end method

.method setMessage(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mMessage:Ljava/lang/CharSequence;

    return-void
.end method

.method setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mNegativeButtonText:Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mNegativeButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mCancelListener:Landroid/content/DialogInterface$OnCancelListener;

    return-void
.end method

.method setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-void
.end method

.method setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mPositiveButtonText:Ljava/lang/CharSequence;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mPositiveButtonListener:Landroid/content/DialogInterface$OnClickListener;

    return-void
.end method

.method setTitle(Ljava/lang/CharSequence;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/AlertDialogFragment;->mTitle:Ljava/lang/CharSequence;

    return-void
.end method
