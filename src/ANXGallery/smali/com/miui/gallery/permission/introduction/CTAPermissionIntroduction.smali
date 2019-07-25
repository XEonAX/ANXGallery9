.class public Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;
.super Ljava/lang/Object;
.source "CTAPermissionIntroduction.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public introduce(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 2

    invoke-static {p2}, Lcom/miui/gallery/permission/cta/CtaPermissions;->isPrivacyAllowed(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    invoke-interface {p3, p1}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "cta_privacy_permission_dialog_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/app/Fragment;

    move-result-object v1

    check-cast v1, Landroid/app/DialogFragment;

    if-nez v1, :cond_1

    new-instance v1, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;

    invoke-direct {v1, p0, p3}, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;-><init>(Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    invoke-static {p2, v1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->newInstance(Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    move-result-object v1

    :cond_1
    invoke-virtual {v1}, Landroid/app/DialogFragment;->isAdded()Z

    move-result p2

    if-nez p2, :cond_2

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object p1

    invoke-virtual {v1, p1, v0}, Landroid/app/DialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method
