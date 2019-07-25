.class Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;
.super Ljava/lang/Object;
.source "TransitionHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Transition"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;
    }
.end annotation


# instance fields
.field private mDriveView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private mDuration:I

.field private mScroller:Landroid/widget/Scroller;

.field private mUpdateListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;ILandroid/view/animation/Interpolator;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p3, Ljava/lang/ref/WeakReference;

    invoke-direct {p3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mDriveView:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mUpdateListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;

    new-instance p2, Landroid/widget/Scroller;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1, p4}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object p2, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    iput p5, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mDuration:I

    return-void
.end method

.method private drive()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->getDriveView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method private getDriveView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mDriveView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v0}, Landroid/widget/Scroller;->getCurrX()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float v0, v0, v1

    const v2, 0x4cbebc20    # 1.0E8f

    div-float/2addr v0, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mUpdateListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mUpdateListener:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getFinalX()I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, v1

    div-float/2addr v4, v2

    invoke-interface {v3, v0, v4}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition$OnUpdateListener;->onUpdate(FF)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->drive()V

    :cond_1
    return-void
.end method

.method public start(FF)V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->stop()V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    const v1, 0x4cbebc20    # 1.0E8f

    mul-float v2, p1, v1

    float-to-int v2, v2

    sub-float/2addr p2, p1

    mul-float p2, p2, v1

    float-to-int v3, p2

    iget v5, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mDuration:I

    const/4 p1, 0x0

    const/4 v4, 0x0

    move v1, v2

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Landroid/widget/Scroller;->startScroll(IIIII)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->drive()V

    return-void
.end method

.method public stop()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->mScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper$Transition;->getDriveView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method
