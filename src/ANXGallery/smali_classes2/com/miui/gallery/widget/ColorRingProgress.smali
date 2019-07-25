.class public Lcom/miui/gallery/widget/ColorRingProgress;
.super Landroid/view/View;
.source "ColorRingProgress.java"


# instance fields
.field private mBackColor:I

.field private mColorInterval:I

.field private mColorIntervalPercent:F

.field private mForeColor:I

.field private mPaint:Landroid/graphics/Paint;

.field private mProgress:F

.field private mRectF:Landroid/graphics/RectF;

.field private mThickness:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0, v0}, Lcom/miui/gallery/widget/ColorRingProgress;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, v0}, Lcom/miui/gallery/widget/ColorRingProgress;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/widget/ColorRingProgress;->init(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/R$styleable;->ColorRingProgress:[I

    invoke-virtual {p1, p2, v0, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    const/4 p3, -0x1

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mForeColor:I

    const/4 p2, 0x0

    const p3, -0x694709

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mBackColor:I

    const/4 p3, 0x3

    const/16 p4, 0xe

    invoke-virtual {p1, p3, p4}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    const/4 p3, 0x1

    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mColorInterval:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    sget-object p2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    iget p2, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 21

    move-object/from16 v0, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/widget/ColorRingProgress;->getWidth()I

    move-result v1

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/widget/ColorRingProgress;->getHeight()I

    move-result v2

    mul-int v1, v1, v2

    if-gtz v1, :cond_0

    return-void

    :cond_0
    const/high16 v1, -0x3d4c0000    # -90.0f

    const/high16 v2, 0x43870000    # 270.0f

    iget v3, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mColorIntervalPercent:F

    const/high16 v4, 0x43b40000    # 360.0f

    mul-float v3, v3, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    const/high16 v6, 0x3f800000    # 1.0f

    iget v7, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mProgress:F

    sub-float/2addr v6, v7

    iget v7, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mColorIntervalPercent:F

    mul-float v7, v7, v5

    cmpg-float v6, v6, v7

    const/4 v7, 0x0

    if-ltz v6, :cond_1

    iget v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mProgress:F

    invoke-static {v6, v7}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v6

    if-eqz v6, :cond_2

    :cond_1
    const/4 v3, 0x0

    :cond_2
    sub-float/2addr v1, v3

    iget-object v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    const/4 v14, 0x0

    invoke-virtual {v6, v14}, Landroid/graphics/Paint;->setColor(I)V

    mul-float v5, v5, v3

    cmpl-float v6, v5, v7

    if-lez v6, :cond_3

    iget-object v9, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    const/4 v12, 0x0

    iget-object v13, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move v10, v1

    move v11, v5

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    :cond_3
    iget-object v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    iget v8, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mForeColor:I

    invoke-virtual {v6, v8}, Landroid/graphics/Paint;->setColor(I)V

    add-float/2addr v1, v5

    iget v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mProgress:F

    mul-float v6, v6, v4

    sub-float/2addr v6, v3

    add-float v4, v1, v6

    cmpl-float v4, v4, v2

    if-lez v4, :cond_4

    sub-float v4, v2, v1

    goto :goto_0

    :cond_4
    move v4, v6

    :goto_0
    cmpl-float v6, v4, v7

    if-lez v6, :cond_5

    iget-object v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    const/16 v19, 0x0

    iget-object v8, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v15, p1

    move-object/from16 v16, v6

    move/from16 v17, v1

    move/from16 v18, v4

    move-object/from16 v20, v8

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    :cond_5
    iget-object v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v6, v14}, Landroid/graphics/Paint;->setColor(I)V

    add-float/2addr v1, v4

    cmpl-float v4, v5, v7

    if-lez v4, :cond_6

    iget-object v9, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    const/4 v12, 0x0

    iget-object v13, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move v10, v1

    move v11, v5

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    :cond_6
    iget-object v4, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    iget v6, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mBackColor:I

    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    add-float v10, v1, v5

    sub-float/2addr v2, v10

    sub-float v11, v2, v3

    cmpl-float v1, v11, v7

    if-lez v1, :cond_7

    iget-object v9, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    const/4 v12, 0x0

    iget-object v13, v0, Lcom/miui/gallery/widget/ColorRingProgress;->mPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    :cond_7
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    iget-object p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mRectF:Landroid/graphics/RectF;

    iget p2, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    int-to-float p2, p2

    iget p3, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    int-to-float p3, p3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->getWidth()I

    move-result p4

    iget p5, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    sub-int/2addr p4, p5

    int-to-float p4, p4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->getHeight()I

    move-result p5

    iget v0, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mThickness:I

    sub-int/2addr p5, v0

    int-to-float p5, p5

    invoke-virtual {p1, p2, p3, p4, p5}, Landroid/graphics/RectF;->set(FFFF)V

    iget p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mColorInterval:I

    int-to-double p1, p1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->getWidth()I

    move-result p3

    int-to-double p3, p3

    const-wide v0, 0x400921fb54442d18L    # Math.PI

    invoke-static {p3, p4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double p3, p3, v0

    invoke-static {p1, p2}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p1, p3

    double-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mColorIntervalPercent:F

    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mBackColor:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->invalidate()V

    return-void
.end method

.method public setForegroundColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mForeColor:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->invalidate()V

    return-void
.end method

.method public setProgress(F)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/ColorRingProgress;->mProgress:F

    invoke-virtual {p0}, Lcom/miui/gallery/widget/ColorRingProgress;->invalidate()V

    return-void
.end method
