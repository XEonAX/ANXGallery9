.class Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;
.super Ljava/lang/Object;
.source "InputFaceNameFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->initTitleBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$100(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Landroid/widget/EditText;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    :cond_0
    move-object v1, p1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$200(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    const v1, 0x7f100434

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    return-void

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1, v1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$300(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$400(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$500(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$600(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;)Z

    move-result p1

    if-nez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    const/4 v0, 0x0

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->showSetRelationDialog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment$2;->this$0:Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;->access$700(Lcom/miui/gallery/ui/renameface/InputFaceNameFragment;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method
