.class public Lcom/miui/gallery/widget/PanelBar;
.super Landroid/widget/FrameLayout;
.source "PanelBar.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/PanelBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/PanelBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private loadAnimator(Z)Landroid/animation/Animator;
    .locals 2

    const/4 v0, 0x2

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    const-string p1, "alpha"

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    invoke-static {v1, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, "alpha"

    new-array v0, v0, [F

    fill-array-data v0, :array_1

    invoke-static {v1, p1, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    :goto_0
    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    return-object p1

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method private refreshVisibility()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PanelBar;->getChildCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->setVisibility(I)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->setVisibility(I)V

    :goto_0
    return-void
.end method


# virtual methods
.method protected onAttachedToWindow()V
    .locals 0

    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelBar;->refreshVisibility()V

    return-void
.end method

.method public removeItem(Z)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PanelBar;->getChildCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v1, 0x0

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/PanelBar;->loadAnimator(Z)Landroid/animation/Animator;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->startViewTransition(Landroid/view/View;)V

    new-instance v2, Lcom/miui/gallery/widget/PanelBar$2;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/widget/PanelBar$2;-><init>(Lcom/miui/gallery/widget/PanelBar;Landroid/view/View;)V

    invoke-virtual {v1, v2}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v1, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    invoke-virtual {v1}, Landroid/animation/Animator;->start()V

    if-nez p1, :cond_0

    invoke-virtual {v1}, Landroid/animation/Animator;->end()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->endViewTransition(Landroid/view/View;)V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PanelBar;->removeAllViews()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelBar;->refreshVisibility()V

    return-void
.end method

.method public replaceItem(Lcom/miui/gallery/widget/PanelItem;Z)V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PanelBar;->getChildCount()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_1

    const/4 v2, 0x0

    invoke-direct {p0, v2}, Lcom/miui/gallery/widget/PanelBar;->loadAnimator(Z)Landroid/animation/Animator;

    move-result-object v2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->startViewTransition(Landroid/view/View;)V

    new-instance v3, Lcom/miui/gallery/widget/PanelBar$1;

    invoke-direct {v3, p0, v0}, Lcom/miui/gallery/widget/PanelBar$1;-><init>(Lcom/miui/gallery/widget/PanelBar;Landroid/view/View;)V

    invoke-virtual {v2, v3}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2, v0}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    if-nez p2, :cond_0

    invoke-virtual {v2}, Landroid/animation/Animator;->end()V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->endViewTransition(Landroid/view/View;)V

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PanelBar;->removeView(Landroid/view/View;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/PanelBar;->removeAllViews()V

    if-eqz p1, :cond_5

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/PanelBar;->loadAnimator(Z)Landroid/animation/Animator;

    move-result-object v0

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    if-nez p2, :cond_2

    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    :cond_2
    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-eqz p2, :cond_4

    instance-of v0, p2, Landroid/view/ViewGroup;

    if-eqz v0, :cond_3

    check-cast p2, Landroid/view/ViewGroup;

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    goto :goto_0

    :cond_3
    return-void

    :cond_4
    :goto_0
    invoke-interface {p1}, Lcom/miui/gallery/widget/PanelItem;->getView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/PanelBar;->addView(Landroid/view/View;)V

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/widget/PanelBar;->refreshVisibility()V

    return-void
.end method
