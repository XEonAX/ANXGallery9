.class Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;
.super Ljava/lang/Object;
.source "TextFragment.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView$TextEditorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClear()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    const/4 v1, -0x1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$202(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;I)I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->onClear()V

    return-void
.end method

.method public onItemEdit()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->isDetached()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getItemText()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    const v2, 0x7f1006d2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    move-result-object v2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setWillEditText(Ljava/lang/String;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getTextConfigDataByIndex(I)Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextEditorView;->getCurrentItemStatus(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->setInitializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->access$400(Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/TextFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "TextEditDialog"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public onModify()V
    .locals 0

    return-void
.end method
