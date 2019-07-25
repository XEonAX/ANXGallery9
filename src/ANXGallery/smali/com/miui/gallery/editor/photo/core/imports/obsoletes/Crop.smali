.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;
.super Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;
.source "Crop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;
    }
.end annotation


# instance fields
.field private mAdjustDegree:F

.field private mAnimatorSet:Landroid/animation/AnimatorSet;

.field private mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

.field private mBgBounds:Landroid/graphics/Rect;

.field private mBgPadding:Landroid/graphics/Rect;

.field private mBoundsFixCallback:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;

.field private mCanvasAnimator:Landroid/animation/ValueAnimator;

.field private mClipBounds:Landroid/graphics/Rect;

.field private mCropArea:Landroid/graphics/RectF;

.field private mCropAreaChanged:Z

.field private mCropWindow:Landroid/graphics/drawable/Drawable;

.field private mEditFinished:Ljava/lang/Runnable;

.field private mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

.field private mFirstIn:Z

.field private mGlobalMatrix:Landroid/graphics/Matrix;

.field private mGuideLineAlpha:I

.field private mGuideLineAnimator:Landroid/animation/ObjectAnimator;

.field private mGuideLineFinished:Ljava/lang/Runnable;

.field private mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

.field private mGuideLineSize:F

.field private mInitialDegree:F

.field private mInitialMatrix:Landroid/graphics/Matrix;

.field private mInvertArea:Landroid/graphics/RectF;

.field private mInvertMatrix:Landroid/graphics/Matrix;

.field private mMaskColor:I

.field private mMaskColorAlpha:I

.field private mMaskColorAnimator:Landroid/animation/ObjectAnimator;

.field private mMatrix:Landroid/graphics/Matrix;

.field private mMsgCropFinish:I

.field private mMsgGuideLineFinish:I

.field private mOffset:Landroid/graphics/PointF;

.field private mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

.field private mPaint:Landroid/graphics/Paint;

.field private mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

.field private mRect:Landroid/graphics/RectF;

.field private mResizeDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;

.field private mResizeEdgeSlop:F

.field private mRotateDegree:I

.field private mRotateListener:Landroid/animation/Animator$AnimatorListener;

.field private mRotateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mRotateValues:Landroid/animation/PropertyValuesHolder;

.field private mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

.field private mScaleValues:Landroid/animation/PropertyValuesHolder;

.field private mStartGuideLine:Z

.field private mTouchBounds:Landroid/graphics/RectF;

.field private mTranslateDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

.field private mUnmodifiedMatrix:Landroid/graphics/Matrix;

.field private mWindowAnimator:Landroid/animation/ValueAnimator;

.field private mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mWindowValues:Landroid/animation/PropertyValuesHolder;

