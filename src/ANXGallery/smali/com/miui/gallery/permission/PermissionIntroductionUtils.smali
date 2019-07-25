.class public Lcom/miui/gallery/permission/PermissionIntroductionUtils;
.super Ljava/lang/Object;
.source "PermissionIntroductionUtils.java"


# direct methods
.method public static showPermissionIntroduction(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/agreement/AgreementsUtils;->isKoreaRegion()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;

    invoke-direct {v0}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;-><init>()V

    invoke-virtual {v0, p0, p1, p2}, Lcom/miui/gallery/permission/introduction/RuntimePermissionsIntroduction;->introduce(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/BaseBuildUtil;->isInternational()Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;

    invoke-direct {v0}, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;-><init>()V

    invoke-virtual {v0, p0, p1, p2}, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;->introduce(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V

    return-void

    :cond_1
    const/4 p0, 0x1

    invoke-interface {p2, p0}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    return-void
.end method
