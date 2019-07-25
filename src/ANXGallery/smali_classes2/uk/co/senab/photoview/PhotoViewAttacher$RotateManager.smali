.class Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Luk/co/senab/photoview/PhotoViewAttacher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RotateManager"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;
    }
.end annotation


# instance fields
.field private final CRITICAL_VELOCITY:F

.field private mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

.field private mRotateDetector:Luk/co/senab/photoview/gestures/RotateGestureDetector;

.field private mRotatedDegrees:F

.field final synthetic this$0:Luk/co/senab/photoview/PhotoViewAttacher;


# direct methods
.method constructor <init>(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .locals 2

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Luk/co/senab/photoview/gestures/RotateGestureDetector;

    invoke-direct {v0, p1, p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;-><init>(Landroid/content/Context;Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotateDetector:Luk/co/senab/photoview/gestures/RotateGestureDetector;

    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-direct {v0, p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;-><init>(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/content/Context;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    const/high16 v1, 0x41200000    # 10.0f

    mul-float v0, v0, v1

    div-float/2addr p1, v1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->CRITICAL_VELOCITY:F

    return-void
.end method

.method static synthetic access$2100(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/graphics/RectF;Landroid/graphics/RectF;)Z
    .locals 0

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->needTrimToBaseRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$2300(Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;Landroid/graphics/Matrix;)[F
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateTranslate(Landroid/graphics/Matrix;)[F

    move-result-object p0

    return-object p0
.end method

.method private adjustAfterRotate(Luk/co/senab/photoview/gestures/RotateGestureDetector;ZF)V
    .locals 10

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->stop()V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v2

    invoke-direct {p0, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateFinalDegrees(ZF)I

    move-result p2

    int-to-float v3, p2

    new-instance p2, Landroid/graphics/Matrix;

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    sub-float v0, v2, v3

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusY()F

    move-result v4

    invoke-virtual {p2, v0, v1, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-direct {p0, v0, p3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateRotateDuration(FF)I

    move-result v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusX()F

    move-result v4

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusY()F

    move-result v5

    move v6, v0

    invoke-virtual/range {v1 .. v6}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->rotate(FFFFI)V

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateTranslate(Landroid/graphics/Matrix;)[F

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v1, 0x0

    aget v7, p1, v1

    const/4 v1, 0x1

    aget v8, p1, v1

    move v9, v0

    invoke-virtual/range {v4 .. v9}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->translate(FFFFI)V

    :cond_1
    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateScale(Landroid/graphics/Matrix;)F

    move-result p1

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1400(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/MatrixUtil;->getScale(Landroid/graphics/Matrix;)F

    move-result p2

    mul-float v1, p2, p1

    invoke-direct {p0, p1, p3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->calculateScaleDuration(FF)I

    move-result p1

    iget-object p3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {p3, p2, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->scale(FFI)V

    goto :goto_0

    :cond_2
    move p1, v0

    :goto_0
    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    iget-object p3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F

    move-result p3

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p2, p3, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->alpha(FFI)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->start()V

    return-void
.end method

.method private calculateFinalDegrees(ZF)I
    .locals 5

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotatedDegrees:F

    const/high16 v2, 0x42b40000    # 90.0f

    rem-float/2addr v1, v2

    const/4 v3, 0x0

    cmpl-float v4, v1, v3

    if-lez v4, :cond_0

    if-eqz p1, :cond_1

    :cond_0
    cmpg-float v4, v1, v3

    if-gez v4, :cond_2

    if-eqz p1, :cond_2

    :cond_1
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    sub-float v1, v2, v1

    goto :goto_0

    :cond_2
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    :goto_0
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result p2

    iget v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->CRITICAL_VELOCITY:F

    cmpl-float p2, p2, v4

    if-lez p2, :cond_7

    const/high16 p2, 0x41a00000    # 20.0f

    cmpl-float p2, v1, p2

    if-lez p2, :cond_6

    rem-float p2, v0, v2

    cmpl-float v1, p2, v3

    if-lez v1, :cond_4

    if-eqz p1, :cond_3

    neg-float p1, p2

    goto :goto_1

    :cond_3
    sub-float p1, v2, p2

    goto :goto_1

    :cond_4
    if-eqz p1, :cond_5

    const/high16 p1, -0x3d4c0000    # -90.0f

    sub-float/2addr p1, p2

    goto :goto_1

    :cond_5
    neg-float p1, p2

    :goto_1
    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    add-float/2addr v0, p1

    invoke-static {p2, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1300(Luk/co/senab/photoview/PhotoViewAttacher;F)I

    move-result p1

    goto :goto_2

    :cond_6
    float-to-int p1, v0

    div-int/lit8 p1, p1, 0x5a

    mul-int/lit8 p1, p1, 0x5a

    goto :goto_2

    :cond_7
    const/high16 p1, 0x42340000    # 45.0f

    cmpl-float p1, v1, p1

    if-lez p1, :cond_8

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1300(Luk/co/senab/photoview/PhotoViewAttacher;F)I

    move-result p1

    goto :goto_2

    :cond_8
    float-to-int p1, v0

    div-int/lit8 p1, p1, 0x5a

    mul-int/lit8 p1, p1, 0x5a

    :goto_2
    return p1
.end method

.method private calculateRotateDuration(FF)I
    .locals 0

    const/16 p1, 0x12c

    return p1
.end method

.method private calculateScale(Landroid/graphics/Matrix;)F
    .locals 4

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/high16 v1, 0x7fc00000    # Float.NaN

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/MatrixUtil;->getRotate(Landroid/graphics/Matrix;)F

    move-result v2

    float-to-int v2, v2

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3, v0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1600(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-direct {v2, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-direct {p0, v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->needTrimToBaseRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result p1

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr p1, v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    return p1

    :cond_2
    return v1
.end method

.method private calculateScaleDuration(FF)I
    .locals 0

    const/16 p1, 0x12c

    return p1
.end method

.method private calculateTranslate(Landroid/graphics/Matrix;)[F
    .locals 6

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/util/MatrixUtil;->getRotate(Landroid/graphics/Matrix;)F

    move-result v3

    float-to-int v3, v3

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v4, v2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1600(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;

    move-result-object v2

    if-nez v2, :cond_1

    return-object v1

    :cond_1
    new-instance v1, Landroid/graphics/RectF;

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-direct {v1, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-direct {p0, v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->needTrimToBaseRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    sub-float/2addr p1, v0

    float-to-int p1, p1

    int-to-float p1, p1

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    int-to-float v0, v0

    goto/16 :goto_3

    :cond_2
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result p1

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v3, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1700(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result v3

    int-to-float v3, v3

    cmpl-float p1, p1, v3

    const/4 v3, 0x0

    if-lez p1, :cond_4

    iget p1, v1, Landroid/graphics/RectF;->left:F

    cmpl-float p1, p1, v3

    if-lez p1, :cond_3

    iget p1, v1, Landroid/graphics/RectF;->left:F

    sub-float p1, v3, p1

    float-to-int p1, p1

    int-to-float p1, p1

    goto :goto_0

    :cond_3
    const/4 p1, 0x0

    :goto_0
    iget v4, v1, Landroid/graphics/RectF;->right:F

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v5, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1700(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result v5

    int-to-float v5, v5

    cmpg-float v4, v4, v5

    if-gez v4, :cond_5

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1700(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result p1

    int-to-float p1, p1

    iget v4, v1, Landroid/graphics/RectF;->right:F

    sub-float/2addr p1, v4

    float-to-int p1, p1

    int-to-float p1, p1

    goto :goto_1

    :cond_4
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    sub-float/2addr p1, v4

    float-to-int p1, p1

    int-to-float p1, p1

    :cond_5
    :goto_1
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget-object v5, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v5, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1800(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result v5

    int-to-float v5, v5

    cmpl-float v4, v4, v5

    if-lez v4, :cond_8

    iget v2, v1, Landroid/graphics/RectF;->top:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_6

    iget v2, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v2

    float-to-int v2, v3

    int-to-float v2, v2

    goto :goto_2

    :cond_6
    const/4 v2, 0x0

    :goto_2
    iget v3, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v4, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1800(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result v4

    int-to-float v4, v4

    cmpg-float v3, v3, v4

    if-gez v3, :cond_7

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v2, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1800(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I

    move-result v0

    int-to-float v0, v0

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    float-to-int v0, v0

    int-to-float v0, v0

    goto :goto_3

    :cond_7
    move v0, v2

    goto :goto_3

    :cond_8
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    sub-float/2addr v0, v1

    float-to-int v0, v0

    int-to-float v0, v0

    :goto_3
    const/4 v1, 0x2

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 p1, 0x1

    aput v0, v1, p1

    return-object v1
.end method

.method private needTrimToBaseRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z
    .locals 3

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1500(Luk/co/senab/photoview/PhotoViewAttacher;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v1

    const v2, 0x3f99999a    # 1.2f

    mul-float v1, v1, v2

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    mul-float p2, p2, v2

    cmpg-float p1, p1, p2

    if-gez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method private rotateBy(FFF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1100(Luk/co/senab/photoview/PhotoViewAttacher;FFF)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {p2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    invoke-static {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V

    return-void
.end method


# virtual methods
.method public isAutoRotating()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->isRunning()Z

    move-result v0

    return v0
.end method

.method public isManualRotating()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotateDetector:Luk/co/senab/photoview/gestures/RotateGestureDetector;

    invoke-virtual {v0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->isInProgress()Z

    move-result v0

    return v0
.end method

.method public isRotating()Z
    .locals 1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isManualRotating()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isAutoRotating()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onRotate(Luk/co/senab/photoview/gestures/RotateGestureDetector;)Z
    .locals 4

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getRotateDegrees()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-static {v0}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotatedDegrees:F

    add-float/2addr v1, v0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotatedDegrees:F

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusX()F

    move-result v1

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusY()F

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->rotateBy(FFF)V

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {v1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object v1

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v2

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusX()F

    move-result v3

    invoke-virtual {p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->getFocusY()F

    move-result p1

    invoke-interface {v1, v0, v2, v3, p1}, Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;->onRotate(FFFF)V

    :cond_1
    const/4 p1, 0x1

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public onRotateBegin(Luk/co/senab/photoview/gestures/RotateGestureDetector;)Z
    .locals 1

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    const/16 v0, 0x8

    invoke-static {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->access$200(Luk/co/senab/photoview/PhotoViewAttacher;I)V

    const/4 p1, 0x0

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotatedDegrees:F

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    move-result-object p1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->this$0:Luk/co/senab/photoview/PhotoViewAttacher;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v0

    invoke-interface {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;->onRotateBegin(F)V

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onRotateEnd(Luk/co/senab/photoview/gestures/RotateGestureDetector;ZF)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->adjustAfterRotate(Luk/co/senab/photoview/gestures/RotateGestureDetector;ZF)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mRotateDetector:Luk/co/senab/photoview/gestures/RotateGestureDetector;

    invoke-virtual {v0, p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method

.method public stop()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->mAjustAnim:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager$AdjustAnimation;->stop()V

    return-void
.end method