.field private mXferModeClear:Landroid/graphics/PorterDuffXfermode;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTouchBounds:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGlobalMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOffset:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mXferModeClear:Landroid/graphics/PorterDuffXfermode;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mStartGuideLine:Z

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mFirstIn:Z

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$4;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEditFinished:Ljava/lang/Runnable;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$5;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$6;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateListener:Landroid/animation/Animator$AnimatorListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$7;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$8;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$9;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$9;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBoundsFixCallback:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$10;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$10;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineFinished:Ljava/lang/Runnable;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700d0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f050076

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColor:I

    const/16 v0, 0xe5

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060266

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineSize:F

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0600e8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mResizeEdgeSlop:F

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$TranslateListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTranslateDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

    new-instance v0, Landroid/view/ScaleGestureDetector;

    new-instance v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ScaleListener;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V

    invoke-direct {v0, p1, v1}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;

    invoke-direct {p1, p0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mResizeDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGlobalMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateDegree:I

    return p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateDegree:I

    return p1
.end method

.method static synthetic access$1200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/animation/ValueAnimator;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->performCropFinished()V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    return-object p0
.end method

.method static synthetic access$1502(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    return-object p1
.end method

.method static synthetic access$1602(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    return p1
.end method

.method static synthetic access$1700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->postCropProceed()V

    return-void
.end method

.method static synthetic access$1800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    return-object p0
.end method

.method static synthetic access$1900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->postCropFinish()V

    return-void
.end method

.method static synthetic access$2000(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->endManualRotate()V

    return-void
.end method

.method static synthetic access$2100(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$2200(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    return-object p0
.end method

.method static synthetic access$2300(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/PointF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOffset:Landroid/graphics/PointF;

    return-object p0
.end method

.method static synthetic access$2400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mResizeEdgeSlop:F

    return p0
.end method

.method static synthetic access$2500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)F
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->calculateMinPixels()F

    move-result p0

    return p0
.end method

.method static synthetic access$2600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    return-object p0
.end method

.method static synthetic access$2700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->preTransform()V

    return-void
.end method

.method static synthetic access$2800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBoundsFixCallback:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin$BoundsFixCallback;

    return-object p0
.end method

.method static synthetic access$2900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animGuideLine(Z)V

    return-void
.end method

.method static synthetic access$3002(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mStartGuideLine:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->doMirror()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->doRotate()V

    return-void
.end method

.method static synthetic access$800(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)Landroid/graphics/RectF;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    return-object p0
.end method

.method private animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 8

    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v1, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v2, Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-direct {v2, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v6

    sget-object v7, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v4, v5, v6, v7}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v4, v3, v5}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v4}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    const/4 v4, 0x0

    invoke-virtual {p0, v0, v1, v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    invoke-direct {p0, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupWindowAnimator(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupAnimatorSet(Landroid/animation/Animator;Landroid/animation/Animator;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method private animGuideLine(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    const/16 v3, 0xff

    if-ge p1, v3, :cond_2

    const-string p1, "guideLineAlpha"

    new-array v1, v1, [I

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    aput v4, v1, v2

    aput v3, v1, v0

    invoke-static {p0, p1, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    if-lez p1, :cond_2

    const-string p1, "guideLineAlpha"

    new-array v1, v1, [I

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    aput v3, v1, v2

    aput v2, v1, v0

    invoke-static {p0, p1, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$11;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$11;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    :cond_3
    return-void
.end method

.method private animRotate(FJLcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)Landroid/animation/Animator;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    const-string v0, "rotate"

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateValues:Landroid/animation/PropertyValuesHolder;

    const-string v0, "scale"

    new-array v2, v1, [F

    fill-array-data v2, :array_1

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleValues:Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateListener:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {v0, v2}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0, p2, p3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateValues:Landroid/animation/PropertyValuesHolder;

    new-array p3, v1, [F

    fill-array-data p3, :array_2

    invoke-virtual {p2, p3}, Landroid/animation/PropertyValuesHolder;->setFloatValues([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleValues:Landroid/animation/PropertyValuesHolder;

    new-array p3, v1, [F

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    aput v0, p3, v2

    const/4 v0, 0x1

    aput p1, p3, v0

    invoke-virtual {p2, p3}, Landroid/animation/PropertyValuesHolder;->setFloatValues([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    new-array p2, v1, [Landroid/animation/PropertyValuesHolder;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateValues:Landroid/animation/PropertyValuesHolder;

    aput-object p3, p2, v2

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleValues:Landroid/animation/PropertyValuesHolder;

    aput-object p3, p2, v0

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    if-eqz p4, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p4}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    return-object p1

    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_2
    .array-data 4
        0x0
        -0x3d4c0000    # -90.0f
    .end array-data
.end method

.method private animTouchMaskColor(Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x2

    if-eqz p1, :cond_1

    const-string p1, "maskColorAlpha"

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    const-string p1, "maskColorAlpha"

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0xe5
        0x7f
    .end array-data

    :array_1
    .array-data 4
        0x7f
        0xe5
    .end array-data
.end method

.method private calculateMinPixels()F
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

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

.method private doMirror()V
    .locals 5

    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    const/high16 v3, -0x40800000    # -1.0f

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v3, v4, v1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method private doRotate()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    const/high16 v3, -0x3d4c0000    # -90.0f

    invoke-virtual {v0, v3, v1, v2}, Landroid/graphics/Matrix;->setRotate(FFF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRect:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRect:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    const-wide/16 v1, 0x64

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animRotate(FJLcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)Landroid/animation/Animator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method private drawGuideLines(Landroid/graphics/Canvas;)V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iget v0, v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->mCount:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineSize:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    sub-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iget v1, v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->mCount:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iget v2, v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->mCount:I

    int-to-float v2, v2

    div-float/2addr v1, v2

    const/4 v2, 0x1

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iget v3, v3, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->mCount:I

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v5, v3, Landroid/graphics/RectF;->left:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    int-to-float v10, v2

    mul-float v4, v1, v10

    add-float v6, v3, v4

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v7, v3, Landroid/graphics/RectF;->right:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float v8, v3, v4

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    mul-float v10, v10, v0

    add-float v5, v3, v10

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v6, v3, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    add-float v7, v3, v10

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v8, v3, Landroid/graphics/RectF;->bottom:F

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private endManualRotate()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialDegree:F

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    return-void
.end method

.method private performCropFinished()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    return-void
.end method

.method private postCropFinish()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    const-wide/16 v2, 0x3e8

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->sendEmptyMessageDelayed(IJ)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;->onChanged()V

    :cond_0
    return-void
.end method

.method private postCropProceed()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    :cond_0
    return-void
.end method

.method private postGuideLineFinish()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgGuideLineFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgGuideLineFinish:I

    const-wide/16 v2, 0x514

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->sendEmptyMessageDelayed(IJ)Z

    return-void
.end method

.method private preTransform()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->postCropProceed()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_0
    return-void
.end method

.method private setupAnimatorSet(Landroid/animation/Animator;Landroid/animation/Animator;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 v1, 0x2

    new-array v1, v1, [Landroid/animation/Animator;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    const/4 p1, 0x1

    aput-object p2, v1, p1

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPerformCropFinish:Landroid/animation/Animator$AnimatorListener;

    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const-wide/16 v0, 0x12c

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1, p3}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method

.method private setupWindowAnimator(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    new-instance v0, Landroid/animation/ValueAnimator;

    invoke-direct {v0}, Landroid/animation/ValueAnimator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const-string v0, "window"

    new-instance v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;

    invoke-direct {v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/RectFEvaluator;-><init>()V

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v3

    aput-object p2, v5, v2

    invoke-static {v0, v4, v5}, Landroid/animation/PropertyValuesHolder;->ofObject(Ljava/lang/String;Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v0, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v4, 0x12c

    invoke-virtual {v0, v4, v5}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    new-array v1, v1, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/PropertyValuesHolder;->setObjectValues([Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    new-array p2, v2, [Landroid/animation/PropertyValuesHolder;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowValues:Landroid/animation/PropertyValuesHolder;

    aput-object v0, p2, v3

    invoke-virtual {p1, p2}, Landroid/animation/ValueAnimator;->setValues([Landroid/animation/PropertyValuesHolder;)V

    if-eqz p3, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    return-void
.end method

.method private startGuideLine()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgGuideLineFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mStartGuideLine:Z

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animGuideLine(Z)V

    return-void
.end method


# virtual methods
.method public beginAutoRotate()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->ROTATION:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialDegree:F

    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    const/16 v0, 0xe5

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->startGuideLine()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method public beginRotate()V
    .locals 2

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->ROTATION:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialDegree:F

    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->ROTATE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    const/16 v0, 0x7f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->startGuideLine()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method protected config(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->config(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGlobalMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->concat(Landroid/graphics/Matrix;)V

    return-void
.end method

.method protected drawOverlay(Landroid/graphics/Canvas;)V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    const/16 v1, 0xe5

    if-ne v0, v1, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mStartGuideLine:Z

    if-eqz v0, :cond_1

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->drawGuideLines(Landroid/graphics/Canvas;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    sub-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->right:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    add-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgPadding:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropWindow:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropWindow:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageDisplayBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGlobalMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageDisplayBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageDisplayBounds()Landroid/graphics/RectF;

    move-result-object v0

    iget v0, v0, Landroid/graphics/RectF;->top:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_2

    const/4 v2, 0x0

    goto :goto_0

    :cond_2
    move v2, v0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->getClipBounds(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColor:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mBgBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    int-to-float v3, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mClipBounds:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v0

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mPaint:Landroid/graphics/Paint;

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public export()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateDegree:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ParcelableCropEntry;-><init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix;F)V

    return-object v0
.end method

.method public finishRotate()V
    .locals 1

    const/16 v0, 0xe5

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->postGuideLineFinish()V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    return-void
.end method

.method public getCroppedSize()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getSampleSize()Landroid/graphics/RectF;
    .locals 2

    new-instance v0, Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    return-object v0
.end method

.method public mirror()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$1;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->doMirror()V

    :cond_3
    :goto_0
    return-void
.end method

.method protected onMatrixChanged()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EditorView$Plugin;->onMatrixChanged()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    return-void
.end method

.method protected onStart()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEditFinished:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->register(Ljava/lang/Runnable;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineFinished:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->register(Ljava/lang/Runnable;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgGuideLineFinish:I

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mFirstIn:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->reset()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mFirstIn:Z

    :cond_0
    return-void
.end method

.method protected onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->ROTATION:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    const/4 v3, 0x1

    if-ne v1, v2, :cond_0

    return v3

    :cond_0
    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTouchBounds:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-nez v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SKIP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-ne v2, v4, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-ne v2, v4, :cond_2

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SKIP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    goto :goto_0

    :cond_2
    return v1

    :cond_3
    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    goto :goto_0

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SKIP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-ne v2, v4, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTouchBounds:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/graphics/RectF;->contains(FF)Z

    move-result v2

    if-eqz v2, :cond_5

    sget-object v2, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    iput-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->setAction(I)V

    :cond_5
    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v4, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->SKIP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-eq v2, v4, :cond_8

    if-nez v0, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->startGuideLine()V

    invoke-direct {p0, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animTouchMaskColor(Z)V

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;->CROP:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineMode:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$GuideLine;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;->changeRotationState(Z)V

    goto :goto_1

    :cond_6
    const/4 v2, 0x3

    if-eq v0, v2, :cond_7

    if-ne v0, v3, :cond_8

    :cond_7
    invoke-direct {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animTouchMaskColor(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->postGuideLineFinish()V

    :cond_8
    :goto_1
    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$12;->$SwitchMap$com$miui$gallery$editor$photo$core$imports$obsoletes$Crop$EventState:[I

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    invoke-virtual {v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->ordinal()I

    move-result v2

    aget v0, v0, v2

    packed-switch v0, :pswitch_data_0

    return v1

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mResizeDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTranslateDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mResizeDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$ResizeDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    :pswitch_2
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTranslateDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_2

    :pswitch_3
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mScaleGestureDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTranslateDetector:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :goto_2
    :pswitch_4
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
    .end packed-switch
.end method

.method public reset()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mUnmodifiedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mTouchBounds:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mRotateDegree:I

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    return-void
.end method

.method public rotate()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$3;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->animCropAreaChanged(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->doRotate()V

    :cond_3
    :goto_0
    return-void
.end method

.method public setFixedAspectRatio(II)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v0

    int-to-float v1, p1

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v0

    int-to-float v1, p2

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return-void

    :cond_0
    if-nez p1, :cond_1

    if-nez p2, :cond_1

    invoke-static {}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$000()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    return-void

    :cond_1
    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    if-ne p2, v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImage()Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImage()Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    goto :goto_0

    :cond_2
    const/4 v0, -0x2

    if-ne p1, v0, :cond_3

    if-ne p2, v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Landroid/app/Activity;

    invoke-static {p2}, Lcom/miui/gallery/util/ScreenUtils;->getFullScreenHeight(Landroid/app/Activity;)I

    move-result p2

    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_5
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCanvasAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->end()V

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->end()V

    :cond_7
    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;-><init>(FF)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    div-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    invoke-static {p2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$600(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAspectRatio:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;

    invoke-static {v0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;->access$700(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$AspectRatio;)F

    move-result v0

    div-float/2addr p2, v0

    sub-float v0, p1, p2

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x800000

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_8

    return-void

    :cond_8
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getEventHandler()Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMsgCropFinish:I

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/EventHandler;->removeMessages(I)V

    new-instance v0, Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-direct {v0, v1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    cmpl-float p1, p1, p2

    const/high16 v1, 0x40000000    # 2.0f

    if-lez p1, :cond_9

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result p1

    div-float/2addr p1, p2

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result p2

    sub-float/2addr p1, p2

    div-float/2addr p1, v1

    iget p2, v0, Landroid/graphics/RectF;->top:F

    sub-float/2addr p2, p1

    iput p2, v0, Landroid/graphics/RectF;->top:F

    iget p2, v0, Landroid/graphics/RectF;->bottom:F

    add-float/2addr p2, p1

    iput p2, v0, Landroid/graphics/RectF;->bottom:F

    goto :goto_1

    :cond_9
    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result p1

    mul-float p2, p2, p1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result p1

    sub-float/2addr p2, p1

    div-float/2addr p2, v1

    iget p1, v0, Landroid/graphics/RectF;->left:F

    sub-float/2addr p1, p2

    iput p1, v0, Landroid/graphics/RectF;->left:F

    iget p1, v0, Landroid/graphics/RectF;->right:F

    add-float/2addr p1, p2

    iput p1, v0, Landroid/graphics/RectF;->right:F

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getBounds()Landroid/graphics/RectF;

    move-result-object p2

    sget-object v1, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {p1, v0, p2, v1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    new-instance p1, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance p2, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p2, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-static {v1, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->resolveScale(Landroid/graphics/RectF;Landroid/graphics/RectF;)F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {p2, v1, v1, v2, v3}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v1, v2, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOffset:Landroid/graphics/PointF;

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->resolveTranslate(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/PointF;)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOffset:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOffset:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    invoke-virtual {p2, v1, v2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    new-instance v1, Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-direct {v1, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    const/4 v2, 0x0

    invoke-direct {p0, v1, v0, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupWindowAnimator(Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    invoke-virtual {p0, p1, p2, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mWindowAnimator:Landroid/animation/ValueAnimator;

    invoke-direct {p0, p1, p2, v2}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupAnimatorSet(Landroid/animation/Animator;Landroid/animation/Animator;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public setGuideLineAlpha(I)V
    .locals 0
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mGuideLineAlpha:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method public setMaskColorAlpha(I)V
    .locals 0
    .annotation build Landroid/support/annotation/Keep;
    .end annotation

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mMaskColorAlpha:I

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method public setOnCropChangedListener(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mOnCropChangedListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$OnCropChangedListener;

    return-void
.end method

.method public setRotateDegree(F)V
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->beginRotate()V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialDegree:F

    sub-float v2, p1, v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerX()F

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-virtual {v0, v2, v3, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    const/high16 p1, 0x3f800000    # 1.0f

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x0

    cmpg-float v2, v2, v3

    const/high16 v4, 0x40000000    # 2.0f

    if-gez v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerX()F

    move-result v5

    div-float/2addr v2, v5

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->right:F

    iget v5, v1, Landroid/graphics/RectF;->right:F

    cmpl-float v2, v2, v5

    if-lez v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v2, v4

    iget v5, v1, Landroid/graphics/RectF;->right:F

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    sub-float/2addr v5, v6

    div-float/2addr v2, v5

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->top:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v4

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    div-float/2addr v2, v3

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget v3, v1, Landroid/graphics/RectF;->bottom:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_5

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    div-float/2addr v2, v4

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float/2addr v1, v3

    div-float/2addr v2, v1

    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, p1, p1, v1, v2}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->invalidate()V

    return-void
.end method

.method public setRotateDegreeWithAnimation(F)V
    .locals 9

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropAreaChanged:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mEventState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    sget-object v1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;->ROTATION:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$EventState;

    if-ne v0, v1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->beginAutoRotate()V

    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    new-instance v1, Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialMatrix:Landroid/graphics/Matrix;

    invoke-direct {v1, v2}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->getImageBounds()Landroid/graphics/RectF;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInitialDegree:F

    sub-float v3, p1, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerX()F

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    invoke-virtual {v1, v3, v4, v5}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mAdjustDegree:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertMatrix:Landroid/graphics/Matrix;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->left:F

    const/4 v3, 0x0

    cmpg-float p1, p1, v3

    const/high16 v4, 0x3f800000    # 1.0f

    const/high16 v5, 0x40000000    # 2.0f

    if-gez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result p1

    div-float/2addr p1, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerX()F

    move-result v6

    div-float/2addr p1, v6

    invoke-static {v4, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    goto :goto_0

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    :goto_0
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->right:F

    iget v7, v2, Landroid/graphics/RectF;->right:F

    cmpl-float v6, v6, v7

    if-lez v6, :cond_3

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v6, v5

    iget v7, v2, Landroid/graphics/RectF;->right:F

    iget-object v8, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v8}, Landroid/graphics/RectF;->centerX()F

    move-result v8

    sub-float/2addr v7, v8

    div-float/2addr v6, v7

    invoke-static {p1, v6}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_3
    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v6, v6, Landroid/graphics/RectF;->top:F

    cmpg-float v3, v6, v3

    if-gez v3, :cond_4

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v3, v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v6}, Landroid/graphics/RectF;->centerY()F

    move-result v6

    div-float/2addr v3, v6

    invoke-static {p1, v3}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_4
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->bottom:F

    iget v6, v2, Landroid/graphics/RectF;->bottom:F

    cmpl-float v3, v3, v6

    if-lez v3, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v3, v5

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v5}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    sub-float/2addr v2, v5

    div-float/2addr v3, v2

    invoke-static {p1, v3}, Ljava/lang/Math;->max(FF)F

    move-result p1

    :cond_5
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mInvertArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {v1, p1, p1, v2, v3}, Landroid/graphics/Matrix;->preScale(FFFF)Z

    new-instance p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop$2;-><init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;)V

    invoke-virtual {p0, v0, v1, p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->setupImageAnimator(Landroid/graphics/Matrix;Landroid/graphics/Matrix;Lcom/miui/gallery/editor/photo/core/imports/obsoletes/OneShotAnimateListener;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    const-wide/16 v0, 0x190

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    const v0, 0x3f19999a    # 0.6f

    const v1, 0x3dcccccd    # 0.1f

    const v2, 0x3eb33333    # 0.35f

    invoke-static {v0, v1, v2, v4}, Lcom/miui/gallery/compat/interpolator/PathInterpolatorCompat;->getPathInterpolator(FFFF)Landroid/view/animation/Interpolator;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/Crop;->mImageAnimator:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method
