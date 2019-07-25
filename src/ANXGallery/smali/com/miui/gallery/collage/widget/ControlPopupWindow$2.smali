.class Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;
.super Ljava/lang/Object;
.source "ControlPopupWindow.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/widget/ControlPopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f0901df

    if-eq p1, v0, :cond_2

    const v0, 0x7f090264

    if-eq p1, v0, :cond_1

    const v0, 0x7f09026f

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;->onRotate()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;->onReplace()V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/ControlPopupWindow$2;->this$0:Lcom/miui/gallery/collage/widget/ControlPopupWindow;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow;->access$000(Lcom/miui/gallery/collage/widget/ControlPopupWindow;)Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/collage/widget/ControlPopupWindow$ControlListener;->onMirror()V

    :cond_3
    :goto_0
    return-void
.end method
