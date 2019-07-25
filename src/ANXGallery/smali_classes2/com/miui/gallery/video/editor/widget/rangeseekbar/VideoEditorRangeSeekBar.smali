.class public Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;
.super Landroid/view/View;
.source "VideoEditorRangeSeekBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;,
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;,
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;,
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;,
        Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$VideoEditorRangeSeekBarBitmapProviderWrapper;
    }
.end annotation


# static fields
.field private static final LONGPRESS_TIMEOUT:I


# instance fields
.field private autoMoveSpeed:F

.field private autoMoving:Z

.field private mAvailableAreaLeft:I

.field private mAvailableAreaOffset:F

.field private mAvailableAreaRight:I

.field private mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

.field private mDragSlop:I

.field private mDragState:I

.field private mEndRange:I

.field private mHeight:I

.field private mHideProgressAnimator:Landroid/animation/Animator;

.field private mHideProgressBarAction:Ljava/lang/Runnable;

.field private mIsShowProgress:Z

.field private mIsZooming:Z

.field private mLastTouchDownX:F

.field private mLeftRangeFloat:F

.field private mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

.field private mLockedAvailableAreaLeft:I

.field private mLockedAvailableAreaRight:I

.field private mLongPressMoveDistanceFlag:F

.field private mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

.field private mMax:I

.field private mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

.field private mProgress:I

.field private mProgressBounds:Landroid/graphics/Rect;

.field private mProgressFloat:F

.field private mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

.field private mRightRangeFloat:F

.field private mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

.field private mScaledTouchSlop:I

.field private mStartLongPressMoveDistanceDownXFlag:F

.field private mStartRange:I

.field private mStopSlide:Z

.field private mThumbOffset:I

.field private mTotal:I

.field private mTouchDownX:F

.field private mTouchMoveX:F

.field private mTouchState:I

.field private mVisibleAreaBottom:I

.field private mVisibleAreaLeft:I

.field private mVisibleAreaRight:I

.field private mVisibleAreaTop:I

.field private mWidth:I

.field private progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Landroid/view/ViewConfiguration;->getLongPressTimeout()I

    move-result v0

    sput v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->LONGPRESS_TIMEOUT:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x3

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStopSlide:Z

    const v0, 0x7fffffff

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    const/4 v1, 0x0

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    const/high16 v2, 0x3f800000    # 1.0f

    iput v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    const/4 v2, -0x1

    iput v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLastTouchDownX:F

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x3

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStopSlide:Z

    const p2, 0x7fffffff

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    const/4 v1, -0x1

    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLastTouchDownX:F

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x3

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStopSlide:Z

    const p2, 0x7fffffff

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    const/4 p3, 0x0

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLastTouchDownX:F

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    iput p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->init()V

    return-void
.end method

