.class Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;
.super Ljava/lang/Object;
.source "ShareFilePrepareFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ShareFilePrepareFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/ui/ShareFilePrepareFragment$1;->this$0:Lcom/miui/gallery/ui/ShareFilePrepareFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/ShareFilePrepareFragment;->access$000(Lcom/miui/gallery/ui/ShareFilePrepareFragment;)Lmiui/app/ProgressDialog;

    move-result-object p1

    invoke-virtual {p1}, Lmiui/app/ProgressDialog;->cancel()V

    return-void
.end method
