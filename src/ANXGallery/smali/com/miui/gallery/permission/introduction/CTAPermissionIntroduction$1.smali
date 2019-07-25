.class Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;
.super Ljava/lang/Object;
.source "CTAPermissionIntroduction.java"

# interfaces
.implements Lcom/miui/gallery/permission/core/OnPermissionIntroduced;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;->introduce(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;

.field final synthetic val$callback:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;


# direct methods
.method constructor <init>(Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;Lcom/miui/gallery/permission/core/OnPermissionIntroduced;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;->this$0:Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction;

    iput-object p2, p0, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;->val$callback:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionIntroduced(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/permission/introduction/CTAPermissionIntroduction$1;->val$callback:Lcom/miui/gallery/permission/core/OnPermissionIntroduced;

    invoke-interface {v0, p1}, Lcom/miui/gallery/permission/core/OnPermissionIntroduced;->onPermissionIntroduced(Z)V

    return-void
.end method
