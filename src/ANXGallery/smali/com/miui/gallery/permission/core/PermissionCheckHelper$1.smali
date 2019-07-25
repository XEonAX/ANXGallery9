.class Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;
.super Ljava/lang/Object;
.source "PermissionCheckHelper.java"

# interfaces
.implements Lcom/miui/gallery/permission/core/OnPermissionIntroduced;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/permission/core/PermissionCheckHelper;->showPermissionIntroduction([Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

.field final synthetic val$index:I

.field final synthetic val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;


# direct methods
.method constructor <init>(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    iput-object p2, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    iput p3, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPermissionIntroduced(Z)V
    .locals 2

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    iget v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    aget-object p1, p1, v0

    const/4 v0, 0x0

    iput v0, p1, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->result:I

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    invoke-static {p1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->access$000(Lcom/miui/gallery/permission/core/PermissionCheckHelper;)Lcom/miui/gallery/permission/core/PermissionCheckCallback;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    iget v1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    aget-object v0, v0, v1

    iget-object v0, v0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->permission:Ljava/lang/String;

    invoke-interface {p1, v0}, Lcom/miui/gallery/permission/core/PermissionCheckCallback;->isPermissionRequired(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    iget v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    aget-object p1, p1, v0

    const/4 v0, -0x1

    iput v0, p1, Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;->result:I

    :goto_0
    iget p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    iget v1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$index:I

    add-int/lit8 v1, v1, 0x1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->access$200(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;I)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    iget-object v0, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->val$results:[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;

    invoke-static {p1, v0}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->access$300(Lcom/miui/gallery/permission/core/PermissionCheckHelper;[Lcom/miui/gallery/permission/core/PermissionCheckHelper$CheckResult;)V

    :goto_1
    return-void

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionCheckHelper$1;->this$0:Lcom/miui/gallery/permission/core/PermissionCheckHelper;

    invoke-static {p1}, Lcom/miui/gallery/permission/core/PermissionCheckHelper;->access$100(Lcom/miui/gallery/permission/core/PermissionCheckHelper;)Landroid/app/Activity;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/Activity;->finish()V

    return-void
.end method
