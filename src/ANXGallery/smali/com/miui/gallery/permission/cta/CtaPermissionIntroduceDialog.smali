.class public Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;
.super Landroid/app/DialogFragment;
.source "CtaPermissionIntroduceDialog.java"


# instance fields
.field private mIntroduceListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

.field private mPermissionToRequest:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mPermissionToRequest:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)Lcom/miui/gallery/permission/core/OnPermissionIntroduced;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mIntroduceListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    return-object p0
.end method

.method public static newInstance(Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;
    .locals 3

    new-instance v0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    invoke-direct {v0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "permission"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->setOnIntroducedListener(Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-object v0
.end method


# virtual methods
.method protected getMessage()Landroid/text/SpannableStringBuilder;
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mPermissionToRequest:Ljava/lang/String;

    const/4 v2, 0x0

    const/4 v3, 0x1

    :try_start_0
    iget-object v4, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mPermissionToRequest:Ljava/lang/String;

    const/16 v5, 0x80

    invoke-virtual {v0, v4, v5}, Landroid/content/pm/PackageManager;->getPermissionInfo(Ljava/lang/String;I)Landroid/content/pm/PermissionInfo;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/content/pm/PermissionInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    move-object v0, v1

    :goto_0
    sget v1, Lcom/miui/gallery/permission/R$string;->grant_permission_item:I

    invoke-virtual {p0, v1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v0, v4, v2

    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    :try_start_1
    const-string v0, "CtaPrivacyPermissionRequestDialog"

    const-string v4, "Get permission info failed, %s"

    invoke-static {v0, v4, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sget v0, Lcom/miui/gallery/permission/R$string;->grant_permission_item:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-array v4, v3, [Ljava/lang/Object;

    aput-object v1, v4, v2

    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    sget v1, Lcom/miui/gallery/permission/R$string;->user_agreement2:I

    invoke-virtual {p0, v1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v1

    sget v4, Lcom/miui/gallery/permission/R$string;->user_agreement4:I

    invoke-virtual {p0, v4}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v4

    sget v5, Lcom/miui/gallery/permission/R$string;->privacy_permission_request_message:I

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v1, v6, v2

    aput-object v4, v6, v3

    const/4 v2, 0x2

    aput-object v0, v6, v2

    invoke-virtual {p0, v5, v6}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v2, v0, v1, v4}, Lcom/miui/gallery/agreement/cta/CtaAgreement;->buildUserNotice(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/text/SpannableStringBuilder;

    move-result-object v0

    return-object v0

    :goto_2
    sget v4, Lcom/miui/gallery/permission/R$string;->grant_permission_item:I

    invoke-virtual {p0, v4}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v4

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v1, v3, v2

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    throw v0
.end method

.method protected getNegativeListener()Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$2;-><init>(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)V

    return-object v0
.end method

.method protected getNegativeText()Ljava/lang/String;
    .locals 1

    sget v0, Lcom/miui/gallery/permission/R$string;->privacy_permission_request_negative:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getPositiveListener()Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;-><init>(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)V

    return-object v0
.end method

.method protected getPositiveText()Ljava/lang/String;
    .locals 1

    sget v0, Lcom/miui/gallery/permission/R$string;->privacy_permission_request_positive:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getTitle()Ljava/lang/String;
    .locals 1

    sget v0, Lcom/miui/gallery/permission/R$string;->privacy_permission_request_title:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->setCancelable(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "permission"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mPermissionToRequest:Ljava/lang/String;

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lmiui/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lmiui/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getMessage()Landroid/text/SpannableStringBuilder;

    move-result-object v0

    invoke-virtual {p1, v0}, Lmiui/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getPositiveText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getPositiveListener()Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lmiui/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Lmiui/app/AlertDialog$Builder;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getNegativeText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getNegativeListener()Landroid/content/DialogInterface$OnClickListener;

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

    invoke-virtual {p0}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    check-cast v0, Lmiui/app/AlertDialog;

    invoke-virtual {v0}, Lmiui/app/AlertDialog;->getMessageView()Landroid/widget/TextView;

    move-result-object v0

    invoke-static {}, Landroid/text/method/LinkMovementMethod;->getInstance()Landroid/text/method/MovementMethod;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMovementMethod(Landroid/text/method/MovementMethod;)V

    return-void
.end method

.method setOnIntroducedListener(Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->mIntroduceListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    return-void
.end method
