.class Lcom/miui/gallery/widget/ScrollableViewDrawer$2;
.super Ljava/lang/Object;
.source "ScrollableViewDrawer.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/widget/ScrollableViewDrawer;->openDrawer(ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V
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

    iput-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p1}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$600(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Z

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p2}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$700(Lcom/miui/gallery/widget/ScrollableViewDrawer;)Lcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    invoke-static {p3}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->access$800(Lcom/miui/gallery/widget/ScrollableViewDrawer;)V

    iget-object p3, p0, Lcom/miui/gallery/widget/ScrollableViewDrawer$2;->this$0:Lcom/miui/gallery/widget/ScrollableViewDrawer;

    new-instance p4, Lcom/miui/gallery/widget/ScrollableViewDrawer$2$1;

    invoke-direct {p4, p0, p1, p2}, Lcom/miui/gallery/widget/ScrollableViewDrawer$2$1;-><init>(Lcom/miui/gallery/widget/ScrollableViewDrawer$2;ZLcom/miui/gallery/widget/ScrollableViewDrawer$DrawerAnimEndListener;)V

    invoke-virtual {p3, p4}, Lcom/miui/gallery/widget/ScrollableViewDrawer;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
