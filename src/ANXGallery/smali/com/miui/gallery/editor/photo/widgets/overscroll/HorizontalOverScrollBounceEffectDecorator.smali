.class public Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;
.super Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;
.source "HorizontalOverScrollBounceEffectDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$AnimationAttributesHorizontal;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$MotionAttributesHorizontal;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;)V
    .locals 3

    const/high16 v0, 0x40400000    # 3.0f

    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v2, -0x40000000    # -2.0f

    invoke-direct {p0, p1, v0, v1, v2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;FFF)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;FFF)V
    .locals 0

    invoke-direct {p0, p1, p4, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;FFF)V

    return-void
.end method

.method public static setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;)V

    return-void
.end method

.method public static setOverScrollEffect(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;-><init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;)V

    return-void
.end method


# virtual methods
.method protected createAnimationAttributes()Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$AnimationAttributes;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$AnimationAttributesHorizontal;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$AnimationAttributesHorizontal;-><init>()V

    return-object v0
.end method

.method protected createMotionAttributes()Lcom/miui/gallery/editor/photo/widgets/overscroll/OverScrollBounceEffectDecoratorBase$MotionAttributes;
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$MotionAttributesHorizontal;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/HorizontalOverScrollBounceEffectDecorator$MotionAttributesHorizontal;-><init>()V

    return-object v0
.end method

.method protected translateView(Landroid/view/View;F)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    return-void
.end method

.method protected translateViewAndEvent(Landroid/view/View;FLandroid/view/MotionEvent;)V
    .locals 0

    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    const/4 p1, 0x0

    invoke-virtual {p3, p1}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    sub-float/2addr p2, p1

    const/4 p1, 0x0

    invoke-virtual {p3, p2, p1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    return-void
.end method
