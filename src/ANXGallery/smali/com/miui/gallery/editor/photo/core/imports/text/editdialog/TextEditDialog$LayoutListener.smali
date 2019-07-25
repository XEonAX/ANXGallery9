.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;
.super Ljava/lang/Object;
.source "TextEditDialog.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "LayoutListener"
.end annotation


# instance fields
.field private mRect:Landroid/graphics/Rect;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->mRect:Landroid/graphics/Rect;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->getDialog()Landroid/app/Dialog;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$200(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)Landroid/widget/FrameLayout;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->mRect:Landroid/graphics/Rect;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$400(Landroid/view/View;ILandroid/graphics/Rect;)I

    move-result v0

    const-string v1, "TextEditDialog"

    const-string v2, "heightDifference : %d:%d:%d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v1

    if-eq v1, v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$502(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;I)I

    :cond_2
    const/high16 v0, 0x43480000    # 200.0f

    invoke-static {v0}, Lcom/miui/gallery/util/ScreenUtils;->dpToPixel(F)F

    move-result v0

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v2

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {v1, v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$502(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;I)I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$600(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog$LayoutListener;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$500(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;->access$700(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/TextEditDialog;I)V

    return-void
.end method
