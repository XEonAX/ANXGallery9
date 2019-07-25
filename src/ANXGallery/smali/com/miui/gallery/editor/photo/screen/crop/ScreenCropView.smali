.class public Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;
.super Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;
.source "ScreenCropView.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/screen/base/IScreenEditor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixListener;,
        Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;,
        Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$GesListener;,
        Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;,
        Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;
    }
.end annotation


# instance fields
.field private mAnimatorSet:Landroid/animation/AnimatorSet;

.field private mBgBounds:Landroid/graphics/Rect;

.field private mBgPadding:Landroid/graphics/Rect;

.field private mBoundsFixCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

.field private mClipBounds:Landroid/graphics/Rect;

.field private mCropArea:Landroid/graphics/RectF;

.field private mCropAreaChanged:Z

.field private mCropWindow:Landroid/graphics/drawable/Drawable;

.field private mEditFinished:Ljava/lang/Runnable;

.field private mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

.field private mEventState:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;

.field private mFirstIn:Z

.field protected mImageAnimator:Landroid/animation/ValueAnimator;

.field private mLastModifiedMatrix:Landroid/graphics/Matrix;

.field private mMaskColor:I

.field private mMaskColorAlpha:I

.field private mMaskColorAnimator:Landroid/animation/ObjectAnimator;

.field private mMsgCropFinish:I

.field private mOffset:Landroid/graphics/PointF;

.field private mPaint:Landroid/graphics/Paint;

.field private mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

.field private mResizeDetector:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;

.field private mResizeEdgeSlop:F

.field private mTempMatrix:Landroid/graphics/Matrix;

.field private mTouchBounds:Landroid/graphics/RectF;

.field private mTransValues:Landroid/animation/PropertyValuesHolder;

.field private mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mUnmodifiedMatrix:Landroid/graphics/Matrix;

.field private mWindowAnimator:Landroid/animation/ValueAnimator;

