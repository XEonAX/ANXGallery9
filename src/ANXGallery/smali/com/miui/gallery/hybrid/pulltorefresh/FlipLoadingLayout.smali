.class public Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;
.super Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;
.source "FlipLoadingLayout.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# instance fields
.field private final mResetRotateAnimation:Landroid/view/animation/Animation;

.field private final mRotateAnimation:Landroid/view/animation/Animation;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;Landroid/content/res/TypedArray;)V
    .locals 9

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/hybrid/pulltorefresh/LoadingLayout;-><init>(Landroid/content/Context;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;Landroid/content/res/TypedArray;)V

    sget-object p1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->PULL_FROM_START:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    if-ne p2, p1, :cond_0

    const/16 p1, -0xb4

    goto :goto_0

    :cond_0
    const/16 p1, 0xb4

    :goto_0
    new-instance p2, Landroid/view/animation/RotateAnimation;

    const/4 v1, 0x0

    int-to-float p1, p1

    const/4 v3, 0x1

    const/high16 v4, 0x3f000000    # 0.5f

    const/4 v5, 0x1

    const/high16 v6, 0x3f000000    # 0.5f

    move-object v0, p2

    move v2, p1

    invoke-direct/range {v0 .. v6}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    sget-object p3, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->ANIMATION_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {p2, p3}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    const-wide/16 p3, 0x96

    invoke-virtual {p2, p3, p4}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    new-instance p2, Landroid/view/animation/RotateAnimation;

    const/4 v4, 0x0

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    move-object v2, p2

    move v3, p1

    invoke-direct/range {v2 .. v8}, Landroid/view/animation/RotateAnimation;-><init>(FFIFIF)V

    iput-object p2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mResetRotateAnimation:Landroid/view/animation/Animation;

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mResetRotateAnimation:Landroid/view/animation/Animation;

    sget-object p2, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->ANIMATION_INTERPOLATOR:Landroid/view/animation/Interpolator;

    invoke-virtual {p1, p2}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mResetRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p1, p3, p4}, Landroid/view/animation/Animation;->setDuration(J)V

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mResetRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    return-void
.end method

.method private getDrawableRotationAngle()F
    .locals 2

    sget-object v0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout$1;->$SwitchMap$com$miui$gallery$hybrid$pulltorefresh$PullToRefreshBase$Mode:[I

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mMode:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;

    invoke-virtual {v1}, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Mode;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mScrollDirection:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->HORIZONTAL:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    if-ne v0, v1, :cond_1

    const/high16 v0, 0x43870000    # 270.0f

    goto :goto_1

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mScrollDirection:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    sget-object v1, Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;->HORIZONTAL:Lcom/miui/gallery/hybrid/pulltorefresh/PullToRefreshBase$Orientation;

    if-ne v0, v1, :cond_0

    const/high16 v0, 0x42b40000    # 90.0f

    goto :goto_1

    :cond_0
    const/high16 v0, 0x43340000    # 180.0f

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x0

    :goto_1
    return v0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected getDefaultDrawableResId()I
    .locals 1

    const v0, 0x7f070166

    return v0
.end method

.method protected onLoadingDrawableSet(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result v2

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v2, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v2}, Landroid/widget/ImageView;->requestLayout()V

    iget-object v2, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    sget-object v3, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iget v3, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    sub-int/2addr v3, p1

    int-to-float p1, v3

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr p1, v3

    iget v4, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    sub-int/2addr v4, v0

    int-to-float v0, v4

    div-float/2addr v0, v3

    invoke-virtual {v2, p1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-direct {p0}, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->getDrawableRotationAngle()F

    move-result p1

    iget v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float v0, v0

    div-float/2addr v0, v3

    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {v2, p1, v0, v1}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    return-void
.end method

.method protected onPullImpl(F)V
    .locals 0

    return-void
.end method

.method protected pullToRefreshImpl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/widget/ImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mResetRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    :cond_0
    return-void
.end method

.method protected refreshingImpl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    return-void
.end method

.method protected releaseToRefreshImpl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    iget-object v1, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mRotateAnimation:Landroid/view/animation/Animation;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->startAnimation(Landroid/view/animation/Animation;)V

    return-void
.end method

.method protected resetImpl()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->clearAnimation()V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderProgress:Landroid/widget/ProgressBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/hybrid/pulltorefresh/FlipLoadingLayout;->mHeaderImage:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method
