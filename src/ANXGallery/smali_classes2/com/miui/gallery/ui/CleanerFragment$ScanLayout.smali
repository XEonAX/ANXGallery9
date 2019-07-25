.class Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;
.super Ljava/lang/Object;
.source "CleanerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/CleanerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScanLayout"
.end annotation


# instance fields
.field private mFlexAnimator:Landroid/animation/ValueAnimator;

.field private mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

.field public mView:Landroid/view/View;

.field final synthetic this$0:Lcom/miui/gallery/ui/CleanerFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/CleanerFragment;Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mView:Landroid/view/View;

    new-instance p2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$1100(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result p1

    const/4 v0, -0x1

    invoke-direct {p2, v0, p1}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    iput-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mView:Landroid/view/View;

    const p2, 0x7f05005c

    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->setHeight(I)V

    return-void
.end method

.method private cancelAnimation()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    :cond_0
    return-void
.end method

.method private initFlexAnimator(II)V
    .locals 3

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput p2, v1, p1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    new-instance p2, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    new-instance p2, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout$1;-><init>(Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;)V

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-void
.end method

.method private setHeight(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mView:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$400(Lcom/miui/gallery/ui/CleanerFragment;)Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/CleanerFragment$ActionLayout;->setMarginTop(I)V

    return-void
.end method


# virtual methods
.method public expand(Z)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->expand(ZJ)V

    return-void
.end method

.method public expand(ZJ)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->cancelAnimation()V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$1100(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->setHeight(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$1100(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$1100(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->initFlexAnimator(II)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_1
    :goto_0
    return-void
.end method

.method public isAnimationRunning()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public retract(Z)V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->retract(ZJ)V

    return-void
.end method

.method public retract(ZJ)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->cancelAnimation()V

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/CleanerFragment;->access$1200(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->setHeight(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mLayoutParams:Landroid/view/ViewGroup$LayoutParams;

    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$1200(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result v0

    if-eq p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->this$0:Lcom/miui/gallery/ui/CleanerFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/CleanerFragment;->access$1200(Lcom/miui/gallery/ui/CleanerFragment;)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->initFlexAnimator(II)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p2, p3}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerFragment$ScanLayout;->mFlexAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :cond_1
    :goto_0
    return-void
.end method
