.class public Lcom/miui/gallery/ui/RichTipDialogFragment;
.super Lcom/miui/gallery/widget/GalleryDialogFragment;
.source "RichTipDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;
    }
.end annotation


# instance fields
.field private mContent:Landroid/view/View;

.field private mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

.field private mPositiveButtonText:Ljava/lang/CharSequence;

.field private mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

.field private mSubTitle:Ljava/lang/CharSequence;

.field private mTitle:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/GalleryDialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/RichTipDialogFragment;)Landroid/content/DialogInterface$OnClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mPositiveClickListener:Landroid/content/DialogInterface$OnClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/RichTipDialogFragment;)Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    return-object p0
.end method


# virtual methods
.method public final onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 1

    new-instance p1, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RichTipDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mSubTitle:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setSubTitle(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mContent:Landroid/view/View;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mPositiveButtonText:Ljava/lang/CharSequence;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setPositiveButton(Ljava/lang/CharSequence;)V

    new-instance v0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/RichTipDialogFragment$1;-><init>(Lcom/miui/gallery/ui/RichTipDialogFragment;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setPositiveButtonOnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setCancelable(Z)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setCanceledOnTouchOutside(Z)V

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    return-object p1
.end method

.method public setContentView(Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mContent:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setContentView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public setPositiveButton(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mPositiveButtonText:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setPositiveButton(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setSubTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mSubTitle:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setSubTitle(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mTitle:Ljava/lang/CharSequence;

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment;->mDialog:Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;->setTitle(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
