.class Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;
.super Ljava/lang/Object;
.source "PermissionDeniedActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->showDialog()Landroid/app/AlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;


# direct methods
.method constructor <init>(Lcom/miui/gallery/permission/core/PermissionDeniedActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-static {p1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->access$100(Lcom/miui/gallery/permission/core/PermissionDeniedActivity;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/high16 p2, 0x400000

    invoke-virtual {p1, p2}, Landroid/view/Window;->addFlags(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-static {p1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->access$200(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$2;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->finish()V

    return-void
.end method
