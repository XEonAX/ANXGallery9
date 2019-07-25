.class Lcom/miui/gallery/ui/CopyOrMoveDialog$1;
.super Ljava/lang/Object;
.source "CopyOrMoveDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CopyOrMoveDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/CopyOrMoveDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/CopyOrMoveDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/CopyOrMoveDialog$1;->this$0:Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2

    const/4 p1, 0x2

    if-gt p2, p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyOrMoveDialog$1;->this$0:Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->access$000(Lcom/miui/gallery/ui/CopyOrMoveDialog;)Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;

    move-result-object p1

    if-eqz p1, :cond_0

    const-string p1, "CopyOrMoveDialog"

    const-string v0, "Creation select : %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CopyOrMoveDialog$1;->this$0:Lcom/miui/gallery/ui/CopyOrMoveDialog;

    invoke-static {p1}, Lcom/miui/gallery/ui/CopyOrMoveDialog;->access$000(Lcom/miui/gallery/ui/CopyOrMoveDialog;)Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;

    move-result-object p1

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/CopyOrMoveDialog$OnOperationSelectedListener;->onOperationSelected(I)V

    :cond_0
    return-void
.end method
