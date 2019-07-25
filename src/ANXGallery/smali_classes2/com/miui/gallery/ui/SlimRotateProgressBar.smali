.class public Lcom/miui/gallery/ui/SlimRotateProgressBar;
.super Lcom/miui/gallery/ui/SpaceRotateProgressBar;
.source "SlimRotateProgressBar.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method protected getChangeDuration(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->getSpaceNumber()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const/16 v0, 0x3a98

    if-ge p1, v0, :cond_0

    const/16 p1, 0x1f4

    return p1

    :cond_0
    const v0, 0x7a120

    if-ge p1, v0, :cond_1

    const/16 p1, 0x7d0

    return p1

    :cond_1
    const/16 p1, 0xbb8

    return p1
.end method

.method public pause()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    const/16 v0, 0x32

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v3, "progress"

    const/4 v4, 0x2

    new-array v4, v4, [I

    iget-object v5, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v5}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v5

    aput v5, v4, v1

    const/4 v1, 0x1

    iget-object v5, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v5}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v5

    add-int/2addr v5, v0

    aput v5, v4, v1

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0xfa

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public resume()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/RotateRingView;->setStartRotateStable()V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v1, "progress"

    const/4 v2, 0x2

    new-array v2, v2, [I

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v4

    aput v4, v2, v3

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v4

    add-int/lit8 v4, v4, 0x32

    aput v4, v2, v3

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lcom/miui/gallery/ui/SlimRotateProgressBar$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/SlimRotateProgressBar$3;-><init>(Lcom/miui/gallery/ui/SlimRotateProgressBar;)V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method public setNumber(J)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZ)V

    return-void
.end method

.method public setNumber(JZ)V
    .locals 2

    if-eqz p3, :cond_0

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->cancelAllAnim()V

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    long-to-int p1, p1

    iget-object p2, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    iget-object p3, p0, Lcom/miui/gallery/ui/SlimRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {p3}, Lcom/miui/gallery/widget/RotateRingView;->getHeadMinAlpha()I

    move-result p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/RotateRingView;->setHeadMaxAlpha(I)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->changeNumberWithNoAnim(I)V

    :goto_0
    return-void
.end method

.method public setNumber(JZLjava/lang/Runnable;)V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->startRotateRingAnim(Z)V

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    long-to-int p1, p1

    if-eqz p4, :cond_0

    new-instance p2, Lcom/miui/gallery/ui/SlimRotateProgressBar$1;

    invoke-direct {p2, p0, p4}, Lcom/miui/gallery/ui/SlimRotateProgressBar$1;-><init>(Lcom/miui/gallery/ui/SlimRotateProgressBar;Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->getSpaceNumber()I

    move-result p3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->getSpaceNumber()I

    move-result p4

    sub-int p4, p1, p4

    mul-int/lit8 p4, p4, 0x7

    div-int/lit8 p4, p4, 0xa

    add-int/2addr p3, p4

    new-instance p4, Lcom/miui/gallery/ui/SlimRotateProgressBar$2;

    invoke-direct {p4, p0, p1, p2}, Lcom/miui/gallery/ui/SlimRotateProgressBar$2;-><init>(Lcom/miui/gallery/ui/SlimRotateProgressBar;ILandroid/animation/AnimatorListenerAdapter;)V

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->changeNumberWithAnim(ILandroid/animation/AnimatorListenerAdapter;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/SlimRotateProgressBar;->changeNumberWithAnim(ILandroid/animation/AnimatorListenerAdapter;)V

    :goto_1
    return-void
.end method
