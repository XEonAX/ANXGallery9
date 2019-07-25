.class Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;
.super Ljava/lang/Object;
.source "Crop.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ResizeDetector"
.end annotation


# instance fields
.field private mPreEdit:Landroid/graphics/RectF;

.field private mResizeEdge:I

.field private mResizeStart:Landroid/graphics/PointF;

.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mPreEdit:Landroid/graphics/RectF;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return-void
.end method

.method private calculateMinSize()I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRadius(F)F

    move-result v0

    const/high16 v1, 0x3f000000    # 0.5f

    add-float/2addr v0, v1

    float-to-int v0, v0

    const/16 v1, 0xc8

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    return v0
.end method

.method private checkOtherBoundOffset(IFLandroid/graphics/RectF;)F
    .locals 2

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p3, p3, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_0

    goto :goto_0

    :cond_0
    move p1, p2

    :goto_0
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->left:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    neg-float p1, p1

    invoke-virtual {p3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto/16 :goto_4

    :cond_1
    and-int/lit8 v0, p1, 0x10

    if-eqz v0, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    iget p3, p3, Landroid/graphics/RectF;->top:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_2

    goto :goto_1

    :cond_2
    move p1, p2

    :goto_1
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->top:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    neg-float p1, p1

    invoke-virtual {p3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_4

    :cond_3
    and-int/lit16 v0, p1, 0x100

    if-eqz v0, :cond_5

    iget p1, p3, Landroid/graphics/RectF;->right:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget p3, p3, Landroid/graphics/RectF;->right:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_4

    goto :goto_2

    :cond_4
    move p1, p2

    :goto_2
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->right:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p3, p1, v1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_4

    :cond_5
    and-int/lit16 p1, p1, 0x1000

    if-eqz p1, :cond_7

    iget p1, p3, Landroid/graphics/RectF;->bottom:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget p3, p3, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, p3

    cmpl-float p3, p1, v1

    if-lez p3, :cond_7

    cmpl-float p3, p2, p1

    if-lez p3, :cond_6

    goto :goto_3

    :cond_6
    move p1, p2

    :goto_3
    sub-float/2addr p2, p1

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p3

    iget v0, p3, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, p1

    iput v0, p3, Landroid/graphics/RectF;->bottom:F

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p3

    invoke-virtual {p3, v1, p1}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    :cond_7
    :goto_4
    return p2
.end method

.method private constraint(FF)F
    .locals 1

    add-float/2addr p2, p1

    mul-float p1, p1, p2

    const/4 v0, 0x0

    cmpg-float p1, p1, v0

    if-gez p1, :cond_0

    return v0

    :cond_0
    return p2
.end method

.method private fixImageBounds(Landroid/graphics/RectF;)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v2, v3, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v4

    if-nez v4, :cond_3

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v6

    cmpl-float v5, v5, v6

    if-gtz v5, :cond_0

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v6

    cmpl-float v5, v5, v6

    if-lez v5, :cond_1

    :cond_0
    invoke-static {v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v5

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v7

    invoke-virtual {v4, v5, v5, v6, v7}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    :cond_1
    invoke-virtual {v4, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    invoke-virtual {v2, v3, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {v1, v3}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result p1

    if-nez p1, :cond_2

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-static {v1, v3, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V

    iget v1, p1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {v4, v1, p1}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    :cond_2
    invoke-virtual {v0, v4}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    :cond_3
    return-void
.end method

.method private getImageCropBound(Landroid/graphics/RectF;)[F
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v2

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound(Landroid/graphics/RectF;)V

    const/4 v4, 0x2

    new-array v5, v4, [F

    new-array v6, v4, [F

    new-array v7, v4, [F

    new-array v8, v4, [F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    new-array v10, v4, [F

    iget v11, v2, Landroid/graphics/RectF;->left:F

    const/4 v12, 0x0

    aput v11, v10, v12

    iget v11, v2, Landroid/graphics/RectF;->top:F

    const/4 v13, 0x1

    aput v11, v10, v13

    invoke-virtual {v9, v5, v10}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    new-array v10, v4, [F

    iget v11, v2, Landroid/graphics/RectF;->right:F

    aput v11, v10, v12

    iget v11, v2, Landroid/graphics/RectF;->top:F

    aput v11, v10, v13

    invoke-virtual {v9, v6, v10}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    new-array v10, v4, [F

    iget v11, v2, Landroid/graphics/RectF;->left:F

    aput v11, v10, v12

    iget v11, v2, Landroid/graphics/RectF;->bottom:F

    aput v11, v10, v13

    invoke-virtual {v9, v7, v10}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v9

    new-array v10, v4, [F

    iget v11, v2, Landroid/graphics/RectF;->right:F

    aput v11, v10, v12

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    aput v2, v10, v13

    invoke-virtual {v9, v8, v10}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound([F)V

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound([F)V

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound([F)V

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound([F)V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v9, Landroid/graphics/RectF;

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    invoke-direct {v9, v10}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->doRound(Landroid/graphics/RectF;)V

    new-array v10, v4, [F

    iget v11, v9, Landroid/graphics/RectF;->left:F

    aput v11, v10, v12

    iget v11, v9, Landroid/graphics/RectF;->top:F

    aput v11, v10, v13

    new-array v11, v4, [F

    iget v14, v9, Landroid/graphics/RectF;->left:F

    aput v14, v11, v12

    iget v14, v9, Landroid/graphics/RectF;->bottom:F

    aput v14, v11, v13

    new-array v14, v4, [F

    iget v15, v9, Landroid/graphics/RectF;->right:F

    aput v15, v14, v12

    iget v15, v9, Landroid/graphics/RectF;->top:F

    aput v15, v14, v13

    new-array v15, v4, [F

    iget v4, v9, Landroid/graphics/RectF;->right:F

    aput v4, v15, v12

    iget v4, v9, Landroid/graphics/RectF;->bottom:F

    aput v4, v15, v13

    const/4 v4, 0x2

    new-array v12, v4, [F

    invoke-virtual {v3, v9}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v4

    if-nez v4, :cond_4

    const-string v2, "Crop"

    const-string v3, "not in bound"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v2, v2, 0x10

    if-eqz v2, :cond_0

    iget v2, v1, Landroid/graphics/RectF;->top:F

    aput v2, v12, v13

    goto :goto_0

    :cond_0
    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v2, v2, 0x1000

    if-eqz v2, :cond_1

    iget v2, v1, Landroid/graphics/RectF;->bottom:F

    aput v2, v12, v13

    :cond_1
    :goto_0
    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v2, v13

    if-eqz v2, :cond_2

    iget v1, v1, Landroid/graphics/RectF;->left:F

    const/4 v2, 0x0

    aput v1, v12, v2

    goto :goto_1

    :cond_2
    const/4 v2, 0x0

    iget v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v3, v3, 0x100

    if-eqz v3, :cond_3

    iget v1, v1, Landroid/graphics/RectF;->right:F

    aput v1, v12, v2

    :cond_3
    :goto_1
    return-object v12

    :cond_4
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v4

    if-ne v1, v4, :cond_5

    const/4 v1, 0x1

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_2
    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    invoke-static {v4}, Ljava/lang/Integer;->bitCount(I)I

    move-result v4

    if-le v4, v13, :cond_d

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v4, v4, 0x10

    if-eqz v4, :cond_7

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v4, v13

    if-eqz v4, :cond_7

    if-eqz v1, :cond_6

    const/4 v4, 0x0

    aget v6, v5, v4

    aget v8, v10, v4

    cmpg-float v4, v6, v8

    if-gez v4, :cond_d

    aget v4, v5, v13

    aget v6, v10, v13

    cmpg-float v4, v4, v6

    if-gez v4, :cond_d

    :cond_6
    invoke-static {v2, v15, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v15, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v15, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    const/16 v16, 0x0

    aget v13, v4, v16

    aget v6, v6, v16

    invoke-static {v13, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    aput v6, v12, v16

    const/4 v6, 0x1

    aget v4, v4, v6

    aget v8, v8, v6

    invoke-static {v4, v8}, Ljava/lang/Math;->max(FF)F

    move-result v4

    aput v4, v12, v6

    move-object/from16 v18, v9

    :goto_3
    const/4 v4, 0x1

    goto/16 :goto_4

    :cond_7
    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v4, v4, 0x10

    if-eqz v4, :cond_9

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v4, v4, 0x100

    if-eqz v4, :cond_9

    if-eqz v1, :cond_8

    const/4 v4, 0x0

    aget v8, v6, v4

    aget v13, v14, v4

    cmpl-float v4, v8, v13

    if-lez v4, :cond_d

    const/4 v4, 0x1

    aget v6, v6, v4

    aget v8, v14, v4

    cmpg-float v4, v6, v8

    if-gez v4, :cond_d

    :cond_8
    invoke-static {v2, v11, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v11, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v11, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    move-object/from16 v18, v9

    const/4 v13, 0x0

    aget v9, v4, v13

    aget v6, v6, v13

    invoke-static {v9, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    aput v6, v12, v13

    const/16 v17, 0x1

    aget v4, v4, v17

    aget v6, v8, v17

    invoke-static {v4, v6}, Ljava/lang/Math;->max(FF)F

    move-result v4

    aput v4, v12, v17

    goto :goto_3

    :cond_9
    move-object/from16 v18, v9

    const/16 v17, 0x1

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v4, v4, 0x1000

    if-eqz v4, :cond_b

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v4, v4, 0x1

    if-eqz v4, :cond_b

    if-eqz v1, :cond_a

    const/4 v4, 0x0

    aget v6, v7, v4

    aget v8, v11, v4

    cmpg-float v4, v6, v8

    if-gez v4, :cond_e

    aget v4, v7, v17

    aget v6, v11, v17

    cmpl-float v4, v4, v6

    if-lez v4, :cond_e

    :cond_a
    invoke-static {v2, v14, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v14, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v14, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    const/4 v9, 0x0

    aget v13, v4, v9

    aget v6, v6, v9

    invoke-static {v13, v6}, Ljava/lang/Math;->max(FF)F

    move-result v6

    aput v6, v12, v9

    const/4 v6, 0x1

    aget v4, v4, v6

    aget v8, v8, v6

    invoke-static {v4, v8}, Ljava/lang/Math;->min(FF)F

    move-result v4

    aput v4, v12, v6

    goto/16 :goto_3

    :cond_b
    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v4, v4, 0x1000

    if-eqz v4, :cond_e

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v4, v4, 0x100

    if-eqz v4, :cond_e

    if-eqz v1, :cond_c

    const/4 v4, 0x0

    aget v6, v8, v4

    aget v9, v15, v4

    cmpl-float v4, v6, v9

    if-lez v4, :cond_e

    const/4 v4, 0x1

    aget v6, v8, v4

    aget v8, v15, v4

    cmpl-float v4, v6, v8

    if-lez v4, :cond_e

    :cond_c
    invoke-static {v2, v10, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v10, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    const/4 v9, 0x0

    aget v13, v4, v9

    aget v6, v6, v9

    invoke-static {v13, v6}, Ljava/lang/Math;->min(FF)F

    move-result v6

    aput v6, v12, v9

    const/4 v6, 0x1

    aget v4, v4, v6

    aget v8, v8, v6

    invoke-static {v4, v8}, Ljava/lang/Math;->min(FF)F

    move-result v4

    aput v4, v12, v6

    goto/16 :goto_3

    :cond_d
    move-object/from16 v18, v9

    :cond_e
    const/4 v4, 0x0

    :goto_4
    if-eqz v4, :cond_f

    return-object v12

    :cond_f
    if-eqz v1, :cond_17

    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_11

    invoke-static {v5, v7, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->isParallel([F[F[F[F)Z

    move-result v1

    if-eqz v1, :cond_10

    iget v1, v3, Landroid/graphics/RectF;->top:F

    const/4 v4, 0x1

    aput v1, v12, v4

    goto :goto_5

    :cond_10
    const/4 v4, 0x1

    :goto_5
    invoke-static {v2, v11, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v1

    invoke-static {v2, v15, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    aget v1, v1, v4

    aget v6, v6, v4

    invoke-static {v1, v6}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, v12, v4

    goto :goto_6

    :cond_11
    const/4 v4, 0x1

    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v1, v1, 0x1000

    if-eqz v1, :cond_13

    invoke-static {v5, v7, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->isParallel([F[F[F[F)Z

    move-result v1

    if-eqz v1, :cond_12

    iget v1, v3, Landroid/graphics/RectF;->bottom:F

    aput v1, v12, v4

    :cond_12
    invoke-static {v2, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v1

    invoke-static {v2, v14, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    aget v1, v1, v4

    aget v6, v6, v4

    invoke-static {v1, v6}, Ljava/lang/Math;->min(FF)F

    move-result v1

    aput v1, v12, v4

    :cond_13
    :goto_6
    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v1, v4

    if-eqz v1, :cond_15

    invoke-static {v5, v7, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->isParallel([F[F[F[F)Z

    move-result v1

    if-eqz v1, :cond_14

    iget v1, v3, Landroid/graphics/RectF;->left:F

    const/4 v4, 0x0

    aput v1, v12, v4

    goto :goto_7

    :cond_14
    const/4 v4, 0x0

    :goto_7
    invoke-static {v2, v14, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v1

    invoke-static {v2, v15, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v2

    aget v1, v1, v4

    aget v2, v2, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, v12, v4

    goto/16 :goto_9

    :cond_15
    const/4 v4, 0x0

    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v1, v1, 0x100

    if-eqz v1, :cond_1b

    invoke-static {v5, v7, v10, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->isParallel([F[F[F[F)Z

    move-result v1

    if-eqz v1, :cond_16

    iget v1, v3, Landroid/graphics/RectF;->right:F

    aput v1, v12, v4

    :cond_16
    invoke-static {v2, v10, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v1

    invoke-static {v2, v11, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v2

    aget v1, v1, v4

    aget v2, v2, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    aput v1, v12, v4

    goto/16 :goto_9

    :cond_17
    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v1, v1, 0x10

    const/high16 v3, 0x40000000    # 2.0f

    if-eqz v1, :cond_19

    const/4 v1, 0x2

    new-array v4, v1, [F

    move-object/from16 v1, v18

    iget v5, v1, Landroid/graphics/RectF;->left:F

    iget v6, v1, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v6

    div-float/2addr v5, v3

    const/4 v6, 0x0

    aput v5, v4, v6

    iget v5, v1, Landroid/graphics/RectF;->bottom:F

    const/4 v6, 0x1

    aput v5, v4, v6

    invoke-static {v2, v4, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v5

    invoke-static {v2, v4, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v4, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v7

    invoke-static {v2, v4, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    iget v9, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v13

    mul-float v13, v13, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v18

    div-float v13, v13, v18

    const/16 v16, 0x0

    aget v18, v4, v16

    aget v7, v7, v16

    sub-float v7, v18, v7

    aget v8, v8, v16

    aget v4, v4, v16

    sub-float/2addr v8, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v4

    mul-float v13, v13, v4

    sub-float/2addr v9, v13

    const/4 v4, 0x1

    aget v5, v5, v4

    aget v6, v6, v4

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-static {v9, v5}, Ljava/lang/Math;->max(FF)F

    move-result v5

    aput v5, v12, v4

    :cond_18
    const/4 v5, 0x1

    goto :goto_8

    :cond_19
    move-object/from16 v1, v18

    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v4, v4, 0x1000

    if-eqz v4, :cond_18

    const/4 v4, 0x2

    new-array v5, v4, [F

    iget v4, v1, Landroid/graphics/RectF;->left:F

    iget v6, v1, Landroid/graphics/RectF;->right:F

    add-float/2addr v4, v6

    div-float/2addr v4, v3

    const/4 v6, 0x0

    aput v4, v5, v6

    iget v4, v1, Landroid/graphics/RectF;->top:F

    const/4 v6, 0x1

    aput v4, v5, v6

    invoke-static {v2, v5, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v5, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v5, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v7

    invoke-static {v2, v5, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    iget v9, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v13

    mul-float v13, v13, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v18

    div-float v13, v13, v18

    const/16 v16, 0x0

    aget v18, v5, v16

    aget v7, v7, v16

    sub-float v7, v18, v7

    aget v8, v8, v16

    aget v5, v5, v16

    sub-float/2addr v8, v5

    invoke-static {v7, v8}, Ljava/lang/Math;->min(FF)F

    move-result v5

    mul-float v13, v13, v5

    add-float/2addr v9, v13

    const/4 v5, 0x1

    aget v4, v4, v5

    aget v6, v6, v5

    invoke-static {v4, v6}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v9, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    aput v4, v12, v5

    :goto_8
    iget v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v4, v5

    if-eqz v4, :cond_1a

    const/4 v4, 0x2

    new-array v4, v4, [F

    iget v6, v1, Landroid/graphics/RectF;->right:F

    const/4 v7, 0x0

    aput v6, v4, v7

    iget v6, v1, Landroid/graphics/RectF;->top:F

    iget v7, v1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v6, v7

    div-float/2addr v6, v3

    aput v6, v4, v5

    invoke-static {v2, v4, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v6

    invoke-static {v2, v4, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v7

    invoke-static {v2, v4, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    invoke-static {v2, v4, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v2

    iget v9, v1, Landroid/graphics/RectF;->right:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v10

    mul-float v10, v10, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v10, v1

    aget v1, v4, v5

    aget v3, v8, v5

    sub-float/2addr v1, v3

    aget v2, v2, v5

    aget v3, v4, v5

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    mul-float v10, v10, v1

    sub-float/2addr v9, v10

    const/4 v4, 0x0

    aget v1, v6, v4

    aget v2, v7, v4

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-static {v9, v1}, Ljava/lang/Math;->max(FF)F

    move-result v1

    aput v1, v12, v4

    goto :goto_9

    :cond_1a
    const/4 v4, 0x0

    iget v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 v5, v5, 0x100

    if-eqz v5, :cond_1b

    const/4 v5, 0x2

    new-array v5, v5, [F

    iget v6, v1, Landroid/graphics/RectF;->left:F

    aput v6, v5, v4

    iget v4, v1, Landroid/graphics/RectF;->top:F

    iget v6, v1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v4, v6

    div-float/2addr v4, v3

    const/4 v6, 0x1

    aput v4, v5, v6

    invoke-static {v2, v5, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v4

    invoke-static {v2, v5, v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v7

    invoke-static {v2, v5, v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v8

    invoke-static {v2, v5, v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropCalculateUtils;->getRectIntersection(Ljava/util/List;[F[F)[F

    move-result-object v2

    iget v9, v1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v10

    mul-float v10, v10, v3

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v10, v1

    aget v1, v5, v6

    aget v3, v8, v6

    sub-float/2addr v1, v3

    aget v2, v2, v6

    aget v3, v5, v6

    sub-float/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    mul-float v10, v10, v1

    add-float/2addr v9, v10

    const/4 v1, 0x0

    aget v2, v4, v1

    aget v3, v7, v1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    aput v2, v12, v1

    :cond_1b
    :goto_9
    return-object v12
.end method

.method private onFixedResize(FF)Landroid/graphics/PointF;
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    invoke-static {v0}, Ljava/lang/Integer;->bitCount(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onFixedResizeEdge(FF)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onFixedResizeVertex(FF)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1
.end method

.method private onFixedResizeEdge(FF)Landroid/graphics/PointF;
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->calculateMinSize()I

    move-result v3

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v4

    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5}, Landroid/graphics/RectF;-><init>()V

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v6}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v6

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    iget-object v8, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v7

    iget-object v8, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v8

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v7

    invoke-virtual {v7, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    const/4 v7, 0x4

    new-array v8, v7, [F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v9

    new-array v7, v7, [F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    const/4 v11, 0x0

    aput v10, v7, v11

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    const/4 v12, 0x1

    aput v10, v7, v12

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->right:F

    const/4 v13, 0x2

    aput v10, v7, v13

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    const/4 v14, 0x3

    aput v10, v7, v14

    invoke-virtual {v9, v8, v7}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    invoke-direct {v0, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->getImageCropBound(Landroid/graphics/RectF;)[F

    move-result-object v5

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/high16 v10, 0x3f800000    # 1.0f

    const/high16 v15, 0x40000000    # 2.0f

    const/high16 v16, -0x40800000    # -1.0f

    const/16 v17, 0x0

    if-eq v7, v12, :cond_f

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v9, 0x100

    if-ne v7, v9, :cond_0

    goto/16 :goto_9

    :cond_0
    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v7, 0x10

    if-eq v1, v7, :cond_1

    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v9, 0x1000

    if-ne v1, v9, :cond_1d

    :cond_1
    iget v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    if-ne v1, v7, :cond_3

    mul-float v1, v2, v16

    cmpl-float v2, v1, v17

    if-lez v2, :cond_2

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget v9, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v9

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->top:F

    aget v5, v5, v12

    sub-float v5, v9, v5

    goto :goto_1

    :cond_2
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v5

    neg-int v5, v3

    int-to-float v5, v5

    invoke-direct {v0, v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v2

    const/4 v5, 0x0

    goto :goto_1

    :cond_3
    cmpl-float v1, v2, v17

    if-lez v1, :cond_4

    iget v1, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v9

    aget v5, v5, v12

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v5, v9

    :goto_0
    move/from16 v18, v2

    move v2, v1

    move/from16 v1, v18

    goto :goto_1

    :cond_4
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v5

    neg-int v5, v3

    int-to-float v5, v5

    invoke-direct {v0, v1, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v1

    const/4 v5, 0x0

    goto :goto_0

    :goto_1
    cmpl-float v9, v1, v17

    if-lez v9, :cond_5

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/RectF;->left:F

    iget v9, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v9

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v9

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v9

    invoke-static {v3, v4}, Ljava/lang/Math;->min(FF)F

    move-result v12

    invoke-virtual {v9, v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getHeight(F)F

    move-result v9

    invoke-static {v9, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    goto :goto_2

    :cond_5
    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v9

    neg-int v3, v3

    int-to-float v3, v3

    invoke-direct {v0, v4, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v3

    div-float/2addr v3, v15

    move v4, v3

    :goto_2
    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    move-result v1

    cmpl-float v5, v1, v2

    if-lez v5, :cond_7

    sub-float v5, v1, v2

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    div-float/2addr v5, v6

    sub-float/2addr v10, v5

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    aget v6, v8, v11

    aget v9, v8, v13

    add-float/2addr v6, v9

    div-float/2addr v6, v15

    iget v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    if-ne v9, v7, :cond_6

    aget v8, v8, v14

    goto :goto_3

    :cond_6
    const/4 v9, 0x1

    aget v8, v8, v9

    :goto_3
    invoke-virtual {v5, v10, v10, v6, v8}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    :cond_7
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v2

    if-lez v5, :cond_9

    cmpl-float v1, v1, v17

    if-lez v1, :cond_8

    const/4 v1, 0x1

    goto :goto_4

    :cond_8
    const/4 v1, -0x1

    :goto_4
    int-to-float v1, v1

    mul-float v1, v1, v2

    :cond_9
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getWidth(F)F

    move-result v2

    div-float v5, v2, v15

    cmpl-float v6, v5, v3

    if-gtz v6, :cond_b

    cmpl-float v6, v5, v4

    if-lez v6, :cond_a

    goto :goto_5

    :cond_a
    move v3, v5

    move v4, v3

    goto :goto_6

    :cond_b
    :goto_5
    cmpg-float v5, v3, v4

    if-gez v5, :cond_c

    sub-float v4, v2, v3

    goto :goto_6

    :cond_c
    sub-float v3, v2, v4

    :goto_6
    cmpg-float v2, v1, v17

    if-gez v2, :cond_d

    mul-float v4, v4, v16

    goto :goto_7

    :cond_d
    mul-float v3, v3, v16

    :goto_7
    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    if-ne v2, v7, :cond_e

    mul-float v1, v1, v16

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v5, v1

    iput v5, v2, Landroid/graphics/RectF;->top:F

    goto :goto_8

    :cond_e
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v5, v1

    iput v5, v2, Landroid/graphics/RectF;->bottom:F

    :goto_8
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v3

    iput v5, v2, Landroid/graphics/RectF;->left:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v3, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->right:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v2

    iput v1, v2, Landroid/graphics/PointF;->y:F

    goto/16 :goto_13

    :cond_f
    :goto_9
    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v7, 0x1

    if-ne v2, v7, :cond_11

    mul-float v1, v1, v16

    cmpl-float v2, v1, v17

    if-ltz v2, :cond_10

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget v7, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->left:F

    aget v5, v5, v11

    sub-float v5, v7, v5

    goto :goto_b

    :cond_10
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v5

    neg-int v5, v3

    int-to-float v5, v5

    invoke-direct {v0, v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v2

    :goto_a
    const/4 v5, 0x0

    goto :goto_b

    :cond_11
    cmpl-float v2, v1, v17

    if-ltz v2, :cond_12

    iget v2, v4, Landroid/graphics/RectF;->right:F

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v7

    aget v5, v5, v11

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, v7

    goto :goto_b

    :cond_12
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v5

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v2, v5

    neg-int v5, v3

    int-to-float v5, v5

    invoke-direct {v0, v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v2

    goto :goto_a

    :goto_b
    cmpl-float v7, v1, v17

    if-lez v7, :cond_13

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/RectF;->top:F

    iget v7, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v7

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v7

    invoke-static {v4, v3}, Ljava/lang/Math;->min(FF)F

    move-result v9

    invoke-virtual {v7, v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getWidth(F)F

    move-result v7

    invoke-static {v7, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    goto :goto_c

    :cond_13
    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v7

    neg-int v3, v3

    int-to-float v3, v3

    invoke-direct {v0, v4, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v3

    div-float/2addr v3, v15

    move v4, v3

    :goto_c
    invoke-static {v1, v5}, Ljava/lang/Math;->min(FF)F

    move-result v1

    cmpl-float v5, v1, v2

    if-lez v5, :cond_15

    sub-float v5, v1, v2

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v5, v6

    sub-float/2addr v10, v5

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v5

    iget v6, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v7, 0x1

    if-ne v6, v7, :cond_14

    aget v6, v8, v13

    goto :goto_d

    :cond_14
    aget v6, v8, v11

    :goto_d
    aget v9, v8, v7

    aget v7, v8, v14

    add-float/2addr v9, v7

    div-float/2addr v9, v15

    invoke-virtual {v5, v10, v10, v6, v9}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    :cond_15
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    cmpl-float v5, v5, v2

    if-lez v5, :cond_17

    cmpl-float v1, v1, v17

    if-lez v1, :cond_16

    const/4 v1, 0x1

    goto :goto_e

    :cond_16
    const/4 v1, -0x1

    :goto_e
    int-to-float v1, v1

    mul-float v1, v1, v2

    :cond_17
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getHeight(F)F

    move-result v2

    div-float v5, v2, v15

    cmpl-float v6, v5, v3

    if-gtz v6, :cond_19

    cmpl-float v6, v5, v4

    if-lez v6, :cond_18

    goto :goto_f

    :cond_18
    move v3, v5

    move v4, v3

    goto :goto_10

    :cond_19
    :goto_f
    cmpg-float v5, v3, v4

    if-gez v5, :cond_1a

    sub-float v4, v2, v3

    goto :goto_10

    :cond_1a
    sub-float v3, v2, v4

    :goto_10
    cmpg-float v2, v1, v17

    if-gez v2, :cond_1b

    mul-float v4, v4, v16

    goto :goto_11

    :cond_1b
    mul-float v3, v3, v16

    :goto_11
    iget v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v5, 0x1

    if-ne v2, v5, :cond_1c

    mul-float v1, v1, v16

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v5, v1

    iput v5, v2, Landroid/graphics/RectF;->left:F

    goto :goto_12

    :cond_1c
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v1

    iput v5, v2, Landroid/graphics/RectF;->right:F

    :goto_12
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v5, v2, Landroid/graphics/RectF;->top:F

    add-float/2addr v5, v3

    iput v5, v2, Landroid/graphics/RectF;->top:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v3, v2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v3, v4

    iput v3, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v2

    iput v1, v2, Landroid/graphics/PointF;->x:F

    :cond_1d
    :goto_13
    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v1

    return-object v1
.end method

.method private onFixedResizeVertex(FF)Landroid/graphics/PointF;
    .locals 12

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->calculateMinSize()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v1

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v6}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v4

    invoke-virtual {v4, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v4, v4, 0x10

    const/high16 v5, -0x40800000    # -1.0f

    if-eqz v4, :cond_0

    mul-float p2, p2, v5

    :cond_0
    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v6, 0x1

    and-int/2addr v4, v6

    if-eqz v4, :cond_1

    mul-float p1, p1, v5

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v4

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v7

    mul-float v4, v4, v7

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v7

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v4, v7

    float-to-double v7, v4

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    double-to-float v4, v7

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v7

    div-float/2addr v7, v4

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v8

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v8

    div-float/2addr v8, v4

    mul-float p1, p1, v7

    mul-float p2, p2, v8

    add-float/2addr p1, p2

    mul-float v7, v7, p1

    mul-float p1, p1, v8

    const/4 p2, 0x4

    new-array v4, p2, [F

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v8

    new-array p2, p2, [F

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->left:F

    const/4 v10, 0x0

    aput v9, p2, v10

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->top:F

    aput v9, p2, v6

    const/4 v9, 0x2

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->right:F

    aput v11, p2, v9

    const/4 v9, 0x3

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    aput v11, p2, v9

    invoke-virtual {v8, v4, p2}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->getImageCropBound(Landroid/graphics/RectF;)[F

    move-result-object p2

    const/4 v2, 0x0

    cmpl-float v4, v7, v2

    if-lez v4, :cond_3

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v4, v6

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->left:F

    iget v8, v1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v8

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/RectF;->left:F

    aget v9, p2, v10

    sub-float/2addr v8, v9

    goto :goto_0

    :cond_2
    iget v4, v1, Landroid/graphics/RectF;->right:F

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/RectF;->right:F

    sub-float/2addr v4, v8

    aget v8, p2, v10

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    iget v9, v9, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v9

    goto :goto_0

    :cond_3
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    iget v4, v4, Landroid/graphics/RectF;->right:F

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v8

    iget v8, v8, Landroid/graphics/RectF;->left:F

    sub-float/2addr v4, v8

    neg-int v8, v0

    int-to-float v8, v8

    invoke-direct {p0, v4, v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v4

    const/4 v8, 0x0

    :goto_0
    cmpl-float v9, p1, v2

    if-lez v9, :cond_5

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v0, v0, 0x10

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->top:F

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->top:F

    aget p2, p2, v6

    sub-float p2, v1, p2

    goto :goto_1

    :cond_4
    iget v0, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v1

    aget p2, p2, v6

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p2, v1

    goto :goto_1

    :cond_5
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p2

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr p2, v1

    neg-int v0, v0

    int-to-float v0, v0

    invoke-direct {p0, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v0

    const/4 p2, 0x0

    :goto_1
    cmpl-float v1, v7, v8

    if-lez v1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p1

    invoke-virtual {p1, v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getHeight(F)F

    move-result p1

    move v7, v8

    :cond_6
    cmpl-float v1, p1, p2

    if-lez v1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->getWidth(F)F

    move-result v7

    move p1, p2

    :cond_7
    cmpl-float p2, v7, v4

    if-gtz p2, :cond_8

    cmpl-float p2, p1, v0

    if-lez p2, :cond_c

    :cond_8
    sub-float p2, v7, v4

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float v1, p2, v1

    sub-float v8, p1, v0

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v9

    div-float v9, v8, v9

    cmpl-float v1, v1, v9

    const/high16 v9, 0x3f800000    # 1.0f

    if-lez v1, :cond_9

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr p2, v1

    sub-float/2addr v9, p2

    goto :goto_2

    :cond_9
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result p2

    div-float/2addr v8, p2

    sub-float/2addr v9, v8

    :goto_2
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v1, v6

    if-eqz v1, :cond_a

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->right:F

    goto :goto_3

    :cond_a
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    :goto_3
    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 v3, v3, 0x10

    if-eqz v3, :cond_b

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    goto :goto_4

    :cond_b
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v3, v3, Landroid/graphics/RectF;->top:F

    :goto_4
    invoke-virtual {p2, v9, v9, v1, v3}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    :cond_c
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, p2, v4

    const/4 v1, -0x1

    if-lez p2, :cond_e

    cmpl-float p1, v7, v2

    if-lez p1, :cond_d

    const/4 p1, 0x1

    goto :goto_5

    :cond_d
    const/4 p1, -0x1

    :goto_5
    int-to-float p1, p1

    mul-float v7, v4, p1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result p1

    div-float p1, v7, p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result p2

    mul-float p1, p1, p2

    :cond_e
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p2

    cmpl-float p2, p2, v0

    if-lez p2, :cond_10

    cmpl-float p1, p1, v2

    if-lez p1, :cond_f

    const/4 v1, 0x1

    :cond_f
    int-to-float p1, v1

    mul-float p1, p1, v0

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result p2

    div-float p2, p1, p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v0

    mul-float v7, p2, v0

    :cond_10
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit8 p2, p2, 0x10

    if-eqz p2, :cond_11

    mul-float p1, p1, v5

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, p1

    iput v0, p2, Landroid/graphics/RectF;->top:F

    goto :goto_6

    :cond_11
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 p2, p2, 0x1000

    if-eqz p2, :cond_12

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, p1

    iput v0, p2, Landroid/graphics/RectF;->bottom:F

    :cond_12
    :goto_6
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr p2, v6

    if-eqz p2, :cond_13

    mul-float v7, v7, v5

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->left:F

    add-float/2addr v0, v7

    iput v0, p2, Landroid/graphics/RectF;->left:F

    goto :goto_7

    :cond_13
    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/lit16 p2, p2, 0x100

    if-eqz p2, :cond_14

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p2

    iget v0, p2, Landroid/graphics/RectF;->right:F

    add-float/2addr v0, v7

    iput v0, p2, Landroid/graphics/RectF;->right:F

    :cond_14
    :goto_7
    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object p2

    iput v7, p2, Landroid/graphics/PointF;->x:F

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object p2

    iput p1, p2, Landroid/graphics/PointF;->y:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object p1

    return-object p1
.end method

.method private onFreeResize(FF)Landroid/graphics/PointF;
    .locals 19

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v3

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v4

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->calculateMinSize()I

    move-result v5

    new-instance v6, Landroid/graphics/RectF;

    invoke-direct {v6}, Landroid/graphics/RectF;-><init>()V

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-virtual {v7, v6, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    iget-object v8, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v8

    invoke-virtual {v7, v8}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v7

    iget-object v8, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v8}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v8

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    const/4 v7, 0x4

    new-array v8, v7, [F

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v9}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;

    move-result-object v9

    new-array v7, v7, [F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    const/4 v11, 0x0

    aput v10, v7, v11

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    const/4 v12, 0x1

    aput v10, v7, v12

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->right:F

    const/4 v13, 0x2

    aput v10, v7, v13

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    const/4 v14, 0x3

    aput v10, v7, v14

    invoke-virtual {v9, v8, v7}, Landroid/graphics/Matrix;->mapPoints([F[F)V

    invoke-direct {v0, v6}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->getImageCropBound(Landroid/graphics/RectF;)[F

    move-result-object v6

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v7, v12

    const/16 v10, 0x1000

    const/16 v15, 0x10

    const/high16 v16, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    if-eqz v7, :cond_5

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    and-int/2addr v7, v15

    if-eqz v7, :cond_5

    cmpg-float v7, p1, v9

    if-gtz v7, :cond_17

    cmpg-float v7, p2, v9

    if-gtz v7, :cond_17

    aget v7, v6, v11

    iget-object v15, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v15

    iget v15, v15, Landroid/graphics/RectF;->left:F

    sub-float/2addr v7, v15

    cmpg-float v15, p1, v7

    if-gez v15, :cond_0

    move v1, v7

    goto :goto_0

    :cond_0
    move/from16 v1, p1

    :goto_0
    aget v7, v6, v12

    iget-object v15, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v15

    iget v15, v15, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v15

    cmpg-float v15, p2, v7

    if-gez v15, :cond_1

    move v2, v7

    goto :goto_1

    :cond_1
    move/from16 v2, p2

    :goto_1
    iget v7, v3, Landroid/graphics/RectF;->top:F

    iget-object v15, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v15}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v15

    iget v15, v15, Landroid/graphics/RectF;->top:F

    cmpl-float v7, v7, v15

    if-ltz v7, :cond_3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v15, v7, v9

    if-lez v15, :cond_2

    const/4 v15, 0x1

    goto :goto_2

    :cond_2
    const/4 v15, 0x0

    :goto_2
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v18

    div-float v7, v7, v18

    sub-float v7, v16, v7

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v11

    aget v10, v8, v13

    aget v12, v8, v14

    invoke-virtual {v11, v7, v7, v10, v12}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    move v11, v15

    goto/16 :goto_10

    :cond_3
    iget v7, v3, Landroid/graphics/RectF;->left:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    cmpl-float v7, v7, v10

    if-ltz v7, :cond_18

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_4

    const/16 v10, 0x100

    const/4 v11, 0x1

    goto :goto_3

    :cond_4
    const/16 v10, 0x100

    const/4 v11, 0x0

    :goto_3
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    aget v12, v8, v13

    aget v15, v8, v14

    invoke-virtual {v10, v7, v7, v12, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto/16 :goto_10

    :cond_5
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v10, 0x1

    and-int/2addr v7, v10

    if-eqz v7, :cond_b

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v10, 0x1000

    and-int/2addr v7, v10

    if-eqz v7, :cond_b

    cmpg-float v7, p1, v9

    if-gtz v7, :cond_17

    cmpl-float v7, p2, v9

    if-ltz v7, :cond_17

    const/4 v7, 0x0

    aget v10, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->left:F

    sub-float v7, v10, v7

    cmpg-float v10, p1, v7

    if-gez v10, :cond_6

    move v1, v7

    goto :goto_4

    :cond_6
    move/from16 v1, p1

    :goto_4
    const/4 v7, 0x1

    aget v10, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    sub-float v7, v10, v7

    cmpl-float v10, p2, v7

    if-lez v10, :cond_7

    move v2, v7

    goto :goto_5

    :cond_7
    move/from16 v2, p2

    :goto_5
    iget v7, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    cmpg-float v7, v7, v10

    if-gtz v7, :cond_9

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_8

    const/16 v10, 0x10

    const/4 v11, 0x1

    goto :goto_6

    :cond_8
    const/16 v10, 0x10

    const/4 v11, 0x0

    :goto_6
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    aget v12, v8, v13

    const/4 v15, 0x1

    aget v14, v8, v15

    invoke-virtual {v10, v7, v7, v12, v14}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto/16 :goto_10

    :cond_9
    iget v7, v3, Landroid/graphics/RectF;->left:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->left:F

    cmpl-float v7, v7, v10

    if-ltz v7, :cond_18

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_a

    const/16 v10, 0x100

    const/4 v11, 0x1

    goto :goto_7

    :cond_a
    const/16 v10, 0x100

    const/4 v11, 0x0

    :goto_7
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    aget v12, v8, v13

    const/4 v14, 0x1

    aget v15, v8, v14

    invoke-virtual {v10, v7, v7, v12, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto/16 :goto_10

    :cond_b
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v10, 0x100

    and-int/2addr v7, v10

    if-eqz v7, :cond_11

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v10, 0x10

    and-int/2addr v7, v10

    if-eqz v7, :cond_11

    cmpl-float v7, p1, v9

    if-ltz v7, :cond_17

    cmpg-float v7, p2, v9

    if-gtz v7, :cond_17

    const/4 v7, 0x0

    aget v10, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->right:F

    sub-float v7, v10, v7

    cmpl-float v10, p1, v7

    if-lez v10, :cond_c

    move v1, v7

    goto :goto_8

    :cond_c
    move/from16 v1, p1

    :goto_8
    const/4 v7, 0x1

    aget v10, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->top:F

    sub-float v7, v10, v7

    cmpg-float v10, p2, v7

    if-gez v10, :cond_d

    move v2, v7

    goto :goto_9

    :cond_d
    move/from16 v2, p2

    :goto_9
    iget v7, v3, Landroid/graphics/RectF;->top:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->top:F

    cmpl-float v7, v7, v10

    if-ltz v7, :cond_f

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_e

    const/16 v10, 0x1000

    const/4 v11, 0x1

    goto :goto_a

    :cond_e
    const/16 v10, 0x1000

    const/4 v11, 0x0

    :goto_a
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    const/4 v12, 0x0

    aget v14, v8, v12

    const/4 v12, 0x3

    aget v15, v8, v12

    invoke-virtual {v10, v7, v7, v14, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto/16 :goto_10

    :cond_f
    iget v7, v3, Landroid/graphics/RectF;->right:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->right:F

    cmpg-float v7, v7, v10

    if-gtz v7, :cond_18

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_10

    const/4 v10, 0x1

    const/4 v11, 0x1

    goto :goto_b

    :cond_10
    const/4 v10, 0x1

    const/4 v11, 0x0

    :goto_b
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    const/4 v12, 0x0

    aget v14, v8, v12

    const/4 v12, 0x3

    aget v15, v8, v12

    invoke-virtual {v10, v7, v7, v14, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto/16 :goto_10

    :cond_11
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v10, 0x100

    and-int/2addr v7, v10

    if-eqz v7, :cond_17

    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v10, 0x1000

    and-int/2addr v7, v10

    if-eqz v7, :cond_17

    cmpl-float v7, p1, v9

    if-ltz v7, :cond_17

    cmpl-float v7, p2, v9

    if-ltz v7, :cond_17

    const/4 v7, 0x0

    aget v10, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->right:F

    sub-float v7, v10, v7

    cmpl-float v10, p1, v7

    if-lez v10, :cond_12

    move v1, v7

    goto :goto_c

    :cond_12
    move/from16 v1, p1

    :goto_c
    const/4 v10, 0x1

    aget v11, v6, v10

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v10

    iget v10, v10, Landroid/graphics/RectF;->bottom:F

    sub-float v10, v11, v10

    cmpl-float v11, p2, v10

    if-lez v11, :cond_13

    move v2, v10

    goto :goto_d

    :cond_13
    move/from16 v2, p2

    :goto_d
    iget v11, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->bottom:F

    cmpg-float v11, v11, v12

    if-gtz v11, :cond_15

    cmpl-float v10, v10, v9

    if-eqz v10, :cond_15

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_14

    const/16 v10, 0x10

    const/4 v11, 0x1

    goto :goto_e

    :cond_14
    const/16 v10, 0x10

    const/4 v11, 0x0

    :goto_e
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v10

    div-float/2addr v7, v10

    sub-float v7, v16, v7

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v10}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v10

    const/4 v12, 0x0

    aget v14, v8, v12

    const/4 v12, 0x1

    aget v15, v8, v12

    invoke-virtual {v10, v7, v7, v14, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto :goto_10

    :cond_15
    iget v10, v3, Landroid/graphics/RectF;->right:F

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->right:F

    cmpg-float v10, v10, v11

    if-gtz v10, :cond_18

    cmpl-float v7, v7, v9

    if-eqz v7, :cond_18

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v10, v7, v9

    if-lez v10, :cond_16

    const/4 v10, 0x1

    const/4 v11, 0x1

    goto :goto_f

    :cond_16
    const/4 v10, 0x1

    const/4 v11, 0x0

    :goto_f
    invoke-direct {v0, v10, v7, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v7

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float/2addr v7, v12

    sub-float v7, v16, v7

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v12

    const/4 v14, 0x0

    aget v15, v8, v14

    aget v14, v8, v10

    invoke-virtual {v12, v7, v7, v15, v14}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    goto :goto_10

    :cond_17
    move/from16 v1, p1

    move/from16 v2, p2

    :cond_18
    const/4 v11, 0x0

    :goto_10
    if-eqz v11, :cond_19

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v1

    invoke-virtual {v1, v9, v9}, Landroid/graphics/PointF;->set(FF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v1

    return-object v1

    :cond_19
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/4 v10, 0x1

    and-int/2addr v7, v10

    const/high16 v10, 0x40000000    # 2.0f

    if-eqz v7, :cond_1e

    const/4 v7, 0x0

    aget v11, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->left:F

    sub-float v7, v11, v7

    iget v11, v3, Landroid/graphics/RectF;->left:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->left:F

    sub-float/2addr v11, v12

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->right:F

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    iget v14, v14, Landroid/graphics/RectF;->left:F

    sub-float/2addr v12, v14

    neg-int v14, v5

    int-to-float v14, v14

    invoke-direct {v0, v12, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v12

    cmpg-float v14, v1, v7

    if-gez v14, :cond_1a

    move v1, v7

    :cond_1a
    cmpg-float v7, v1, v11

    if-gez v7, :cond_1c

    sub-float v1, v11, v1

    const/16 v7, 0x100

    invoke-direct {v0, v7, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v1

    cmpl-float v7, v1, v9

    if-lez v7, :cond_1b

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    div-float/2addr v1, v7

    sub-float v1, v16, v1

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    aget v12, v8, v13

    const/4 v14, 0x1

    aget v15, v8, v14

    const/4 v14, 0x3

    aget v17, v8, v14

    add-float v15, v15, v17

    div-float/2addr v15, v10

    invoke-virtual {v7, v1, v1, v12, v15}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v12, v7, Landroid/graphics/RectF;->top:F

    sub-float v1, v16, v1

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    move-result v14

    mul-float v14, v14, v1

    div-float/2addr v14, v10

    add-float/2addr v12, v14

    iput v12, v7, Landroid/graphics/RectF;->top:F

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v12, v7, Landroid/graphics/RectF;->bottom:F

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    move-result v14

    mul-float v1, v1, v14

    div-float/2addr v1, v10

    sub-float/2addr v12, v1

    iput v12, v7, Landroid/graphics/RectF;->bottom:F

    :cond_1b
    move v1, v11

    goto :goto_11

    :cond_1c
    cmpl-float v7, v1, v12

    if-lez v7, :cond_1d

    move v1, v12

    :cond_1d
    :goto_11
    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v11, v7, Landroid/graphics/RectF;->left:F

    add-float/2addr v11, v1

    iput v11, v7, Landroid/graphics/RectF;->left:F

    goto/16 :goto_13

    :cond_1e
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v11, 0x100

    and-int/2addr v7, v11

    if-eqz v7, :cond_23

    const/4 v7, 0x0

    aget v11, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->right:F

    sub-float v7, v11, v7

    iget v11, v3, Landroid/graphics/RectF;->right:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->right:F

    sub-float/2addr v11, v12

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->left:F

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    iget v14, v14, Landroid/graphics/RectF;->right:F

    sub-float/2addr v12, v14

    int-to-float v14, v5

    invoke-direct {v0, v12, v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v12

    cmpl-float v14, v1, v7

    if-lez v14, :cond_1f

    move v1, v7

    :cond_1f
    cmpl-float v7, v1, v11

    if-lez v7, :cond_21

    sub-float/2addr v1, v11

    const/4 v7, 0x1

    invoke-direct {v0, v7, v1, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v1

    cmpl-float v12, v1, v9

    if-lez v12, :cond_20

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v12

    div-float/2addr v1, v12

    sub-float v1, v16, v1

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v12

    const/4 v14, 0x0

    aget v15, v8, v14

    aget v14, v8, v7

    const/4 v7, 0x3

    aget v17, v8, v7

    add-float v14, v14, v17

    div-float/2addr v14, v10

    invoke-virtual {v12, v1, v1, v15, v14}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v12, v7, Landroid/graphics/RectF;->top:F

    sub-float v1, v16, v1

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    move-result v14

    mul-float v14, v14, v1

    div-float/2addr v14, v10

    add-float/2addr v12, v14

    iput v12, v7, Landroid/graphics/RectF;->top:F

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v12, v7, Landroid/graphics/RectF;->bottom:F

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v14}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v14

    invoke-virtual {v14}, Landroid/graphics/RectF;->height()F

    move-result v14

    mul-float v1, v1, v14

    div-float/2addr v1, v10

    sub-float/2addr v12, v1

    iput v12, v7, Landroid/graphics/RectF;->bottom:F

    :cond_20
    move v1, v11

    goto :goto_12

    :cond_21
    cmpg-float v7, v1, v12

    if-gez v7, :cond_22

    move v1, v12

    :cond_22
    :goto_12
    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v11, v7, Landroid/graphics/RectF;->right:F

    add-float/2addr v11, v1

    iput v11, v7, Landroid/graphics/RectF;->right:F

    :cond_23
    :goto_13
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v11, 0x10

    and-int/2addr v7, v11

    if-eqz v7, :cond_28

    const/4 v7, 0x1

    aget v6, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->top:F

    sub-float/2addr v6, v7

    iget v7, v3, Landroid/graphics/RectF;->top:F

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v11

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->top:F

    sub-float/2addr v11, v12

    neg-int v5, v5

    int-to-float v5, v5

    invoke-direct {v0, v11, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v5

    cmpg-float v11, v2, v6

    if-gez v11, :cond_24

    move v2, v6

    :cond_24
    cmpg-float v6, v2, v7

    if-gez v6, :cond_26

    sub-float v2, v7, v2

    const/16 v5, 0x1000

    invoke-direct {v0, v5, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v2

    cmpl-float v3, v2, v9

    if-lez v3, :cond_25

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v2, v3

    sub-float v2, v16, v2

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    const/4 v4, 0x0

    aget v4, v8, v4

    aget v5, v8, v13

    add-float/2addr v4, v5

    div-float/2addr v4, v10

    const/4 v5, 0x3

    aget v5, v8, v5

    invoke-virtual {v3, v2, v2, v4, v5}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v4, v3, Landroid/graphics/RectF;->left:F

    sub-float v16, v16, v2

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    mul-float v2, v2, v16

    div-float/2addr v2, v10

    add-float/2addr v4, v2

    iput v4, v3, Landroid/graphics/RectF;->left:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v3, v2, Landroid/graphics/RectF;->right:F

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float v16, v16, v4

    div-float v16, v16, v10

    sub-float v3, v3, v16

    iput v3, v2, Landroid/graphics/RectF;->right:F

    :cond_25
    move v2, v7

    goto :goto_14

    :cond_26
    cmpl-float v3, v2, v5

    if-lez v3, :cond_27

    move v2, v5

    :cond_27
    :goto_14
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v4, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v4, v2

    iput v4, v3, Landroid/graphics/RectF;->top:F

    goto/16 :goto_16

    :cond_28
    iget v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    const/16 v11, 0x1000

    and-int/2addr v7, v11

    if-eqz v7, :cond_2d

    const/4 v7, 0x1

    aget v6, v6, v7

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v7}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v7

    iget v7, v7, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v6, v7

    iget v7, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v7, v11

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v11}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v11

    iget v11, v11, Landroid/graphics/RectF;->top:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v12}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v12

    iget v12, v12, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v11, v12

    int-to-float v5, v5

    invoke-direct {v0, v11, v5}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->constraint(FF)F

    move-result v5

    cmpl-float v11, v2, v6

    if-lez v11, :cond_29

    move v2, v6

    :cond_29
    cmpl-float v6, v2, v7

    if-lez v6, :cond_2b

    sub-float/2addr v2, v7

    const/16 v5, 0x10

    invoke-direct {v0, v5, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->checkOtherBoundOffset(IFLandroid/graphics/RectF;)F

    move-result v2

    cmpl-float v3, v2, v9

    if-lez v3, :cond_2a

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v2, v3

    sub-float v2, v16, v2

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    const/4 v4, 0x0

    aget v4, v8, v4

    aget v5, v8, v13

    add-float/2addr v4, v5

    div-float/2addr v4, v10

    const/4 v5, 0x1

    aget v5, v8, v5

    invoke-virtual {v3, v2, v2, v4, v5}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v4, v3, Landroid/graphics/RectF;->left:F

    sub-float v16, v16, v2

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    mul-float v2, v2, v16

    div-float/2addr v2, v10

    add-float/2addr v4, v2

    iput v4, v3, Landroid/graphics/RectF;->left:F

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v3, v2, Landroid/graphics/RectF;->right:F

    iget-object v4, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v4

    mul-float v16, v16, v4

    div-float v16, v16, v10

    sub-float v3, v3, v16

    iput v3, v2, Landroid/graphics/RectF;->right:F

    :cond_2a
    move v2, v7

    goto :goto_15

    :cond_2b
    cmpg-float v3, v2, v5

    if-gez v3, :cond_2c

    move v2, v5

    :cond_2c
    :goto_15
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    iget v4, v3, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v4, v2

    iput v4, v3, Landroid/graphics/RectF;->bottom:F

    :cond_2d
    :goto_16
    iget-object v3, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Landroid/graphics/PointF;->set(FF)V

    iget-object v1, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;

    move-result-object v1

    return-object v1
.end method

.method private resolveResizeEdge(FF)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    const/high16 v2, 0x40400000    # 3.0f

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v3

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v3, v2

    invoke-static {v1, v3}, Ljava/lang/Math;->min(FF)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, p2, v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v3

    add-float/2addr v2, v3

    cmpg-float v2, p2, v2

    if-gez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v3

    sub-float/2addr v2, v3

    cmpl-float v2, p1, v2

    if-lez v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->left:F

    add-float/2addr v2, v1

    cmpg-float v2, p1, v2

    if-gez v2, :cond_0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    or-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v2

    iget v2, v2, Landroid/graphics/RectF;->right:F

    sub-float/2addr v2, v1

    cmpl-float v1, p1, v2

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v2

    add-float/2addr v1, v2

    cmpg-float v1, p1, v1

    if-gez v1, :cond_1

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    or-int/lit16 v1, v1, 0x100

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v2

    sub-float/2addr v1, v2

    cmpl-float v1, p1, v1

    if-lez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v1

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v2

    add-float/2addr v1, v2

    cmpg-float p1, p1, v1

    if-gez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v1

    sub-float/2addr p1, v1

    cmpl-float p1, p2, p1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gez p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    or-int/lit8 p1, p1, 0x10

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    goto :goto_1

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, v0

    cmpl-float p1, p2, p1

    if-lez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F

    move-result v0

    add-float/2addr p1, v0

    cmpg-float p1, p2, p1

    if-gez p1, :cond_3

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    or-int/lit16 p1, p1, 0x1000

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    :cond_3
    :goto_1
    return-void
.end method


# virtual methods
.method protected onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-direct {p0, v0, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->resolveResizeEdge(FF)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    if-nez v0, :cond_0

    return v2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->RESIZE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-static {v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1602(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v2, p1}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    move-result-object v0

    sget-object v3, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->RESIZE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-eq v0, v3, :cond_2

    return v2

    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v3, 0x2

    if-ne v0, v3, :cond_6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    if-eqz v0, :cond_3

    return v2

    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->y:F

    sub-float/2addr p1, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mPreEdit:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v4

    if-ne v3, v4, :cond_4

    const/4 v2, 0x1

    :cond_4
    if-eqz v2, :cond_5

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onFreeResize(FF)Landroid/graphics/PointF;

    move-result-object p1

    goto :goto_0

    :cond_5
    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onFixedResize(FF)Landroid/graphics/PointF;

    move-result-object p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    iget v2, v0, Landroid/graphics/PointF;->x:F

    iget v3, p1, Landroid/graphics/PointF;->x:F

    add-float/2addr v2, v3

    iput v2, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeStart:Landroid/graphics/PointF;

    iget v2, v0, Landroid/graphics/PointF;->y:F

    iget p1, p1, Landroid/graphics/PointF;->y:F

    add-float/2addr v2, p1

    iput v2, v0, Landroid/graphics/PointF;->y:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->fixImageBounds(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    goto :goto_1

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v1, :cond_7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v3, 0x3

    if-eq v0, v3, :cond_7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v3, 0x6

    if-ne v0, v3, :cond_8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    if-nez p1, :cond_8

    :cond_7
    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->mResizeEdge:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SKIP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$1900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->this$0:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->access$2000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    :cond_8
    :goto_1
    return v1
.end method
