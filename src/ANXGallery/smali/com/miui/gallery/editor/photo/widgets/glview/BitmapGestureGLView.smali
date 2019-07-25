.class public Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;
.super Landroid/opengl/GLSurfaceView;
.source "BitmapGestureGLView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;,
        Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;,
        Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;,
        Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;
    }
.end annotation


# instance fields
.field protected mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

.field private mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;

.field private mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;

.field private mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;

.field private mGestureDetector:Landroid/view/GestureDetector;

.field protected mOriginBitmap:Landroid/graphics/Bitmap;

.field private mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

.field private mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field protected mState:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

.field private mTouchMinSize:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    sget-object p1, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mState:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->init()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;)Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mTouchMinSize:F

    return p0
.end method

.method protected static final convertBitmapX(FF)F
    .locals 2

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p1, v0

    sub-float/2addr p0, v1

    mul-float p0, p0, v0

    div-float/2addr p0, p1

    return p0
.end method

.method protected static final convertBitmapY(FF)F
    .locals 2

    const/high16 v0, 0x40000000    # 2.0f

    div-float v1, p1, v0

    sub-float/2addr p0, v1

    neg-float p0, p0

    mul-float p0, p0, v0

    div-float/2addr p0, p1

    return p0
.end method

.method public static convertPointToBitmap([FFF)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    aget v1, p0, v0

    invoke-static {v1, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertBitmapX(FF)F

    move-result v1

    aput v1, p0, v0

    add-int/lit8 v1, v0, 0x1

    aget v2, p0, v1

    invoke-static {v2, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertBitmapY(FF)F

    move-result v2

    aput v2, p0, v1

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static generateVertexPositionToBitmap(Landroid/graphics/RectF;[FFF)V
    .locals 2

    iget v0, p0, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    const/4 v1, 0x1

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x2

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    const/4 v1, 0x3

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x4

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x5

    aput v0, p1, v1

    iget v0, p0, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x6

    aput v0, p1, v1

    iget p0, p0, Landroid/graphics/RectF;->top:F

    const/4 v0, 0x7

    aput p0, p1, v0

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertPointToBitmap([FFF)V

    return-void
.end method

.method private init()V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mTouchMinSize:F

    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomGesListener;

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$CustomScaleListener;

    invoke-direct {v0, v1, v2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;-><init>(Landroid/view/View;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->setEGLContextClientVersion(I)V

    const/16 v2, 0x8

    const/16 v3, 0x8

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x10

    const/4 v7, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v7}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->setEGLConfigChooser(IIIIII)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->setZOrderOnTop(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v0

    const/4 v1, -0x2

    invoke-interface {v0, v1}, Landroid/view/SurfaceHolder;->setFormat(I)V

    return-void
.end method

.method private onActionUp(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->resetMatrixWithAnim()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;->onActionUp(FF)V

    :cond_0
    return-void
.end method


# virtual methods
.method protected convertPoint([F)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertX(F)F

    move-result v1

    aput v1, p1, v0

    add-int/lit8 v1, v0, 0x1

    aget v2, p1, v1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertY(F)F

    move-result v2

    aput v2, p1, v1

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected final convertX(F)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    sub-float/2addr p1, v0

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method protected final convertY(F)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    sub-float/2addr p1, v0

    neg-float p1, p1

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr p1, v0

    return p1
.end method

.method protected generateVertexPosition(Landroid/graphics/RectF;[F)V
    .locals 2

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v1, 0x1

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x2

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v1, 0x3

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x4

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x5

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x6

    aput v0, p2, v1

    iget p1, p1, Landroid/graphics/RectF;->top:F

    const/4 v0, 0x7

    aput p1, p2, v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertPoint([F)V

    return-void
.end method

.method protected generateVertexPositionReverse(Landroid/graphics/RectF;[F)V
    .locals 2

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x0

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x1

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x2

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x3

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->left:F

    const/4 v1, 0x4

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v1, 0x5

    aput v0, p2, v1

    iget v0, p1, Landroid/graphics/RectF;->right:F

    const/4 v1, 0x6

    aput v0, p2, v1

    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    const/4 v0, 0x7

    aput p1, p2, v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->convertPoint([F)V

    return-void
.end method

.method protected onBitmapMatrixChange()V
    .locals 0

    return-void
.end method

.method protected onCanvasMatrixChange()V
    .locals 0

    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    invoke-super {p0, p1, p2, p3, p4}, Landroid/opengl/GLSurfaceView;->onSizeChanged(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->onSizeChanged(IIII)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mState:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_1

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mState:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$State;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v1, :cond_2

    const/4 v2, 0x3

    if-eq v0, v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->onActionUp(FF)V

    :goto_0
    return v1
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->setBitmap(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public setFeatureGestureListener(Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/glview/BitmapGestureGLView$FeatureGesListener;

    return-void
.end method
