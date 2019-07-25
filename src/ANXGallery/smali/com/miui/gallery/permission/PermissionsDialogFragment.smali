.class public Lcom/miui/gallery/permission/PermissionsDialogFragment;
.super Landroid/app/DialogFragment;
.source "PermissionsDialogFragment.java"

# interfaces
.implements Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionWrapper;,
        Lcom/miui/gallery/permission/PermissionsDialogFragment$CategoryViewHolder;,
        Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionViewHolder;,
        Lcom/miui/gallery/permission/PermissionsDialogFragment$BaseViewHolder;,
        Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;
    }
.end annotation


# instance fields
.field private mOnIntroducedListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/DialogFragment;-><init>()V

    return-void
.end method

.method public static newInstance(Ljava/util/ArrayList;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)Lcom/miui/gallery/permission/PermissionsDialogFragment;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/permission/core/Permission;",
            ">;",
            "Lcom/miui/gallery/permission/core/OnPermissionIntroduced;",
            ")",
            "Lcom/miui/gallery/permission/PermissionsDialogFragment;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/permission/PermissionsDialogFragment;

    invoke-direct {v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "extra_permissions"

    invoke-virtual {v1, v2, p0}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->setArguments(Landroid/os/Bundle;)V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->setOnIntroducedListener(Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-object v0
.end method


# virtual methods
.method public onAgreementInvoked(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment;->mOnIntroducedListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment;->mOnIntroducedListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    invoke-interface {v0, p1}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/app/DialogFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->setCancelable(Z)V

    return-void
.end method

.method public onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
    .locals 2

    new-instance p1, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;

    invoke-virtual {p0}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;->setOnAgreementListener(Lcom/miui/gallery/agreement/core/OnAgreementInvokedListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/permission/PermissionsDialogFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra_permissions"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/permission/PermissionsDialogFragment$PermissionDialog;->setPermissions(Ljava/util/List;)V

    return-object p1
.end method

.method setOnIntroducedListener(Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/PermissionsDialogFragment;->mOnIntroducedListener:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    return-void
.end method
