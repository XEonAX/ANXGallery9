.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;
.super Ljava/lang/Object;
.source "TextEditDialog.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->ordinal()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$900(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->getNavigationButton()Landroid/view/View;

    move-result-object v4

    if-ne p1, v4, :cond_3

    if-ne v0, v2, :cond_0

    goto :goto_2

    :cond_0
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->setChecked(Z)V

    if-nez v2, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$1000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$800(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->KEYBOARD:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    if-ne v4, v5, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    move-result-object v5

    aget-object v5, v5, v2

    invoke-static {v4, v5}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$802(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$1100(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    :cond_2
    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->getSubMenuView()Landroid/view/ViewGroup;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/FrameLayout;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->removeAllViews()V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$1200(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/FrameLayout;

    move-result-object v4

    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v4, v3, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;->values()[Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    move-result-object v4

    aget-object v4, v4, v2

    invoke-static {v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$802(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;)Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$Tab;

    const-string v3, "TextEditDialog"

    const-string v4, "current click index : %d"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_3
    invoke-virtual {v3, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogSubMenu;->setChecked(Z)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method
