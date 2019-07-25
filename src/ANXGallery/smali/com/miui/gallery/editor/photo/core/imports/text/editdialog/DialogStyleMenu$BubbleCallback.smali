.class Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;
.super Ljava/lang/Object;
.source "DialogStyleMenu.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BubbleCallback"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/editor/photo/widgets/seekbar/BubbleIndicator$Callback<",
        "Landroid/view/View;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;-><init>(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)V

    return-void
.end method


# virtual methods
.method public updateProgress(Landroid/view/View;I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result v0

    const-string v1, "DialogStyleMenu"

    const-string v2, "updateProgress progress: %d color: %s"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v2, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/GradientDrawable;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu$BubbleCallback;->this$0:Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;->access$300(Lcom/miui/gallery/editor/photo/core/imports/text/editdialog/DialogStyleMenu;)Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/widgets/seekbar/ColorPicker;->getColor()I

    move-result p2

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    return-void
.end method
