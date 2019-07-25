.class Lcom/miui/gallery/permission/core/PermissionDeniedActivity$1;
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

    iput-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$1;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/permission/core/PermissionDeniedActivity$1;->this$0:Lcom/miui/gallery/permission/core/PermissionDeniedActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/permission/core/PermissionDeniedActivity;->finish()V

    return-void
.end method