.method static synthetic access$102(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsZooming:Z

    return p1
.end method

.method static synthetic access$1300(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    return p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressMoveDistanceFlag:F

    return p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mScaledTouchSlop:I

    return p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartLongPressMoveDistanceDownXFlag:F

    return p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    return p0
.end method

.method static synthetic access$1800(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;FFZ)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->scaleTo(FFZ)V

    return-void
.end method

.method static synthetic access$1900(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Landroid/animation/Animator;)Landroid/animation/Animator;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    return-object p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    return p0
.end method

.method private adjustThumb()V
    .locals 6

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v2, v2

    cmpl-float v2, v0, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ltz v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v2, v2

    cmpg-float v2, v1, v2

    if-gtz v2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->clearAvailableAreaOffset()V

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    invoke-direct {p0, v0, v1, v3, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto/16 :goto_0

    :cond_0
    sub-float v2, v1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getVisibleAreaWidth()I

    move-result v5

    int-to-float v5, v5

    cmpg-float v2, v2, v5

    if-gez v2, :cond_3

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v2, v2

    cmpl-float v2, v1, v2

    const/high16 v5, 0x3f000000    # 0.5f

    if-lez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v2, v2

    sub-float/2addr v2, v1

    add-float/2addr v0, v2

    sub-float/2addr v0, v5

    float-to-int v0, v0

    add-float/2addr v1, v2

    sub-float/2addr v1, v5

    float-to-int v1, v1

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    if-lt v0, v5, :cond_4

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    if-gt v1, v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->clearAvailableAreaOffset()V

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    int-to-float v0, v0

    add-float/2addr v0, v2

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    int-to-float v1, v1

    add-float/2addr v1, v2

    float-to-int v1, v1

    invoke-direct {p0, v0, v1, v3, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v2, v2

    cmpg-float v2, v0, v2

    if-gez v2, :cond_2

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v2, v2

    sub-float/2addr v2, v0

    add-float/2addr v0, v2

    add-float/2addr v0, v5

    float-to-int v0, v0

    add-float/2addr v1, v2

    add-float/2addr v1, v5

    float-to-int v1, v1

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    if-lt v0, v5, :cond_4

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    if-gt v1, v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->clearAvailableAreaOffset()V

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    int-to-float v0, v0

    add-float/2addr v0, v2

    float-to-int v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    int-to-float v1, v1

    add-float/2addr v1, v2

    float-to-int v1, v1

    invoke-direct {p0, v0, v1, v3, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->clearAvailableAreaOffset()V

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    invoke-direct {p0, v0, v1, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockFloatRangeTo(FFLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto :goto_0

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->clearAvailableAreaOffset()V

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    invoke-direct {p0, v0, v1, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockFloatRangeTo(FFLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    :cond_4
    :goto_0
    return-void
.end method

.method private autoMove()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    if-eqz v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    add-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v1, v1

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v1, v1

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLastTouchDownX:F

    invoke-direct {p0, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->trackTouchEvent(F)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->invalidate()V

    :cond_2
    return-void
.end method

.method private canSlip()Z
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    if-le v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v2

    div-int/lit8 v2, v2, 0x2

    add-int/2addr v1, v2

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private clearAvailableAreaOffset()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    return-void
.end method

.method private init()V
    .locals 6

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070313

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070314

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070329

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-direct {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setCLayoutDirection(I)V

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050190

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;-><init>(Landroid/graphics/drawable/Drawable;)V

    iput-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v0

    int-to-double v0, v0

    const-wide/high16 v3, 0x4004000000000000L    # 2.5

    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v3

    double-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mScaledTouchSlop:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06055d

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f06055b

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f06055a

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f06055c

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v5, v2, v0, v2, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setPadding(IIII)V

    iget-object v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    invoke-virtual {v5, v2, v0, v2, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setPadding(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v4, v2, v1, v2, v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setPadding(IIII)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v3, 0x7f060562

    invoke-virtual {v1, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3, v2, v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setPadding(IIII)V

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3, v2, v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setPadding(IIII)V

    return-void
.end method

.method private lockFloatRangeTo(FFLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getVisibleAreaWidth()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v1, v1

    int-to-float v0, v0

    mul-float p1, p1, v0

    add-float/2addr v1, p1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float p1, p1

    mul-float p2, p2, v0

    add-float/2addr p1, p2

    sub-float p2, p1, v1

    div-float/2addr v0, p2

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float p2, p2

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v2, v2

    sub-float/2addr v1, v2

    mul-float v1, v1, v0

    sub-float/2addr p2, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v2, v2

    sub-float/2addr v2, p1

    mul-float v2, v2, v0

    add-float/2addr v1, v2

    float-to-int p1, p2

    float-to-int p2, v1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    return-void
.end method

.method private onStartTrackingTouch()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v3, :cond_0

    const/4 v1, 0x0

    :cond_0
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    :goto_0
    invoke-interface {v0, p0, v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;II)V

    goto :goto_3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_4

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_2

    :cond_4
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    :goto_2
    invoke-interface {v0, p0, v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;II)V

    :cond_5
    :goto_3
    return-void
.end method

.method private onStopTrackingTouch()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v3, :cond_0

    const/4 v1, 0x0

    :cond_0
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    goto :goto_0

    :cond_1
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    :goto_0
    invoke-interface {v0, p0, v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;II)V

    goto :goto_3

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v1, 0x0

    :goto_1
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_4

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_2

    :cond_4
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    :goto_2
    invoke-interface {v0, p0, v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onStartTrackingTouch(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;II)V

    :cond_5
    :goto_3
    return-void
.end method

.method private recoverToLockedArea()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    invoke-static {v0, v2}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->adjustThumb()V

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    :cond_2
    :goto_0
    return-void
.end method

.method private scaleTo(FFZ)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getAvailableWidth()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr p1, v1

    mul-float v0, v0, p1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float p1, p1

    mul-float v2, v0, p2

    sub-float/2addr p1, v2

    float-to-int p1, p1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    int-to-float v2, v2

    sub-float/2addr v1, p2

    mul-float v0, v0, v1

    add-float/2addr v2, v0

    float-to-int p2, v2

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    return-void
.end method

.method private trackTouchEvent(F)V
    .locals 4

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLastTouchDownX:F

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v0, v0

    cmpg-float v0, p1, v0

    const v1, 0x3e4ccccd    # 0.2f

    const/4 v2, 0x0

    if-gez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float v0, v0

    sub-float/2addr v0, p1

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    int-to-float p1, p1

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v0, v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float v0, v0

    sub-float/2addr v0, p1

    mul-float v0, v0, v1

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    int-to-float p1, p1

    goto :goto_0

    :cond_1
    iput v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getAvailableWidth()I

    move-result v0

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v1, v1

    sub-float/2addr p1, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    sub-float/2addr p1, v1

    div-float/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    packed-switch v0, :pswitch_data_0

    goto :goto_1

    :pswitch_0
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    goto :goto_1

    :pswitch_1
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_2

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    goto :goto_1

    :cond_2
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    goto :goto_1

    :pswitch_2
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    cmpl-float v0, p1, v0

    if-lez v0, :cond_3

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    goto :goto_1

    :cond_3
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateRangeValue()V

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    invoke-static {p1, v2}, Ljava/lang/Float;->compare(FF)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_7

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    cmpl-float p1, p1, v2

    if-lez p1, :cond_4

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    if-lt p1, v3, :cond_5

    :cond_4
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoveSpeed:F

    cmpg-float p1, p1, v2

    if-gez p1, :cond_8

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    if-le p1, v2, :cond_8

    :cond_5
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    cmpg-float p1, p1, v2

    if-gez p1, :cond_6

    iput-boolean v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    goto :goto_2

    :cond_6
    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    goto :goto_2

    :cond_7
    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    :cond_8
    :goto_2
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/4 v2, 0x2

    if-ne p1, v2, :cond_9

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->canSlip()Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    const/4 v0, -0x1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    invoke-interface {p1, p0, v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onProgressPreview(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;IIZ)V

    goto :goto_6

    :cond_9
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_c

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_a

    goto :goto_3

    :cond_a
    const/4 v0, 0x1

    :goto_3
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_b

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    goto :goto_4

    :cond_b
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    :goto_4
    invoke-interface {p1, p0, v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onProgressChanged(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;IIZ)V

    goto :goto_6

    :cond_c
    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_d

    const/4 v0, 0x1

    :cond_d
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v2, :cond_e

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_5

    :cond_e
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    :goto_5
    invoke-interface {p1, p0, v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;->onProgressChanged(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;IIZ)V

    :cond_f
    :goto_6
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private updateRangeValue()V
    .locals 4

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/high16 v1, 0x3f000000    # 0.5f

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_0

    :cond_1
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float v2, v3, v2

    mul-float v0, v0, v2

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    sub-float/2addr v3, v2

    mul-float v0, v0, v3

    add-float/2addr v0, v1

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    :goto_0
    return-void
.end method

.method private updateState()V
    .locals 8

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getAvailableWidth()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v1, v2

    float-to-int v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    int-to-float v2, v2

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    add-float/2addr v2, v3

    float-to-int v2, v2

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaTop:I

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaBottom:I

    invoke-virtual {v3, v1, v4, v2, v5}, Landroid/graphics/Rect;->set(IIII)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setBounds(Landroid/graphics/Rect;)V

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressBounds:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setBounds(Landroid/graphics/Rect;)V

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    int-to-float v0, v0

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    mul-float v2, v2, v0

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v3, v3

    add-float/2addr v2, v3

    const/high16 v3, 0x3f000000    # 0.5f

    add-float/2addr v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    mul-float v4, v4, v0

    iget v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v5, v5

    add-float/2addr v4, v5

    add-float/2addr v4, v3

    add-float/2addr v2, v4

    float-to-int v2, v2

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    const/4 v5, 0x2

    if-ne v4, v5, :cond_2

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    if-ne v4, v5, :cond_2

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    mul-float v0, v0, v6

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    int-to-float v6, v6

    add-float/2addr v0, v6

    add-float/2addr v0, v3

    add-float/2addr v4, v0

    float-to-int v0, v4

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3f666666    # 0.9f

    mul-float v3, v3, v4

    float-to-int v3, v3

    add-int/2addr v3, v1

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v4

    int-to-float v4, v4

    const v6, 0x3dcccccd    # 0.1f

    mul-float v4, v4, v6

    float-to-int v4, v4

    add-int/2addr v4, v2

    if-gt v0, v3, :cond_0

    move v0, v3

    goto :goto_0

    :cond_0
    if-lt v0, v4, :cond_1

    move v0, v4

    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    div-int/2addr v4, v5

    invoke-virtual {v3, v0, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->moveProgressThumb(II)V

    goto :goto_1

    :cond_2
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaOffset:F

    int-to-float v4, v1

    sub-int v6, v2, v1

    int-to-float v6, v6

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    mul-float v6, v6, v7

    add-float/2addr v4, v6

    add-float/2addr v4, v3

    add-float/2addr v0, v4

    float-to-int v0, v0

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result v3

    int-to-float v3, v3

    const v4, 0x3ecccccd    # 0.4f

    mul-float v3, v3, v4

    float-to-int v3, v3

    add-int/2addr v0, v3

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    div-int/2addr v4, v5

    invoke-virtual {v3, v0, v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->moveTo(II)V

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    div-int/2addr v3, v5

    invoke-virtual {v0, v1, v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->moveLeftThumb(II)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    div-int/2addr v1, v5

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->moveRightThumb(II)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setStartRangeScale(F)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setEndRangeScale(F)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->invalidate()V

    return-void
.end method

.method private zoomAvailableAreaTo(IIZLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V
    .locals 8

    sub-int v0, p2, p1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    if-ge v0, v1, :cond_0

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-string v1, "AvailableAreaLeft"

    const/4 v2, 0x2

    new-array v3, v2, [I

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    const/4 v5, 0x0

    aput v4, v3, v5

    const/4 v4, 0x1

    aput p1, v3, v4

    invoke-static {p0, v1, v3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-string v3, "AvailableAreaRight"

    new-array v6, v2, [I

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    aput v7, v6, v5

    aput p2, v6, v4

    invoke-static {p0, v3, v6}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v3

    new-array v2, v2, [Landroid/animation/Animator;

    aput-object v1, v2, v5

    aput-object v3, v2, v4

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    iput-boolean v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsZooming:Z

    new-instance v1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$1;

    invoke-direct {v1, p0, p4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$1;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    if-eqz p3, :cond_0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    iput p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    :cond_0
    return-void
.end method


# virtual methods
.method public getAvailableHeight()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->getPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->getPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getAvailableWidth()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public getEndRange()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    return v0
.end method

.method public getNearbyThumbId(IZ)I
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v0

    sub-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v2

    sub-int/2addr v2, p1

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result p1

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v4}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getLocationX()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-gt v2, v4, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iget v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-gt v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    const/4 v4, 0x2

    const/4 v7, 0x3

    if-eqz p2, :cond_8

    if-eqz v2, :cond_3

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-lt v0, p2, :cond_2

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_3

    :cond_2
    return v6

    :cond_3
    if-eqz v3, :cond_5

    iget-boolean p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz p2, :cond_5

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-lt v1, p2, :cond_4

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_5

    :cond_4
    return v7

    :cond_5
    iget-boolean p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz p2, :cond_6

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_6

    return v7

    :cond_6
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge v0, p1, :cond_7

    return v6

    :cond_7
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge v1, p1, :cond_f

    return v4

    :cond_8
    if-eqz v3, :cond_a

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-lt v1, p2, :cond_9

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_a

    :cond_9
    return v4

    :cond_a
    if-eqz v2, :cond_c

    iget-boolean p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz p2, :cond_c

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-lt v0, p2, :cond_b

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_c

    :cond_b
    return v7

    :cond_c
    iget-boolean p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz p2, :cond_d

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge p1, p2, :cond_d

    return v7

    :cond_d
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge v1, p1, :cond_e

    return v4

    :cond_e
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragSlop:I

    if-ge v0, p1, :cond_f

    return v6

    :cond_f
    return v5
.end method

.method public getStartRange()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    return v0
.end method

.method public getVisibleAreaWidth()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public hideProgressBar()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->hideProgressBar(Z)V

    :cond_0
    return-void
.end method

.method public hideProgressBar(Z)V
    .locals 2

    if-eqz p1, :cond_0

    const-string p1, "ProgressBarAlpha"

    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    invoke-static {p0, p1, v0}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v0, 0x3e8

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$2;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setProgressBarAlpha(I)V

    :goto_0
    return-void

    nop

    :array_0
    .array-data 4
        0xff
        0x0
    .end array-data
.end method

.method public isTouching()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isZooming()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsZooming:Z

    return v0
.end method

.method public lockRangeTo(IILcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    if-gt p2, v0, :cond_1

    if-ge p1, p2, :cond_1

    sub-int v0, p2, p1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mWidth:I

    if-le v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result v0

    if-nez v0, :cond_0

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    int-to-float p2, p2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    div-float/2addr p2, v0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockFloatRangeTo(FFLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    goto :goto_0

    :cond_0
    int-to-float p2, p2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    div-float/2addr p2, v0

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float p2, v0, p2

    int-to-float p1, p1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v1, v1

    div-float/2addr p1, v1

    sub-float/2addr v0, p1

    invoke-direct {p0, p2, v0, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->lockFloatRangeTo(FFLcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$ISeekbarZooming;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->draw(Landroid/graphics/Canvas;)V

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->draw(Landroid/graphics/Canvas;)V

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMove()V

    :cond_1
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    if-eqz p1, :cond_2

    sub-int/2addr p4, p2

    iput p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mWidth:I

    sub-int/2addr p5, p3

    iput p5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result p2

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setSize(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result p2

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setSize(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getIntrinsicWidth()I

    move-result p2

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setSize(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getPaddingLeft()I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getPaddingLeft()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mWidth:I

    iget-object p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {p2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->getPaddingRight()I

    move-result p2

    sub-int/2addr p1, p2

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getPaddingRight()I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getPaddingTop()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaTop:I

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHeight:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getPaddingBottom()I

    move-result p2

    sub-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaBottom:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setDrawingArea(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRangeDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    sub-int/2addr p2, p3

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    add-int/2addr p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/DisabledRangeDrawable;->setDrawingArea(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    sub-int/2addr p2, p3

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    add-int/2addr p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setDrawingArea(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightThumbDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    sub-int/2addr p2, p3

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    add-int/2addr p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setDrawingArea(II)V

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    iget p2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    sub-int/2addr p2, p3

    iget p3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iget p4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mThumbOffset:I

    add-int/2addr p3, p4

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setDrawingArea(II)V

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    const p2, 0x7fffffff

    if-ne p1, p2, :cond_0

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaLeft:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    :cond_0
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    if-ne p1, p2, :cond_1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mVisibleAreaRight:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    :cond_2
    return-void
.end method

.method protected onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 1

    if-eqz p1, :cond_0

    instance-of v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->getSuperState()Landroid/os/Parcelable;

    move-result-object v0

    invoke-super {p0, v0}, Landroid/view/View;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    iget v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->total:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iget v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->startRange:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iget v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->endRange:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    iget v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->max:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    iget v0, p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->progress:I

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$600(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$700(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$800(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$900(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1000(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1100(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    invoke-static {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1200(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;)F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    :cond_0
    return-void
.end method

.method public onRtlPropertiesChanged(I)V
    .locals 1

    invoke-super {p0, p1}, Landroid/view/View;->onRtlPropertiesChanged(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setCLayoutDirection(I)V

    return-void
.end method

.method protected onSaveInstanceState()Landroid/os/Parcelable;
    .locals 2

    new-instance v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;

    invoke-super {p0}, Landroid/view/View;->onSaveInstanceState()Landroid/os/Parcelable;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;-><init>(Landroid/os/Parcelable;)V

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iput v1, v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->total:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iput v1, v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->startRange:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    iput v1, v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->endRange:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    iput v1, v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->max:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    iput v1, v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->progress:I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$602(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;I)I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$702(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;I)I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$802(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;I)I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$902(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;I)I

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1002(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;F)F

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1102(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;F)F

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    invoke-static {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;->access$1202(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$SavedState;F)F

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_3

    :pswitch_0
    const/4 v0, 0x2

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartLongPressMoveDistanceDownXFlag:F

    sub-float/2addr v6, v7

    iput v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressMoveDistanceFlag:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v6

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchDownX:F

    sub-float/2addr v6, v7

    iput v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaLeft:I

    if-eq v6, v7, :cond_0

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLockedAvailableAreaRight:I

    if-ne v6, v7, :cond_3

    :cond_0
    iget-boolean v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    if-nez v6, :cond_1

    iget v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressMoveDistanceFlag:F

    invoke-static {v6}, Ljava/lang/Math;->abs(F)F

    move-result v6

    iget v7, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mScaledTouchSlop:I

    div-int/2addr v7, v0

    int-to-float v7, v7

    cmpg-float v6, v6, v7

    if-gez v6, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    if-nez v6, :cond_3

    new-instance v6, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    invoke-direct {v6, p0, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$1;)V

    iput-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    iget-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    sget v6, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->LONGPRESS_TIMEOUT:I

    int-to-long v6, v6

    invoke-virtual {p0, v2, v6, v7}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    :cond_1
    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    if-eqz v6, :cond_2

    iget-object v6, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    invoke-virtual {v6}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->cancel()V

    iput-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    :cond_2
    iput v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressMoveDistanceFlag:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    iput v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartLongPressMoveDistanceDownXFlag:F

    :cond_3
    :goto_0
    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-eq v2, v5, :cond_6

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStopSlide:Z

    if-eqz v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-nez v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    cmpg-float v0, v0, v4

    if-gez v0, :cond_4

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->trackTouchEvent(F)V

    goto/16 :goto_3

    :cond_4
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-ne v0, v3, :cond_a

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    cmpl-float v0, v0, v4

    if-lez v0, :cond_a

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->trackTouchEvent(F)V

    goto/16 :goto_3

    :cond_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->trackTouchEvent(F)V

    goto/16 :goto_3

    :cond_6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchDownX:F

    sub-float/2addr p1, v2

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mScaledTouchSlop:I

    int-to-float v2, v2

    cmpl-float p1, p1, v2

    if-lez p1, :cond_a

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchDownX:F

    float-to-int p1, p1

    iget v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    cmpg-float v2, v2, v4

    if-gez v2, :cond_7

    const/4 v2, 0x1

    goto :goto_1

    :cond_7
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p0, p1, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getNearbyThumbId(IZ)I

    move-result p1

    packed-switch p1, :pswitch_data_1

    iput v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    goto :goto_2

    :pswitch_1
    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    goto :goto_2

    :pswitch_2
    iput v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    goto :goto_2

    :pswitch_3
    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    :goto_2
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-eq p1, v5, :cond_a

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->onStartTrackingTouch()V

    goto :goto_3

    :pswitch_4
    iput v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;->cancel()V

    iput-object v2, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    :cond_8
    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    if-eq p1, v5, :cond_9

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->onStopTrackingTouch()V

    iput v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    iput-boolean v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->autoMoving:Z

    :cond_9
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->recoverToLockedArea()V

    goto :goto_3

    :pswitch_5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchDownX:F

    iput v5, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mDragState:I

    iput v3, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchState:I

    iput v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTouchMoveX:F

    iput v4, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressMoveDistanceFlag:F

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartLongPressMoveDistanceDownXFlag:F

    new-instance p1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    invoke-direct {p1, p0, v2}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$1;)V

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    iget-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLongPressedRunnable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$LongPressedRunnable;

    sget v0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->LONGPRESS_TIMEOUT:I

    int-to-long v0, v0

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_a
    :goto_3
    return v3

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_5
        :pswitch_4
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public setAvailableAreaLeft(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaLeft:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setAvailableAreaRight(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mAvailableAreaRight:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setBitmapProvider(Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    new-instance v1, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$VideoEditorRangeSeekBarBitmapProviderWrapper;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$VideoEditorRangeSeekBarBitmapProviderWrapper;-><init>(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setmBitmapProvider(Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable$BitmapProvider;)V

    return-void
.end method

.method public setEndRange(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    if-le p1, v0, :cond_0

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    if-ge p1, v0, :cond_1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    goto :goto_1

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setMax(I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v1, v1

    mul-float v1, v1, v0

    float-to-int v0, v1

    iput v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    goto :goto_0

    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setOnSeekBarChangeListener(Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method public setProgress(I)V
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    goto :goto_1

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgress:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mMax:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mProgressFloat:F

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setProgressBarAlpha(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->progressDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/ThumbDrawable;->setAlpha(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->invalidate()V

    return-void
.end method

.method public setStartRange(I)V
    .locals 2

    if-gez p1, :cond_0

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    goto :goto_0

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    if-le p1, v0, :cond_1

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mEndRange:I

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    goto :goto_0

    :cond_1
    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->getLayoutDirection()I

    move-result p1

    if-nez p1, :cond_2

    iget p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    int-to-float p1, p1

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v0, v0

    div-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mLeftRangeFloat:F

    goto :goto_1

    :cond_2
    const/high16 p1, 0x3f800000    # 1.0f

    iget v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStartRange:I

    int-to-float v0, v0

    iget v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    sub-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mRightRangeFloat:F

    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateState()V

    return-void
.end method

.method public setStopSlide(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mStopSlide:Z

    return-void
.end method

.method public setThumbnailAspectRatio(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mBackgroundDrawable:Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/drawable/VideoThumbnailBackgroundDrawable;->setAspectRatio(F)V

    return-void
.end method

.method public setTotal(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mTotal:I

    invoke-direct {p0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->updateRangeValue()V

    return-void
.end method

.method public showProgressBar()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressBarAction:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressBarAction:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    iput-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressBarAction:Ljava/lang/Runnable;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    iput-object v1, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mHideProgressAnimator:Landroid/animation/Animator;

    :cond_1
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->mIsShowProgress:Z

    const/16 v0, 0xff

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/editor/widget/rangeseekbar/VideoEditorRangeSeekBar;->setProgressBarAlpha(I)V

    :cond_2
    return-void
.end method
