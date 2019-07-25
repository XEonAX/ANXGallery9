.class Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AdjustAnimation"
.end annotation


# instance fields
.field private isRunning:Z

.field private mAlphaScroller:Landroid/widget/Scroller;

.field private mRotateFocusX:F

.field private mRotateFocusY:F

.field private mRotateScroller:Landroid/widget/Scroller;

.field private mScaleScroller:Landroid/widget/Scroller;

.field private mTranslateScroller:Landroid/widget/Scroller;

.field private mTranslateX:I

.field private mTraslateY:I

.field final synthetic this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;


# direct methods
.method public constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/content/Context;)V
    .locals 1

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {p1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    new-instance v0, Landroid/widget/Scroller;

    invoke-direct {v0, p2, p1}, Landroid/widget/Scroller;-><init>(Landroid/content/Context;Landroid/view/animation/Interpolator;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mAlphaScroller:Landroid/widget/Scroller;

    return-void
.end method

.method private checkBounds()V
    .locals 6

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-static {v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v2

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v3, v3, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1300(Luk/co/senab/photoview/PhotoViewAttacher;F)I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    sub-float/2addr v2, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-static {v4, v2, v3, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1100(Luk/co/senab/photoview/PhotoViewAttacher;FFF)V

    :cond_1
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-static {v2, v1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->access$2300(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/graphics/Matrix;)[F

    move-result-object v1

    if-eqz v1, :cond_2

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    const/4 v3, 0x0

    aget v3, v1, v3

    const/4 v4, 0x1

    aget v1, v1, v4

    invoke-static {v2, v3, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$300(Luk/co/senab/photoview/PhotoViewAttacher;FF)V

    :cond_2
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v1

    float-to-int v1, v1

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v2, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1600(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v1, "PhotoViewAttacher"

    const-string v2, "calculate base display null"

    invoke-interface {v0, v1, v2}, Luk/co/senab/photoview/log/Logger;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-static {v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v3

    cmpg-float v2, v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    if-gez v2, :cond_4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr v2, v4

    goto :goto_0

    :cond_4
    const/high16 v2, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float v4, v4, v2

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr v5, v0

    mul-float v4, v4, v5

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr v4, v0

    invoke-static {v2, v3}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {v4, v3}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v0

    if-nez v0, :cond_6

    :cond_5
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-static {v0, v2, v4, v3, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$900(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    :cond_6
    return-void
.end method

.method private precise(F)I
    .locals 1

    const v0, 0x461c4000    # 10000.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    return p1
.end method

.method private unPrecise(I)F
    .locals 1

    int-to-float p1, p1

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p1, p1, v0

    const v0, 0x461c4000    # 10000.0f

    div-float/2addr p1, v0

    return p1
.end method

.method private updateMatrix()V
    .locals 11

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v0

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v3, v3, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-static {v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v3, v3, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v4, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1300(Luk/co/senab/photoview/PhotoViewAttacher;F)I

    move-result v0

    invoke-static {v3, v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1900(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)V

    new-instance v0, Landroid/graphics/RectF;

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v3, v3, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$2000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v3

    invoke-static {v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v2, v2, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1400(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/Matrix;->reset()V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-static {v2, v1, v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->access$2100(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    if-nez v2, :cond_0

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float v3, v2, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v4

    div-float/2addr v2, v4

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    invoke-virtual {v4, v3, v2, v5, v6}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    sub-float/2addr v5, v6

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    sub-float/2addr v1, v6

    invoke-virtual {v4, v5, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1400(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    move v7, v2

    move v6, v3

    goto :goto_0

    :cond_0
    const/high16 v6, 0x3f800000    # 1.0f

    const/high16 v7, 0x3f800000    # 1.0f

    :goto_0
    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v5, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v9

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v10

    invoke-static/range {v5 .. v10}, Luk/co/senab/photoview/PhotoViewAttacher;->access$2200(Luk/co/senab/photoview/PhotoViewAttacher;FFFFF)V

    :cond_1
    return-void
.end method


# virtual methods
.method public alpha(FFI)V
    .locals 8

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mAlphaScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mAlphaScroller:Landroid/widget/Scroller;

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v3

    sub-float/2addr p2, p1

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public isRunning()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning:Z

    return v0
.end method

.method public rotate(FFFFI)V
    .locals 8

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iput p3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusX:F

    iput p4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusY:F

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v3

    sub-float/2addr p2, p1

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move v7, p5

    invoke-virtual/range {v2 .. v7}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public run()V
    .locals 8

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->stop()V

    return-void

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_1

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->unPrecise(I)F

    move-result v1

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v4

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v5, v5, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    sub-float/2addr v4, v1

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusX:F

    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusY:F

    invoke-static {v5, v4, v1, v6}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1100(Luk/co/senab/photoview/PhotoViewAttacher;FFF)V

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v4

    if-eqz v4, :cond_3

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->unPrecise(I)F

    move-result v1

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v4}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1400(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/MatrixUtil;->getScale(Landroid/graphics/Matrix;)F

    move-result v4

    div-float/2addr v1, v4

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v5, v5, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v5}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    invoke-static {v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v5, v5, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-static {v5, v1, v1, v6, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->access$900(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    :cond_2
    const/4 v1, 0x1

    :cond_3
    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v4

    if-eqz v4, :cond_4

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    invoke-virtual {v1}, Landroid/widget/Scroller;->getCurrX()I

    move-result v1

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    invoke-virtual {v4}, Landroid/widget/Scroller;->getCurrY()I

    move-result v4

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateX:I

    sub-int v5, v1, v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->unPrecise(I)F

    move-result v5

    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTraslateY:I

    sub-int v6, v4, v6

    invoke-direct {p0, v6}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->unPrecise(I)F

    move-result v6

    iget v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusX:F

    add-float/2addr v7, v5

    iput v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusX:F

    iget v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusY:F

    add-float/2addr v7, v6

    iput v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateFocusY:F

    iget-object v7, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v7, v7, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v7, v5, v6}, Luk/co/senab/photoview/PhotoViewAttacher;->access$300(Luk/co/senab/photoview/PhotoViewAttacher;FF)V

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateX:I

    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTraslateY:I

    const/4 v1, 0x1

    :cond_4
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mAlphaScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->computeScrollOffset()Z

    move-result v3

    if-eqz v3, :cond_5

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mAlphaScroller:Landroid/widget/Scroller;

    invoke-virtual {v3}, Landroid/widget/Scroller;->getCurrX()I

    move-result v3

    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->unPrecise(I)F

    move-result v3

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v4, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$800(Luk/co/senab/photoview/PhotoViewAttacher;F)V

    :cond_5
    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v3, v3, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v4, v4, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v4}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-static {v3, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    if-eqz v1, :cond_6

    invoke-static {v0, p0}, Luk/co/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    goto :goto_1

    :cond_6
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->checkBounds()V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->updateMatrix()V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$800(Luk/co/senab/photoview/PhotoViewAttacher;F)V

    iput-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning:Z

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v1, v1, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v1

    invoke-interface {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;->onRotateEnd(F)V

    :cond_7
    :goto_1
    return-void
.end method

.method public scale(FFI)V
    .locals 8

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v3

    sub-float/2addr p2, p1

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move v7, p3

    invoke-virtual/range {v2 .. v7}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method

.method public start()V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning:Z

    invoke-static {v0, p0}, Luk/co/senab/photoview/Compat;->postOnAnimation(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mRotateScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mScaleScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning:Z

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->this$1:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    iget-object v0, v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    const/16 v1, 0x8

    invoke-static {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    :cond_0
    return-void
.end method

.method public translate(FFFFI)V
    .locals 7

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Scroller;->forceFinished(Z)V

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v0

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateX:I

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v0

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTraslateY:I

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->mTranslateScroller:Landroid/widget/Scroller;

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v2

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v3

    invoke-direct {p0, p3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v4

    invoke-direct {p0, p4}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->precise(F)I

    move-result v5

    move v6, p5

    invoke-virtual/range {v1 .. v6}, Landroid/widget/Scroller;->startScroll(IIIII)V

    return-void
.end method
