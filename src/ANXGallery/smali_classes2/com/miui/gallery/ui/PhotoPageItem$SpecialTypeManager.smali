.class public Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;
.super Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;
.source "PhotoPageItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "SpecialTypeManager"
.end annotation


# instance fields
.field private mHasShowIndicator:Z

.field private mIndicatorText:Ljava/lang/String;

.field private mTypeIndicator:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;-><init>(Lcom/miui/gallery/ui/PhotoPageItem;)V

    return-void
.end method

.method static synthetic access$2700(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;)Landroid/widget/TextView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->showIndicator(Z)Z

    move-result p0

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    move-result p0

    return p0
.end method

.method private doAdjustLocation(ZLandroid/graphics/RectF;)V
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageItem;->getActionBarHeight()I

    move-result p1

    int-to-float p1, p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p2, :cond_1

    iget v1, p2, Landroid/graphics/RectF;->top:F

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    if-eqz p2, :cond_2

    iget p2, p2, Landroid/graphics/RectF;->left:F

    goto :goto_2

    :cond_2
    const/4 p2, 0x0

    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->getMaxTranslationY()F

    move-result v2

    invoke-static {p1, v1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->getVerticalMargin()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr p1, v1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->getMaxTranslationX()F

    move-result v1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(FF)F

    move-result p2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->getHorizontalMargin()I

    move-result v0

    int-to-float v0, v0

    add-float/2addr p2, v0

    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTranslationY(F)V

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTranslationX(F)V

    return-void
.end method

.method private hideIndicator(Z)Z
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mHasShowIndicator:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->clearAnimation()V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->generateHideAnimation()Landroid/view/animation/Animation;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager$1;-><init>(Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;)V

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setVisibility(I)V

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method private initLayout()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b0163

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mIndicatorText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/PhotoPageItem;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method private showIndicator(Z)Z
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->needShowIndicatorView()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mHasShowIndicator:Z

    invoke-direct {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->initLayout()V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getVisibility()I

    move-result v2

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->clearAnimation()V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v3, v3, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v3}, Luk/co/senab/photoview/PhotoView;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {p0, v2, v3, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->generateShowAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/widget/TextView;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return v0

    :cond_1
    return v1
.end method


# virtual methods
.method public adjustLocation(ZLandroid/graphics/RectF;Z)V
    .locals 0

    iget-boolean p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mHasShowIndicator:Z

    if-nez p3, :cond_0

    return-void

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {p3}, Landroid/widget/TextView;->getVisibility()I

    move-result p3

    if-nez p3, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->doAdjustLocation(ZLandroid/graphics/RectF;)V

    :cond_1
    return-void
.end method

.method protected changeVisibilityForSpecialScene()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->needShowIndicatorView()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->showIndicator(Z)Z

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->clearAnimation()V

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    :goto_0
    return-void
.end method

.method protected generateHideAnimation()Landroid/view/animation/Animation;
    .locals 4

    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v1, Landroid/view/animation/AlphaAnimation;

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    invoke-direct {v1, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    return-object v0
.end method

.method protected generateShowAnimation()Landroid/view/animation/Animation;
    .locals 4

    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v1, Landroid/view/animation/AlphaAnimation;

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    return-object v0
.end method

.method protected getHorizontalMargin()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06047d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    return v0
.end method

.method protected getVerticalMargin()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06047d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mMargin:I

    return v0
.end method

.method protected needShowIndicatorView()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->isInActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->isRotating()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->isDrawableDisplayInside()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mIndicatorText:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->access$2600(Lcom/miui/gallery/ui/PhotoPageItem;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onActionBarVisibleChanged(Z)V
    .locals 1

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->showIndicator(Z)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    :goto_0
    return-void
.end method

.method public onSelected()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onSelected()V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->access$2600(Lcom/miui/gallery/ui/PhotoPageItem;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->showIndicator(Z)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    :goto_0
    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->hideIndicator(Z)Z

    invoke-super {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->release()V

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mHasShowIndicator:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    return-void
.end method

.method public setTypeIndicatorText(Ljava/lang/String;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mIndicatorText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$SpecialTypeManager;->mTypeIndicator:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method
