.class public Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;
.super Landroid/graphics/drawable/ShapeDrawable;
.source "CircleDrawable.java"


# static fields
.field private static INIT_COLOR:I = -0xff6e24

.field private static STROKE_COLOR:I = 0x4c000000


# instance fields
.field private final mOffset:F

.field private mPaint:Landroid/graphics/Paint;

.field private mPorterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

.field private mStrokePaint:Landroid/graphics/Paint;

.field private final mThumbSize:I

.field private final mThumbTouchSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(FLandroid/content/res/Resources;)V
    .locals 2

    invoke-direct {p0}, Landroid/graphics/drawable/ShapeDrawable;-><init>()V

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mOffset:F

    new-instance p1, Landroid/graphics/PorterDuffXfermode;

    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {p1, v0}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPorterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->INIT_COLOR:I

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setColor(I)V

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mStrokePaint:Landroid/graphics/Paint;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mStrokePaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPorterDuffXfermode:Landroid/graphics/PorterDuffXfermode;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    const p1, 0x7f06035d

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mThumbTouchSize:I

    const p1, 0x7f060185

    invoke-virtual {p2, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mThumbSize:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mThumbSize:I

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mOffset:F

    add-float/2addr v4, v1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v2}, Landroid/graphics/Paint;->getColor()I

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, -0x1

    if-ne v2, v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget v5, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->STROKE_COLOR:I

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_0

    :cond_0
    const/high16 v5, -0x1000000

    if-ne v2, v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v5, v4}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v4, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v3, v0, v1, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setColor(I)V

    :cond_1
    :goto_0
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mThumbTouchSize:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mThumbTouchSize:I

    return v0
.end method

.method public getOpacity()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setAlpha(I)V
    .locals 0

    return-void
.end method

.method public setColor(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/seekbar/CircleDrawable;->invalidateSelf()V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 0

    return-void
.end method
