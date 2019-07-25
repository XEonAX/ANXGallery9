.class Luk/co/senab/photoview/PhotoViewAttacher$Transition;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/photoview/PhotoViewAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Transition"
.end annotation


# instance fields
.field private isExitTransition:Z

.field private isExited:Z

.field private isRunning:Z

.field private mAlphaScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

.field private mClipMatrix:Landroid/graphics/Matrix;

.field private mClipRect:Landroid/graphics/RectF;

.field private mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

.field private mCurrentX:I

.field private mCurrentY:I

.field public mListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

.field private mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

.field private mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

.field final synthetic this$0:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method public constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-static {p2, v0}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mAlphaScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-static {p2, p1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-static {p2, p1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-static {p2, p1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getScroller(Landroid/content/Context;Landroid/view/animation/Interpolator;)Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    move-result-object p1

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipMatrix:Landroid/graphics/Matrix;

    return-void
.end method


# virtual methods
.method public alpha(FF)V
    .locals 6

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mAlphaScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const v1, 0x461c4000    # 10000.0f

    mul-float v2, p1, v1

    float-to-int v2, v2

    sub-float/2addr p2, p1

    mul-float p2, p2, v1

    float-to-int v3, p2

    const/4 p1, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x96

    move v1, v2

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->startScroll(IIIII)V

    return-void
.end method

.method public clip(FFFF)V
    .locals 9

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v1, v0, Landroid/graphics/RectF;->left:F

    iget v2, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v2, p1, p2, v1, v1}, Landroid/graphics/Matrix;->setScale(FFFF)V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    float-to-int v4, p1

    mul-float p2, p2, v0

    float-to-int v5, p2

    mul-float p3, p3, v0

    float-to-int v6, p3

    mul-float p4, p4, v0

    float-to-int v7, p4

    const/16 v8, 0x96

    invoke-virtual/range {v3 .. v8}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->startScroll(IIIII)V

    return-void
.end method

.method public ensureAlpha(Z)V
    .locals 2

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    if-eqz p1, :cond_1

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F

    move-result p1

    invoke-static {p1, v1}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F

    move-result v0

    goto :goto_0

    :cond_1
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F

    move-result p1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result p1

    if-eqz p1, :cond_2

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_0

    :cond_2
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F

    move-result v1

    move v0, v1

    :goto_0
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$800(Luk/co/senab/photoview/PhotoViewAttacher;F)V

    return-void
.end method

.method public getClipRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public isExited()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExited:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    return v0
.end method

.method public run()V
    .locals 14

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    const/4 v1, 0x4

    if-nez v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    return-void

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_d

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->computeScrollOffset()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v2

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentX:I

    sub-int/2addr v2, v5

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrY()I

    move-result v5

    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentY:I

    sub-int/2addr v5, v6

    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    int-to-float v2, v2

    int-to-float v5, v5

    invoke-static {v6, v2, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->access$300(Luk/co/senab/photoview/PhotoViewAttacher;FF)V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v2

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentX:I

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrY()I

    move-result v2

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentY:I

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->computeScrollOffset()Z

    move-result v5

    const v6, 0x461c4000    # 10000.0f

    if-eqz v5, :cond_3

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v2

    int-to-float v2, v2

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v5}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v5

    mul-float v5, v5, v6

    div-float/2addr v2, v5

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v7}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-static {v5, v7}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v5

    if-eqz v5, :cond_2

    iget-object v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget v8, v5, Landroid/graphics/RectF;->left:F

    iget v5, v5, Landroid/graphics/RectF;->top:F

    invoke-static {v7, v2, v2, v8, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->access$900(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    :cond_2
    const/4 v2, 0x1

    :cond_3
    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->computeScrollOffset()Z

    move-result v5

    const/high16 v7, 0x3f800000    # 1.0f

    if-eqz v5, :cond_7

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v2}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v7

    div-float/2addr v2, v6

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrY()I

    move-result v5

    int-to-float v5, v5

    mul-float v5, v5, v7

    div-float/2addr v5, v6

    iget-object v8, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v9, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v9}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    invoke-static {v8, v9}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v8

    if-eqz v8, :cond_4

    iget-object v9, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipMatrix:Landroid/graphics/Matrix;

    iget v10, v8, Landroid/graphics/RectF;->left:F

    iget v11, v8, Landroid/graphics/RectF;->right:F

    add-float/2addr v10, v11

    const/high16 v11, 0x40000000    # 2.0f

    div-float/2addr v10, v11

    iget v12, v8, Landroid/graphics/RectF;->top:F

    iget v13, v8, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v12, v13

    div-float/2addr v12, v11

    invoke-virtual {v9, v2, v5, v10, v12}, Landroid/graphics/Matrix;->setScale(FFFF)V

    iget-object v9, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipMatrix:Landroid/graphics/Matrix;

    iget-object v10, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    invoke-virtual {v9, v10, v8}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    :cond_4
    invoke-static {v2, v7}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v2

    const/4 v8, 0x0

    if-eqz v2, :cond_5

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    iput v8, v2, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getWidth()I

    move-result v9

    int-to-float v9, v9

    iput v9, v2, Landroid/graphics/RectF;->right:F

    :cond_5
    invoke-static {v5, v7}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    iput v8, v2, Landroid/graphics/RectF;->top:F

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getHeight()I

    move-result v5

    int-to-float v5, v5

    iput v5, v2, Landroid/graphics/RectF;->bottom:F

    :cond_6
    const/4 v2, 0x1

    :cond_7
    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mAlphaScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->computeScrollOffset()Z

    move-result v5

    if-eqz v5, :cond_8

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mAlphaScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->getCurrX()I

    move-result v5

    int-to-float v5, v5

    mul-float v5, v5, v7

    div-float/2addr v5, v6

    invoke-static {v2, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->access$800(Luk/co/senab/photoview/PhotoViewAttacher;F)V

    const/4 v2, 0x1

    :cond_8
    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v6

    invoke-static {v5, v6}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v5

    if-eqz v5, :cond_9

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v6

    invoke-static {v5, v6}, Luk/co/senab/photoview/PhotoViewAttacher;->access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    goto :goto_1

    :cond_9
    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    :goto_1
    if-eqz v2, :cond_a

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v2, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$200(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    invoke-static {v0, p0}, Luk/co/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_3

    :cond_a
    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v2, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    if-nez v1, :cond_b

    return-void

    :cond_b
    const/4 v1, 0x0

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipRect:Landroid/graphics/RectF;

    iput-boolean v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExitTransition:Z

    if-eqz v1, :cond_c

    iput-boolean v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExited:Z

    goto :goto_2

    :cond_c
    iput-boolean v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExited:Z

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1000(Luk/co/senab/photoview/PhotoViewAttacher;)V

    :goto_2
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

    if-eqz v1, :cond_e

    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$Transition$1;

    invoke-direct {v1, p0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher$Transition;)V

    const-wide/16 v2, 0x14

    invoke-virtual {v0, v1, v2, v3}, Landroid/widget/ImageView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_3

    :cond_d
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    :cond_e
    :goto_3
    return-void
.end method

.method public scale(FF)V
    .locals 6

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const v1, 0x461c4000    # 10000.0f

    mul-float v2, p1, v1

    float-to-int v2, v2

    sub-float/2addr p2, p1

    mul-float p2, p2, v1

    float-to-int v3, p2

    const/4 p1, 0x0

    const/4 v4, 0x0

    const/16 v5, 0x96

    move v1, v2

    move v2, p1

    invoke-virtual/range {v0 .. v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->startScroll(IIIII)V

    return-void
.end method

.method public setTransitionListener(Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

    return-void
.end method

.method public start(Z)V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExitTransition:Z

    invoke-static {v0, p0}, Luk/co/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->forceFinished(Z)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mScaleScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->forceFinished(Z)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mClipScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->forceFinished(Z)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning:Z

    return-void
.end method

.method public translate(IIII)V
    .locals 6

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentX:I

    iput p2, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mCurrentY:I

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->mTranslateScroller:Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;

    const/16 v5, 0x96

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v5}, Luk/co/senab/photoview/scrollerproxy/ScrollerProxy;->startScroll(IIIII)V

    return-void
.end method
