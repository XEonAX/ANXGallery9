.class Lcom/miui/gallery/editor/photo/app/MenuTransition;
.super Landroid/transition/Transition;
.source "MenuTransition.java"


# instance fields
.field private mEnter:Z

.field private mExitAlphaDuration:I

.field private mExitTranslateDuration:I

.field private mTranslate:F


# direct methods
.method public constructor <init>(FZLandroid/content/res/Resources;)V
    .locals 0

    invoke-direct {p0}, Landroid/transition/Transition;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mTranslate:F

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mEnter:Z

    const p1, 0x7f0a002f

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mExitTranslateDuration:I

    const p1, 0x7f0a0030

    invoke-virtual {p3, p1}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mExitAlphaDuration:I

    return-void
.end method

.method private createEnterAnimator(Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 7

    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    sget-object v1, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v2, 0x2

    new-array v3, v2, [F

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mTranslate:F

    const/4 v5, 0x0

    aput v4, v3, v5

    const/4 v4, 0x1

    const/4 v6, 0x0

    aput v6, v3, v4

    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    sget-object v3, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v6, v2, [F

    fill-array-data v6, :array_0

    invoke-static {v3, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v2, v5

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget-object p1, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    return-object v0

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private createExitAnimator(Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 9

    new-instance v0, Landroid/animation/ObjectAnimator;

    invoke-direct {v0}, Landroid/animation/ObjectAnimator;-><init>()V

    const/4 v1, 0x1

    new-array v2, v1, [Landroid/animation/PropertyValuesHolder;

    sget-object v3, Landroid/view/View;->TRANSLATION_Y:Landroid/util/Property;

    const/4 v4, 0x2

    new-array v5, v4, [F

    const/4 v6, 0x0

    const/4 v7, 0x0

    aput v7, v5, v6

    iget v7, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mTranslate:F

    aput v7, v5, v1

    invoke-static {v3, v5}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mExitTranslateDuration:I

    int-to-long v2, v2

    invoke-virtual {v0, v2, v3}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v2, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    new-instance v2, Landroid/animation/ObjectAnimator;

    invoke-direct {v2}, Landroid/animation/ObjectAnimator;-><init>()V

    new-array v3, v1, [Landroid/animation/PropertyValuesHolder;

    sget-object v5, Landroid/view/View;->ALPHA:Landroid/util/Property;

    new-array v7, v4, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Landroid/util/Property;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    aput-object v5, v3, v6

    invoke-virtual {v2, v3}, Landroid/animation/ObjectAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mExitAlphaDuration:I

    int-to-long v7, v3

    invoke-virtual {v2, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    invoke-virtual {v2, p1}, Landroid/animation/ObjectAnimator;->setTarget(Ljava/lang/Object;)V

    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    new-array v3, v4, [Landroid/animation/Animator;

    aput-object v0, v3, v6

    aput-object v2, v3, v1

    invoke-virtual {p1, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    return-object p1

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public captureEndValues(Landroid/transition/TransitionValues;)V
    .locals 0

    return-void
.end method

.method public captureStartValues(Landroid/transition/TransitionValues;)V
    .locals 0

    return-void
.end method

.method public createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 0

    if-eqz p2, :cond_2

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/MenuTransition;->mEnter:Z

    if-eqz p1, :cond_1

    invoke-direct {p0, p3}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->createEnterAnimator(Landroid/transition/TransitionValues;)Landroid/animation/Animator;

    move-result-object p1

    return-object p1

    :cond_1
    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/app/MenuTransition;->createExitAnimator(Landroid/transition/TransitionValues;)Landroid/animation/Animator;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isTransitionRequired(Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
