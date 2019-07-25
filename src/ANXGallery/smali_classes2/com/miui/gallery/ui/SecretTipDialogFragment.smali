.class public Lcom/miui/gallery/ui/SecretTipDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "SecretTipDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;
    }
.end annotation


# instance fields
.field private mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

.field private mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/SecretTipDialogFragment;)Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/SecretTipDialogFragment;Landroid/content/DialogInterface;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->onDone(Landroid/content/DialogInterface;)V

    return-void
.end method

.method private onDone(Landroid/content/DialogInterface;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->stopAnimation()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    invoke-interface {v0, p1}, Landroid/content/DialogInterface$OnDismissListener;->onDismiss(Landroid/content/DialogInterface;)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->dismissAllowingStateLoss()V

    :goto_0
    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onCancel(Landroid/content/DialogInterface;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->onDone(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 1

    new-instance p1, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;-><init>(Lcom/miui/gallery/ui/SecretTipDialogFragment;Landroid/content/Context;)V

    new-instance v0, Lcom/miui/gallery/ui/SecretTipDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$1;-><init>(Lcom/miui/gallery/ui/SecretTipDialogFragment;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->setPositiveButtonOnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    return-object p1
.end method

.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onDismiss(Landroid/content/DialogInterface;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->onDone(Landroid/content/DialogInterface;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->onPause()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mSecretTipDialog:Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->onResume()V

    :cond_0
    return-void
.end method

.method public setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment;->mOnDismissListener:Landroid/content/DialogInterface$OnDismissListener;

    return-void
.end method
