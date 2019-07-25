.class public Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;
.super Ljava/lang/Object;
.source "OverScrollBounceEffectDecoratorBase.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;
.implements Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "BounceBackState"
.end annotation


# instance fields
.field protected final mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

.field protected final mBounceBackInterpolator:Landroid/view/animation/Interpolator;

.field protected final mDecelerateFactor:F

.field protected final mDoubleDecelerateFactor:F

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;F)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mBounceBackInterpolator:Landroid/view/animation/Interpolator;

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mDecelerateFactor:F

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p2, p2, v0

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mDoubleDecelerateFactor:F

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->createAnimationAttributes()Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    return-void
.end method


# virtual methods
.method protected createAnimator()Landroid/animation/Animator;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mViewAdapter:Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;->getView()Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->init(Landroid/view/View;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    cmpg-float v1, v1, v2

    if-gez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mStartAttr:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

    iget-boolean v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;->mDir:Z

    if-nez v1, :cond_3

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mStartAttr:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

    iget-boolean v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;->mDir:Z

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    neg-float v1, v1

    iget v3, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mDecelerateFactor:F

    div-float/2addr v1, v3

    cmpg-float v3, v1, v2

    if-gez v3, :cond_2

    const/4 v1, 0x0

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v2, v2, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    neg-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget v3, v3, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mVelocity:F

    mul-float v2, v2, v3

    iget v3, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mDoubleDecelerateFactor:F

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    iget v3, v3, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->mAbsOffset:F

    add-float/2addr v3, v2

    float-to-int v1, v1

    invoke-virtual {p0, v0, v1, v3}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->createSlowdownAnimator(Landroid/view/View;IF)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {p0, v3}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->createBounceBackAnimator(F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v3, 0x2

    new-array v3, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    return-object v2

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    iget v0, v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->mAbsOffset:F

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->createBounceBackAnimator(F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    return-object v0
.end method

.method protected createBounceBackAnimator(F)Landroid/animation/ObjectAnimator;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mViewAdapter:Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;->getView()Landroid/view/View;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    iget v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->mMaxOffset:F

    div-float/2addr p1, v1

    const/high16 v1, 0x44480000    # 800.0f

    mul-float p1, p1, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->mProperty:Landroid/util/Property;

    const/4 v2, 0x1

    new-array v2, v2, [F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v3, v3, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mStartAttr:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

    iget v3, v3, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;->mAbsOffset:F

    const/4 v4, 0x0

    aput v3, v2, v4

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    float-to-int p1, p1

    const/16 v1, 0xc8

    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mBounceBackInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v0, p0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object v0
.end method

.method protected createSlowdownAnimator(Landroid/view/View;IF)Landroid/animation/ObjectAnimator;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mAnimAttributes:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;->mProperty:Landroid/util/Property;

    const/4 v1, 0x1

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p3, v1, v2

    invoke-static {p1, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    int-to-long p2, p2

    invoke-virtual {p1, p2, p3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->mBounceBackInterpolator:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1, p0}, Landroid/animation/ObjectAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    return-object p1
.end method

.method public handleEntryTransition(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->createAnimator()Landroid/animation/Animator;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method public handleMoveTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public handleUpOrCancelTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;->this$0:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mIdleState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->issueStateTransition(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;)V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 0

    return-void
.end method
