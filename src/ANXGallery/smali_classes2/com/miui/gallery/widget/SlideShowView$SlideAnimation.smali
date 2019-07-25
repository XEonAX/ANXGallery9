.class Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;
.super Landroid/view/animation/Animation;
.source "SlideShowView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/SlideShowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SlideAnimation"
.end annotation


# instance fields
.field private mBaseMatrix:Landroid/graphics/Matrix;

.field private mHeight:I

.field private mMovingVector:Landroid/graphics/PointF;

.field private mRotation:I

.field private mScalePoint:Landroid/graphics/PointF;

.field private mWidth:I

.field final synthetic this$0:Lcom/miui/gallery/widget/SlideShowView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/SlideShowView;IIIJ)V
    .locals 5

    iput-object p1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-direct {p0}, Landroid/view/animation/Animation;-><init>()V

    iput p2, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    iput p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    iput p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mRotation:I

    new-instance p2, Ljava/util/Random;

    invoke-direct {p2}, Ljava/util/Random;-><init>()V

    new-instance p3, Landroid/graphics/PointF;

    iget p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float p4, p4

    const v0, 0x3e4ccccd    # 0.2f

    mul-float p4, p4, v0

    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    move-result v1

    const/high16 v2, 0x3f000000    # 0.5f

    sub-float/2addr v1, v2

    mul-float p4, p4, v1

    iget v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float v1, v1

    mul-float v1, v1, v0

    invoke-virtual {p2}, Ljava/util/Random;->nextFloat()F

    move-result p2

    sub-float/2addr p2, v2

    mul-float v1, v1, p2

    invoke-direct {p3, p4, v1}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mMovingVector:Landroid/graphics/PointF;

    new-instance p2, Landroid/graphics/RectF;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result p4

    int-to-float p4, p4

    const/4 v0, 0x0

    invoke-direct {p2, v0, v0, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-static {p1}, Lcom/miui/gallery/widget/SlideShowView;->access$000(Lcom/miui/gallery/widget/SlideShowView;)I

    move-result p3

    const/4 p4, 0x1

    if-eq p3, p4, :cond_0

    new-instance p1, Landroid/graphics/RectF;

    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float p4, p4

    invoke-direct {p1, v0, v0, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    goto/16 :goto_1

    :cond_0
    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    if-eqz p3, :cond_3

    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    if-eqz p3, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result p3

    if-eqz p3, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result p3

    if-nez p3, :cond_1

    goto :goto_0

    :cond_1
    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float p4, p4

    div-float/2addr p3, p4

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result p4

    int-to-float p4, p4

    invoke-virtual {p1}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p4, p1

    cmpl-float p1, p3, p4

    if-lez p1, :cond_2

    new-instance p1, Landroid/graphics/RectF;

    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float p3, p3

    iget v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float v1, v1

    mul-float v1, v1, p4

    sub-float/2addr p3, v1

    mul-float p3, p3, v2

    iget v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float v1, v1

    iget v3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float v3, v3

    iget v4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float v4, v4

    mul-float v4, v4, p4

    add-float/2addr v3, v4

    mul-float v3, v3, v2

    invoke-direct {p1, v0, p3, v1, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    goto :goto_1

    :cond_2
    new-instance p1, Landroid/graphics/RectF;

    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float p3, p3

    iget v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float v1, v1

    div-float/2addr v1, p4

    sub-float/2addr p3, v1

    mul-float p3, p3, v2

    iget v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float v1, v1

    iget v3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float v3, v3

    div-float/2addr v3, p4

    add-float/2addr v1, v3

    mul-float v1, v1, v2

    iget p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float p4, p4

    invoke-direct {p1, p3, v0, v1, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    goto :goto_1

    :cond_3
    :goto_0
    new-instance p1, Landroid/graphics/RectF;

    iget p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mWidth:I

    int-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mHeight:I

    int-to-float p4, p4

    invoke-direct {p1, v0, v0, p3, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    :goto_1
    new-instance p3, Landroid/graphics/Matrix;

    invoke-direct {p3}, Landroid/graphics/Matrix;-><init>()V

    iput-object p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mBaseMatrix:Landroid/graphics/Matrix;

    iget-object p3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mBaseMatrix:Landroid/graphics/Matrix;

    sget-object p4, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p3, p1, p2, p4}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    invoke-virtual {p0, p5, p6}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->setDuration(J)V

    new-instance p1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method


# virtual methods
.method protected applyTransformation(FLandroid/view/animation/Transformation;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-static {v0}, Lcom/miui/gallery/widget/SlideShowView;->access$100(Lcom/miui/gallery/widget/SlideShowView;)Z

    move-result v0

    const/4 v1, 0x0

    const v2, 0x3e4ccccd    # 0.2f

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mScalePoint:Landroid/graphics/PointF;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    new-instance v5, Landroid/graphics/PointF;

    invoke-virtual {v0, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v6

    iget-object v7, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v7}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result v7

    mul-int v6, v6, v7

    int-to-float v6, v6

    invoke-virtual {v0, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    iget-object v4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v4}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result v4

    mul-int v0, v0, v4

    int-to-float v0, v0

    invoke-direct {v5, v6, v0}, Landroid/graphics/PointF;-><init>(FF)V

    iput-object v5, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mScalePoint:Landroid/graphics/PointF;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mScalePoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mScalePoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    mul-float p1, p1, v2

    add-float/2addr p1, v3

    move v2, p1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/SlideShowView;->getWidth()I

    move-result v0

    div-int/2addr v0, v4

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/SlideShowView;->getHeight()I

    move-result v1

    div-int/2addr v1, v4

    int-to-float v4, v1

    mul-float v2, v2, p1

    add-float v1, v2, v3

    iget-object v2, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mMovingVector:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    mul-float v2, v2, p1

    iget-object v3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mMovingVector:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    mul-float p1, p1, v3

    move v8, v2

    move v2, v1

    move v1, v8

    :goto_0
    iget v3, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mRotation:I

    if-lez v3, :cond_2

    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    iget v5, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mRotation:I

    int-to-float v5, v5

    invoke-virtual {v3, v5, v0, v4}, Landroid/graphics/Matrix;->setRotate(FFF)V

    :cond_2
    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/widget/SlideShowView$SlideAnimation;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3, v5}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    invoke-virtual {v3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {p2}, Landroid/view/animation/Transformation;->getMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-virtual {p1, v2, v2, v0, v4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    return-void
.end method
