.class Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;
.super Ljava/lang/Object;
.source "TwoStageDrawer.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnScrollChangedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/TwoStageDrawer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyOnScrollChangeListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/TwoStageDrawer;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/TwoStageDrawer;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/TwoStageDrawer;Lcom/miui/gallery/widget/TwoStageDrawer$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;-><init>(Lcom/miui/gallery/widget/TwoStageDrawer;)V

    return-void
.end method


# virtual methods
.method public onScrollChanged()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1500(Lcom/miui/gallery/widget/TwoStageDrawer;)Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1500(Lcom/miui/gallery/widget/TwoStageDrawer;)Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;->canScrollDown()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1600(Lcom/miui/gallery/widget/TwoStageDrawer;)Z

    move-result v1

    if-eq v1, v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-static {v1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->access$1602(Lcom/miui/gallery/widget/TwoStageDrawer;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/TwoStageDrawer$MyOnScrollChangeListener;->this$0:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->invalidate()V

    :cond_1
    return-void
.end method
