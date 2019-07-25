.class public Lcom/miui/gallery/agreement/AgreementDialogFragment;
.super Landroid/app/DialogFragment;
.source "AgreementDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementWrapper;,
        Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementViewHolder;,
        Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;
    }
.end annotation


# instance fields
.field private mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/util/ArrayList;)Lcom/miui/gallery/agreement/AgreementDialogFragment;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/agreement/core/Agreement;",
            ">;)",
            "Lcom/miui/gallery/agreement/AgreementDialogFragment;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/agreement/AgreementDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "extra_agreements"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/agreement/AgreementDialogFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method


# virtual methods
.method public invoke(Landroid/app/Activity;Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V
    .locals 0

    iput-object p2, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment;->mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    const-string p2, "AgreementDialogFragment"

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/agreement/AgreementDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/agreement/AgreementDialogFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/AgreementDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;-><init>(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/agreement/AgreementDialogFragment;->mListener:Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;->setOnAgreementListener(Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/agreement/AgreementDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra_agreements"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/agreement/AgreementDialogFragment$AgreementDialog;->setAgreements(Ljava/util/List;)V

    return-object p1
.end method
