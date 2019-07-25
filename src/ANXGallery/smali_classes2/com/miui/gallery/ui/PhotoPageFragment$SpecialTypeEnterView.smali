.class Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;
.super Ljava/lang/Object;
.source "PhotoPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SpecialTypeEnterView"
.end annotation


# instance fields
.field private mCommonEnterView:Landroid/view/View;

.field private mEnterHideAnim:Landroid/view/animation/Animation;

.field private mEnterShowAnim:Landroid/view/animation/Animation;

.field private mSystemWindowInsetBottom:I

.field private mVideoEnterView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;Landroid/view/View$OnClickListener;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    const v2, 0x7f0b0162

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-virtual {v3, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportNewVideoPlayer()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->updatePosition()V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    new-instance p2, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$SpecialTypeEnterView$ly---IOcFyT6XrEFxpp_QpD3IUE;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/-$$Lambda$PhotoPageFragment$SpecialTypeEnterView$ly---IOcFyT6XrEFxpp_QpD3IUE;-><init>(Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;)V

    invoke-static {p1, p2}, Landroid/support/v4/view/ViewCompat;->setOnApplyWindowInsetsListener(Landroid/view/View;Landroid/support/v4/view/OnApplyWindowInsetsListener;)V

    return-void
.end method

.method private getInsetBottom(Landroid/view/View;)I
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result p1

    return p1
.end method

.method private hide(Landroid/view/View;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterHideAnim:Landroid/view/animation/Animation;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f010016

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterHideAnim:Landroid/view/animation/Animation;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterHideAnim:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method public static synthetic lambda$new$9(Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;Landroid/view/View;Landroid/support/v4/view/WindowInsetsCompat;)Landroid/support/v4/view/WindowInsetsCompat;
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-static {p1}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetBottom(Landroid/view/View;)I

    move-result p1

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mSystemWindowInsetBottom:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mSystemWindowInsetBottom:I

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->updatePosition()V

    :cond_0
    return-object p2
.end method

.method private show(Landroid/view/View;)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterShowAnim:Landroid/view/animation/Animation;

    if-nez v0, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f010015

    invoke-static {v0, v1}, Landroid/view/animation/AnimationUtils;->loadAnimation(Landroid/content/Context;I)Landroid/view/animation/Animation;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterShowAnim:Landroid/view/animation/Animation;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mEnterShowAnim:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method private startViewAlphaAnim(Landroid/view/View;Z)V
    .locals 2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    if-eqz p2, :cond_0

    const/high16 p2, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    new-instance p2, Lmiui/view/animation/SineEaseInOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/SineEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_1
    return-void
.end method

.method private updatePosition()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    const v1, 0x7f060480

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->updateViewPosition(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    const v1, 0x7f060488

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->updateViewPosition(Landroid/view/View;I)V

    return-void
.end method

.method private updateViewPosition(Landroid/view/View;I)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v0, :cond_1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->getInsetBottom(Landroid/view/View;)I

    move-result v1

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    add-int/2addr v1, p2

    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    return-void
.end method


# virtual methods
.method setVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method startEnterAlphaAnim(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->startViewAlphaAnim(Landroid/view/View;Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->startViewAlphaAnim(Landroid/view/View;Z)V

    return-void
.end method

.method update(ZZII)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    if-nez v0, :cond_0

    const/4 p2, 0x0

    :cond_0
    if-eqz p1, :cond_3

    if-eqz p2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->show(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->hide(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->show(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->hide(Landroid/view/View;)V

    :goto_0
    instance-of p2, p1, Landroid/widget/ImageView;

    if-eqz p2, :cond_2

    check-cast p1, Landroid/widget/ImageView;

    invoke-virtual {p1, p3}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_1

    :cond_2
    instance-of p2, p1, Landroid/widget/TextView;

    if-eqz p2, :cond_4

    move-object p2, p1

    check-cast p2, Landroid/widget/TextView;

    invoke-virtual {p2, p4}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p2, p1, p3, p3, p3}, Landroid/widget/TextView;->setCompoundDrawablesRelativeWithIntrinsicBounds(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    goto :goto_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mCommonEnterView:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->hide(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->mVideoEnterView:Landroid/view/View;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageFragment$SpecialTypeEnterView;->hide(Landroid/view/View;)V

    :cond_4
    :goto_1
    return-void
.end method
