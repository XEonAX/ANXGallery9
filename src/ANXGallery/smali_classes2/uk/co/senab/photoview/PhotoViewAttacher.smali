.class public Luk/co/senab/photoview/PhotoViewAttacher;
.super Ljava/lang/Object;
.source "PhotoViewAttacher.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;
.implements Luk/co/senab/photoview/IPhotoView;
.implements Luk/co/senab/photoview/gestures/OnGestureListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$Transition;,
        Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;,
        Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;
    }
.end annotation


# static fields
.field static final sInterpolator:Landroid/view/animation/Interpolator;


# instance fields
.field private final EXIT_SCALE_RATIO:F

.field ZOOM_DURATION:I

.field private mAllowParentInterceptOnEdge:Z

.field private mAlpha:F

.field private mAlphaChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;

.field private mAlphaDrawable:Landroid/graphics/drawable/Drawable;

.field private mAnim:I

.field private final mBaseMatrix:Landroid/graphics/Matrix;

.field private mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

.field private final mDisplayRect:Landroid/graphics/RectF;

.field private mDownScale:F

.field private mDragDownOutThreshold:F

.field private mDragDownOutY:F

.field private mDragHandled:Z

.field private final mDrawMatrix:Landroid/graphics/Matrix;

.field private mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

.field private mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

.field private mExitScale:F

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private mHScrollEdge:I

.field private mHasScale:Z

.field private mImageView:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/ImageView;",
            ">;"
        }
    .end annotation
.end field

.field private mIntercepted:Z

.field private mIsDragDownOut:Z

.field private mIsRegionDecodeEnable:Z

.field private mIvBottom:I

.field private mIvLeft:I

.field private mIvRight:I

.field private mIvTop:I

.field private mLastScaleFocusX:F

.field private mLastScaleFocusY:F

.field private mLongClickListener:Landroid/view/View$OnLongClickListener;

