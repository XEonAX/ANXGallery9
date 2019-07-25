.class Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;
.super Ljava/lang/Object;
.source "DeleteMediaDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

.field final synthetic val$info:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->val$info:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    iget-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->access$100(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)Lcom/miui/gallery/ui/DeletionTask$Param;

    move-result-object p2

    const/4 v0, 0x0

    iput v0, p2, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    iget-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->val$info:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;

    iget-object p2, p2, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    if-eqz p2, :cond_1

    check-cast p1, Lmiui/app/AlertDialog;

    iget-object p2, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->val$info:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;

    iget-object p2, p2, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$DialogInfo;->checkBoxInfo:Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;

    iget p2, p2, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$CheckBoxInfo;->type:I

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lmiui/app/AlertDialog;->isChecked()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->access$100(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)Lcom/miui/gallery/ui/DeletionTask$Param;

    move-result-object p1

    iput v0, p1, Lcom/miui/gallery/ui/DeletionTask$Param;->mDeleteOptions:I

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/ui/DeleteMediaDialogFragment$3;->this$0:Lcom/miui/gallery/ui/DeleteMediaDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/DeleteMediaDialogFragment;->access$000(Lcom/miui/gallery/ui/DeleteMediaDialogFragment;)V

    return-void
.end method
