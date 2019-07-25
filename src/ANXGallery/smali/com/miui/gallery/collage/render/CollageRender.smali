.class public Lcom/miui/gallery/collage/render/CollageRender;
.super Ljava/lang/Object;
.source "CollageRender.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;,
        Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;,
        Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;,
        Lcom/miui/gallery/collage/render/CollageRender$RenderData;
    }
.end annotation


# direct methods
.method public static doRender(Landroid/graphics/Canvas;Lcom/miui/gallery/collage/render/CollageRender$RenderData;Lcom/miui/gallery/collage/BitmapManager;)V
    .locals 7

    invoke-virtual {p0}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iget-object v3, p1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    if-eqz v3, :cond_0

    iget-object v3, p1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iget-object v3, v3, Lcom/miui/gallery/collage/core/poster/PosterModel;->collagePositions:[Lcom/miui/gallery/collage/core/poster/CollagePositionModel;

    iget-object v4, p1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->bitmapRenders:[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    array-length v4, v4

    invoke-static {v3, v4}, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->getCollagePositionModelByImageSize([Lcom/miui/gallery/collage/core/poster/CollagePositionModel;I)Lcom/miui/gallery/collage/core/poster/CollagePositionModel;

    move-result-object v3

    iget-object v3, v3, Lcom/miui/gallery/collage/core/poster/CollagePositionModel;->position:[F

    goto :goto_0

    :cond_0
    sget-object v3, Lcom/miui/gallery/collage/widget/PosterLayout;->DEFAULT_LAYOUT_PARAMS:[F

    :goto_0
    int-to-float v0, v0

    const/4 v4, 0x0

    aget v4, v3, v4

    mul-float v4, v4, v0

    float-to-int v4, v4

    int-to-float v4, v4

    int-to-float v1, v1

    const/4 v5, 0x1

    aget v5, v3, v5

    mul-float v5, v5, v1

    float-to-int v5, v5

    int-to-float v5, v5

    const/4 v6, 0x2

    aget v6, v3, v6

    mul-float v0, v0, v6

    float-to-int v0, v0

    int-to-float v0, v0

    const/4 v6, 0x3

    aget v3, v3, v6

    mul-float v1, v1, v3

    float-to-int v1, v1

    int-to-float v1, v1

    invoke-virtual {v2, v4, v5, v0, v1}, Landroid/graphics/RectF;->set(FFFF)V

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    invoke-static {p0, p1, v2, p2}, Lcom/miui/gallery/collage/render/CollageRender;->drawBitmap(Landroid/graphics/Canvas;Lcom/miui/gallery/collage/render/CollageRender$RenderData;Landroid/graphics/RectF;Lcom/miui/gallery/collage/BitmapManager;)V

    iget-object p1, p1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->posterElementRender:Lcom/miui/gallery/collage/render/PosterElementRender;

    if-eqz p1, :cond_1

    invoke-virtual {p1, p0}, Lcom/miui/gallery/collage/render/PosterElementRender;->draw(Landroid/graphics/Canvas;)V

    :cond_1
    return-void
.end method

.method private static drawBitmap(Landroid/graphics/Canvas;Lcom/miui/gallery/collage/render/CollageRender$RenderData;Landroid/graphics/RectF;Lcom/miui/gallery/collage/BitmapManager;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    iget-object v4, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->layoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    iget v5, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->margin:F

    iget-object v6, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->bitmapRenders:[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    new-instance v13, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;

    invoke-direct {v13}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;-><init>()V

    new-instance v14, Landroid/graphics/RectF;

    invoke-direct {v14}, Landroid/graphics/RectF;-><init>()V

    new-instance v15, Lcom/miui/gallery/collage/render/BitmapItemRender;

    invoke-direct {v15}, Lcom/miui/gallery/collage/render/BitmapItemRender;-><init>()V

    const/4 v7, 0x0

    const/4 v12, 0x0

    :goto_0
    iget-object v7, v4, Lcom/miui/gallery/collage/core/layout/LayoutModel;->items:[Lcom/miui/gallery/collage/core/layout/LayoutItemModel;

    array-length v7, v7

    if-ge v12, v7, :cond_2

    array-length v7, v6

    if-lt v12, v7, :cond_0

    move-object/from16 v18, v4

    move/from16 v16, v12

    goto/16 :goto_1

    :cond_0
    iget-object v7, v4, Lcom/miui/gallery/collage/core/layout/LayoutModel;->items:[Lcom/miui/gallery/collage/core/layout/LayoutItemModel;

    aget-object v7, v7, v12

    new-instance v11, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v8, v7, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->clipType:Lcom/miui/gallery/collage/ClipType;

    iget-object v7, v7, Lcom/miui/gallery/collage/core/layout/LayoutItemModel;->data:[F

    invoke-direct {v11, v8, v7}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;-><init>(Lcom/miui/gallery/collage/ClipType;[F)V

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->width()F

    move-result v9

    invoke-virtual/range {p2 .. p2}, Landroid/graphics/RectF;->height()F

    move-result v10

    iget v7, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->scaleOffset:F

    mul-float v16, v5, v7

    iget-boolean v8, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->igonreMarginEdge:Z

    move-object v7, v13

    move/from16 v17, v8

    move-object v8, v11

    move-object/from16 v18, v4

    move-object v4, v11

    move/from16 v11, v16

    move/from16 v16, v12

    move/from16 v12, v17

    invoke-virtual/range {v7 .. v12}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->processorImageLocation(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;FFFZ)V

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Canvas;->save()I

    iget v7, v2, Landroid/graphics/RectF;->left:F

    iget v8, v2, Landroid/graphics/RectF;->top:F

    invoke-virtual {v0, v7, v8}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object v7, v4, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mPathForClip:Landroid/graphics/Path;

    invoke-virtual {v0, v7}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    invoke-static {v4}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$000(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;)I

    move-result v7

    int-to-float v7, v7

    invoke-static {v4}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$100(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;)I

    move-result v8

    int-to-float v8, v8

    invoke-static {v4}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$200(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;)I

    move-result v9

    int-to-float v9, v9

    invoke-static {v4}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$300(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;)I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v14, v7, v8, v9, v4}, Landroid/graphics/RectF;->set(FFFF)V

    aget-object v4, v6, v16

    iget-object v7, v4, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmap:Landroid/graphics/Bitmap;

    if-eqz v3, :cond_1

    iget-object v8, v4, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v3, v8}, Lcom/miui/gallery/collage/BitmapManager;->getOriginUriByBitmap(Landroid/graphics/Bitmap;)Landroid/net/Uri;

    move-result-object v8

    iget v9, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageWidth:I

    iget v10, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageHeight:I

    invoke-virtual {v3, v9, v10, v8}, Lcom/miui/gallery/collage/BitmapManager;->loadSuitableBitmapBySize(IILandroid/net/Uri;)Landroid/graphics/Bitmap;

    move-result-object v8

    iput-object v8, v4, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmap:Landroid/graphics/Bitmap;

    :cond_1
    iget v8, v1, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->scaleOffset:F

    invoke-virtual {v15, v4, v14, v0, v8}, Lcom/miui/gallery/collage/render/BitmapItemRender;->drawBitmapItem(Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;Landroid/graphics/RectF;Landroid/graphics/Canvas;F)V

    iput-object v7, v4, Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;->bitmap:Landroid/graphics/Bitmap;

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/Canvas;->restore()V

    :goto_1
    add-int/lit8 v12, v16, 0x1

    move-object/from16 v4, v18

    goto/16 :goto_0

    :cond_2
    return-void
.end method

.method public static generateRenderData(Landroid/content/Context;Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;Lcom/miui/gallery/collage/widget/CollageLayout;I)Lcom/miui/gallery/collage/render/CollageRender$RenderData;
    .locals 4

    invoke-virtual {p3}, Lcom/miui/gallery/collage/widget/CollageLayout;->getChildCount()I

    move-result v0

    new-array v1, v0, [Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    invoke-virtual {p3, v2}, Lcom/miui/gallery/collage/widget/CollageLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-virtual {v3}, Lcom/miui/gallery/collage/widget/CollageImageView;->generateBitmapRenderData()Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-static {p0, p1, p2, v1}, Lcom/miui/gallery/collage/render/CollageRender;->generateRenderData(Landroid/content/res/Resources;Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;)Lcom/miui/gallery/collage/render/CollageRender$RenderData;

    move-result-object p0

    iget p2, p0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageWidth:I

    int-to-float p2, p2

    int-to-float p4, p4

    div-float/2addr p2, p4

    iput p2, p0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->scaleOffset:F

    invoke-virtual {p3}, Lcom/miui/gallery/collage/widget/CollageLayout;->getMargin()F

    move-result p2

    iput p2, p0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->margin:F

    invoke-virtual {p3}, Lcom/miui/gallery/collage/widget/CollageLayout;->isIgnoreEdgeMargin()Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->igonreMarginEdge:Z

    if-eqz p1, :cond_1

    new-instance p1, Lcom/miui/gallery/collage/render/PosterElementRender;

    invoke-direct {p1}, Lcom/miui/gallery/collage/render/PosterElementRender;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->posterElementRender:Lcom/miui/gallery/collage/render/PosterElementRender;

    :cond_1
    return-object p0
.end method

.method private static generateRenderData(Landroid/content/res/Resources;Lcom/miui/gallery/collage/core/poster/PosterModel;Lcom/miui/gallery/collage/core/layout/LayoutModel;[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;)Lcom/miui/gallery/collage/render/CollageRender$RenderData;
    .locals 4

    new-instance v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;

    invoke-direct {v0}, Lcom/miui/gallery/collage/render/CollageRender$RenderData;-><init>()V

    const/4 v1, 0x0

    if-eqz p1, :cond_0

    iget v2, p1, Lcom/miui/gallery/collage/core/poster/PosterModel;->ratio:F

    cmpl-float v2, v2, v1

    if-eqz v2, :cond_0

    iget p0, p1, Lcom/miui/gallery/collage/core/poster/PosterModel;->ratio:F

    goto :goto_0

    :cond_0
    if-eqz p2, :cond_1

    iget v2, p2, Lcom/miui/gallery/collage/core/layout/LayoutModel;->ratio:F

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_1

    iget p0, p2, Lcom/miui/gallery/collage/core/layout/LayoutModel;->ratio:F

    goto :goto_0

    :cond_1
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    const v2, 0x7f06039e

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v1, v3}, Landroid/content/res/Resources;->getValue(ILandroid/util/TypedValue;Z)V

    invoke-virtual {v1}, Landroid/util/TypedValue;->getFloat()F

    move-result p0

    :goto_0
    const/16 v1, 0x870

    iput v1, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageWidth:I

    iget v1, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageWidth:I

    int-to-float v1, v1

    div-float/2addr v1, p0

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result p0

    iput p0, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->imageHeight:I

    iput-object p1, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->posterModel:Lcom/miui/gallery/collage/core/poster/PosterModel;

    iput-object p2, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->layoutModel:Lcom/miui/gallery/collage/core/layout/LayoutModel;

    iput-object p3, v0, Lcom/miui/gallery/collage/render/CollageRender$RenderData;->bitmapRenders:[Lcom/miui/gallery/collage/render/CollageRender$BitmapRenderData;

    return-object v0
.end method

.method public static initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 6

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/collage/render/CollageRender;->initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;ZILandroid/graphics/RectF;)V

    return-void
.end method

.method public static initBitmapMatrix(Landroid/graphics/RectF;Landroid/graphics/Matrix;Landroid/graphics/RectF;ZILandroid/graphics/RectF;)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    sget-object v0, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p1, p0, p2, v0}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    invoke-virtual {p5, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p1, p5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    const/high16 v0, 0x3f800000    # 1.0f

    if-eqz p3, :cond_0

    const/high16 p3, -0x40800000    # -1.0f

    invoke-virtual {p5}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    invoke-virtual {p5}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {p1, p3, v0, v1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    :cond_0
    int-to-float p3, p4

    invoke-virtual {p5}, Landroid/graphics/RectF;->centerX()F

    move-result p4

    invoke-virtual {p5}, Landroid/graphics/RectF;->centerY()F

    move-result v1

    invoke-virtual {p1, p3, p4, v1}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    invoke-virtual {p5, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p1, p5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p3

    invoke-virtual {p5}, Landroid/graphics/RectF;->height()F

    move-result p4

    div-float/2addr p3, p4

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p4

    invoke-virtual {p5}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr p4, v1

    invoke-static {p4, p3}, Ljava/lang/Math;->max(FF)F

    move-result p3

    cmpl-float p4, p3, v0

    if-eqz p4, :cond_1

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    move-result p4

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result p2

    invoke-virtual {p1, p3, p3, p4, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-virtual {p5, p0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    invoke-virtual {p1, p5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    :cond_1
    return-void
.end method
