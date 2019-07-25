.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;
.super Ljava/lang/Object;
.source "DialogStyleMenu.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->initializeData(Lcom/miui/gallery/editor/photo/core/imports/text/model/DialogStatusData;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    const-string p1, "DialogStyleMenu"

    const-string p2, "onLayoutChange"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$000(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Landroid/widget/TextView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/TextView;->refreshDrawableState()V

    return-void
.end method