.field private mMatrixChangeListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private final mMatrixValues:[F

.field private mMaxDoubleTapScale:F

.field private mMaxPointsScale:F

.field private mMaxScale:F

.field private mMidScale:F

.field private mMinScale:F

.field private mOriginHeight:I

.field private mOriginWidth:I

.field private mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

.field private mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

.field private mRotateEnabled:Z

.field private mRotateListener:Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

.field private mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

.field private mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

.field private mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mStrokeColor:I

.field private mStrokePaint:Landroid/graphics/Paint;

.field private mStrokeWidth:I

.field private final mSuppMatrix:Landroid/graphics/Matrix;

.field private mSupportHd:Z

.field private mTileView:Lcom/miui/gallery/util/photoview/TileView;

.field private mTouchDownY:F

.field private mTransition:Luk/co/senab/photoview/PhotoViewAttacher$Transition;

.field private mTransitionListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

.field private mVScrollEdge:I

.field private mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

.field private mWantEnterTime:J

.field private mZoomEnabled:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    sput-object v0, Luk/co/senab/photoview/PhotoViewAttacher;->sInterpolator:Landroid/view/animation/Interpolator;

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;-><init>(Landroid/widget/ImageView;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/widget/ImageView;Z)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0xc8

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    const v0, 0x3f4ccccd    # 0.8f

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->EXIT_SCALE_RATIO:F

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitScale:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDownScale:F

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    const/high16 v1, 0x3fe00000    # 1.75f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    const/high16 v1, 0x40000000    # 2.0f

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    const/4 v1, 0x1

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/Matrix;

    invoke-direct {v2}, Landroid/graphics/Matrix;-><init>()V

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    const/16 v2, 0x9

    new-array v2, v2, [F

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    const/4 v2, 0x4

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateEnabled:Z

    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsRegionDecodeEnable:Z

    const/4 v1, 0x0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAnim:I

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {p1, p0}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_0
    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setZoomable(Z)V

    invoke-virtual {p1}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x41200000    # 10.0f

    mul-float p1, p1, p2

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutThreshold:F

    return-void
.end method

.method static synthetic access$000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/view/View$OnLongClickListener;
    .locals 0

    iget-object p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-object p0
.end method

.method static synthetic access$100(Luk/co/senab/photoview/PhotoViewAttacher;I)V
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->clearAnim(I)V

    return-void
.end method

.method static synthetic access$1000(Luk/co/senab/photoview/PhotoViewAttacher;)V
    .locals 0

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    return-void
.end method

.method static synthetic access$1100(Luk/co/senab/photoview/PhotoViewAttacher;FFF)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->postRotate(FFF)V

    return-void
.end method

.method static synthetic access$1200(Luk/co/senab/photoview/PhotoViewAttacher;)Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;
    .locals 0

    iget-object p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateListener:Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    return-object p0
.end method

.method static synthetic access$1300(Luk/co/senab/photoview/PhotoViewAttacher;F)I
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->trimRotation(F)I

    move-result p0

    return p0
.end method

.method static synthetic access$1400(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$1500(Luk/co/senab/photoview/PhotoViewAttacher;)Z
    .locals 0

    iget-boolean p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    return p0
.end method

.method static synthetic access$1600(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;
    .locals 0

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->calculateBaseRect(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1800(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/widget/ImageView;)I
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1900(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/drawable/Drawable;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;I)V

    return-void
.end method

.method static synthetic access$200(Luk/co/senab/photoview/PhotoViewAttacher;I)V
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->appendAnim(I)V

    return-void
.end method

.method static synthetic access$2000(Luk/co/senab/photoview/PhotoViewAttacher;)Landroid/graphics/Matrix;
    .locals 0

    iget-object p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    return-object p0
.end method

.method static synthetic access$2200(Luk/co/senab/photoview/PhotoViewAttacher;FFFFF)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Luk/co/senab/photoview/PhotoViewAttacher;->dispatchScaleChanged(FFFFF)V

    return-void
.end method

.method static synthetic access$300(Luk/co/senab/photoview/PhotoViewAttacher;FF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->postTranslate(FF)V

    return-void
.end method

.method static synthetic access$400(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)V
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    return-void
.end method

.method static synthetic access$500(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Luk/co/senab/photoview/PhotoViewAttacher;)F
    .locals 0

    iget p0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    return p0
.end method

.method static synthetic access$800(Luk/co/senab/photoview/PhotoViewAttacher;F)V
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateAlpha(F)V

    return-void
.end method

.method static synthetic access$900(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Luk/co/senab/photoview/PhotoViewAttacher;->postScale(FFFF)V

    return-void
.end method

.method private appendAnim(I)V
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAnim:I

    or-int/2addr p1, v0

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAnim:I

    return-void
.end method

.method private calculateBaseRect(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;
    .locals 9

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    if-nez p1, :cond_0

    goto/16 :goto_2

    :cond_0
    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result p1

    int-to-float p1, p1

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v0

    int-to-float v0, v0

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawableWidth(I)I

    move-result v2

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawbleHeight(I)I

    move-result p2

    const/4 v3, 0x0

    cmpl-float v4, p1, v3

    if-eqz v4, :cond_5

    cmpl-float v4, v0, v3

    if-eqz v4, :cond_5

    if-eqz v2, :cond_5

    if-nez p2, :cond_1

    goto/16 :goto_1

    :cond_1
    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    int-to-float v2, v2

    div-float v4, p1, v2

    int-to-float p2, p2

    div-float v5, v0, p2

    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    const/high16 v8, 0x40000000    # 2.0f

    if-ne v6, v7, :cond_2

    sub-float/2addr p1, v2

    div-float/2addr p1, v8

    sub-float/2addr v0, p2

    div-float/2addr v0, v8

    invoke-virtual {v1, p1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    :cond_2
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    if-ne v6, v7, :cond_3

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    invoke-virtual {v1, v4, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    mul-float v5, v2, v4

    sub-float/2addr p1, v5

    div-float/2addr p1, v8

    mul-float v4, v4, p2

    sub-float/2addr v0, v4

    div-float/2addr v0, v8

    invoke-virtual {v1, p1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    :cond_3
    iget-object v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    if-ne v6, v7, :cond_4

    const/high16 v6, 0x3f800000    # 1.0f

    invoke-static {v4, v5}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    invoke-virtual {v1, v4, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    mul-float v5, v2, v4

    sub-float/2addr p1, v5

    div-float/2addr p1, v8

    mul-float v4, v4, p2

    sub-float/2addr v0, v4

    div-float/2addr v0, v8

    invoke-virtual {v1, p1, v0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    goto :goto_0

    :cond_4
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v3, v3, v2, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5, v3, v3, p1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    sget-object p1, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v0

    aget p1, p1, v0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    sget-object p1, Landroid/graphics/Matrix$ScaleToFit;->FILL:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v4, v5, p1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    :pswitch_1
    sget-object p1, Landroid/graphics/Matrix$ScaleToFit;->CENTER:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v4, v5, p1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    :pswitch_2
    sget-object p1, Landroid/graphics/Matrix$ScaleToFit;->END:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v4, v5, p1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    goto :goto_0

    :pswitch_3
    sget-object p1, Landroid/graphics/Matrix$ScaleToFit;->START:Landroid/graphics/Matrix$ScaleToFit;

    invoke-virtual {v1, v4, v5, p1}, Landroid/graphics/Matrix;->setRectToRect(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix$ScaleToFit;)Z

    :goto_0
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {p1, v3, v3, v2, p2}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    return-object p1

    :cond_5
    :goto_1
    return-object v1

    :cond_6
    :goto_2
    return-object v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private calculateScales()V
    .locals 9

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v2

    float-to-int v2, v2

    invoke-direct {p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawableWidth(I)I

    move-result v3

    invoke-direct {p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawbleHeight(I)I

    move-result v2

    const/4 v4, 0x0

    cmpl-float v5, v0, v4

    if-eqz v5, :cond_7

    cmpl-float v5, v1, v4

    if-eqz v5, :cond_7

    if-eqz v3, :cond_7

    if-nez v2, :cond_1

    goto/16 :goto_3

    :cond_1
    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxPointsScale:F

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v2

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v4

    mul-float v4, v4, v3

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v5

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v6

    mul-float v5, v5, v6

    div-float/2addr v4, v0

    div-float/2addr v5, v1

    invoke-direct {p0, v3, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getEnlargeMode(FF)I

    move-result v3

    const-wide/high16 v6, 0x3ff0000000000000L    # 1.0

    packed-switch v3, :pswitch_data_0

    goto/16 :goto_2

    :pswitch_0
    float-to-double v3, v5

    cmpg-double v0, v3, v6

    if-gez v0, :cond_2

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr v1, v0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    :goto_0
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    goto :goto_2

    :pswitch_1
    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    goto :goto_2

    :pswitch_2
    cmpg-float v3, v4, v5

    const/high16 v8, 0x40000000    # 2.0f

    if-gez v3, :cond_4

    float-to-double v3, v4

    cmpg-double v1, v3, v6

    if-gez v1, :cond_3

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float v8, v0, v1

    :cond_3
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginWidth:I

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginHeight:I

    invoke-direct {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getCorrectWidth(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    goto :goto_1

    :cond_4
    float-to-double v3, v5

    cmpg-double v0, v3, v6

    if-gez v0, :cond_5

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float v8, v1, v0

    :cond_5
    iput v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginWidth:I

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginHeight:I

    invoke-direct {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getCorrectHeight(II)I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr v0, v1

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    :goto_1
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    :cond_6
    :goto_2
    const/high16 v0, 0x3fc00000    # 1.5f

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    mul-float v1, v1, v0

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxPointsScale:F

    return-void

    :cond_7
    :goto_3
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private cancelFling()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->cancelFling()V

    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    :cond_0
    return-void
.end method

.method private checkAndDisplayMatrix()V
    .locals 1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    :cond_0
    return-void
.end method

.method private checkImageViewScaleType()V
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    instance-of v1, v0, Luk/co/senab/photoview/IPhotoView;

    if-nez v1, :cond_1

    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "The ImageView\'s ScaleType has been changed since attaching a PhotoViewAttacher"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    :goto_0
    return-void
.end method

.method private checkMatrixBounds()Z
    .locals 16

    move-object/from16 v0, p0

    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptCheckBounds()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    return v2

    :cond_0
    invoke-virtual/range {p0 .. p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    const/4 v3, 0x0

    if-nez v1, :cond_1

    return v3

    :cond_1
    invoke-virtual/range {p0 .. p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v4

    invoke-direct {v0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    if-nez v4, :cond_2

    return v3

    :cond_2
    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v5

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v6

    invoke-direct {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v7

    float-to-double v8, v5

    invoke-static {v8, v9}, Ljava/lang/Math;->floor(D)D

    move-result-wide v8

    int-to-double v10, v7

    cmpg-double v12, v8, v10

    const/4 v8, -0x1

    const/high16 v9, 0x40000000    # 2.0f

    const-wide/16 v13, 0x0

    const/4 v15, 0x0

    if-gtz v12, :cond_3

    sget-object v10, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v11, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v11}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    int-to-float v7, v7

    sub-float/2addr v7, v5

    div-float/2addr v7, v9

    iget v5, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v5

    goto :goto_0

    :pswitch_0
    int-to-float v7, v7

    sub-float/2addr v7, v5

    iget v5, v4, Landroid/graphics/RectF;->top:F

    sub-float/2addr v7, v5

    goto :goto_0

    :pswitch_1
    iget v5, v4, Landroid/graphics/RectF;->top:F

    neg-float v5, v5

    move v7, v5

    :goto_0
    const/4 v5, 0x5

    iput v5, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    move v2, v7

    goto :goto_1

    :cond_3
    iget v5, v4, Landroid/graphics/RectF;->top:F

    float-to-double v2, v5

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    cmpl-double v5, v2, v13

    if-ltz v5, :cond_4

    const/4 v2, 0x2

    iput v2, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    iget v2, v4, Landroid/graphics/RectF;->top:F

    neg-float v2, v2

    goto :goto_1

    :cond_4
    iget v2, v4, Landroid/graphics/RectF;->bottom:F

    float-to-double v2, v2

    invoke-static {v2, v3}, Ljava/lang/Math;->floor(D)D

    move-result-wide v2

    cmpg-double v5, v2, v10

    if-gtz v5, :cond_5

    int-to-float v2, v7

    iget v3, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v3

    const/4 v3, 0x3

    iput v3, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    goto :goto_1

    :cond_5
    iput v8, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    const/4 v2, 0x0

    :goto_1
    invoke-direct {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v1

    int-to-float v3, v1

    cmpg-float v5, v6, v3

    if-gtz v5, :cond_6

    sget-object v1, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    iget-object v5, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {v5}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v5

    aget v1, v1, v5

    packed-switch v1, :pswitch_data_1

    sub-float/2addr v3, v6

    div-float/2addr v3, v9

    iget v1, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v1

    :goto_2
    move v15, v3

    goto :goto_3

    :pswitch_2
    sub-float/2addr v3, v6

    iget v1, v4, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v1

    goto :goto_2

    :pswitch_3
    iget v1, v4, Landroid/graphics/RectF;->left:F

    neg-float v1, v1

    move v15, v1

    :goto_3
    const/4 v1, 0x4

    iput v1, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    goto :goto_4

    :cond_6
    iget v5, v4, Landroid/graphics/RectF;->left:F

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    cmpl-double v7, v5, v13

    if-ltz v7, :cond_7

    const/4 v5, 0x0

    iput v5, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    iget v1, v4, Landroid/graphics/RectF;->left:F

    neg-float v15, v1

    :goto_4
    const/4 v1, 0x1

    goto :goto_5

    :cond_7
    iget v5, v4, Landroid/graphics/RectF;->right:F

    float-to-double v5, v5

    invoke-static {v5, v6}, Ljava/lang/Math;->floor(D)D

    move-result-wide v5

    int-to-double v9, v1

    cmpg-double v1, v5, v9

    if-gtz v1, :cond_8

    iget v1, v4, Landroid/graphics/RectF;->right:F

    sub-float v15, v3, v1

    const/4 v1, 0x1

    iput v1, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    goto :goto_5

    :cond_8
    const/4 v1, 0x1

    iput v8, v0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    :goto_5
    invoke-direct {v0, v15, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->postTranslate(FF)V

    return v1

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x2
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method private static checkZoomLevels(FFF)V
    .locals 0

    cmpl-float p0, p0, p1

    if-gez p0, :cond_1

    cmpl-float p0, p1, p2

    if-gez p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "MidZoom has to be less than MaxZoom"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "MinZoom has to be less than MidZoom"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private clearAnim(I)V
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAnim:I

    xor-int/lit8 p1, p1, -0x1

    and-int/2addr p1, v0

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAnim:I

    return-void
.end method

.method private dispatchScaleChanged(FFFFF)V
    .locals 7

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    if-eqz v0, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-interface/range {v1 .. v6}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;->onScaleChange(FFFFF)V

    :cond_0
    return-void
.end method

.method private drawBackground(Landroid/graphics/Canvas;)V
    .locals 4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaDrawable:Landroid/graphics/drawable/Drawable;

    if-eqz v1, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaDrawable:Landroid/graphics/drawable/Drawable;

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    const/high16 v3, 0x437f0000    # 255.0f

    mul-float v2, v2, v3

    float-to-int v2, v2

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v0

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method private drawStroke(Landroid/graphics/Canvas;)V
    .locals 3

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    if-lez v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    if-eqz v1, :cond_0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    int-to-float v1, v1

    iget v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_0
    return-void
.end method

.method private ensureRotateDetector()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-nez v0, :cond_0

    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    :cond_0
    return-void
.end method

.method private ensureScaleDragDetector()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Luk/co/senab/photoview/gestures/VersionedGestureDetector;->newInstance(Landroid/content/Context;Luk/co/senab/photoview/gestures/OnGestureListener;)Luk/co/senab/photoview/gestures/GestureDetector;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    :cond_0
    return-void
.end method

.method private ensureStrokePaint()V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    if-nez v0, :cond_0

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_0
    return-void
.end method

.method private ensureTapDetector()V
    .locals 3

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/view/GestureDetector;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v2, Luk/co/senab/photoview/PhotoViewAttacher$1;

    invoke-direct {v2, p0}, Luk/co/senab/photoview/PhotoViewAttacher$1;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-direct {v1, v0, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v1, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v1, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    :cond_0
    return-void
.end method

.method private getCorrectHeight(II)I
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    cmpl-float v0, v1, v0

    if-lez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_0
    return p1
.end method

.method private getCorrectWidth(II)I
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    cmpl-float v0, v1, v0

    if-lez v0, :cond_0

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    :goto_0
    return p1
.end method

.method private getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;
    .locals 4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v1

    if-lez v1, :cond_0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v3, v2, v0}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDisplayRect:Landroid/graphics/RectF;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getDrawableWidth(I)I
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    if-lez p1, :cond_2

    add-int/lit8 p1, p1, 0x2d

    goto :goto_0

    :cond_2
    add-int/lit8 p1, p1, -0x2d

    :goto_0
    div-int/lit8 p1, p1, 0x5a

    and-int/lit8 p1, p1, 0x1

    if-nez p1, :cond_3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    :goto_1
    return p1
.end method

.method private getDrawbleHeight(I)I
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    if-lez p1, :cond_2

    add-int/lit8 p1, p1, 0x2d

    goto :goto_0

    :cond_2
    add-int/lit8 p1, p1, -0x2d

    :goto_0
    div-int/lit8 p1, p1, 0x5a

    and-int/lit8 p1, p1, 0x1

    if-nez p1, :cond_3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p1

    goto :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    :goto_1
    return p1
.end method

.method private getEnlargeMode(FF)I
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSupportHd:Z

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    if-ge p1, p2, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x2

    return p1
.end method

.method private getImageViewHeight(Landroid/widget/ImageView;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method private getImageViewWidth(Landroid/widget/ImageView;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/widget/ImageView;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result p1

    sub-int/2addr v0, p1

    return v0
.end method

.method private getMaxPointsScale()F
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxPointsScale:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxPointsScale:F

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    :goto_0
    return v0
.end method

.method private getMaxPointsScalingScale()F
    .locals 2

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaxPointsScale()F

    move-result v0

    const/high16 v1, 0x3fc00000    # 1.5f

    mul-float v0, v0, v1

    return v0
.end method

.method private getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTransition:Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTransition:Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTransition:Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    return-object v0
.end method

.method private getValue(Landroid/graphics/Matrix;I)F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->getValues([F)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixValues:[F

    aget p1, p1, p2

    return p1
.end method

.method private static hasDrawable(Landroid/widget/ImageView;)Z
    .locals 0

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private interceptCheckBounds()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private interceptDrag()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private interceptDrawTiles()Z
    .locals 2

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->isViewAnimationRunning()Z

    move-result v0

    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsRegionDecodeEnable:Z

    if-eqz v1, :cond_1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v1

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v1

    if-nez v1, :cond_1

    if-nez v0, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private interceptMotionEnd()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private interceptTouch()Z
    .locals 1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isAutoRotating()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private static isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z
    .locals 2

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    sget-object v0, Luk/co/senab/photoview/PhotoViewAttacher$2;->$SwitchMap$android$widget$ImageView$ScaleType:[I

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    return v1

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/widget/ImageView$ScaleType;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " is not supported in PhotoView"

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private isViewAnimationRunning()Z
    .locals 3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getAnimation()Landroid/view/animation/Animation;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasStarted()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v0}, Landroid/view/animation/Animation;->hasEnded()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    return v1
.end method

.method private needDrawTile()Z
    .locals 13

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptDrawTiles()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    if-eqz v2, :cond_6

    if-eqz v0, :cond_6

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_6

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v3}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderWidth()I

    move-result v3

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v4}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderHeight()I

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x1

    if-lez v3, :cond_5

    if-gtz v4, :cond_1

    goto/16 :goto_0

    :cond_1
    iget-object v7, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v7}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderRotation()I

    move-result v7

    div-int/lit8 v7, v7, 0x5a

    and-int/2addr v7, v6

    if-ne v7, v6, :cond_2

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v3}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderHeight()I

    move-result v3

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v4}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderWidth()I

    move-result v4

    :cond_2
    int-to-float v7, v2

    const/high16 v8, 0x3f800000    # 1.0f

    mul-float v7, v7, v8

    int-to-float v9, v0

    div-float/2addr v7, v9

    int-to-float v9, v3

    mul-float v9, v9, v8

    int-to-float v10, v4

    div-float/2addr v9, v10

    const/high16 v10, 0x3f000000    # 0.5f

    invoke-static {v7, v9, v10}, Lcom/miui/gallery/util/MiscUtil;->floatNear(FFF)Z

    move-result v10

    if-eqz v10, :cond_4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    cmpl-float v0, v0, v8

    if-ltz v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    return v1

    :cond_4
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v8

    const-string v10, "PhotoViewAttacher"

    const-string v11, "drawable w/h not equal to tile w/h: %.2f, %.2f"

    new-array v12, v5, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v12, v1

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    aput-object v7, v12, v6

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v8, v10, v7}, Luk/co/senab/photoview/log/Logger;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    div-int/2addr v7, v8

    int-to-float v7, v7

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v8

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v9

    div-int/2addr v8, v9

    int-to-float v8, v8

    invoke-static {v7, v8}, Lcom/miui/gallery/util/MiscUtil;->floatEquals(FF)Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v7

    const-string v8, "PhotoViewAttacher"

    const-string v9, "drawable w[%s], h[%s] not equal to tile w[%s], h[%s]; tile rotation[%s]"

    const/4 v10, 0x5

    new-array v10, v10, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v10, v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v10, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v10, v5

    const/4 v0, 0x3

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v10, v0

    const/4 v0, 0x4

    iget-object v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v2}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderRotation()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v10, v0

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v8, v0}, Luk/co/senab/photoview/log/Logger;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "tile_rotation"

    iget-object v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v3}, Lcom/miui/gallery/util/photoview/TileView;->getTileProviderRotation()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "photo"

    const-string v3, "photo_tile_orientation_error"

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :cond_5
    :goto_0
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v0

    const-string v2, "PhotoViewAttacher"

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "invalid tile size[%dx%d]"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v5, v6

    invoke-static {v7, v8, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v2, v3}, Luk/co/senab/photoview/log/Logger;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_6
    :goto_1
    return v1
.end method

.method private notifyTileViewInvalidate()V
    .locals 3

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->needDrawTile()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/util/photoview/TileView;->notifyInvalidate(Landroid/graphics/RectF;F)V

    :cond_0
    return-void
.end method

.method private onBaseMatrixChanged()V
    .locals 5

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->tryAnimEnter()V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->calculateScales()V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    new-instance v1, Landroid/graphics/Rect;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v2

    invoke-direct {p0, v2}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {v1, v4, v4, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/photoview/TileView;->setViewPort(Landroid/graphics/Rect;)V

    :cond_0
    return-void
.end method

.method private onScaleChanged(FFFF)V
    .locals 6

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v5

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->updateAlpha(F)V

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v5}, Luk/co/senab/photoview/PhotoViewAttacher;->dispatchScaleChanged(FFFFF)V

    return-void
.end method

.method private postRotate(FFF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    return-void
.end method

.method private postScale(FFFF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-direct {p0, p1, p2, p3, p4}, Luk/co/senab/photoview/PhotoViewAttacher;->onScaleChanged(FFFF)V

    return-void
.end method

.method private postTranslate(FF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    return-void
.end method

.method private resetMatrix()V
    .locals 3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v1

    invoke-virtual {v1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    if-eqz v1, :cond_2

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    cmpl-float v1, v0, v1

    const/4 v2, 0x0

    if-ltz v1, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {v0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMaxScaleStage(Z)V

    goto :goto_0

    :cond_1
    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpl-float v0, v0, v1

    if-ltz v0, :cond_2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {v0, v2}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMidScaleStage(Z)V

    :cond_2
    :goto_0
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    return-void
.end method

.method private setImageViewMatrix(Landroid/graphics/Matrix;)V
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkImageViewScaleType()V

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageMatrix(Landroid/graphics/Matrix;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->notifyTileViewInvalidate()V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    if-lez v0, :cond_0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p1

    if-eqz p1, :cond_0

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;

    invoke-interface {v1, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;->onMatrixChanged(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V
    .locals 2

    if-eqz p0, :cond_0

    instance-of v0, p0, Luk/co/senab/photoview/IPhotoView;

    if-nez v0, :cond_0

    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0}, Landroid/widget/ImageView;->getScaleType()Landroid/widget/ImageView$ScaleType;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView$ScaleType;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    :cond_0
    return-void
.end method

.method private setRotate(FFF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3}, Landroid/graphics/Matrix;->setRotate(FFF)V

    return-void
.end method

.method private setScale(FFFF)V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Matrix;->setScale(FFFF)V

    invoke-direct {p0, p1, p2, p3, p4}, Luk/co/senab/photoview/PhotoViewAttacher;->onScaleChanged(FFFF)V

    return-void
.end method

.method private trimRotation(F)I
    .locals 2

    const/4 v0, 0x0

    cmpl-float v0, p1, v0

    const/high16 v1, 0x42340000    # 45.0f

    if-lez v0, :cond_0

    add-float/2addr p1, v1

    goto :goto_0

    :cond_0
    sub-float/2addr p1, v1

    :goto_0
    float-to-int p1, p1

    div-int/lit8 p1, p1, 0x5a

    mul-int/lit8 p1, p1, 0x5a

    rem-int/lit16 p1, p1, 0x168

    return p1
.end method

.method private tryAnimEnter()V
    .locals 5

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    if-eqz v0, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mWantEnterTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x12c

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTransitionListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

    invoke-virtual {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    :cond_1
    :goto_0
    return-void
.end method

.method private tryGetViewPaint()Landroid/graphics/Paint;
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getPaint()Landroid/graphics/Paint;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private updateAlpha(F)V
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v1, p1, v0

    if-gez v1, :cond_0

    const/4 v1, 0x0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/MiscUtil;->clamp(FFF)F

    move-result p1

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    goto :goto_0

    :cond_0
    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    :goto_0
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    invoke-interface {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;->onAlphaChanged(F)V

    :cond_1
    return-void
.end method

.method private updateBaseMatrix(Landroid/graphics/drawable/Drawable;I)V
    .locals 4

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->calculateBaseRect(Landroid/graphics/drawable/Drawable;I)Landroid/graphics/RectF;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    rsub-int/lit8 p2, p2, 0x0

    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, p2, v1, v2}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object p2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    sub-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p2

    div-float/2addr v2, p2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    invoke-virtual {v0, v1, v2, p2, p1}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->onBaseMatrixChanged()V

    return-void
.end method


# virtual methods
.method public addOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public afterDraw(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->needDrawTile()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->tryGetViewPaint()Landroid/graphics/Paint;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/util/photoview/TileView;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    :cond_0
    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->drawStroke(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public animEnter(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V
    .locals 12

    if-eqz p1, :cond_5

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->stop()V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v5

    div-float/2addr v4, v5

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v6

    div-float/2addr v5, v6

    cmpl-float v6, v4, v5

    if-lez v6, :cond_0

    goto :goto_0

    :cond_0
    move v4, v5

    :goto_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v5

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v6

    mul-float v6, v6, v4

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v7

    mul-float v7, v7, v4

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v8, v6

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v8, v10

    float-to-int v8, v8

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v10, v7

    div-float/2addr v10, v9

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v10, v9

    float-to-int v9, v10

    invoke-virtual {v3}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v10

    int-to-float v10, v10

    iget v11, v0, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v11

    int-to-float v8, v8

    sub-float/2addr v10, v8

    float-to-int v8, v10

    invoke-virtual {v3}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v3

    int-to-float v3, v3

    iget v10, v0, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v10

    int-to-float v9, v9

    sub-float/2addr v3, v9

    float-to-int v3, v3

    iget v9, v0, Landroid/graphics/RectF;->left:F

    iget v0, v0, Landroid/graphics/RectF;->top:F

    invoke-direct {p0, v4, v4, v9, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->postScale(FFFF)V

    neg-int v0, v8

    int-to-float v0, v0

    neg-int v9, v3

    int-to-float v9, v9

    invoke-direct {p0, v0, v9}, Luk/co/senab/photoview/PhotoViewAttacher;->postTranslate(FF)V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->scale(FF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0, v1, v1, v8, v3}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->translate(IIII)V

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v6

    if-ltz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v0, v0, v7

    if-gez v0, :cond_2

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v0

    int-to-float v0, v0

    div-float/2addr v0, v6

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v7

    const/4 v3, 0x0

    invoke-static {v0, v3, v2}, Lcom/miui/gallery/util/MiscUtil;->clamp(FFF)F

    move-result v0

    invoke-static {p1, v3, v2}, Lcom/miui/gallery/util/MiscUtil;->clamp(FFF)F

    move-result p1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v3

    sub-float v4, v2, v0

    sub-float v5, v2, p1

    invoke-virtual {v3, v0, p1, v4, v5}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->clip(FFFF)V

    :cond_2
    const/4 p1, 0x0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    goto :goto_1

    :cond_3
    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mEnterInfo:Lcom/miui/gallery/util/photoview/ItemViewInfo;

    iput-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTransitionListener:Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iput-wide v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mWantEnterTime:J

    :goto_1
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->setTransitionListener(Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iget-wide v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mWantEnterTime:J

    sub-long/2addr p1, v3

    const-wide/16 v3, 0x96

    cmp-long v0, p1, v3

    if-gez v0, :cond_4

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->ensureAlpha(Z)V

    :cond_4
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    invoke-virtual {p1, p2, v2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->alpha(FF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->start(Z)V

    goto :goto_2

    :cond_5
    if-eqz p2, :cond_6

    invoke-interface {p2}, Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;->onTransitEnd()V

    :cond_6
    :goto_2
    return-void
.end method

.method public animExit(Lcom/miui/gallery/util/photoview/ItemViewInfo;Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V
    .locals 12

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->isLocationValid()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->stop()V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {v0, v2}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getImageInfo(Landroid/view/View;I)Lcom/miui/gallery/util/photoview/ItemViewInfo;

    move-result-object v0

    iget-object v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v4}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v4

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v6

    div-float/2addr v5, v6

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v7

    div-float/2addr v6, v7

    cmpl-float v7, v5, v6

    if-lez v7, :cond_0

    goto :goto_0

    :cond_0
    move v5, v6

    :goto_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v6

    invoke-virtual {v4}, Landroid/graphics/RectF;->width()F

    move-result v7

    mul-float v7, v7, v5

    invoke-virtual {v4}, Landroid/graphics/RectF;->height()F

    move-result v4

    mul-float v4, v4, v5

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v8

    int-to-float v8, v8

    sub-float/2addr v8, v7

    const/high16 v9, 0x40000000    # 2.0f

    div-float/2addr v8, v9

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v10

    int-to-float v10, v10

    add-float/2addr v8, v10

    float-to-int v8, v8

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v10

    int-to-float v10, v10

    sub-float/2addr v10, v4

    div-float/2addr v10, v9

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v9

    int-to-float v9, v9

    add-float/2addr v10, v9

    float-to-int v9, v10

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getX()I

    move-result v10

    int-to-float v10, v10

    iget v11, v3, Landroid/graphics/RectF;->left:F

    add-float/2addr v10, v11

    int-to-float v8, v8

    sub-float/2addr v10, v8

    float-to-int v8, v10

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getY()I

    move-result v0

    int-to-float v0, v0

    iget v3, v3, Landroid/graphics/RectF;->top:F

    add-float/2addr v0, v3

    int-to-float v3, v9

    sub-float/2addr v0, v3

    float-to-int v0, v0

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v3, v7

    if-ltz v3, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result v3

    int-to-float v3, v3

    cmpg-float v3, v3, v4

    if-gez v3, :cond_2

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getWidth()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v3, v7

    invoke-virtual {p1}, Lcom/miui/gallery/util/photoview/ItemViewInfo;->getHeight()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr p1, v4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static {p1, v1, v4}, Lcom/miui/gallery/util/MiscUtil;->clamp(FFF)F

    move-result p1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v7

    sub-float/2addr v3, v4

    sub-float/2addr p1, v4

    invoke-virtual {v7, v4, v4, v3, p1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->clip(FFFF)V

    :cond_2
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1, v6, v5}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->scale(FF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    neg-int v3, v8

    neg-int v0, v0

    invoke-virtual {p1, v2, v2, v3, v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->translate(IIII)V

    :cond_3
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->setTransitionListener(Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1, v2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->ensureAlpha(Z)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlpha:F

    invoke-virtual {p1, p2, v1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->alpha(FF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->start(Z)V

    goto :goto_1

    :cond_4
    if-eqz p2, :cond_5

    invoke-interface {p2}, Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;->onTransitEnd()V

    :cond_5
    :goto_1
    return-void
.end method

.method public beforeDraw(Landroid/graphics/Canvas;)Z
    .locals 2

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->drawBackground(Landroid/graphics/Canvas;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->getClipRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->getClipRect()Landroid/graphics/RectF;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    :cond_0
    return v1

    :cond_1
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object p1

    invoke-virtual {p1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isExited()Z

    move-result p1

    xor-int/2addr p1, v1

    return p1
.end method

.method public canRotatable()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateEnabled:Z

    return v0
.end method

.method public canZoom()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    return v0
.end method

.method public cleanup()V
    .locals 4

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    invoke-virtual {v0}, Landroid/widget/ImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Landroid/view/ViewTreeObserver;->isAlive()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    :cond_2
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    if-eqz v0, :cond_3

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, v1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    :cond_3
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->stop()V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getTransition()Luk/co/senab/photoview/PhotoViewAttacher$Transition;

    move-result-object v0

    invoke-virtual {v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher$Transition;->setTransitionListener(Luk/co/senab/photoview/PhotoViewAttacher$TransitionListener;)V

    :cond_4
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_5

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_5

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->stop()V

    :cond_5
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->releaseTile()V

    iput-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public getAbsoluteRect(Landroid/graphics/RectF;)Z
    .locals 1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    move-result p1

    return p1
.end method

.method public getBaseDisplayRect()Landroid/graphics/RectF;
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getBaseMatrix()Landroid/graphics/Matrix;
    .locals 2

    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getDisplayMatrix()Landroid/graphics/Matrix;
    .locals 2

    new-instance v0, Landroid/graphics/Matrix;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getDisplayRect()Landroid/graphics/RectF;
    .locals 2

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect(Landroid/graphics/Matrix;)Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v0}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return-object v1
.end method

.method public getDrawMatrix()Landroid/graphics/Matrix;
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDrawMatrix:Landroid/graphics/Matrix;

    return-object v0
.end method

.method public getDrawableSize()Landroid/graphics/RectF;
    .locals 4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v2

    if-lez v2, :cond_0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v2, Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    int-to-float v0, v0

    invoke-direct {v2, v1, v1, v3, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v2

    :cond_0
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0, v1, v1, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    return-object v0
.end method

.method public getImageView()Landroid/widget/ImageView;
    .locals 4

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mImageView:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cleanup()V

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    const-string v2, "PhotoViewAttacher"

    const-string v3, "ImageView no longer exists. You should not use this PhotoViewAttacher any more."

    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-object v0
.end method

.method public getMaximumScale()F
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    goto :goto_0

    :cond_0
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    :goto_0
    return v0
.end method

.method public getMediumScale()F
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return v0
.end method

.method public getMinimumScale()F
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    return v0
.end method

.method public getOnPhotoTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    return-object v0
.end method

.method public getOnViewTapListener()Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    return-object v0
.end method

.method public getRotate()F
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-static {v0}, Lcom/miui/gallery/util/MatrixUtil;->getRotate(Landroid/graphics/Matrix;)F

    move-result v0

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mBaseMatrix:Landroid/graphics/Matrix;

    invoke-static {v1}, Lcom/miui/gallery/util/MatrixUtil;->getRotate(Landroid/graphics/Matrix;)F

    move-result v1

    add-float/2addr v0, v1

    return v0
.end method

.method public getScale()F
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-static {v0}, Lcom/miui/gallery/util/MatrixUtil;->getScale(Landroid/graphics/Matrix;)F

    move-result v0

    return v0
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    return-object v0
.end method

.method public getSuppMatrix()Landroid/graphics/Matrix;
    .locals 2

    new-instance v0, Landroid/graphics/Matrix;

    iget-object v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    return-object v0
.end method

.method public getVisibleRectangleBitmap()Landroid/graphics/Bitmap;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public isGestureOperating()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isDragging()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {v0}, Luk/co/senab/photoview/gestures/GestureDetector;->isScaling()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    if-eqz v0, :cond_2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {v0}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->isRotating()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onDoubleTap(FF)V
    .locals 4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v1

    const v2, 0x3a83126f    # 0.001f

    sub-float/2addr v1, v2

    cmpg-float v1, v0, v1

    const/4 v3, 0x1

    if-gez v1, :cond_1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v0

    invoke-virtual {p0, v0, p1, p2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    if-eqz p1, :cond_3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result p1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result p2

    cmpg-float p1, p1, p2

    if-gez p1, :cond_3

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {p1, v3}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMidScaleStage(Z)V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMediumScale()F

    move-result v1

    sub-float/2addr v1, v2

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v1

    sub-float/2addr v1, v2

    cmpg-float v0, v0, v1

    if-gez v0, :cond_2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v0

    invoke-virtual {p0, v0, p1, p2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    if-eqz p1, :cond_3

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {p1, v3}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMaxScaleStage(Z)V

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMinimumScale()F

    move-result v0

    invoke-virtual {p0, v0, p1, p2, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onDrag(FF)V
    .locals 11

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptDrag()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v0

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHasScale:Z

    const/4 v1, 0x5

    const/4 v2, 0x1

    if-nez v0, :cond_3

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    if-nez v0, :cond_2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    if-ne v0, v1, :cond_3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v0

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    cmpl-float v0, v0, v3

    if-lez v0, :cond_3

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTouchDownY:F

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->density:F

    const/high16 v4, 0x41c80000    # 25.0f

    mul-float v3, v3, v4

    cmpl-float v0, v0, v3

    if-lez v0, :cond_3

    :cond_2
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutY:F

    add-float/2addr v0, p2

    iput v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutY:F

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    if-nez v0, :cond_3

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutY:F

    iget v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutThreshold:F

    cmpl-float v0, v0, v3

    if-ltz v0, :cond_3

    iput-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    iput-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    :cond_3
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    iget-boolean v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    const/4 v4, 0x2

    const/high16 v5, 0x3f800000    # 1.0f

    if-eqz v3, :cond_4

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v3

    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v6

    invoke-direct {p0, v6}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v6

    iget-object v7, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-direct {p0, v7, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->getValue(Landroid/graphics/Matrix;I)F

    move-result v7

    int-to-float v6, v6

    div-float v8, p2, v6

    sub-float v8, v5, v8

    const/high16 v9, 0x3f000000    # 0.5f

    mul-float v8, v8, v9

    add-float/2addr v8, v9

    div-int/2addr v3, v4

    int-to-float v3, v3

    add-float v9, v6, v7

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    invoke-direct {p0, v8, v8, v3, v9}, Luk/co/senab/photoview/PhotoViewAttacher;->postScale(FFFF)V

    div-float v3, p1, v10

    invoke-direct {p0, v3, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->postTranslate(FF)V

    div-float/2addr v7, v6

    sub-float v3, v5, v7

    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->updateAlpha(F)V

    goto :goto_0

    :cond_4
    iget-boolean v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v3, :cond_5

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->postTranslate(FF)V

    :cond_5
    :goto_0
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    iget-boolean v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    if-eqz v3, :cond_d

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v3

    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    cmpl-float v3, v3, v6

    const/4 v6, 0x0

    const/high16 v7, -0x40800000    # -1.0f

    if-lez v3, :cond_9

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    const/4 v1, 0x4

    if-eq p2, v1, :cond_7

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    if-nez p2, :cond_6

    cmpl-float p2, p1, v5

    if-gez p2, :cond_7

    :cond_6
    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHScrollEdge:I

    if-ne p2, v2, :cond_e

    cmpg-float p1, p1, v7

    if-gtz p1, :cond_e

    :cond_7
    if-eqz v0, :cond_8

    iget-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    if-nez p1, :cond_8

    invoke-interface {v0, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_8
    return-void

    :cond_9
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    if-eq p1, v1, :cond_b

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    if-ne p1, v4, :cond_a

    cmpl-float p1, p2, v5

    if-gez p1, :cond_b

    :cond_a
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mVScrollEdge:I

    const/4 v1, 0x3

    if-ne p1, v1, :cond_e

    cmpg-float p1, p2, v7

    if-gtz p1, :cond_e

    :cond_b
    if-eqz v0, :cond_c

    iget-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    if-nez p1, :cond_c

    invoke-interface {v0, v6}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_c
    return-void

    :cond_d
    if-eqz v0, :cond_e

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    :cond_e
    iput-boolean v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    return-void
.end method

.method public onFling(FFFF)V
    .locals 2

    iget-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptDrag()Z

    move-result p1

    if-eqz p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result p1

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float p1, p1, p2

    if-gez p1, :cond_2

    return-void

    :cond_2
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    new-instance p2, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;Landroid/content/Context;)V

    iput-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result v0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v1

    float-to-int p3, p3

    float-to-int p4, p4

    invoke-virtual {p2, v0, v1, p3, p4}, Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;->fling(IIII)V

    iget-object p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mCurrentFlingRunnable:Luk/co/senab/photoview/PhotoViewAttacher$FlingRunnable;

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onGlobalLayout()V
    .locals 6

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getTop()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v2

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v3

    invoke-virtual {v0}, Landroid/widget/ImageView;->getLeft()I

    move-result v4

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    if-ne v1, v5, :cond_0

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    if-ne v3, v5, :cond_0

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    if-ne v4, v5, :cond_0

    iget v5, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    if-eq v2, v5, :cond_1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v5

    invoke-direct {p0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->trimRotation(F)I

    move-result v5

    invoke-direct {p0, v0, v5}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;I)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    iput v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvTop:I

    iput v2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvRight:I

    iput v3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvBottom:I

    iput v4, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIvLeft:I

    :cond_1
    return-void
.end method

.method public onScale(FFF)V
    .locals 5

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHasScale:Z

    const/4 v1, 0x0

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v2

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaxPointsScalingScale()F

    move-result v3

    cmpg-float v3, v2, v3

    const/high16 v4, 0x3f800000    # 1.0f

    if-ltz v3, :cond_1

    cmpg-float v3, p1, v4

    if-gez v3, :cond_4

    :cond_1
    iput p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusX:F

    iput p3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusY:F

    invoke-direct {p0, p1, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->postScale(FFFF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result p2

    iget-object p3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    if-eqz p3, :cond_4

    cmpg-float p1, p1, v4

    if-gez p1, :cond_3

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    cmpg-float p1, p2, p1

    if-gez p1, :cond_2

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    cmpl-float p1, v2, p1

    if-ltz p1, :cond_2

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMaxScaleStage(Z)V

    goto :goto_0

    :cond_2
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpg-float p1, p2, p1

    if-gez p1, :cond_4

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    cmpl-float p1, v2, p1

    if-ltz p1, :cond_4

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMidScaleStage(Z)V

    goto :goto_0

    :cond_3
    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxDoubleTapScale:F

    cmpl-float p1, p2, p1

    if-ltz p1, :cond_4

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    invoke-interface {p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;->onMaxScaleStage(Z)V

    :cond_4
    :goto_0
    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIntercepted:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptTouch()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    if-eqz p2, :cond_e

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p1

    invoke-interface {p1, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto/16 :goto_6

    :cond_1
    move-object v0, p1

    check-cast v0, Landroid/widget/ImageView;

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->hasDrawable(Landroid/widget/ImageView;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v3

    const/4 v4, 0x3

    if-eq v3, v4, :cond_3

    packed-switch v3, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result p1

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDownScale:F

    if-eqz v0, :cond_2

    invoke-interface {v0, v2}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    goto :goto_0

    :cond_2
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object p1

    const-string v0, "PhotoViewAttacher"

    const-string v3, "onTouch getParent() returned null"

    invoke-interface {p1, v0, v3}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTouchDownY:F

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mHasScale:Z

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->cancelFling()V

    :goto_1
    const/4 p1, 0x0

    goto/16 :goto_5

    :cond_3
    :pswitch_1
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->interceptMotionEnd()Z

    move-result v0

    if-eqz v0, :cond_4

    return v2

    :cond_4
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v5

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v9, 0x0

    if-eqz v0, :cond_7

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutY:F

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutThreshold:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_5

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    if-eqz p1, :cond_6

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    invoke-interface {p1}, Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;->onExit()V

    goto :goto_2

    :cond_5
    invoke-direct {p0, v3}, Luk/co/senab/photoview/PhotoViewAttacher;->updateAlpha(F)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    :cond_6
    :goto_2
    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsDragDownOut:Z

    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragDownOutY:F

    goto :goto_3

    :cond_7
    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_a

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitScale:F

    cmpg-float v0, v5, v0

    if-gez v0, :cond_8

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    if-eqz v0, :cond_8

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDownScale:F

    cmpg-float v0, v0, v3

    if-gtz v0, :cond_8

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    invoke-interface {p1}, Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;->onExit()V

    goto :goto_3

    :cond_8
    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v0, v5, v0

    if-gez v0, :cond_9

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDisplayRect()Landroid/graphics/RectF;

    move-result-object v0

    if-eqz v0, :cond_a

    new-instance v9, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    iget v6, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v7

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v8

    move-object v3, v9

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {p1, v9}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    const/4 p1, 0x1

    goto :goto_4

    :cond_9
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaxPointsScale()F

    move-result v0

    cmpl-float v0, v5, v0

    if-lez v0, :cond_a

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusX:F

    cmpl-float v0, v0, v9

    if-lez v0, :cond_a

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusY:F

    cmpl-float v0, v0, v9

    if-lez v0, :cond_a

    new-instance v0, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaxPointsScale()F

    move-result v6

    iget v7, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusX:F

    iget v8, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusY:F

    move-object v3, v0

    move-object v4, p0

    invoke-direct/range {v3 .. v8}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusX:F

    iput v9, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLastScaleFocusY:F

    :cond_a
    :goto_3
    const/4 p1, 0x0

    :goto_4
    iput-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mDragHandled:Z

    :goto_5
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->canRotatable()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->ensureRotateDetector()V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateDetector:Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;

    invoke-virtual {p1, p2}, Luk/co/senab/photoview/PhotoViewAttacher$RotateManager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    :cond_b
    move v1, p1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->ensureScaleDragDetector()V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleDragDetector:Luk/co/senab/photoview/gestures/GestureDetector;

    invoke-interface {p1, p2}, Luk/co/senab/photoview/gestures/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_c

    const/4 v1, 0x1

    :cond_c
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->ensureTapDetector()V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {p1, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_d

    goto :goto_6

    :cond_d
    move v2, v1

    :cond_e
    :goto_6
    return v2

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public releaseTile()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {v0}, Lcom/miui/gallery/util/photoview/TileView;->cleanup()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    return-void
.end method

.method public removeOnMatrixChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnMatrixChangedListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMatrixChangeListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public setAllowParentInterceptOnEdge(Z)V
    .locals 0

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAllowParentInterceptOnEdge:Z

    return-void
.end method

.method public setAlphaBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method

.method public setBackgroundAlpha(F)V
    .locals 0

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateAlpha(F)V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    :cond_0
    return-void
.end method

.method public setDisplayMatrix(Landroid/graphics/Matrix;)Z
    .locals 2

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-nez v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSuppMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkMatrixBounds()Z

    const/4 p1, 0x1

    return p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Matrix cannot be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setHDState(IIZ)V
    .locals 0

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginWidth:I

    iput p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mOriginHeight:I

    iput-boolean p3, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mSupportHd:Z

    return-void
.end method

.method public setInterceptTouch(Z)V
    .locals 0

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIntercepted:Z

    return-void
.end method

.method public setMaximumScale(F)V
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    invoke-static {v0, v1, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    return-void
.end method

.method public setMediumScale(F)V
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {v0, p1, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    return-void
.end method

.method public setMinimumScale(F)V
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMidScale:F

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMaxScale:F

    invoke-static {p1, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->checkZoomLevels(FFF)V

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    iget p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    const v0, 0x3f4ccccd    # 0.8f

    mul-float p1, p1, v0

    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitScale:F

    return-void
.end method

.method public setOnBackgroundAlphaChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mAlphaChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnBackgroundAlphaChangedListener;

    return-void
.end method

.method public setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V
    .locals 1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->ensureTapDetector()V

    if-eqz p1, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mGestureDetector:Landroid/view/GestureDetector;

    new-instance v0, Luk/co/senab/photoview/DefaultOnDoubleTapListener;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/DefaultOnDoubleTapListener;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;)V

    invoke-virtual {p1, v0}, Landroid/view/GestureDetector;->setOnDoubleTapListener(Landroid/view/GestureDetector$OnDoubleTapListener;)V

    :goto_0
    return-void
.end method

.method public setOnExitListener(Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mExitListener:Luk/co/senab/photoview/PhotoViewAttacher$OnExitListener;

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mLongClickListener:Landroid/view/View$OnLongClickListener;

    return-void
.end method

.method public setOnPhotoTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mPhotoTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnPhotoTapListener;

    return-void
.end method

.method public setOnRotateListener(Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateListener:Luk/co/senab/photoview/PhotoViewAttacher$OnRotateListener;

    return-void
.end method

.method public setOnScaleChangeListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleChangeListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleChangeListener;

    return-void
.end method

.method public setOnScaleStageChangedListener(Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleStageChangedListener:Luk/co/senab/photoview/PhotoViewAttacher$OnScaleStageChangedListener;

    return-void
.end method

.method public setOnViewTapListener(Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;)V
    .locals 0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mViewTapListener:Luk/co/senab/photoview/PhotoViewAttacher$OnViewTapListener;

    return-void
.end method

.method public setRegionDecodeEnable(Z)V
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsRegionDecodeEnable:Z

    if-eq v0, p1, :cond_1

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mIsRegionDecodeEnable:Z

    if-eqz p1, :cond_0

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->notifyTileViewInvalidate()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/ImageView;->invalidate()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setRotatable(Z)V
    .locals 0

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateEnabled:Z

    iget-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mRotateEnabled:Z

    if-nez p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setRotationBy(F)V
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->postRotate(FFF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public setRotationTo(F)V
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setRotate(FFF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    return-void
.end method

.method public setScale(F)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FZ)V

    return-void
.end method

.method public setScale(FFFZ)V
    .locals 8

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_3

    iget v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mMinScale:F

    cmpg-float v1, p1, v1

    if-ltz v1, :cond_2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getMaximumScale()F

    move-result v1

    cmpl-float v1, p1, v1

    if-lez v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p4, :cond_1

    new-instance p4, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getScale()F

    move-result v4

    move-object v2, p4

    move-object v3, p0

    move v5, p1

    move v6, p2

    move v7, p3

    invoke-direct/range {v2 .. v7}, Luk/co/senab/photoview/PhotoViewAttacher$AnimatedZoomRunnable;-><init>(Luk/co/senab/photoview/PhotoViewAttacher;FFFF)V

    invoke-virtual {v0, p4}, Landroid/widget/ImageView;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1, p1, p2, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFF)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->checkAndDisplayMatrix()V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object p1

    const-string p2, "PhotoViewAttacher"

    const-string p3, "Scale must be within the range of minScale and maxScale"

    invoke-interface {p1, p2, p3}, Luk/co/senab/photoview/log/Logger;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    :goto_1
    return-void
.end method

.method public setScale(FZ)V
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/widget/ImageView;->getRight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBottom()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0, p1, v1, v0, p2}, Luk/co/senab/photoview/PhotoViewAttacher;->setScale(FFFZ)V

    :cond_0
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 1

    invoke-static {p1}, Luk/co/senab/photoview/PhotoViewAttacher;->isSupportedScaleType(Landroid/widget/ImageView$ScaleType;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    if-eq p1, v0, :cond_0

    iput-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mScaleType:Landroid/widget/ImageView$ScaleType;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setStroke(II)V
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeColor:I

    if-ne v0, p1, :cond_0

    iget v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    if-eq v0, p2, :cond_2

    :cond_0
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeColor:I

    iput p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    if-lez p2, :cond_1

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->ensureStrokePaint()V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeColor:I

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokePaint:Landroid/graphics/Paint;

    iget p2, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mStrokeWidth:I

    int-to-float p2, p2

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    :cond_1
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/widget/ImageView;->invalidate()V

    :cond_2
    return-void
.end method

.method public setZoomTransitionDuration(I)V
    .locals 0

    if-gez p1, :cond_0

    const/16 p1, 0xc8

    :cond_0
    iput p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->ZOOM_DURATION:I

    return-void
.end method

.method public setZoomable(Z)V
    .locals 0

    iput-boolean p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->update(Z)V

    :cond_0
    return-void
.end method

.method public setupTile(Lcom/miui/gallery/util/photoview/TileBitProvider;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V
    .locals 2

    iget-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/photoview/TileView;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v1

    invoke-direct {v0, p1, v1, p2, p3}, Lcom/miui/gallery/util/photoview/TileView;-><init>(Lcom/miui/gallery/util/photoview/TileBitProvider;Landroid/view/View;Lcom/miui/gallery/util/photoview/BitmapRecycleCallback;Lcom/miui/gallery/util/photoview/TrimMemoryCallback;)V

    iput-object v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    :cond_0
    iget-object p1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mTileView:Lcom/miui/gallery/util/photoview/TileView;

    new-instance p2, Landroid/graphics/Rect;

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object p3

    invoke-direct {p0, p3}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewWidth(Landroid/widget/ImageView;)I

    move-result p3

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    invoke-direct {p0, v0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageViewHeight(Landroid/widget/ImageView;)I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p2, v1, v1, p3, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/util/photoview/TileView;->setViewPort(Landroid/graphics/Rect;)V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->calculateScales()V

    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->notifyTileViewInvalidate()V

    return-void
.end method

.method public update(Z)V
    .locals 2

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getImageView()Landroid/widget/ImageView;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-boolean v1, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v1, :cond_0

    invoke-static {v0}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewScaleTypeMatrix(Landroid/widget/ImageView;)V

    :cond_0
    invoke-virtual {v0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getRotate()F

    move-result v1

    invoke-direct {p0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->trimRotation(F)I

    move-result v1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v0, v1}, Luk/co/senab/photoview/PhotoViewAttacher;->updateBaseMatrix(Landroid/graphics/drawable/Drawable;I)V

    iget-boolean v0, p0, Luk/co/senab/photoview/PhotoViewAttacher;->mZoomEnabled:Z

    if-eqz v0, :cond_3

    if-nez p1, :cond_2

    goto :goto_1

    :cond_2
    invoke-virtual {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->getDrawMatrix()Landroid/graphics/Matrix;

    move-result-object p1

    invoke-direct {p0, p1}, Luk/co/senab/photoview/PhotoViewAttacher;->setImageViewMatrix(Landroid/graphics/Matrix;)V

    goto :goto_2

    :cond_3
    :goto_1
    invoke-direct {p0}, Luk/co/senab/photoview/PhotoViewAttacher;->resetMatrix()V

    :cond_4
    :goto_2
    return-void
.end method
