.class public Luk/co/senab/photoview/gestures/RotateGestureDetector;
.super Ljava/lang/Object;
.source "RotateGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;
    }
.end annotation


# static fields
.field private static DEBUG:Z


# instance fields
.field private isInProgress:Z

.field private mDegrees:F

.field private mDistanceDiffLimit:D

.field private mFirstPointerID:I

.field private mFirstPointerLastX:F

.field private mFirstPointerLastY:F

.field private mFocusX:F

.field private mFocusY:F

.field private mIsBeingRotated:Z

.field private mIsClockwise:Z

.field private mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

.field private mMaxVelocity:I

.field private mMinVelocity:I

.field private mPointersLastDistance:D

.field private mRotateSlop:F

.field private mSecondPointerID:I

.field private mSecondPointerLastX:F

.field private mSecondPointerLastY:F

.field private mTracker:Landroid/view/VelocityTracker;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "RotateGestureDetector"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mRotateSlop:F

    const-wide/high16 v0, 0x4049000000000000L    # 50.0

    iput-wide v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDistanceDiffLimit:D

    const/4 v0, 0x0

    iput-boolean v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsBeingRotated:Z

    iput-object p2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    const/4 p2, -0x1

    iput p2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    iput p2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p2

    iput p2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mMinVelocity:I

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    iput p1, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mMaxVelocity:I

    return-void
.end method

