.class public Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;
.super Ljava/lang/Object;
.source "BitmapGestureParamsHolder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;
    }
.end annotation


# instance fields
.field private mAnimTargetMatrix:Landroid/graphics/Matrix;

.field public mBitmapDisplayInitRect:Landroid/graphics/RectF;

.field public mBitmapDisplayInsideRect:Landroid/graphics/RectF;

.field public mBitmapDisplayRect:Landroid/graphics/RectF;

.field public mBitmapRect:Landroid/graphics/RectF;

.field public mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

.field public mCanvasMatrix:Landroid/graphics/Matrix;

.field public mCanvasMatrixInvert:Landroid/graphics/Matrix;

.field public mDisplayInitRect:Landroid/graphics/RectF;

.field public mDisplayInsideRect:Landroid/graphics/RectF;

.field public mDisplayRect:Landroid/graphics/RectF;

.field public mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

.field private mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

.field private mMatrixUpdateListener:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

.field private mMatrixValues:[F

.field private mMaxWidth:F

.field public mMaxWidthScale:F

.field private mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

.field private mRectFTemp:Landroid/graphics/RectF;

.field private mScaleFocusX:F

.field private mScaleFocusY:F

.field private mTarget:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInsideRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrixInvert:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    const/16 v0, 0x9

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixValues:[F

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mRectFTemp:Landroid/graphics/RectF;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusY:F

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixUpdateListener:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mTarget:Landroid/view/View;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixUpdateListener:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->setMatrixUpdateListener(Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition$MatrixUpdateListener;)V

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    return-void
.end method

.method private onBitmapMatrixChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;->onBitmapMatrixChanged()V

    :cond_0
    return-void
.end method

.method private onCanvasMatrixChange()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;->onCanvasMatrixChange()V

    :cond_0
    return-void
.end method

.method private refreshBitmapDisplayRect()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrixInvert:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrixInvert:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInsideRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInsideRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->intersect(Landroid/graphics/RectF;)Z

    return-void
.end method

.method private refreshBitmapInitRect()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    sget-object v3, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    return-void
.end method

.method private resetBitmapMatrix()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->refreshBitmapInitRect()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInsideRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40800000    # 4.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMaxWidth:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMaxWidthScale:F

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->onBitmapMatrixChanged()V

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private resolvePadding(Landroid/graphics/RectF;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mTarget:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mTarget:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    int-to-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mTarget:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mTarget:Landroid/view/View;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    int-to-float v3, v3

    iget v4, p1, Landroid/graphics/RectF;->left:F

    add-float/2addr v4, v0

    iput v4, p1, Landroid/graphics/RectF;->left:F

    iget v0, p1, Landroid/graphics/RectF;->right:F

    sub-float/2addr v0, v1

    iput v0, p1, Landroid/graphics/RectF;->right:F

    iget v0, p1, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, v2

    iput v0, p1, Landroid/graphics/RectF;->top:F

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v3

    iput v0, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method


# virtual methods
.method public convertDistanceX(F)F
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    mul-float p1, p1, v0

    return p1
.end method

.method public convertDistanceY(F)F
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInsideRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v0, v1

    mul-float p1, p1, v0

    return p1
.end method

.method public convertPointToBitmapCoordinate(Landroid/view/MotionEvent;[F)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    const/4 v1, 0x0

    aput v0, p2, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    const/4 v0, 0x1

    aput p1, p2, v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToBitmapCoordinate([F)V

    return-void
.end method

.method public convertPointToBitmapCoordinate([F)V
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToViewPortCoordinate([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayToBitmapMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    return-void
.end method

.method public convertPointToViewPortCoordinate([F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrixInvert:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapPoints([F)V

    return-void
.end method

.method protected countAnimMatrixWhenZoomIn(Landroid/graphics/Matrix;)V
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mRectFTemp:Landroid/graphics/RectF;

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v2, v3}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    iget v4, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMaxWidth:F

    cmpl-float v3, v3, v4

    if-lez v3, :cond_0

    iget v3, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMaxWidth:F

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v4

    div-float/2addr v3, v4

    iget v4, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusX:F

    iget v5, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusY:F

    invoke-virtual {v1, v3, v3, v4, v5}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object v3, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    :cond_0
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v4

    iget v5, v2, Landroid/graphics/RectF;->left:F

    iget v6, v2, Landroid/graphics/RectF;->right:F

    iget v7, v2, Landroid/graphics/RectF;->top:F

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v8, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->width()F

    move-result v8

    iget-object v9, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    move-result v9

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->right:F

    iget-object v12, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v12, v12, Landroid/graphics/RectF;->top:F

    iget-object v13, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v13, v13, Landroid/graphics/RectF;->bottom:F

    cmpl-float v14, v5, v10

    const/high16 v15, 0x3f800000    # 1.0f

    const/16 v16, 0x0

    if-lez v14, :cond_2

    cmpl-float v6, v3, v8

    if-lez v6, :cond_1

    sub-float/2addr v5, v10

    neg-float v3, v5

    goto :goto_0

    :cond_1
    iget-object v6, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->left:F

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v11, v11, Landroid/graphics/RectF;->left:F

    sub-float/2addr v6, v11

    iget-object v11, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v11}, Landroid/graphics/RectF;->width()F

    move-result v11

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    move-result v14

    sub-float/2addr v11, v14

    div-float/2addr v6, v11

    sub-float/2addr v5, v10

    neg-float v5, v5

    sub-float/2addr v8, v3

    mul-float v8, v8, v6

    add-float v3, v5, v8

    goto :goto_0

    :cond_2
    cmpg-float v5, v6, v11

    if-gez v5, :cond_4

    cmpl-float v5, v3, v8

    if-lez v5, :cond_3

    sub-float v3, v11, v6

    goto :goto_0

    :cond_3
    iget-object v5, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v10, v10, Landroid/graphics/RectF;->left:F

    sub-float/2addr v5, v10

    iget-object v10, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v10}, Landroid/graphics/RectF;->width()F

    move-result v10

    iget-object v14, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v14}, Landroid/graphics/RectF;->width()F

    move-result v14

    sub-float/2addr v10, v14

    div-float/2addr v5, v10

    sub-float/2addr v11, v6

    sub-float/2addr v8, v3

    sub-float v3, v15, v5

    mul-float v8, v8, v3

    sub-float v3, v11, v8

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    cmpl-float v5, v7, v12

    if-lez v5, :cond_6

    cmpl-float v2, v4, v9

    if-lez v2, :cond_5

    sub-float/2addr v7, v12

    neg-float v2, v7

    goto :goto_2

    :cond_5
    iget-object v2, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    sub-float/2addr v2, v5

    iget-object v5, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->height()F

    move-result v5

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    sub-float/2addr v5, v6

    div-float/2addr v2, v5

    sub-float/2addr v7, v12

    neg-float v5, v7

    sub-float/2addr v9, v4

    mul-float v9, v9, v2

    add-float v16, v5, v9

    :goto_1
    move/from16 v2, v16

    goto :goto_2

    :cond_6
    cmpg-float v5, v2, v13

    if-gez v5, :cond_8

    cmpl-float v5, v4, v9

    if-lez v5, :cond_7

    sub-float v16, v13, v2

    goto :goto_1

    :cond_7
    iget-object v5, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    sub-float/2addr v5, v6

    iget-object v6, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->height()F

    move-result v6

    iget-object v7, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayInitRect:Landroid/graphics/RectF;

    invoke-virtual {v7}, Landroid/graphics/RectF;->height()F

    move-result v7

    sub-float/2addr v6, v7

    div-float/2addr v5, v6

    sub-float/2addr v13, v2

    sub-float/2addr v9, v4

    sub-float/2addr v15, v5

    mul-float v9, v9, v15

    sub-float v16, v13, v9

    goto :goto_1

    :cond_8
    const/4 v2, 0x0

    :goto_2
    invoke-virtual {v1, v3, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method protected countAnimMatrixWhenZoomOut(Landroid/graphics/Matrix;)V
    .locals 0

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    return-void
.end method

.method public getMatrixValues()[F
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixValues:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixValues:[F

    return-object v0
.end method

.method public onSizeChanged(IIII)V
    .locals 0

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 p4, 0x0

    invoke-virtual {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayInitRect:Landroid/graphics/RectF;

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->resolvePadding(Landroid/graphics/RectF;)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->resetBitmapMatrix()V

    return-void
.end method

.method public performCanvasMatrixChange()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->refreshBitmapDisplayRect()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->onCanvasMatrixChange()V

    return-void
.end method

.method public performScale(FFF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p1, p2, p3}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iput p2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusX:F

    iput p3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mScaleFocusY:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performCanvasMatrixChange()V

    return-void
.end method

.method public performTransition(FF)V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    const/4 v4, 0x0

    cmpl-float v5, p1, v4

    const/high16 v6, 0x3f800000    # 1.0f

    if-lez v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->left:F

    cmpl-float v5, v5, v7

    if-lez v5, :cond_0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, v5

    div-float v0, v1, v0

    goto :goto_0

    :cond_0
    cmpg-float v5, p1, v4

    if-gez v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v7, v7, Landroid/graphics/RectF;->right:F

    cmpg-float v5, v5, v7

    if-gez v5, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v5, v1

    div-float v0, v5, v0

    goto :goto_0

    :cond_1
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    cmpl-float v1, p2, v4

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v5, v5, Landroid/graphics/RectF;->top:F

    cmpl-float v1, v1, v5

    if-lez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v3, v1

    div-float v6, v3, v2

    goto :goto_1

    :cond_2
    cmpg-float v1, p2, v4

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    cmpg-float v1, v1, v4

    if-gez v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v1, v3

    div-float v6, v1, v2

    :cond_3
    :goto_1
    mul-float p1, p1, v0

    mul-float p2, p2, v6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->performCanvasMatrixChange()V

    return-void
.end method

.method public resetMatrixWithAnim()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixValues:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixValues:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v0, v0, v2

    if-gtz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->countAnimMatrixWhenZoomOut(Landroid/graphics/Matrix;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->countAnimMatrixWhenZoomIn(Landroid/graphics/Matrix;)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mMatrixTransition:Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;

    const/4 v2, 0x2

    new-array v2, v2, [Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    aput-object v3, v2, v1

    const/4 v1, 0x1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mAnimTargetMatrix:Landroid/graphics/Matrix;

    aput-object v3, v2, v1

    invoke-virtual {v0, v2}, Lcom/miui/gallery/editor/photo/widgets/imageview/MatrixTransition;->animMatrix([Landroid/graphics/Matrix;)V

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapRect:Landroid/graphics/RectF;

    int-to-float v0, v0

    int-to-float p1, p1

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v2, v0, p1}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->resetBitmapMatrix()V

    return-void
.end method
