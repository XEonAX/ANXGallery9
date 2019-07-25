.class public Lcom/miui/gallery/widget/ScalableImageView;
.super Lcom/miui/gallery/widget/ForegroundImageView;
.source "ScalableImageView.java"


# instance fields
.field private mMatrixScale:F

.field private mTempMatrix:Landroid/graphics/Matrix;

.field private final sMatrixValues:[F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    const/16 p1, 0x9

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->sMatrixValues:[F

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/ScalableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/ForegroundImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    const/16 p1, 0x9

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->sMatrixValues:[F

    return-void
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/ScalableImageView;->sMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->sMatrixValues:[F

    aget p1, p1, p2

    return p1
.end method

.method private postImageMatrixScale(F)V
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_4

    const/4 v1, 0x0

    cmpg-float v2, p1, v1

    if-gtz v2, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    if-lez v2, :cond_3

    if-gtz v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getHeight()I

    move-result v4

    int-to-float v3, v3

    const/high16 v5, 0x3f800000    # 1.0f

    mul-float v6, v3, v5

    int-to-float v2, v2

    div-float/2addr v6, v2

    int-to-float v4, v4

    mul-float v5, v5, v4

    int-to-float v0, v0

    div-float/2addr v5, v0

    invoke-static {v6, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    mul-float v2, v2, v5

    mul-float v0, v0, v5

    mul-float v5, v5, p1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getMatrixScale()F

    move-result v6

    div-float/2addr v5, v6

    cmpl-float v1, v5, v1

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v6

    invoke-virtual {v1, v6}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v5, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    mul-float v2, v2, p1

    sub-float/2addr v2, v3

    neg-float v1, v2

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float v1, v1, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    const/4 v5, 0x2

    invoke-direct {p0, v3, v5}, Lcom/miui/gallery/widget/ScalableImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v3

    sub-float/2addr v1, v3

    mul-float p1, p1, v0

    sub-float/2addr p1, v4

    neg-float p1, p1

    mul-float p1, p1, v2

    iget-object v0, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    const/4 v2, 0x5

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/widget/ScalableImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    sub-float/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/ScalableImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    :cond_2
    return-void

    :cond_3
    :goto_0
    return-void

    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public getMatrixScale()F
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/widget/ScalableImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v1

    float-to-double v1, v1

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-float v1, v1

    const/4 v2, 0x3

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/widget/ScalableImageView;->getValue(Landroid/graphics/Matrix;I)F

    move-result v0

    float-to-double v5, v0

    invoke-static {v5, v6, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v0, v2

    add-float/2addr v1, v0

    float-to-double v0, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    return v0
.end method

.method protected setFrame(IIII)Z
    .locals 0

    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/ForegroundImageView;->setFrame(IIII)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object p2

    sget-object p3, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne p2, p3, :cond_0

    iget p2, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/ScalableImageView;->postImageMatrixScale(F)V

    :cond_0
    return p1
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    if-eq v0, p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ScalableImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object p1

    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-ne p1, v0, :cond_0

    iget p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/ScalableImageView;->postImageMatrixScale(F)V

    :cond_0
    return-void
.end method

.method public setMatrixScale(F)V
    .locals 1

    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/ScalableImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    iput p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/ScalableImageView;->postImageMatrixScale(F)V

    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/ForegroundImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_0

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/widget/ScalableImageView;->mMatrixScale:F

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/ScalableImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    return-void
.end method
