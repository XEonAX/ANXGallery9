.class Lcom/miui/gallery/ui/RichTipDialogFragment$1;
.super Ljava/lang/Object;
.source "RichTipDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/RichTipDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/RichTipDialogFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;->this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;->this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/RichTipDialogFragment;->access$000(Lcom/miui/gallery/ui/RichTipDialogFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;->this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/RichTipDialogFragment;->access$000(Lcom/miui/gallery/ui/RichTipDialogFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;->this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/RichTipDialogFragment;->access$100(Lcom/miui/gallery/ui/RichTipDialogFragment;)Lcom/miui/gallery/ui/RichTipDialogFragment$RichTipDialog;

    move-result-object v0

    const/4 v1, -0x1

    invoke-interface {p1, v0, v1}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/RichTipDialogFragment$1;->this$0:Lcom/miui/gallery/ui/RichTipDialogFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/RichTipDialogFragment;->dismissSafely()V

    return-void
.end method