.method private calculateDegrees(FF)F
    .locals 1

    invoke-direct {p0, p2}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->clipAngle(F)F

    move-result p2

    invoke-direct {p0, p1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->clipAngle(F)F

    move-result p1

    sub-float/2addr p2, p1

    const/high16 p1, -0x3ccc0000    # -180.0f

    cmpg-float p1, p2, p1

    const/high16 v0, 0x43b40000    # 360.0f

    if-gez p1, :cond_0

    add-float/2addr p2, v0

    goto :goto_0

    :cond_0
    const/high16 p1, 0x43340000    # 180.0f

    cmpl-float p1, p2, p1

    if-lez p1, :cond_1

    sub-float/2addr p2, v0

    :cond_1
    :goto_0
    return p2
.end method

.method private calculateDegrees(FFFFFFFF)F
    .locals 2

    sub-float/2addr p4, p2

    float-to-double v0, p4

    sub-float/2addr p3, p1

    float-to-double p1, p3

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p1

    double-to-float p1, p1

    sub-float/2addr p8, p6

    float-to-double p2, p8

    sub-float/2addr p7, p5

    float-to-double p4, p7

    invoke-static {p2, p3, p4, p5}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p2

    double-to-float p2, p2

    float-to-double p3, p1

    invoke-static {p3, p4}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p3

    double-to-float p1, p3

    float-to-double p2, p2

    invoke-static {p2, p3}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p2

    double-to-float p2, p2

    invoke-direct {p0, p1, p2}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDegrees(FF)F

    move-result p1

    return p1
.end method

.method private calculateDistance(DDDD)D
    .locals 0

    sub-double/2addr p1, p5

    const-wide/high16 p5, 0x4000000000000000L    # 2.0

    invoke-static {p1, p2, p5, p6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p1

    sub-double/2addr p3, p7

    invoke-static {p3, p4, p5, p6}, Ljava/lang/Math;->pow(DD)D

    move-result-wide p3

    add-double/2addr p1, p3

    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    return-wide p1
.end method

.method private callRotateEnd()V
    .locals 11

    iget-boolean v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->isInProgress:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iput-boolean v1, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->isInProgress:Z

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    iget v3, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mMaxVelocity:I

    int-to-float v3, v3

    invoke-virtual {v0, v2, v3}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    iget v2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    invoke-virtual {v0, v2}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v0

    iget-object v2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    iget v3, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    invoke-virtual {v2, v3}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v2

    iget-object v3, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    iget v4, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    invoke-virtual {v3, v4}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v3

    iget-object v4, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    iget v5, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    invoke-virtual {v4, v5}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v4

    sub-float/2addr v2, v0

    sub-float v5, v4, v3

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v6

    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    move-result v7

    cmpl-float v6, v6, v7

    if-lez v6, :cond_0

    move v6, v2

    goto :goto_0

    :cond_0
    move v6, v5

    :goto_0
    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v6, v7

    sget-boolean v7, Luk/co/senab/photoview/gestures/RotateGestureDetector;->DEBUG:Z

    if-eqz v7, :cond_1

    const-string v7, "RotateGestureDetector"

    const-string v8, "x1 %s, x1 %s, y1 %s, y2 %s, deltaX %s, deltaY %s, clockwise %s"

    const/4 v9, 0x7

    new-array v9, v9, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v9, v1

    const/4 v10, 0x1

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    aput-object v0, v9, v10

    const/4 v0, 0x2

    invoke-static {v3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v9, v0

    const/4 v0, 0x3

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v9, v0

    const/4 v0, 0x4

    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v9, v0

    const/4 v0, 0x5

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v2

    aput-object v2, v9, v0

    const/4 v0, 0x6

    iget-boolean v2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsClockwise:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    aput-object v2, v9, v0

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    iget-boolean v2, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsClockwise:Z

    invoke-interface {v0, p0, v2, v6}, Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;->onRotateEnd(Luk/co/senab/photoview/gestures/RotateGestureDetector;ZF)V

    :cond_2
    iput-boolean v1, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsBeingRotated:Z

    invoke-direct {p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->releaseTracker()V

    return-void
.end method

.method private checkPointerIndex(Landroid/view/MotionEvent;I)Z
    .locals 1

    const/4 v0, -0x1

    if-le p2, v0, :cond_0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result p1

    if-ge p2, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private clipAngle(F)F
    .locals 1

    const/high16 v0, 0x43b40000    # 360.0f

    rem-float/2addr p1, v0

    return p1
.end method

.method private ensureTracker()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    if-nez v0, :cond_0

    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method

.method private releaseTracker()V
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_0

    iget-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    iput-object v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    :cond_0
    return-void
.end method


# virtual methods
.method public getFocusX()F
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusX:F

    return v0
.end method

.method public getFocusY()F
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusY:F

    return v0
.end method

.method public getRotateDegrees()F
    .locals 1

    iget v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    return v0
.end method

.method public isInProgress()Z
    .locals 1

    iget-boolean v0, p0, Luk/co/senab/photoview/gestures/RotateGestureDetector;->isInProgress:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 17

    move-object/from16 v9, p0

    move-object/from16 v0, p1

    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->ensureTracker()V

    iget-object v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1, v0}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v10, 0x0

    const/4 v2, -0x1

    packed-switch v1, :pswitch_data_0

    :cond_0
    :goto_0
    :pswitch_0
    const/4 v0, 0x1

    goto/16 :goto_5

    :pswitch_1
    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->callRotateEnd()V

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    goto :goto_0

    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v2

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    iput v10, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->callRotateEnd()V

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    float-to-double v1, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    float-to-double v3, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    float-to-double v5, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    float-to-double v7, v0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v8}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDistance(DDDD)D

    move-result-wide v0

    iput-wide v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mPointersLastDistance:D

    goto :goto_0

    :pswitch_3
    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->callRotateEnd()V

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    goto :goto_0

    :pswitch_4
    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    if-eq v1, v2, :cond_0

    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    if-eq v1, v2, :cond_0

    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v1

    iget v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerID:I

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    invoke-direct {v9, v0, v1}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v3

    const/4 v14, 0x2

    if-eqz v3, :cond_a

    invoke-direct {v9, v0, v2}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v3

    if-nez v3, :cond_1

    goto/16 :goto_4

    :cond_1
    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getX(I)F

    move-result v15

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v7

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v8

    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    iget-boolean v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsBeingRotated:Z

    if-nez v0, :cond_4

    float-to-double v1, v15

    float-to-double v3, v7

    float-to-double v12, v8

    float-to-double v10, v5

    move-object/from16 v0, p0

    move/from16 v16, v5

    move-wide v5, v12

    move v12, v7

    move v13, v8

    move-wide v7, v10

    invoke-direct/range {v0 .. v8}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDistance(DDDD)D

    move-result-wide v0

    sget-boolean v2, Luk/co/senab/photoview/gestures/RotateGestureDetector;->DEBUG:Z

    if-eqz v2, :cond_2

    const-string v2, "RotateGestureDetector"

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "distance old %s, distance new %s"

    new-array v5, v14, [Ljava/lang/Object;

    iget-wide v6, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mPointersLastDistance:D

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    iget-wide v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mPointersLastDistance:D

    sub-double/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(D)D

    move-result-wide v0

    iget-wide v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDistanceDiffLimit:D

    cmpl-double v4, v0, v2

    if-lez v4, :cond_3

    iput v15, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    iput v12, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    iput v13, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    move/from16 v10, v16

    iput v10, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    float-to-double v1, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    float-to-double v3, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    float-to-double v5, v0

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    float-to-double v7, v0

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v8}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDistance(DDDD)D

    move-result-wide v0

    iput-wide v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mPointersLastDistance:D

    goto :goto_1

    :cond_3
    move/from16 v10, v16

    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    iget v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    iget v3, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    iget v4, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    move-object/from16 v0, p0

    move v5, v15

    move v6, v12

    move v7, v13

    move v8, v10

    invoke-direct/range {v0 .. v8}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDegrees(FFFFFFFF)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mRotateSlop:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_5

    const/4 v0, 0x1

    iput-boolean v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsBeingRotated:Z

    iput v15, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    iput v12, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    iput v13, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    iput v10, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    iget-object v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    if-eqz v0, :cond_5

    iget-object v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    invoke-interface {v0, v9}, Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;->onRotateBegin(Luk/co/senab/photoview/gestures/RotateGestureDetector;)Z

    move-result v0

    iput-boolean v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->isInProgress:Z

    goto :goto_1

    :cond_4
    move v10, v5

    move v12, v7

    move v13, v8

    :cond_5
    :goto_1
    iget-boolean v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsBeingRotated:Z

    if-eqz v0, :cond_0

    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    iget v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    iget v3, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    iget v4, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    move-object/from16 v0, p0

    move v5, v15

    move v6, v12

    move v7, v13

    move v8, v10

    invoke-direct/range {v0 .. v8}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->calculateDegrees(FFFFFFFF)F

    move-result v0

    iput v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    add-float v8, v15, v13

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v8, v0

    iput v8, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusX:F

    add-float v7, v12, v10

    div-float/2addr v7, v0

    iput v7, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusY:F

    sget-boolean v1, Luk/co/senab/photoview/gestures/RotateGestureDetector;->DEBUG:Z

    if-eqz v1, :cond_6

    const-string v1, "RotateGestureDetector"

    const-string v2, "degrees %s, focusX %s, focusY %s"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusX:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    iget v4, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFocusY:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v14

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    iget v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v1

    cmpl-float v0, v1, v0

    if-lez v0, :cond_8

    iget v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_7

    const/4 v0, 0x1

    goto :goto_2

    :cond_7
    const/4 v0, 0x0

    :goto_2
    iput-boolean v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mIsClockwise:Z

    :cond_8
    iget-object v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    if-eqz v0, :cond_9

    iget-object v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mListener:Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;

    invoke-interface {v0, v9}, Luk/co/senab/photoview/gestures/RotateGestureDetector$OnRotationGestureListener;->onRotate(Luk/co/senab/photoview/gestures/RotateGestureDetector;)Z

    move-result v0

    goto :goto_3

    :cond_9
    const/4 v0, 0x1

    :goto_3
    if-eqz v0, :cond_0

    iput v15, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    iput v12, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    iput v13, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastX:F

    iput v10, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mSecondPointerLastY:F

    goto/16 :goto_0

    :cond_a
    :goto_4
    const-string v3, "RotateGestureDetector"

    const-string v4, "illegal pointer index, count[%s], pointer1[%s], pointer2[%s]"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v6, 0x0

    aput-object v0, v5, v6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v5, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v14

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    :pswitch_5
    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->callRotateEnd()V

    iput v2, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    goto/16 :goto_0

    :pswitch_6
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    iput v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastX:F

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iput v1, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerLastY:F

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mFirstPointerID:I

    const/4 v0, 0x0

    iput v0, v9, Luk/co/senab/photoview/gestures/RotateGestureDetector;->mDegrees:F

    invoke-direct/range {p0 .. p0}, Luk/co/senab/photoview/gestures/RotateGestureDetector;->callRotateEnd()V

    goto/16 :goto_0

    :goto_5
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
