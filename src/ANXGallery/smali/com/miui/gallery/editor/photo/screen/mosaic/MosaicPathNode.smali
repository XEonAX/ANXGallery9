.class public Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;
.super Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;
.source "MosaicPathNode.java"


# static fields
.field private static sDefaultSize:F = 98.0f


# instance fields
.field private mPaint:Landroid/graphics/Paint;

.field private mPath:Landroid/graphics/Path;

.field private mPointFList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicNode;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPointFList:Ljava/util/List;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPath:Landroid/graphics/Path;

    return-void
.end method

.method private initPaint()V
    .locals 2

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    sget v1, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->sDefaultSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public init()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->initPaint()V

    return-void
.end method

.method protected onReceivePosition(FFZ)V
    .locals 4

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPath:Landroid/graphics/Path;

    invoke-virtual {p3}, Landroid/graphics/Path;->isEmpty()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPath:Landroid/graphics/Path;

    invoke-virtual {p3, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPointFList:Ljava/util/List;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPointFList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/graphics/PointF;

    iget v0, p3, Landroid/graphics/PointF;->x:F

    add-float/2addr v0, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget v2, p3, Landroid/graphics/PointF;->y:F

    add-float/2addr v2, p2

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPath:Landroid/graphics/Path;

    iget v3, p3, Landroid/graphics/PointF;->x:F

    iget p3, p3, Landroid/graphics/PointF;->y:F

    invoke-virtual {v1, v3, p3, v0, v2}, Landroid/graphics/Path;->quadTo(FFFF)V

    :goto_0
    iget-object p3, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPointFList:Ljava/util/List;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-interface {p3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public setPaintSize(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method public setShader(Landroid/graphics/Shader;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/mosaic/MosaicPathNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method
