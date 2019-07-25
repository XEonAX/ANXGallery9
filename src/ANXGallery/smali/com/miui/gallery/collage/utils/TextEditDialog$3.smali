.class Lcom/miui/gallery/collage/utils/TextEditDialog$3;
.super Ljava/lang/Object;
.source "TextEditDialog.java"

# interfaces
.implements Landroid/content/DialogInterface$OnShowListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/utils/TextEditDialog;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/utils/TextEditDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onShow(Landroid/content/DialogInterface;)V
    .locals 4

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$200(Lcom/miui/gallery/collage/utils/TextEditDialog;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$200(Lcom/miui/gallery/collage/utils/TextEditDialog;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$300(Lcom/miui/gallery/collage/utils/TextEditDialog;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$200(Lcom/miui/gallery/collage/utils/TextEditDialog;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/widget/EditText;->setSelection(II)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$200(Lcom/miui/gallery/collage/utils/TextEditDialog;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setSelection(I)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$400(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/text/TextWatcher;

    move-result-object p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$400(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/text/TextWatcher;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->addTextChangedListener(Landroid/text/TextWatcher;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$500(Lcom/miui/gallery/collage/utils/TextEditDialog;)I

    move-result p1

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/text/InputFilter;

    new-instance v2, Landroid/text/InputFilter$LengthFilter;

    iget-object v3, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$3;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {v3}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$500(Lcom/miui/gallery/collage/utils/TextEditDialog;)I

    move-result v3

    invoke-direct {v2, v3}, Landroid/text/InputFilter$LengthFilter;-><init>(I)V

    aput-object v2, v1, v0

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setFilters([Landroid/text/InputFilter;)V

    :cond_3
    return-void
.end method
