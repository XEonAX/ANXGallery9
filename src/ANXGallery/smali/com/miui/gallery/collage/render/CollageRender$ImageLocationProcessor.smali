.class public Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;
.super Ljava/lang/Object;
.source "CollageRender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/collage/render/CollageRender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ImageLocationProcessor"
.end annotation


# instance fields
.field private mClipArray:[F

.field private mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPathRectF:Landroid/graphics/RectF;

.field private mPathRegion:Landroid/graphics/Region;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Region;

    invoke-direct {v0}, Landroid/graphics/Region;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private enableMargin(FFFZ)V
    .locals 26

    move-object/from16 v0, p0

    const/4 v2, 0x0

    cmpl-float v3, p1, v2

    if-nez v3, :cond_0

    return-void

    :cond_0
    iget-object v3, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v3, v3, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mPathForClip:Landroid/graphics/Path;

    sget-object v4, Lcom/miui/gallery/collage/render/CollageRender$1;->$SwitchMap$com$miui$gallery$collage$ClipType:[I

    iget-object v5, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v5, v5, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mClipType:Lcom/miui/gallery/collage/ClipType;

    invoke-virtual {v5}, Lcom/miui/gallery/collage/ClipType;->ordinal()I

    move-result v5

    aget v4, v4, v5

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    packed-switch v4, :pswitch_data_0

    goto/16 :goto_7

    :pswitch_0
    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    new-instance v9, Landroid/graphics/RectF;

    invoke-direct {v9}, Landroid/graphics/RectF;-><init>()V

    new-instance v10, Landroid/graphics/Region;

    invoke-direct {v10}, Landroid/graphics/Region;-><init>()V

    const/4 v11, 0x0

    :goto_0
    iget-object v12, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    array-length v12, v12

    if-ge v11, v12, :cond_9

    new-array v12, v6, [F

    new-array v13, v6, [F

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v14, v14, v11

    aput v14, v12, v7

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    add-int/lit8 v15, v11, 0x1

    aget v14, v14, v15

    aput v14, v12, v8

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    array-length v14, v14

    sub-int/2addr v14, v6

    if-ne v11, v14, :cond_1

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v14, v14, v7

    aput v14, v13, v7

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v14, v14, v8

    aput v14, v13, v8

    goto :goto_1

    :cond_1
    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    add-int/lit8 v15, v11, 0x2

    aget v14, v14, v15

    aput v14, v13, v7

    iget-object v14, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    add-int/lit8 v15, v11, 0x3

    aget v14, v14, v15

    aput v14, v13, v8

    :goto_1
    aget v14, v12, v7

    aget v15, v12, v8

    aget v5, v13, v7

    aget v6, v13, v8

    cmpl-float v18, v14, v5

    if-nez v18, :cond_4

    cmpl-float v18, v14, v2

    if-eqz v18, :cond_3

    cmpl-float v19, v14, p2

    if-nez v19, :cond_2

    goto :goto_2

    :cond_2
    const/16 v19, 0x0

    goto :goto_3

    :cond_3
    :goto_2
    const/16 v19, 0x1

    :goto_3
    move/from16 v20, v19

    goto :goto_4

    :cond_4
    cmpl-float v19, v15, v6

    if-nez v19, :cond_6

    cmpl-float v19, v15, v2

    if-eqz v19, :cond_5

    cmpl-float v20, v15, p3

    if-nez v20, :cond_6

    :cond_5
    const/16 v20, 0x1

    goto :goto_4

    :cond_6
    const/16 v20, 0x0

    :goto_4
    if-eqz v20, :cond_8

    if-eqz p4, :cond_7

    const/16 v21, 0x0

    goto :goto_5

    :cond_7
    const/high16 v21, 0x40000000    # 2.0f

    mul-float v21, v21, p1

    :goto_5
    move/from16 v2, v21

    goto :goto_6

    :cond_8
    move/from16 v2, p1

    :goto_6
    aget v21, v13, v8

    aget v22, v12, v8

    sub-float v8, v21, v22

    move-object/from16 v24, v10

    move/from16 v25, v11

    float-to-double v10, v8

    aget v8, v13, v7

    aget v21, v12, v7

    sub-float v8, v8, v21

    float-to-double v7, v8

    invoke-static {v10, v11, v7, v8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v7

    const-string v10, "CollageRender"

    const-string v11, "xStart:%f yStart:%f xEnd:%f yEnd:%f degree\uff1a%f"

    const/4 v1, 0x5

    new-array v1, v1, [Ljava/lang/Object;

    const/16 v21, 0x0

    aget v22, v12, v21

    invoke-static/range {v22 .. v22}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v22

    aput-object v22, v1, v21

    const/16 v22, 0x1

    aget v23, v12, v22

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v23

    aput-object v23, v1, v22

    aget v23, v13, v21

    invoke-static/range {v23 .. v23}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v21

    const/16 v17, 0x2

    aput-object v21, v1, v17

    aget v21, v13, v22

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v21

    const/16 v16, 0x3

    aput-object v21, v1, v16

    const/16 v21, 0x4

    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v22

    aput-object v22, v1, v21

    invoke-static {v10, v11, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    neg-double v10, v7

    double-to-float v10, v10

    invoke-virtual {v1, v10}, Landroid/graphics/Matrix;->postRotate(F)Z

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    neg-float v2, v2

    const/4 v10, 0x0

    invoke-virtual {v1, v10, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    double-to-float v2, v7

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->postRotate(F)Z

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v12}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v13}, Landroid/graphics/Matrix;->mapPoints([F)V

    const-string v1, "CollageRender"

    const-string v2, "xStart:%f yStart:%f"

    const/4 v7, 0x0

    aget v8, v12, v7

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    const/4 v11, 0x1

    aget v21, v12, v11

    invoke-static/range {v21 .. v21}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    invoke-static {v1, v2, v8, v10}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4}, Landroid/graphics/Path;->reset()V

    invoke-virtual {v4, v14, v15}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->lineTo(FF)V

    aget v1, v13, v7

    aget v2, v13, v11

    invoke-virtual {v4, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    aget v1, v12, v7

    aget v2, v12, v11

    invoke-virtual {v4, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v4}, Landroid/graphics/Path;->close()V

    invoke-virtual {v4, v9, v11}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    invoke-virtual/range {v24 .. v24}, Landroid/graphics/Region;->setEmpty()V

    new-instance v1, Landroid/graphics/Region;

    iget v2, v9, Landroid/graphics/RectF;->left:F

    float-to-int v2, v2

    iget v5, v9, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    iget v6, v9, Landroid/graphics/RectF;->right:F

    float-to-int v6, v6

    iget v7, v9, Landroid/graphics/RectF;->bottom:F

    float-to-int v7, v7

    invoke-direct {v1, v2, v5, v6, v7}, Landroid/graphics/Region;-><init>(IIII)V

    move-object/from16 v2, v24

    invoke-virtual {v2, v4, v1}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    sget-object v5, Landroid/graphics/Region$Op;->DIFFERENCE:Landroid/graphics/Region$Op;

    invoke-virtual {v1, v2, v5}, Landroid/graphics/Region;->op(Landroid/graphics/Region;Landroid/graphics/Region$Op;)Z

    add-int/lit8 v11, v25, 0x2

    move-object v10, v2

    const/4 v2, 0x0

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    goto/16 :goto_0

    :cond_9
    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    invoke-virtual {v1, v3}, Landroid/graphics/Region;->getBoundaryPath(Landroid/graphics/Path;)Z

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    const/4 v2, 0x1

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    goto :goto_7

    :pswitch_1
    const/4 v2, 0x1

    invoke-virtual {v3}, Landroid/graphics/Path;->reset()V

    new-instance v1, Landroid/graphics/RectF;

    iget-object v4, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v5, 0x0

    aget v4, v4, v5

    add-float v4, v4, p1

    iget-object v6, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v6, v6, v2

    add-float v6, v6, p1

    iget-object v2, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v7, 0x2

    aget v2, v2, v7

    sub-float v2, v2, p1

    iget-object v7, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v8, 0x3

    aget v7, v7, v8

    sub-float v7, v7, p1

    invoke-direct {v1, v4, v6, v2, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->round(F)I

    move-result v1

    int-to-float v1, v1

    invoke-static/range {p1 .. p1}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Path;->offset(FF)V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    const/4 v2, 0x1

    invoke-virtual {v3, v1, v2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    invoke-virtual {v1}, Landroid/graphics/Region;->setEmpty()V

    iget-object v1, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    new-instance v2, Landroid/graphics/Region;

    iget-object v4, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->left:F

    float-to-int v4, v4

    iget-object v5, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    float-to-int v5, v5

    iget-object v6, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    float-to-int v6, v6

    iget-object v7, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    float-to-int v7, v7

    invoke-direct {v2, v4, v5, v6, v7}, Landroid/graphics/Region;-><init>(IIII)V

    invoke-virtual {v1, v3, v2}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    :goto_7
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private generateClipArrayBySize(FF)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v0, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mClipArray:[F

    array-length v1, v0

    new-array v1, v1, [F

    iput-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v1, 0x0

    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v3, v0, v1

    mul-float v3, v3, p1

    aput v3, v2, v1

    iget-object v2, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    add-int/lit8 v3, v1, 0x1

    aget v4, v0, v3

    mul-float v4, v4, p2

    aput v4, v2, v3

    add-int/lit8 v1, v1, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method private generateLayoutSizeByRect()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$002(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;I)I

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$102(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;I)I

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$202(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;I)I

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->access$302(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;I)I

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v0, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mPathRegion:Landroid/graphics/Region;

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    invoke-virtual {v0, v1}, Landroid/graphics/Region;->set(Landroid/graphics/Region;)Z

    return-void
.end method

.method private generatePath()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v0, v0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mPathForClip:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    sget-object v1, Lcom/miui/gallery/collage/render/CollageRender$1;->$SwitchMap$com$miui$gallery$collage$ClipType:[I

    iget-object v2, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    iget-object v2, v2, Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;->mClipType:Lcom/miui/gallery/collage/ClipType;

    invoke-virtual {v2}, Lcom/miui/gallery/collage/ClipType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v1, v3, :cond_2

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    array-length v1, v1

    if-ge v2, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v1, v1, v2

    iget-object v4, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    add-int/lit8 v5, v2, 0x1

    aget v4, v4, v5

    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {v0, v1, v4}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_1

    :cond_0
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    :goto_1
    add-int/lit8 v2, v2, 0x2

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    goto :goto_2

    :cond_2
    new-instance v1, Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v2, v4, v2

    iget-object v4, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    aget v4, v4, v3

    iget-object v5, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v6, 0x2

    aget v5, v5, v6

    iget-object v6, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mClipArray:[F

    const/4 v7, 0x3

    aget v6, v6, v7

    invoke-direct {v1, v2, v4, v5, v6}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object v2, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    :goto_2
    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    invoke-virtual {v1}, Landroid/graphics/Region;->setEmpty()V

    iget-object v1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRegion:Landroid/graphics/Region;

    new-instance v2, Landroid/graphics/Region;

    iget-object v3, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    float-to-int v3, v3

    iget-object v4, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    float-to-int v4, v4

    iget-object v5, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    float-to-int v5, v5

    iget-object v6, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mPathRectF:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->bottom:F

    float-to-int v6, v6

    invoke-direct {v2, v3, v4, v5, v6}, Landroid/graphics/Region;-><init>(IIII)V

    invoke-virtual {v1, v0, v2}, Landroid/graphics/Region;->setPath(Landroid/graphics/Path;Landroid/graphics/Region;)Z

    return-void
.end method


# virtual methods
.method public processorImageLocation(Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;FFFZ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->mImageLocation:Lcom/miui/gallery/collage/render/CollageRender$ImageLocation;

    const/4 p1, 0x0

    cmpl-float p1, p4, p1

    if-lez p1, :cond_0

    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->generateClipArrayBySize(FF)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->generatePath()V

    invoke-direct {p0, p4, p2, p3, p5}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->enableMargin(FFFZ)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->generateClipArrayBySize(FF)V

    invoke-direct {p0}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->generatePath()V

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/collage/render/CollageRender$ImageLocationProcessor;->generateLayoutSizeByRect()V

    return-void
.end method
