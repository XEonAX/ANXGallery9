.class public Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;
.super Landroid/view/View;
.source "BitmapGestureView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;,
        Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;,
        Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;,
        Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;
    }
.end annotation


# instance fields
.field protected mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

.field private mBitmapPaint:Landroid/graphics/Paint;

.field private mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

.field private mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

.field protected mDisplayBitmap:Landroid/graphics/Bitmap;

.field protected mDisplayCanvas:Landroid/graphics/Canvas;

.field private mDrawOrigin:Z

.field private mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

.field private mForceHandleEventByChild:Z

.field private mGestureDetector:Landroid/view/GestureDetector;

.field protected mOriginBitmap:Landroid/graphics/Bitmap;

.field private mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

.field private mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field protected mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

.field private mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

.field private mTouchMinSize:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapPaint:Landroid/graphics/Paint;

    sget-object p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDrawOrigin:Z

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapPaint:Landroid/graphics/Paint;

    sget-object p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDrawOrigin:Z

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapPaint:Landroid/graphics/Paint;

    sget-object p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDrawOrigin:Z

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->init()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mTouchMinSize:F

    return p0
.end method

.method private init()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mParamsChangeListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;-><init>(Landroid/view/View;Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder$ParamsChangeListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    new-instance v0, Landroid/view/GestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomGesListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomGesListener;

    invoke-direct {v0, v1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mCustomScaleListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$CustomScaleListener;

    invoke-direct {v0, v1, v2}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mGestureDetector:Landroid/view/GestureDetector;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setIsLongpressEnabled(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mTouchMinSize:F

    new-instance v0, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    return-void
.end method

.method private onActionUp(FF)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->resetMatrixWithAnim()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;->onActionUp(FF)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->invalidate()V

    return-void
.end method


# virtual methods
.method protected convertDistanceX(F)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertDistanceX(F)F

    move-result p1

    return p1
.end method

.method protected convertDistanceY(F)F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertDistanceY(F)F

    move-result p1

    return p1
.end method

.method protected convertPointToViewPortCoordinate(Landroid/view/MotionEvent;[F)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    const/4 v1, 0x0

    aput v0, p2, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    const/4 v0, 0x1

    aput p1, p2, v0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->convertPointToViewPortCoordinate([F)V

    return-void
.end method

.method protected convertPointToViewPortCoordinate([F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->convertPointToViewPortCoordinate([F)V

    return-void
.end method

.method protected disableChildHandleMode()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    return-void
.end method

.method protected drawChild(Landroid/graphics/Canvas;)V
    .locals 0

    return-void
.end method

.method public drawOrigin(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDrawOrigin:Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->invalidate()V

    return-void
.end method

.method protected enableChildHandleMode()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    return-void
.end method

.method protected getRectOverScrollStatus(Landroid/graphics/RectF;)I
    .locals 1

    const/high16 v0, 0x3f000000    # 0.5f

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->getRectOverScrollStatus(Landroid/graphics/RectF;F)I

    move-result p1

    return p1
.end method

.method protected getRectOverScrollStatus(Landroid/graphics/RectF;F)I
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    mul-float v2, v2, p2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v3

    mul-float v3, v3, p2

    iget p2, v0, Landroid/graphics/RectF;->left:F

    iget v4, v1, Landroid/graphics/RectF;->left:F

    invoke-static {p2, v4}, Ljava/lang/Math;->max(FF)F

    move-result p2

    iget v4, v0, Landroid/graphics/RectF;->top:F

    iget v5, v1, Landroid/graphics/RectF;->top:F

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iget v5, v0, Landroid/graphics/RectF;->right:F

    iget v6, v1, Landroid/graphics/RectF;->right:F

    invoke-static {v5, v6}, Ljava/lang/Math;->min(FF)F

    move-result v5

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget v1, p1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v1, p2

    neg-float p2, v2

    cmpg-float p2, v1, p2

    if-gez p2, :cond_0

    const/16 p2, 0x8

    goto :goto_0

    :cond_0
    iget p2, p1, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v2

    cmpl-float p2, p2, v5

    if-lez p2, :cond_1

    const/4 p2, 0x4

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    iget v1, p1, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v4

    neg-float v2, v3

    cmpg-float v1, v1, v2

    if-gez v1, :cond_2

    or-int/lit8 p2, p2, 0x2

    goto :goto_1

    :cond_2
    iget p1, p1, Landroid/graphics/RectF;->bottom:F

    add-float/2addr v0, v3

    cmpl-float p1, p1, v0

    if-lez p1, :cond_3

    or-int/lit8 p2, p2, 0x1

    :cond_3
    :goto_1
    return p2
.end method

.method protected onBitmapMatrixChanged()V
    .locals 0

    return-void
.end method

.method protected onCanvasMatrixChange()V
    .locals 0

    return-void
.end method

.method public onClear()V
    .locals 0

    return-void
.end method

.method protected final onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v0, v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mCanvasMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDrawOrigin:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mOriginBitmap:Landroid/graphics/Bitmap;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapToDisplayMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->drawChild(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mStrokeImageHelper:Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    iget-object v1, v1, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/editor/photo/widgets/StrokeImageHelper;->draw(Landroid/graphics/Canvas;Landroid/graphics/RectF;)V

    :cond_1
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 1

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->onSizeChanged(IIII)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->NOT_DEFINE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->SCALE_MOVE:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mForceHandleEventByChild:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;->BY_CHILD:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mState:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$State;

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    if-eq v0, v1, :cond_4

    const/4 v2, 0x3

    if-eq v0, v2, :cond_4

    goto :goto_0

    :cond_4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->onActionUp(FF)V

    :goto_0
    return v1
.end method

.method protected refreshDisplayCanvas()V
    .locals 4

    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayCanvas:Landroid/graphics/Canvas;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayCanvas:Landroid/graphics/Canvas;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mOriginBitmap:Landroid/graphics/Bitmap;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapPaint:Landroid/graphics/Paint;

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v3, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public setBitmap(Landroid/graphics/Bitmap;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mOriginBitmap:Landroid/graphics/Bitmap;

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mDisplayBitmap:Landroid/graphics/Bitmap;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mBitmapGestureParamsHolder:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->setBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->refreshDisplayCanvas()V

    return-void
.end method

.method public setFeatureGestureListener(Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView;->mFeatureGestureListener:Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureView$FeatureGesListener;

    return-void
.end method
