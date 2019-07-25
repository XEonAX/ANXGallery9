.class public Lcom/miui/gallery/search/transitions/ChangeTextView;
.super Landroid/transition/Transition;
.source "ChangeTextView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;,
        Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/transition/Transition;-><init>()V

    return-void
.end method

.method static synthetic access$000(FI)I
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/search/transitions/ChangeTextView;->colorWithAlpha(FI)I

    move-result p0

    return p0
.end method

.method private captureValues(Landroid/transition/TransitionValues;)V
    .locals 4

    iget-object v0, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p1, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    const-string v2, "customtransition:change_text_view:text"

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/search/transitions/ChangeTextView;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p1, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    const-string v2, "customtransition:change_text_view:text_color"

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p1, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    const-string v2, "customtransition:change_text_view:hint"

    invoke-virtual {v0}, Landroid/widget/TextView;->getHint()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/miui/gallery/search/transitions/ChangeTextView;->nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p1, Landroid/transition/TransitionValues;->values:Ljava/util/Map;

    const-string v1, "customtransition:change_text_view:hint_color"

    invoke-virtual {v0}, Landroid/widget/TextView;->getCurrentHintTextColor()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private static colorWithAlpha(FI)I
    .locals 2

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float p0, p0, v0

    float-to-int p0, p0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v1

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    invoke-static {p0, v0, v1, p1}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method private nullToEmpty(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 0

    if-nez p1, :cond_0

    const-string p1, ""

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method


# virtual methods
.method public captureEndValues(Landroid/transition/TransitionValues;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/transitions/ChangeTextView;->captureValues(Landroid/transition/TransitionValues;)V

    return-void
.end method

.method public captureStartValues(Landroid/transition/TransitionValues;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/transitions/ChangeTextView;->captureValues(Landroid/transition/TransitionValues;)V

    return-void
.end method

.method public createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
    .locals 3

    const/4 p1, 0x0

    if-eqz p2, :cond_2

    if-nez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p3, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/TextView;

    if-eqz v0, :cond_1

    const/4 p1, 0x2

    new-array p1, p1, [F

    fill-array-data p1, :array_0

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;

    iget-object v1, p3, Landroid/transition/TransitionValues;->view:Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    new-instance v2, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    invoke-direct {v2, p2}, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;-><init>(Landroid/transition/TransitionValues;)V

    new-instance p2, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;

    invoke-direct {p2, p3}, Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;-><init>(Landroid/transition/TransitionValues;)V

    invoke-direct {v0, v1, v2, p2}, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;-><init>(Landroid/widget/TextView;Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;Lcom/miui/gallery/search/transitions/ChangeTextView$ValueHolder;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/search/transitions/ChangeTextView$TextAnimationUpdater;->getInterpolator()Landroid/view/animation/Interpolator;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    return-object p1

    :cond_1
    return-object p1

    :cond_2
    :goto_0
    return-object p1

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
