.class public Lcom/miui/gallery/movie/ui/view/PlayProgressView;
.super Landroid/view/View;
.source "PlayProgressView.java"


# instance fields
.field private defaultColor:I

.field private mProgress:F

.field private paint:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const-string p1, "#4da0f8"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->defaultColor:I

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-string p1, "#4da0f8"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->defaultColor:I

    invoke-direct {p0}, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->init()V

    return-void
.end method

.method private init()V
    .locals 2

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->defaultColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    const/high16 v1, 0x41200000    # 10.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 8

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->mProgress:F

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float v5, v0, v1

    iget-object v7, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->paint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public setProgress(F)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->mProgress:F

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->invalidate()V

    return-void
.end method
