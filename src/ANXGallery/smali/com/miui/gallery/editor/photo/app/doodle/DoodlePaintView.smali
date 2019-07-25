.class public Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;
.super Landroid/view/View;
.source "DoodlePaintView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;
    }
.end annotation


# instance fields
.field private mInnerColor:I

.field private mOuterColor:I

.field private mOuterHeight:F

.field private mOuterWidth:F

.field private mPaint:Landroid/graphics/Paint;

.field private mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

.field private mRadiusPercent:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    const-string v0, "#F1F1F1"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterColor:I

    const-string v0, "#FF7A31"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mInnerColor:I

    const v0, 0x3e570a3d    # 0.21f

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    sget-object v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->init(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p2, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p2, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    const-string p2, "#F1F1F1"

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterColor:I

    const-string p2, "#FF7A31"

    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mInnerColor:I

    const p2, 0x3e570a3d    # 0.21f

    iput p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    sget-object p2, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->init(Landroid/content/Context;)V

    return-void
.end method

.method private drawInnerCircle(Landroid/graphics/Canvas;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mInnerColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterWidth:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterHeight:F

    div-float/2addr v2, v1

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterWidth:F

    mul-float v3, v3, v4

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    iget v5, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterHeight:F

    mul-float v4, v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    div-float/2addr v3, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawOuterCircle(Landroid/graphics/Canvas;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterWidth:F

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterHeight:F

    div-float/2addr v2, v1

    iget v3, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterWidth:F

    iget v4, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterHeight:F

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v3

    div-float/2addr v3, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v2, v3, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isNightMode(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "#242424"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterColor:I

    :cond_0
    return-void
.end method


# virtual methods
.method public getPaintType()Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->drawOuterCircle(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->drawInnerCircle(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onMeasure(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterWidth:F

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mOuterHeight:F

    return-void
.end method

.method public setClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setColor(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mInnerColor:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->invalidate()V

    return-void
.end method

.method public updateInnerRadiusPercent()V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    const v1, 0x3e2e147b    # 0.17f

    cmpl-float v0, v0, v1

    const v2, 0x3e570a3d    # 0.21f

    if-nez v0, :cond_0

    iput v2, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    sget-object v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->MEDIUM:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_1

    const/high16 v0, 0x3e800000    # 0.25f

    iput v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    sget-object v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->HEAVY:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    goto :goto_0

    :cond_1
    iput v1, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mRadiusPercent:F

    sget-object v0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;->LIGHT:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->mPaintType:Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView$PaintType;

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/app/doodle/DoodlePaintView;->invalidate()V

    return-void
.end method
