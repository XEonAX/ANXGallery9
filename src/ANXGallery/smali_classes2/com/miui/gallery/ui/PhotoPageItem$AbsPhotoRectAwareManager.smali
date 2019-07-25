.class public abstract Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;
.super Ljava/lang/Object;
.source "PhotoPageItem.java"

# interfaces
.implements Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/PhotoPageItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x404
    name = "AbsPhotoRectAwareManager"
.end annotation


# instance fields
.field private isDrawableDisplayInside:Z

.field private isRotating:Z

.field protected mMargin:I

.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageItem;


# direct methods
.method protected constructor <init>(Lcom/miui/gallery/ui/PhotoPageItem;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract adjustLocation(ZLandroid/graphics/RectF;Z)V
.end method

.method protected abstract changeVisibilityForSpecialScene()V
.end method

.method protected generateHideAnimation()Landroid/view/animation/Animation;
    .locals 11

    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const/high16 v3, 0x3f800000    # 1.0f

    const v4, 0x3f4ccccd    # 0.8f

    const/high16 v5, 0x3f800000    # 1.0f

    const v6, 0x3f4ccccd    # 0.8f

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    move-object v2, v1

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    return-object v0
.end method

.method protected generateShowAnimation()Landroid/view/animation/Animation;
    .locals 11

    new-instance v0, Landroid/view/animation/AnimationSet;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    new-instance v1, Landroid/view/animation/ScaleAnimation;

    const v3, 0x3f4ccccd    # 0.8f

    const/high16 v4, 0x3f800000    # 1.0f

    const v5, 0x3f4ccccd    # 0.8f

    const/high16 v6, 0x3f800000    # 1.0f

    const/4 v7, 0x1

    const/high16 v8, 0x3f000000    # 0.5f

    const/4 v9, 0x1

    const/high16 v10, 0x3f000000    # 0.5f

    move-object v2, v1

    invoke-direct/range {v2 .. v10}, Landroid/view/animation/ScaleAnimation;-><init>(FFFFIFIF)V

    new-instance v2, Landroid/view/animation/AlphaAnimation;

    const/4 v3, 0x0

    invoke-direct {v2, v3, v4}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    invoke-virtual {v0, v2}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AnimationSet;->setInterpolator(Landroid/view/animation/Interpolator;)V

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    return-object v0
.end method

.method protected getAdjustAnimDuration(Z)I
    .locals 0

    if-eqz p1, :cond_0

    const/16 p1, 0x15e

    goto :goto_0

    :cond_0
    const/16 p1, 0xfa

    :goto_0
    return p1
.end method

.method protected getAdjustAnimInterpolator(Z)Landroid/view/animation/Interpolator;
    .locals 0

    if-eqz p1, :cond_0

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    goto :goto_0

    :cond_0
    new-instance p1, Lmiui/view/animation/CubicEaseInInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseInInterpolator;-><init>()V

    :goto_0
    return-object p1
.end method

.method protected getHorizontalMargin()I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->getVerticalMargin()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    iget v1, v1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-static {v1}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetRight(Landroid/view/View;)I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    add-int/2addr v0, v1

    return v0
.end method

.method protected getLeftInset()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    iget v0, v0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-static {v0}, Lcom/miui/gallery/compat/view/ViewCompat;->getSystemWindowInsetLeft(Landroid/view/View;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected getMaxTranslationX()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    return v0
.end method

.method protected getMaxTranslationY()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    return v0
.end method

.method protected getVerticalMargin()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->mMargin:I

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/PhotoPageItem;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06012d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->mMargin:I

    :cond_0
    iget v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->mMargin:I

    return v0
.end method

.method protected isDrawableDisplayInside()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isDrawableDisplayInside:Z

    return v0
.end method

.method protected isRotating()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    return v0
.end method

.method public onActionModeChanged(Z)V
    .locals 2

    const-string v0, "PhotoPageItem"

    const-string v1, "onActionModeChanged %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->changeVisibilityForSpecialScene()V

    return-void
.end method

.method public final onMatrixChanged(Landroid/graphics/RectF;)V
    .locals 4

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v1, v1, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoView;->getBaseDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    const/high16 v3, 0x40a00000    # 5.0f

    add-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpg-float v1, v2, v1

    if-gez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iget-boolean v2, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isDrawableDisplayInside:Z

    if-eq v1, v2, :cond_1

    iput-boolean v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isDrawableDisplayInside:Z

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onScaleInsideChanged(Z)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageItem;->isActionBarVisible()Z

    move-result v1

    invoke-virtual {p0, v1, p1, v0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->adjustLocation(ZLandroid/graphics/RectF;Z)V

    return-void
.end method

.method public onRotate(FFFF)V
    .locals 0

    return-void
.end method

.method public final onRotateBegin(F)V
    .locals 0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    iget-boolean p1, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onRotateStateChanged(Z)V

    return-void
.end method

.method public final onRotateEnd(F)V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    iget-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->onRotateStateChanged(Z)V

    new-instance v0, Landroid/util/ArrayMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/util/ArrayMap;-><init>(I)V

    const-string v1, "toDegree"

    invoke-static {p1}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo"

    const-string v1, "manual_rotate"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public onRotateStateChanged(Z)V
    .locals 2

    const-string v0, "PhotoPageItem"

    const-string v1, "onRotateStateChanged %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->changeVisibilityForSpecialScene()V

    return-void
.end method

.method public onScaleInsideChanged(Z)V
    .locals 2

    const-string v0, "PhotoPageItem"

    const-string v1, "onScaleInsideChanged %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->changeVisibilityForSpecialScene()V

    return-void
.end method

.method public onSelected()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    invoke-virtual {v0, p0}, Luk/co/senab/photoview/PhotoView;->setOnRotateListener(Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;)V

    return-void
.end method

.method public onUnSelected()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->this$0:Lcom/miui/gallery/ui/PhotoPageItem;

    iget-object v0, v0, Lcom/miui/gallery/ui/PhotoPageItem;->mPhotoView:Luk/co/senab/photoview/PhotoView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoView;->setOnRotateListener(Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;)V

    return-void
.end method

.method public release()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isRotating:Z

    iput-boolean v0, p0, Lcom/miui/gallery/ui/PhotoPageItem$AbsPhotoRectAwareManager;->isDrawableDisplayInside:Z

    return-void
.end method
