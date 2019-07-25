.class Lcom/miui/gallery/widget/ScrollableViewDrawer$1;
.super Ljava/lang/Object;
.source "ScrollableViewDrawer.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/ScrollableViewDrawer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    const-string p1, "ScrollableViewDrawer"

    const-string p2, "ContentView layout change, newBottom: %d, oldBottom: %d"

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$000(Lcom/miui/gallery/widget/ScrollableViewDrawer;)I

    move-result p1

    if-eq p5, p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$100(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Landroid/widget/Scroller;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Scroller;->isFinished()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$200(Lcom/miui/gallery/widget/ScrollableViewDrawer;)I

    move-result p1

    if-ne p1, p2, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1, p5}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$002(Lcom/miui/gallery/widget/ScrollableViewDrawer;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$200(Lcom/miui/gallery/widget/ScrollableViewDrawer;)I

    move-result p1

    const/4 p2, 0x2

    if-ne p1, p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1, p5}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$402(Lcom/miui/gallery/widget/ScrollableViewDrawer;I)I

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$500(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$1;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1, p2}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$302(Lcom/miui/gallery/widget/ScrollableViewDrawer;Z)Z

    :cond_2
    :goto_1
    return-void
.end method
