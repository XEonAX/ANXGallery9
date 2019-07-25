.class public Lcom/miui/gallery/widget/RotateRingView;
.super Landroid/view/View;
.source "RotateRingView.java"


# static fields
.field private static final HEAD_POSITIONS:[F


# instance fields
.field private mChangeColors:[I

.field private mCircleX:I

.field private mCircleY:I

.field private mHeadMaxAlpha:I

.field private mPaint:Landroid/graphics/Paint;

.field private mProgress:I

.field private mRadius:I

.field private mRectF:Landroid/graphics/RectF;

.field private mRotateMatrix:Landroid/graphics/Matrix;

.field private mStrokeWidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x2

    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/widget/RotateRingView;->HEAD_POSITIONS:[F

    return-void

    nop

    :array_0
    .array-data 4
        0x3f400000    # 0.75f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/RotateRingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/RotateRingView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mRotateMatrix:Landroid/graphics/Matrix;

    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mRectF:Landroid/graphics/RectF;

    new-instance p2, Landroid/graphics/Paint;

    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    iget-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0603da

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mStrokeWidth:I

    iget-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mStrokeWidth:I

    int-to-float v0, v0

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0603d9

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    const/4 p1, 0x2

    new-array p1, p1, [I

    const/16 p2, 0x60

    const/16 v0, 0xff

    invoke-static {p2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    const/4 v2, 0x0

    aput v1, p1, v2

    invoke-static {p2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p2

    aput p2, p1, p3

    iput-object p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mChangeColors:[I

    return-void
.end method


# virtual methods
.method public drawRing(Landroid/graphics/Canvas;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mRotateMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mProgress:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleX:I

    int-to-float v2, v2

    iget v3, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleY:I

    int-to-float v3, v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRotate(FFF)V

    new-instance v0, Landroid/graphics/SweepGradient;

    iget v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleX:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleY:I

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/widget/RotateRingView;->mChangeColors:[I

    sget-object v4, Lcom/miui/gallery/widget/RotateRingView;->HEAD_POSITIONS:[F

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    iget-object v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mRotateMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/SweepGradient;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget-object v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    return-void
.end method

.method public getCircleHeight()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    mul-int/lit8 v0, v0, 0x2

    iget v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mStrokeWidth:I

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0
.end method

.method public getHeadMaxAlpha()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mHeadMaxAlpha:I

    return v0
.end method

.method public getHeadMinAlpha()I
    .locals 1

    const/16 v0, 0x60

    return v0
.end method

.method public getProgress()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mProgress:I

    return v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/RotateRingView;->drawRing(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 2

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleX:I

    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleY:I

    iget-object p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mRectF:Landroid/graphics/RectF;

    iget p2, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleX:I

    iget p3, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    sub-int/2addr p2, p3

    int-to-float p2, p2

    iget p3, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleY:I

    iget p4, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    sub-int/2addr p3, p4

    int-to-float p3, p3

    iget p4, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleX:I

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    add-int/2addr p4, v0

    int-to-float p4, p4

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mCircleY:I

    iget v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mRadius:I

    add-int/2addr v0, v1

    int-to-float v0, v0

    invoke-virtual {p1, p2, p3, p4, v0}, Landroid/graphics/RectF;->set(FFFF)V

    return-void
.end method

.method public setHeadMaxAlpha(I)V
    .locals 2

    iput p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mHeadMaxAlpha:I

    iget-object p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mChangeColors:[I

    iget v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mHeadMaxAlpha:I

    const/16 v1, 0xff

    invoke-static {v0, v1, v1, v1}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    const/4 v1, 0x1

    aput v0, p1, v1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/RotateRingView;->invalidate()V

    return-void
.end method

.method public setProgress(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/widget/RotateRingView;->mProgress:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/RotateRingView;->invalidate()V

    return-void
.end method

.method public setStartRotateStable()V
    .locals 3

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/RotateRingView;->setAlpha(F)V

    const/16 v0, 0xff

    iput v0, p0, Lcom/miui/gallery/widget/RotateRingView;->mHeadMaxAlpha:I

    iget-object v1, p0, Lcom/miui/gallery/widget/RotateRingView;->mChangeColors:[I

    iget v2, p0, Lcom/miui/gallery/widget/RotateRingView;->mHeadMaxAlpha:I

    invoke-static {v2, v0, v0, v0}, Landroid/graphics/Color;->argb(IIII)I

    move-result v0

    const/4 v2, 0x1

    aput v0, v1, v2

    return-void
.end method
