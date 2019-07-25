.class public abstract Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;
.super Ljava/lang/Object;
.source "OverScrollBounceEffectDecoratorBase.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollingState;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$MotionAttributes;
    }
.end annotation


# instance fields
.field protected final mBounceBackState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;

.field protected mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

.field protected final mIdleState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;

.field protected final mOverScrollingState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollingState;

.field protected final mStartAttr:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

.field protected mVelocity:F

.field protected final mViewAdapter:Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;FFF)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mStartAttr:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollStartAttributes;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mViewAdapter:Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;F)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mBounceBackState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$BounceBackState;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollingState;

    invoke-direct {p1, p0, p3, p4}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollingState;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;FF)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mOverScrollingState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$OverScrollingState;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mIdleState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mIdleState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IdleState;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->attach()V

    return-void
.end method


# virtual methods
.method protected attach()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->getView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/view/View;->setOverScrollMode(I)V

    return-void
.end method

.method protected abstract createAnimationAttributes()Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;
.end method

.method protected abstract createMotionAttributes()Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$MotionAttributes;
.end method

.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mViewAdapter:Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;->getView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method protected issueStateTransition(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    invoke-interface {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;->handleEntryTransition(Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;)V

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;->handleMoveTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    :pswitch_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;->mCurrentState:Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;

    invoke-interface {p1, p2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$IDecoratorState;->handleUpOrCancelTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected abstract translateView(Landroid/view/View;F)V
.end method

.method protected abstract translateViewAndEvent(Landroid/view/View;FLandroid/view/MotionEvent;)V
.end method