.field private mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mWindowValues:Landroid/animation/PropertyValuesHolder;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/base/ScreenVirtualEditorView;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mLastModifiedMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    sget-object p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;->IDLE:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventState:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTouchBounds:Landroid/graphics/RectF;

    new-instance p1, Landroid/graphics/PointF;

    invoke-direct {p1}, Landroid/graphics/PointF;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mOffset:Landroid/graphics/PointF;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTempMatrix:Landroid/graphics/Matrix;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mFirstIn:Z

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$1;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEditFinished:Ljava/lang/Runnable;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$2;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$3;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$3;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$4;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$4;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBoundsFixCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$5;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$5;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$GesListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$GesListener;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$1;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->setCropGestureListener(Lcom/miui/gallery/editor/photo/screen/base/ScreenBaseGestureView$FeatureGesListener;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0700d0

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f05009f

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColor:I

    const/16 p1, 0xe5

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAlpha:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f0603e3

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mResizeEdgeSlop:F

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;

    invoke-direct {p1, p0, v1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;-><init>(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mResizeDetector:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEditFinished:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->register(Ljava/lang/Runnable;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageBounds()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageDisplayRect()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mOffset:Landroid/graphics/PointF;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->performCanvasMatrixChange()V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->performCanvasMatrixChange()V

    return-void
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->performCanvasMatrixChange()V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->performCanvasMatrixChange()V

    return-void
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mResizeEdgeSlop:F

    return p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageDisplayRect()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapDisplayInitRect()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)F
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->calculateMinPixels()F

    move-result p0

    return p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/Matrix;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->postCropFinish()V

    return-void
.end method

.method static synthetic access$2800(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTouchBounds:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventState:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;

    return-object p0
.end method

.method static synthetic access$2902(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;)Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventState:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$EventState;

    return-object p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/animation/ValueAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->postCropProceed()V

    return-void
.end method

.method static synthetic access$3100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mResizeDetector:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$ResizeDetector;

    return-object p0
.end method

.method static synthetic access$3400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->animTouchMaskColor(Z)V

    return-void
.end method

.method static synthetic access$3502(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    return p1
.end method

.method static synthetic access$3700(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->invalidate()V

    return-void
.end method

.method static synthetic access$3800(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBoundsFixCallback:Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView$BoundsFixCallback;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$4100(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->preTransform()V

    return-void
.end method

.method static synthetic access$4200(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->invalidate()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    return p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->performCropFinished()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBounds()Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method private animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 8

    const-string v0, "ScreenCropView"

    const-string v1, "animCropAreaChanged"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v1, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    invoke-direct {v2, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTempMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBounds()Landroid/graphics/RectF;

    move-result-object v6

    sget-object v7, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v4, v5, v6, v7}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTempMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v4, v3, v5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTempMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v1, v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->setupWindowAnimator(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->setupAnimatorSet(Landroid/animation/Animator;Landroid/animation/Animator;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method private animTouchMaskColor(Z)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p1, :cond_1

    const-string p1, "maskColorAlpha"

    new-array v2, v2, [I

    iget v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAlpha:I

    aput v3, v2, v1

    const/16 v1, 0x7f

    aput v1, v2, v0

    invoke-static {p0, p1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    const-string p1, "maskColorAlpha"

    new-array v2, v2, [I

    iget v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAlpha:I

    aput v3, v2, v1

    const/16 v1, 0xe5

    aput v1, v2, v0

    invoke-static {p0, p1, v2}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method private calculateMinPixels()F
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/high16 v1, 0x41200000    # 10.0f

    div-float/2addr v0, v1

    const/high16 v1, 0x42000000    # 32.0f

    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    return v0
.end method

.method private performCropFinished()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    return-void
.end method

.method private postCropFinish()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->sendEmptyMessageDelayed(IJ)Z

    :cond_0
    return-void
.end method

.method private postCropProceed()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    :cond_0
    return-void
.end method

.method private preTransform()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->postCropProceed()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method protected static resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F
    .locals 3

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    goto :goto_0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result v2

    cmpl-float v1, v1, v2

    if-lez v1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/RectF;->height()F

    move-result p0

    div-float/2addr p1, p0

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    :cond_1
    return v0
.end method

.method protected static resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V
    .locals 4

    invoke-virtual {p0, p1}, Landroid/graphics/RectF;->contains(Landroid/graphics/RectF;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    cmpg-float v0, v0, v2

    if-gez v0, :cond_0

    iget v0, p1, Landroid/graphics/RectF;->top:F

    iget v2, p0, Landroid/graphics/RectF;->top:F

    sub-float/2addr v0, v2

    goto :goto_0

    :cond_0
    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    cmpl-float v0, v0, v2

    if-lez v0, :cond_1

    iget v0, p1, Landroid/graphics/RectF;->bottom:F

    iget v2, p0, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v0, v2

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    iget v2, p1, Landroid/graphics/RectF;->left:F

    iget v3, p0, Landroid/graphics/RectF;->left:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2

    iget p1, p1, Landroid/graphics/RectF;->left:F

    iget p0, p0, Landroid/graphics/RectF;->left:F

    sub-float v1, p1, p0

    goto :goto_1

    :cond_2
    iget v2, p1, Landroid/graphics/RectF;->right:F

    iget v3, p0, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_3

    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget p0, p0, Landroid/graphics/RectF;->right:F

    sub-float v1, p1, p0

    :cond_3
    :goto_1
    iput v1, p2, Landroid/graphics/PointF;->x:F

    iput v0, p2, Landroid/graphics/PointF;->y:F

    goto :goto_2

    :cond_4
    iput v1, p2, Landroid/graphics/PointF;->x:F

    iput v1, p2, Landroid/graphics/PointF;->y:F

    :goto_2
    return-void
.end method

.method private setupAnimatorSet(Landroid/animation/Animator;Landroid/animation/Animator;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method

.method private setupWindowAnimator(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const-string v0, "window"

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;

    invoke-direct {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;-><init>()V

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p2, v5, v2

    invoke-static {v0, v4, v5}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v4, 0x12c

    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    new-array p2, v2, [Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    aput-object v0, p2, v3

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public canvasMatrixChange()V
    .locals 0

    return-void
.end method

.method public drawOverlay(Landroid/graphics/Canvas;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropWindow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    move v2, v0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public export()Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropEntry;
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropAreaChanged:Z

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->isModified()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropEntry;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBitmapGestureParamsHolder()Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;

    move-result-object v2

    iget-object v2, v2, Lcom/miui/gallery/editor/photo/widgets/imageview/BitmapGestureParamsHolder;->mBitmapDisplayRect:Landroid/graphics/RectF;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropEntry;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method public isModified()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isModifiedBaseLast()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mLastModifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mLastModifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onDetachedFromWindow()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEventHandler:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    iget v1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->unregister(I)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMsgCropFinish:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_3
    return-void
.end method

.method public onStart()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mFirstIn:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mFirstIn:Z

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->reset()V

    return-void
.end method

.method public reset()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTouchBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->getBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public setMaskColorAlpha(I)V
    .locals 0
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mMaskColorAlpha:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mEditorView:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorView;->invalidate()V

    return-void
.end method

.method protected setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    const-string v0, "matrix"

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;

    invoke-direct {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateEvaluator;-><init>()V

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p2, v5, v2

    invoke-static {v0, v4, v5}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTransValues:Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    new-array v4, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTransValues:Landroid/animation/PropertyValuesHolder;

    aput-object v5, v4, v3

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->setObjectValues([Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTranslateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTransValues:Landroid/animation/PropertyValuesHolder;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    new-array p2, v2, [Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mTransValues:Landroid/animation/PropertyValuesHolder;

    aput-object v0, p2, v3

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/crop/ScreenCropView;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method
