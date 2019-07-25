.class public Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;
.super Landroid/view/View;
.source "PaintSizeView.java"


# instance fields
.field private mDiameter:I

.field private mPaint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060303

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    div-float/2addr v1, v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mDiameter:I

    int-to-float v3, v3

    div-float/2addr v3, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v3, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public setDiameter(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->mDiameter:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizeView;->invalidate()V

    return-void
.end method
