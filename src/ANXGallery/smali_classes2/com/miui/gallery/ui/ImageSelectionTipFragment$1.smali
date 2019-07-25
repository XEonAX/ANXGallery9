.class Lcom/miui/gallery/ui/ImageSelectionTipFragment$1;
.super Ljava/lang/Object;
.source "ImageSelectionTipFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/ImageSelectionTipFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/ImageSelectionTipFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$1;->this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$1;->this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;

    iget-object v0, p0, Lcom/miui/gallery/ui/ImageSelectionTipFragment$1;->this$0:Lcom/miui/gallery/ui/ImageSelectionTipFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->access$000(Lcom/miui/gallery/ui/ImageSelectionTipFragment;)Lcom/miui/gallery/ui/ImageSelectionTipFragment$ImageSelectionTipDialog;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/ImageSelectionTipFragment;->access$100(Lcom/miui/gallery/ui/ImageSelectionTipFragment;Landroid/content/DialogInterface;)V

    return-void
.end method
