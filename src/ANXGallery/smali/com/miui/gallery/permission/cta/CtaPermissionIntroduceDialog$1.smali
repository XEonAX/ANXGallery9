.class Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;
.super Ljava/lang/Object;
.source "CtaPermissionIntroduceDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->getPositiveListener()Landroid/content/DialogInterface$OnClickListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;->this$0:Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;->this$0:Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    invoke-static {p1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->access$000(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    invoke-static {p1, p2}, Lcom/miui/gallery/preference/BaseGalleryPreferences$PermissionIntroduction;->setCtaPrivacyPermissionsAllowed(Ljava/lang/String;Z)V

    iget-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;->this$0:Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    invoke-static {p1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->access$100(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog$1;->this$0:Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;

    invoke-static {p1}, Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;->access$100(Lcom/miui/gallery/permission/cta/CtaPermissionIntroduceDialog;)Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    :cond_0
    return-void
.end method
