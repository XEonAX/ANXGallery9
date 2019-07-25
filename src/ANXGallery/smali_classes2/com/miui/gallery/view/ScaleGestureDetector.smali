.class public Lcom/miui/gallery/view/ScaleGestureDetector;
.super Ljava/lang/Object;
.source "ScaleGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;
    }
.end annotation


# instance fields
.field private mAnchoredScaleMode:I

.field private mAnchoredScaleStartX:F

.field private mAnchoredScaleStartY:F

.field private final mContext:Landroid/content/Context;

.field private mCurrSpan:F

.field private mCurrSpanX:F

.field private mCurrSpanY:F

.field private mCurrTime:J

.field private mEventBeforeOrAboveStartingGestureEvent:Z

.field private mFocusX:F

.field private mFocusY:F

.field private mGestureDetector:Landroid/view/GestureDetector;

.field private final mHandler:Landroid/os/Handler;

.field private mInProgress:Z

.field private mInitialSpan:F

.field private final mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

.field private mMinSpan:I

.field private mPrevSpan:F

.field private mPrevSpanX:F

.field private mPrevSpanY:F

.field private mPrevTime:J

.field private mQuickScaleEnabled:Z

.field private mSpanSlop:I

.field private mStylusScaleEnabled:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;Landroid/os/Handler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;Landroid/os/Handler;)V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    iput-object p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p2

    mul-int/lit8 p2, p2, 0x2

    iput p2, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mSpanSlop:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mSpanSlop:I

    const-string v1, "config_minScalingSpan"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-static {p2, v1, v2, v3}, Lcom/miui/gallery/util/MiscUtil;->getDimensionPixelOffset(Landroid/content/res/Resources;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mMinSpan:I

    iput-object p3, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p1

    iget p1, p1, Landroid/content/pm/ApplicationInfo;->targetSdkVersion:I

    const/4 p2, 0x1

    const/16 p3, 0x12

    if-le p1, p3, :cond_0

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/ScaleGestureDetector;->setQuickScaleEnabled(Z)V

    :cond_0
    const/16 p3, 0x16

    if-le p1, p3, :cond_1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/view/ScaleGestureDetector;->setStylusScaleEnabled(Z)V

    :cond_1
    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/view/ScaleGestureDetector;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartX:F

    return p1
.end method

.method static synthetic access$102(Lcom/miui/gallery/view/ScaleGestureDetector;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartY:F

    return p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/view/ScaleGestureDetector;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    return p1
.end method

.method private inAnchoredScaleMode()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public getFocusX()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mFocusX:F

    return v0
.end method

.method public getFocusY()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mFocusY:F

    return v0
.end method

.method public getScaleFactor()F
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v0

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mEventBeforeOrAboveStartingGestureEvent:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iget v3, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    cmpg-float v0, v0, v3

    if-ltz v0, :cond_1

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mEventBeforeOrAboveStartingGestureEvent:Z

    if-nez v0, :cond_2

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iget v3, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    cmpl-float v0, v0, v3

    if-lez v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    iget v3, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iget v4, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    div-float/2addr v3, v4

    sub-float v3, v2, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    const/high16 v4, 0x3f000000    # 0.5f

    mul-float v3, v3, v4

    iget v4, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    cmpg-float v1, v4, v1

    if-gtz v1, :cond_3

    goto :goto_1

    :cond_3
    if-eqz v0, :cond_4

    add-float/2addr v2, v3

    goto :goto_1

    :cond_4
    sub-float/2addr v2, v3

    :goto_1
    return v2

    :cond_5
    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iget v1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    div-float v2, v0, v1

    :cond_6
    return v2
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getEventTime()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrTime:J

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    iget-boolean v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mQuickScaleEnabled:Z

    if-eqz v3, :cond_0

    iget-object v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mGestureDetector:Landroid/view/GestureDetector;

    invoke-virtual {v3, v1}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getButtonState()I

    move-result v4

    and-int/lit8 v4, v4, 0x20

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_1

    const/4 v4, 0x1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    :goto_0
    iget v7, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    const/4 v8, 0x2

    if-ne v7, v8, :cond_2

    if-nez v4, :cond_2

    const/4 v7, 0x1

    goto :goto_1

    :cond_2
    const/4 v7, 0x0

    :goto_1
    if-eq v2, v6, :cond_4

    const/4 v9, 0x3

    if-eq v2, v9, :cond_4

    if-eqz v7, :cond_3

    goto :goto_2

    :cond_3
    const/4 v9, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 v9, 0x1

    :goto_3
    const/4 v10, 0x0

    if-eqz v2, :cond_5

    if-eqz v9, :cond_8

    :cond_5
    iget-boolean v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    if-eqz v11, :cond_6

    iget-object v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v11, v0}, Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;->onScaleEnd(Lcom/miui/gallery/view/ScaleGestureDetector;)V

    iput-boolean v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    iput v10, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    iput v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    goto :goto_4

    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v11

    if-eqz v11, :cond_7

    if-eqz v9, :cond_7

    iput-boolean v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    iput v10, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    iput v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    :cond_7
    :goto_4
    if-eqz v9, :cond_8

    return v6

    :cond_8
    iget-boolean v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    if-nez v11, :cond_9

    iget-boolean v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mStylusScaleEnabled:Z

    if-eqz v11, :cond_9

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v11

    if-nez v11, :cond_9

    if-nez v9, :cond_9

    if-eqz v4, :cond_9

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v4

    iput v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartX:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    iput v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartY:F

    iput v8, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleMode:I

    iput v10, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    :cond_9
    const/4 v4, 0x6

    if-eqz v2, :cond_b

    if-eq v2, v4, :cond_b

    const/4 v9, 0x5

    if-eq v2, v9, :cond_b

    if-eqz v7, :cond_a

    goto :goto_5

    :cond_a
    const/4 v7, 0x0

    goto :goto_6

    :cond_b
    :goto_5
    const/4 v7, 0x1

    :goto_6
    if-ne v2, v4, :cond_c

    const/4 v4, 0x1

    goto :goto_7

    :cond_c
    const/4 v4, 0x0

    :goto_7
    if-eqz v4, :cond_d

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v9

    goto :goto_8

    :cond_d
    const/4 v9, -0x1

    :goto_8
    if-eqz v4, :cond_e

    add-int/lit8 v4, v3, -0x1

    goto :goto_9

    :cond_e
    move v4, v3

    :goto_9
    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v11

    if-eqz v11, :cond_10

    iget v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartX:F

    iget v12, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mAnchoredScaleStartY:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v13

    cmpg-float v13, v13, v12

    if-gez v13, :cond_f

    iput-boolean v6, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mEventBeforeOrAboveStartingGestureEvent:Z

    goto :goto_c

    :cond_f
    iput-boolean v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mEventBeforeOrAboveStartingGestureEvent:Z

    goto :goto_c

    :cond_10
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_a
    if-ge v11, v3, :cond_12

    if-ne v9, v11, :cond_11

    goto :goto_b

    :cond_11
    invoke-virtual {v1, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v14

    add-float/2addr v12, v14

    invoke-virtual {v1, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v14

    add-float/2addr v13, v14

    :goto_b
    add-int/lit8 v11, v11, 0x1

    goto :goto_a

    :cond_12
    int-to-float v11, v4

    div-float/2addr v12, v11

    div-float v11, v13, v11

    move/from16 v16, v12

    move v12, v11

    move/from16 v11, v16

    :goto_c
    const/4 v10, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    :goto_d
    if-ge v10, v3, :cond_14

    if-ne v9, v10, :cond_13

    goto :goto_e

    :cond_13
    invoke-virtual {v1, v10}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    sub-float/2addr v15, v11

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    add-float/2addr v13, v15

    invoke-virtual {v1, v10}, Landroid/view/MotionEvent;->getY(I)F

    move-result v15

    sub-float/2addr v15, v12

    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    move-result v15

    add-float/2addr v14, v15

    :goto_e
    add-int/lit8 v10, v10, 0x1

    goto :goto_d

    :cond_14
    int-to-float v1, v4

    div-float/2addr v13, v1

    div-float/2addr v14, v1

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v13, v13, v1

    mul-float v14, v14, v1

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v1

    if-eqz v1, :cond_15

    move v1, v14

    goto :goto_f

    :cond_15
    float-to-double v3, v13

    float-to-double v9, v14

    invoke-static {v3, v4, v9, v10}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v3

    double-to-float v1, v3

    :goto_f
    iget-boolean v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    iput v11, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mFocusX:F

    iput v12, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mFocusY:F

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v4

    if-nez v4, :cond_17

    iget-boolean v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    if-eqz v4, :cond_17

    iget v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mMinSpan:I

    int-to-float v4, v4

    cmpg-float v4, v1, v4

    if-ltz v4, :cond_16

    if-eqz v7, :cond_17

    :cond_16
    iget-object v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v4, v0}, Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;->onScaleEnd(Lcom/miui/gallery/view/ScaleGestureDetector;)V

    iput-boolean v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    :cond_17
    if-eqz v7, :cond_18

    iput v13, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanX:F

    iput v13, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanX:F

    iput v14, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanY:F

    iput v14, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanY:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    :cond_18
    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/view/ScaleGestureDetector;->inAnchoredScaleMode()Z

    move-result v4

    if-eqz v4, :cond_19

    iget v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mSpanSlop:I

    goto :goto_10

    :cond_19
    iget v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mMinSpan:I

    :goto_10
    iget-boolean v5, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    if-nez v5, :cond_1b

    int-to-float v4, v4

    cmpl-float v4, v1, v4

    if-ltz v4, :cond_1b

    if-nez v3, :cond_1a

    iget v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInitialSpan:F

    sub-float v3, v1, v3

    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    move-result v3

    iget v4, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mSpanSlop:I

    int-to-float v4, v4

    cmpl-float v3, v3, v4

    if-lez v3, :cond_1b

    :cond_1a
    iput v13, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanX:F

    iput v13, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanX:F

    iput v14, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanY:F

    iput v14, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanY:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    iget-wide v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrTime:J

    iput-wide v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevTime:J

    iget-object v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v3, v0}, Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;->onScaleBegin(Lcom/miui/gallery/view/ScaleGestureDetector;)Z

    move-result v3

    iput-boolean v3, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    :cond_1b
    if-ne v2, v8, :cond_1d

    iput v13, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanX:F

    iput v14, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanY:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iget-boolean v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mInProgress:Z

    if-eqz v1, :cond_1c

    iget-object v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mListener:Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;

    invoke-interface {v1, v0}, Lcom/miui/gallery/view/ScaleGestureDetector$OnScaleGestureListener;->onScale(Lcom/miui/gallery/view/ScaleGestureDetector;)Z

    move-result v1

    goto :goto_11

    :cond_1c
    const/4 v1, 0x1

    :goto_11
    if-eqz v1, :cond_1d

    iget v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanX:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanX:F

    iget v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpanY:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpanY:F

    iget v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrSpan:F

    iput v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevSpan:F

    iget-wide v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mCurrTime:J

    iput-wide v1, v0, Lcom/miui/gallery/view/ScaleGestureDetector;->mPrevTime:J

    :cond_1d
    return v6
.end method

.method public setQuickScaleEnabled(Z)V
    .locals 3

    iput-boolean p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mQuickScaleEnabled:Z

    iget-boolean p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mQuickScaleEnabled:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mGestureDetector:Landroid/view/GestureDetector;

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/view/ScaleGestureDetector$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/view/ScaleGestureDetector$1;-><init>(Lcom/miui/gallery/view/ScaleGestureDetector;)V

    new-instance v0, Landroid/view/GestureDetector;

    iget-object v1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, v1, p1, v2}, Landroid/view/GestureDetector;-><init>(Landroid/content/Context;Landroid/view/GestureDetector$OnGestureListener;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mGestureDetector:Landroid/view/GestureDetector;

    :cond_0
    return-void
.end method

.method public setScaleMinSpan(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mSpanSlop:I

    invoke-static {p1, v0}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mMinSpan:I

    return-void
.end method

.method public setStylusScaleEnabled(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/view/ScaleGestureDetector;->mStylusScaleEnabled:Z

    return-void
.end method
