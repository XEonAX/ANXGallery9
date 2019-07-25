.class public Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;
.super Landroid/view/View;
.source "PercentCircleView.java"


# instance fields
.field private mArcRectF:Landroid/graphics/RectF;

.field private mBackgroundColor:I

.field private mBackgroundPaint:Landroid/graphics/Paint;

.field private mBgRadius:F

.field private mCircleX:I

.field private mCircleY:I

.field private mCurrentAngle:F

.field private mInnerRadius:F

.field private mProgressColor:I

.field private mProgressPaint:Landroid/graphics/Paint;

.field private mRingColor:I

.field private mRingPaint:Landroid/graphics/Paint;

.field private mStartSweepValue:F

.field private mStoke:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/high16 p1, 0x42b40000    # 90.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCurrentAngle:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, 0x42b40000    # 90.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCurrentAngle:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, 0x42b40000    # 90.0f

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCurrentAngle:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    const v0, -0xe55e01

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundColor:I

    const v0, -0x7f000001

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingColor:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressColor:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBgRadius:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f0601f4

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    div-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0601f5

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mStoke:F

    const/high16 v0, -0x3d4c0000    # -90.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mStartSweepValue:F

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundPaint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingColor:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mStoke:F

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mStoke:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleY:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBgRadius:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mBackgroundPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleY:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mRingPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mArcRectF:Landroid/graphics/RectF;

    iget v6, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mStartSweepValue:F

    iget v7, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCurrentAngle:F

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mProgressPaint:Landroid/graphics/Paint;

    const/4 v8, 0x0

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 1

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->getMeasuredWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleX:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->getMeasuredHeight()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleY:I

    new-instance p1, Landroid/graphics/RectF;

    iget p2, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleX:I

    int-to-float p2, p2

    iget p3, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    sub-float/2addr p2, p3

    iget p3, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleY:I

    int-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    sub-float/2addr p3, p4

    iget p4, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleX:I

    int-to-float p4, p4

    iget p5, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    add-float/2addr p4, p5

    iget p5, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCircleY:I

    int-to-float p5, p5

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mInnerRadius:F

    add-float/2addr p5, v0

    invoke-direct {p1, p2, p3, p4, p5}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mArcRectF:Landroid/graphics/RectF;

    return-void
.end method

.method public setPercent(F)V
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    mul-float p1, p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->mCurrentAngle:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PercentCircleView;->invalidate()V

    return-void
.end method
