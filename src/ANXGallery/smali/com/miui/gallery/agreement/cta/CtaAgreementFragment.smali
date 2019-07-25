.class public Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;
.super Landroid/app/DialogFragment;
.source "CtaAgreementFragment.java"


# instance fields
.field private mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    return-object p0
.end method


# virtual methods
.method protected getMessage()Landroid/text/SpannableStringBuilder;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    sget v1, Lcom/miui/gallery/permission/R$string;->user_notice_identify_summary_format:I

    invoke-static {v0, v1}, Lcom/miui/gallery/agreement/cta/CtaAgreement;->buildUserNotice(Landroid/content/Context;I)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    return-object v0
.end method

.method protected getNegativeListener()Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$2;-><init>(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)V

    return-object v0
.end method

.method protected getNegativeText()Ljava/lang/String;
    .locals 1

    const/high16 v0, 0x1040000

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPositiveListener()Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment$1;-><init>(Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;)V

    return-object v0
.end method

.method protected getPositiveText()Ljava/lang/String;
    .locals 1

    sget v0, Lcom/miui/gallery/permission/R$string;->user_agree:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    sget v0, Lcom/miui/gallery/permission/R$string;->user_notice_title:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public invoke(Landroid/app/Activity;Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V
    .locals 2

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    const-string v1, "CtaAgreementFragment"

    invoke-virtual {v0, v1}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eq v0, p0, :cond_0

    instance-of v1, v0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/app/DialogFragment;

    invoke-virtual {v0}, Landroid/app/DialogFragment;->dismiss()V

    :cond_0
    iput-object p2, p0, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string p2, "CtaAgreementFragment"

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getMessage()Landroid/text/SpannableStringBuilder;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getPositiveText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getPositiveListener()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getNegativeText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getNegativeListener()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/AlertDialog$Builder;->create()Lmiui/app/AlertDialog;

    move-result-object p1

    return-object p1
.end method

.method public onStart()V
    .locals 2

    invoke-super {p0}, Landroid/app/DialogFragment;->onStart()V

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/cta/CtaAgreementFragment;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    :cond_0
    return-void
.end method
