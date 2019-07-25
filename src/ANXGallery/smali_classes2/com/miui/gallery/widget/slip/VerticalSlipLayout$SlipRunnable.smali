.class Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;
.super Ljava/lang/Object;
.source "VerticalSlipLayout.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/slip/VerticalSlipLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlipRunnable"
.end annotation


# instance fields
.field private isAbort:Z

.field private final mInterpolator:Landroid/view/animation/Interpolator;

.field private mScroller:Landroid/widget/Scroller;

.field private mTargetY:I

.field final synthetic this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    new-instance p1, Landroid/widget/Scroller;

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mInterpolator:Landroid/view/animation/Interpolator;

    invoke-direct {p1, p2, v0}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    return-void
.end method

.method private completeSlip()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1402(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget v2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mTargetY:I

    invoke-static {v0, v2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1100(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$700(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-static {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1200(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)V

    return-void
.end method


# virtual methods
.method public abort()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1402(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Z)Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->isAbort:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->abortAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->isFinished()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrY()I

    move-result v1

    int-to-float v1, v1

    invoke-static {v0, v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1000(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;F)V

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->isAbort:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->completeSlip()V

    :cond_1
    return-void
.end method

.method public slipTo(II)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->abort()V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->isAbort:Z

    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-static {v0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1300(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)I

    move-result v3

    sub-int v5, p1, v3

    iput p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mTargetY:I

    if-nez v5, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->completeSlip()V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-static {v1}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1500(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;)I

    move-result v1

    if-ne v1, p1, :cond_1

    const/4 p2, 0x1

    :cond_1
    invoke-static {v0, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$1402(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    const/4 p2, 0x2

    invoke-static {p1, p2}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->access$700(Lcom/miui/gallery/widget/slip/VerticalSlipLayout;I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->mScroller:Landroid/widget/Scroller;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/16 v6, 0xfa

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/slip/VerticalSlipLayout$SlipRunnable;->this$0:Lcom/miui/gallery/widget/slip/VerticalSlipLayout;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/widget/slip/VerticalSlipLayout;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
