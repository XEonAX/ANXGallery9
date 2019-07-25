.class public Lcom/edmodo/cropper/CropImageView;
.super Landroid/widget/ImageView;
.source "CropImageView.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "com.edmodo.cropper.CropImageView"


# instance fields
.field private mAspectRatioX:I

.field private mAspectRatioY:I

.field private mBitmapRect:Landroid/graphics/RectF;

.field private mBorderPaint:Landroid/graphics/Paint;

.field private mBorderThickness:F

.field private mCornerLength:F

.field private mCornerPaint:Landroid/graphics/Paint;

.field private mCornerThickness:F

.field private mFixAspectRatio:Z

.field private mGuidelinePaint:Landroid/graphics/Paint;

.field private mGuidelinesMode:I

.field private mHandleRadius:F

.field private mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

.field private mSnapRadius:F

.field private mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

.field private mTouchOffset:Landroid/graphics/PointF;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    const/4 v0, 0x1

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/edmodo/cropper/CropImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    const/4 v0, 0x1

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    invoke-direct {p0, p1, p2}, Lcom/edmodo/cropper/CropImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    new-instance p3, Landroid/graphics/PointF;

    invoke-direct {p3}, Landroid/graphics/PointF;-><init>()V

    iput-object p3, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    const/4 p3, 0x1

    iput p3, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    iput p3, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    iput p3, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    invoke-direct {p0, p1, p2}, Lcom/edmodo/cropper/CropImageView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private drawBorder(Landroid/graphics/Canvas;)V
    .locals 7

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    iget-object v6, p0, Lcom/edmodo/cropper/CropImageView;->mBorderPaint:Landroid/graphics/Paint;

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawCorners(Landroid/graphics/Canvas;)V
    .locals 29

    move-object/from16 v0, p0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v2

    sget-object v3, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v3

    sget-object v4, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    iget v5, v0, Lcom/edmodo/cropper/CropImageView;->mCornerThickness:F

    iget v6, v0, Lcom/edmodo/cropper/CropImageView;->mBorderThickness:F

    sub-float/2addr v5, v6

    const/high16 v6, 0x40000000    # 2.0f

    div-float/2addr v5, v6

    iget v7, v0, Lcom/edmodo/cropper/CropImageView;->mCornerThickness:F

    iget v8, v0, Lcom/edmodo/cropper/CropImageView;->mBorderThickness:F

    div-float/2addr v8, v6

    sub-float/2addr v7, v8

    sub-float v6, v1, v5

    sub-float v14, v2, v7

    iget v8, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    add-float v12, v2, v8

    iget-object v13, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move v9, v6

    move v10, v14

    move v11, v6

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sub-float v21, v1, v7

    sub-float v22, v2, v5

    iget v8, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    add-float v18, v1, v8

    iget-object v8, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move-object/from16 v15, p1

    move/from16 v16, v21

    move/from16 v17, v22

    move/from16 v19, v22

    move-object/from16 v20, v8

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v26, v3, v5

    iget v8, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    add-float v12, v2, v8

    iget-object v13, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move/from16 v9, v26

    move/from16 v11, v26

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v2, v3, v7

    iget v8, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    sub-float v11, v3, v8

    iget-object v13, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move-object/from16 v8, p1

    move v9, v2

    move/from16 v10, v22

    move/from16 v12, v22

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float v25, v4, v7

    iget v7, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    sub-float v12, v4, v7

    iget-object v13, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move v9, v6

    move/from16 v10, v25

    move v11, v6

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-float/2addr v5, v4

    iget v6, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    add-float v18, v1, v6

    iget-object v1, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move/from16 v17, v5

    move/from16 v19, v5

    move-object/from16 v20, v1

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget v1, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    sub-float v27, v4, v1

    iget-object v1, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move-object/from16 v23, p1

    move/from16 v24, v26

    move-object/from16 v28, v1

    invoke-virtual/range {v23 .. v28}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget v1, v0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    sub-float v18, v3, v1

    iget-object v1, v0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    move/from16 v16, v2

    move-object/from16 v20, v1

    invoke-virtual/range {v15 .. v20}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawDarkenedSurroundingArea(Landroid/graphics/Canvas;)V
    .locals 14

    iget-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v12

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v13

    iget v7, v0, Landroid/graphics/RectF;->left:F

    iget v8, v0, Landroid/graphics/RectF;->top:F

    iget v9, v0, Landroid/graphics/RectF;->right:F

    iget-object v11, p0, Lcom/edmodo/cropper/CropImageView;->mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

    move-object v6, p1

    move v10, v1

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget v7, v0, Landroid/graphics/RectF;->left:F

    iget v9, v0, Landroid/graphics/RectF;->right:F

    iget v10, v0, Landroid/graphics/RectF;->bottom:F

    iget-object v11, p0, Lcom/edmodo/cropper/CropImageView;->mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

    move v8, v13

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget v3, v0, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/edmodo/cropper/CropImageView;->mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

    move-object v2, p1

    move v4, v1

    move v6, v13

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget v9, v0, Landroid/graphics/RectF;->right:F

    iget-object v11, p0, Lcom/edmodo/cropper/CropImageView;->mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

    move-object v6, p1

    move v7, v12

    move v8, v1

    move v10, v13

    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private drawGuidelines(Landroid/graphics/Canvas;)V
    .locals 12

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->shouldGuidelinesBeShown()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v1

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v9

    invoke-static {}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getWidth()F

    move-result v2

    const/high16 v10, 0x40400000    # 3.0f

    div-float v11, v2, v10

    add-float v5, v0, v11

    iget-object v7, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object v2, p1

    move v3, v5

    move v4, v1

    move v6, v9

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sub-float v5, v8, v11

    iget-object v7, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinePaint:Landroid/graphics/Paint;

    move v3, v5

    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    invoke-static {}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getHeight()F

    move-result v2

    div-float v7, v2, v10

    add-float v5, v1, v7

    iget-object v6, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinePaint:Landroid/graphics/Paint;

    move-object v1, p1

    move v2, v0

    move v3, v5

    move v4, v8

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    sub-float v5, v9, v7

    iget-object v6, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinePaint:Landroid/graphics/Paint;

    move v3, v5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method private getBitmapRect()Landroid/graphics/RectF;
    .locals 6

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    return-object v0

    :cond_0
    const/16 v1, 0x9

    new-array v1, v1, [F

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x4

    aget v3, v1, v3

    const/4 v4, 0x2

    aget v4, v1, v4

    const/4 v5, 0x5

    aget v1, v1, v5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v5, v5

    mul-float v5, v5, v2

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-float v0, v0

    mul-float v0, v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    const/4 v3, 0x0

    invoke-static {v4, v3}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-static {v1, v3}, Ljava/lang/Math;->max(FF)F

    move-result v1

    int-to-float v2, v2

    add-float/2addr v2, v4

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    int-to-float v0, v0

    add-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getHeight()I

    move-result v3

    int-to-float v3, v3

    invoke-static {v0, v3}, Ljava/lang/Math;->min(FF)F

    move-result v0

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v4, v1, v2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v3
.end method

.method private getTargetAspectRatio()F
    .locals 2

    iget v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    int-to-float v0, v0

    iget v1, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    sget-object v0, Lcom/edmodo/cropper/R$styleable;->CropImageView:[I

    const/4 v1, 0x0

    invoke-virtual {p1, p2, v0, v1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v0, 0x1

    const/4 v2, 0x3

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    const/4 v2, 0x2

    invoke-virtual {p2, v2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v2

    iput-boolean v2, p0, Lcom/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    iput v1, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v0

    iput v0, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1}, Lcom/edmodo/cropper/util/PaintUtil;->newBorderPaint(Landroid/content/res/Resources;)Landroid/graphics/Paint;

    move-result-object p2

    iput-object p2, p0, Lcom/edmodo/cropper/CropImageView;->mBorderPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/edmodo/cropper/util/PaintUtil;->newGuidelinePaint(Landroid/content/res/Resources;)Landroid/graphics/Paint;

    move-result-object p2

    iput-object p2, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinePaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/edmodo/cropper/util/PaintUtil;->newSurroundingAreaOverlayPaint(Landroid/content/res/Resources;)Landroid/graphics/Paint;

    move-result-object p2

    iput-object p2, p0, Lcom/edmodo/cropper/CropImageView;->mSurroundingAreaOverlayPaint:Landroid/graphics/Paint;

    invoke-static {p1}, Lcom/edmodo/cropper/util/PaintUtil;->newCornerPaint(Landroid/content/res/Resources;)Landroid/graphics/Paint;

    move-result-object p2

    iput-object p2, p0, Lcom/edmodo/cropper/CropImageView;->mCornerPaint:Landroid/graphics/Paint;

    const p2, 0x7f0604a7

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/edmodo/cropper/CropImageView;->mHandleRadius:F

    const p2, 0x7f060476

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/edmodo/cropper/CropImageView;->mSnapRadius:F

    const p2, 0x7f060059

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/edmodo/cropper/CropImageView;->mBorderThickness:F

    const p2, 0x7f0600e5

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    iput p2, p0, Lcom/edmodo/cropper/CropImageView;->mCornerThickness:F

    const p2, 0x7f0600e4

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/edmodo/cropper/CropImageView;->mCornerLength:F

    return-void
.end method

.method private initCropWindow(Landroid/graphics/RectF;)V
    .locals 4

    iget-boolean v0, p0, Lcom/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->initCropWindowWithFixedAspectRatio(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    const v1, 0x3dcccccd    # 0.1f

    mul-float v0, v0, v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    mul-float v2, v2, v1

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v3, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v3, v0

    invoke-virtual {v1, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v3, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v2

    invoke-virtual {v1, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v3, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v3, v0

    invoke-virtual {v1, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr p1, v2

    invoke-virtual {v0, p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    :goto_0
    return-void
.end method

.method private initCropWindowWithFixedAspectRatio(Landroid/graphics/RectF;)V
    .locals 4

    invoke-static {p1}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateAspectRatio(Landroid/graphics/RectF;)F

    move-result v0

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->getTargetAspectRatio()F

    move-result v1

    cmpl-float v0, v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->getTargetAspectRatio()F

    move-result v2

    invoke-static {v0, v2}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateWidth(FF)F

    move-result v0

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    div-float/2addr v0, v1

    sub-float/2addr v3, v0

    invoke-virtual {v2, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v2, p1, Landroid/graphics/RectF;->top:F

    invoke-virtual {v1, v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    add-float/2addr v2, v0

    invoke-virtual {v1, v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {v0, p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->getTargetAspectRatio()F

    move-result v2

    invoke-static {v0, v2}, Lcom/edmodo/cropper/util/AspectRatioUtil;->calculateHeight(FF)F

    move-result v0

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v3, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {v2, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v2, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    div-float/2addr v0, v1

    sub-float/2addr v3, v0

    invoke-virtual {v2, v3}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    iget v2, p1, Landroid/graphics/RectF;->right:F

    invoke-virtual {v1, v2}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    add-float/2addr p1, v0

    invoke-virtual {v1, p1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->setCoordinate(F)V

    :goto_0
    return-void
.end method

.method private onActionDown(FF)V
    .locals 12

    sget-object v0, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v0}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v0

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v8

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->RIGHT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v9

    sget-object v1, Lcom/edmodo/cropper/cropwindow/edge/Edge;->BOTTOM:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v1}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v10

    iget v7, p0, Lcom/edmodo/cropper/CropImageView;->mHandleRadius:F

    move v1, p1

    move v2, p2

    move v3, v0

    move v4, v8

    move v5, v9

    move v6, v10

    invoke-static/range {v1 .. v7}, Lcom/edmodo/cropper/util/HandleUtil;->getPressedHandle(FFFFFFF)Lcom/edmodo/cropper/cropwindow/handle/Handle;

    move-result-object v1

    iput-object v1, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    iget-object v1, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    iget-object v11, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    move v2, p1

    move v3, p2

    move v4, v0

    move v5, v8

    move v6, v9

    move v7, v10

    move-object v8, v11

    invoke-static/range {v1 .. v8}, Lcom/edmodo/cropper/util/HandleUtil;->getOffset(Lcom/edmodo/cropper/cropwindow/handle/Handle;FFFFFFLandroid/graphics/PointF;)V

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->invalidate()V

    :cond_0
    return-void
.end method

.method private onActionMove(FF)V
    .locals 7

    iget-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    add-float v2, p1, v0

    iget-object p1, p0, Lcom/edmodo/cropper/CropImageView;->mTouchOffset:Landroid/graphics/PointF;

    iget p1, p1, Landroid/graphics/PointF;->y:F

    add-float v3, p2, p1

    iget-boolean p1, p0, Lcom/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    if-eqz p1, :cond_1

    iget-object v1, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->getTargetAspectRatio()F

    move-result v4

    iget-object v5, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    iget v6, p0, Lcom/edmodo/cropper/CropImageView;->mSnapRadius:F

    invoke-virtual/range {v1 .. v6}, Lcom/edmodo/cropper/cropwindow/handle/Handle;->updateCropWindow(FFFLandroid/graphics/RectF;F)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    iget-object p2, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    iget v0, p0, Lcom/edmodo/cropper/CropImageView;->mSnapRadius:F

    invoke-virtual {p1, v2, v3, p2, v0}, Lcom/edmodo/cropper/cropwindow/handle/Handle;->updateCropWindow(FFLandroid/graphics/RectF;F)V

    :goto_0
    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->invalidate()V

    return-void
.end method

.method private onActionUp()V
    .locals 1

    iget-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->invalidate()V

    :cond_0
    return-void
.end method

.method private shouldGuidelinesBeShown()Z
    .locals 3

    iget v0, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1

    iget v0, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/edmodo/cropper/CropImageView;->mPressedHandle:Lcom/edmodo/cropper/cropwindow/handle/Handle;

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method


# virtual methods
.method public getCroppedImage()Landroid/graphics/Bitmap;
    .locals 7

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_5

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-nez v1, :cond_0

    goto/16 :goto_0

    :cond_0
    const/16 v1, 0x9

    new-array v1, v1, [F

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->getValues([F)V

    const/4 v2, 0x0

    aget v2, v1, v2

    const/4 v3, 0x4

    aget v3, v1, v3

    const/4 v4, 0x2

    aget v4, v1, v4

    const/4 v5, 0x5

    aget v1, v1, v5

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    sget-object v5, Lcom/edmodo/cropper/cropwindow/edge/Edge;->LEFT:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v5}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v5

    sub-float/2addr v5, v4

    div-float/2addr v5, v2

    sget-object v4, Lcom/edmodo/cropper/cropwindow/edge/Edge;->TOP:Lcom/edmodo/cropper/cropwindow/edge/Edge;

    invoke-virtual {v4}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getCoordinate()F

    move-result v4

    sub-float/2addr v4, v1

    div-float/2addr v4, v3

    invoke-static {}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getWidth()F

    move-result v1

    div-float/2addr v1, v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v2, v5

    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    move-result v1

    invoke-static {}, Lcom/edmodo/cropper/cropwindow/edge/Edge;->getHeight()F

    move-result v2

    div-float/2addr v2, v3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    float-to-int v3, v5

    float-to-int v4, v4

    float-to-double v5, v1

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v1, v5

    float-to-double v5, v2

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    double-to-int v2, v5

    const/4 v5, 0x1

    if-nez v1, :cond_1

    const/4 v1, 0x1

    :cond_1
    if-nez v2, :cond_2

    const/4 v2, 0x1

    :cond_2
    add-int v5, v3, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    if-le v5, v6, :cond_3

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v3, v5

    :cond_3
    add-int v5, v4, v2

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    if-le v5, v6, :cond_4

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    sub-int/2addr v5, v6

    sub-int/2addr v4, v5

    :cond_4
    invoke-static {v0, v3, v4, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0

    :cond_5
    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->drawDarkenedSurroundingArea(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->drawGuidelines(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->drawBorder(Landroid/graphics/Canvas;)V

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->drawCorners(Landroid/graphics/Canvas;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/ImageView;->onLayout(ZIIII)V

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->getBitmapRect()Landroid/graphics/RectF;

    move-result-object p1

    iput-object p1, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    iget-object p1, p0, Lcom/edmodo/cropper/CropImageView;->mBitmapRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/edmodo/cropper/CropImageView;->initCropWindow(Landroid/graphics/RectF;)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->isEnabled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    return v1

    :pswitch_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/edmodo/cropper/CropImageView;->onActionMove(FF)V

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    return v2

    :pswitch_1
    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v1}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    invoke-direct {p0}, Lcom/edmodo/cropper/CropImageView;->onActionUp()V

    return v2

    :pswitch_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/edmodo/cropper/CropImageView;->onActionDown(FF)V

    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public setAspectRatio(II)V
    .locals 0

    if-lez p1, :cond_1

    if-lez p2, :cond_1

    iput p1, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioX:I

    iput p2, p0, Lcom/edmodo/cropper/CropImageView;->mAspectRatioY:I

    iget-boolean p1, p0, Lcom/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->requestLayout()V

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Cannot set aspect ratio value to a number less than or equal to 0."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFixedAspectRatio(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/edmodo/cropper/CropImageView;->mFixAspectRatio:Z

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->requestLayout()V

    return-void
.end method

.method public setGuidelines(I)V
    .locals 0

    iput p1, p0, Lcom/edmodo/cropper/CropImageView;->mGuidelinesMode:I

    invoke-virtual {p0}, Lcom/edmodo/cropper/CropImageView;->invalidate()V

    return-void
.end method
