.class Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$1;
.super Ljava/lang/Object;
.source "CardDownloadDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/content/DialogInterface;ILandroid/view/KeyEvent;)Z
    .locals 0

    const/4 p1, 0x4

    if-ne p2, p1, :cond_0

    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog$1;->this$0:Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;

    invoke-static {p1}, Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;->access$000(Lcom/miui/gallery/card/ui/detail/CardDownloadDialog;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
