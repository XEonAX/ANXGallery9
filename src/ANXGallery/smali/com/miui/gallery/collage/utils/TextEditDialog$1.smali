.class Lcom/miui/gallery/collage/utils/TextEditDialog$1;
.super Ljava/lang/Object;
.source "TextEditDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/utils/TextEditDialog;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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

    iput-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$1;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/utils/TextEditDialog$1;->this$0:Lcom/miui/gallery/collage/utils/TextEditDialog;

    invoke-static {p1}, Lcom/miui/gallery/collage/utils/TextEditDialog;->access$100(Lcom/miui/gallery/collage/utils/TextEditDialog;)Landroid/widget/EditText;

    move-result-object p1

    const-string v0, ""

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
