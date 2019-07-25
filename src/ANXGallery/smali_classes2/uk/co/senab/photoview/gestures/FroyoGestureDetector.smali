.class public Luk/co/senab/photoview/gestures/FroyoGestureDetector;
.super Luk/co/senab/photoview/gestures/EclairGestureDetector;
.source "FroyoGestureDetector.java"


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0x8
.end annotation


# static fields
.field private static DEBUG:Z


# instance fields
.field protected final mDetector:Landroid/view/ScaleGestureDetector;

.field private mMultiPointerDiff:F

.field private mPrimaryPointerId:I

.field private mSecondLastTouchX:F

.field private mSecondLastTouchY:F

.field private mSecondPointerId:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "FroyoGestureDetector"

    const/4 v1, 0x3

    invoke-static {v0, v1}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->DEBUG:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Luk/co/senab/photoview/gestures/EclairGestureDetector;-><init>(Landroid/content/Context;)V

    const/4 v0, -0x1

    iput v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    iput v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    const/high16 v0, 0x41200000    # 10.0f

    iput v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mMultiPointerDiff:F

    new-instance v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector$1;

    invoke-direct {v0, p0}, Luk/co/senab/photoview/gestures/FroyoGestureDetector$1;-><init>(Luk/co/senab/photoview/gestures/FroyoGestureDetector;)V

    new-instance v1, Landroid/view/ScaleGestureDetector;

    invoke-direct {v1, p1, v0}, Landroid/view/ScaleGestureDetector;-><init>(Landroid/content/Context;Landroid/view/ScaleGestureDetector$OnScaleGestureListener;)V

    iput-object v1, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    return-void
.end method

.method private calculateDistance(DD)D
    .locals 0

    mul-double p1, p1, p1

    mul-double p3, p3, p3

    add-double/2addr p1, p3

    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide p1

    return-wide p1
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

.method private handleDragEvent(Landroid/view/MotionEvent;)Z
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x2

    const/4 v5, 0x3

    const/4 v6, -0x1

    const/4 v7, 0x1

    const/4 v8, 0x0

    packed-switch v2, :pswitch_data_0

    :pswitch_0
    goto/16 :goto_8

    :pswitch_1
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iget v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    if-ne v3, v9, :cond_3

    iget v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    if-eq v9, v6, :cond_0

    iget v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    goto :goto_1

    :cond_0
    if-nez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v2

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    :goto_1
    iget v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v2

    invoke-direct {v0, v1, v2}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v9

    if-nez v9, :cond_2

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v9

    const-string v10, "FroyoGestureDetector"

    const-string v11, "new primary id %s, new index %s, count %s"

    new-array v12, v5, [Ljava/lang/Object;

    iget v13, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v8

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v12, v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v12, v4

    invoke-static {v11, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v9, v10, v2}, Luk/co/senab/photoview/log/Logger;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v2, :cond_3

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2}, Landroid/view/VelocityTracker;->clear()V

    :cond_3
    iget-boolean v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    if-nez v2, :cond_6

    iget v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    iget v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    if-eq v2, v9, :cond_4

    iget v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    if-ne v2, v3, :cond_6

    :cond_4
    iput v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-le v2, v7, :cond_6

    const/4 v6, 0x0

    :goto_2
    if-ge v6, v2, :cond_6

    invoke-virtual {v1, v6}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v9

    iget v10, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    if-eq v10, v9, :cond_5

    if-eq v9, v3, :cond_5

    iput v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    goto :goto_3

    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_2

    :cond_6
    :goto_3
    sget-boolean v2, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->DEBUG:Z

    if-eqz v2, :cond_12

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "FroyoGestureDetector"

    const-string v6, "pointer info after ACTION_POINTER_UP, primary %s, second %s, count %s"

    new-array v5, v5, [Ljava/lang/Object;

    iget v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v5, v8

    iget v8, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v5, v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v5, v4

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v3, v1}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    :pswitch_2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchX:F

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    iput v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchY:F

    sget-boolean v1, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->DEBUG:Z

    if-eqz v1, :cond_12

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    const-string v2, "FroyoGestureDetector"

    const-string v3, "ACTION_POINTER_DOWN pointer id %s"

    new-array v4, v7, [Ljava/lang/Object;

    iget v5, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_8

    :pswitch_3
    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_7

    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_7
    iput-boolean v8, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    goto/16 :goto_8

    :pswitch_4
    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v2

    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v3

    iget v9, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    sub-float v9, v2, v9

    iget v10, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    sub-float v10, v3, v10

    iget-boolean v11, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    if-nez v11, :cond_e

    iget v11, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    if-eq v11, v6, :cond_c

    iget v11, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    invoke-virtual {v1, v11}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v11

    invoke-direct {v0, v1, v11}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v12

    if-eqz v12, :cond_b

    invoke-virtual {v1, v11}, Landroid/view/MotionEvent;->getX(I)F

    move-result v6

    invoke-virtual {v1, v11}, Landroid/view/MotionEvent;->getY(I)F

    move-result v11

    iget v12, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchX:F

    sub-float v12, v6, v12

    iget v13, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchY:F

    sub-float v13, v11, v13

    sget-boolean v14, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->DEBUG:Z

    if-eqz v14, :cond_8

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v14

    const-string v15, "FroyoGestureDetector"

    const-string v5, "dx %s, dy %s, secondDx %s. secondDy %s"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    aput-object v18, v4, v8

    invoke-static {v10}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    aput-object v18, v4, v7

    invoke-static {v12}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v18

    const/16 v17, 0x2

    aput-object v18, v4, v17

    invoke-static {v13}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v17

    const/16 v16, 0x3

    aput-object v17, v4, v16

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v14, v15, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_8
    iget v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mMultiPointerDiff:F

    invoke-static {v9, v12, v4}, Lcom/miui/gallery/util/MiscUtil;->floatNear(FFF)Z

    move-result v4

    if-eqz v4, :cond_a

    iget v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mMultiPointerDiff:F

    invoke-static {v10, v13, v4}, Lcom/miui/gallery/util/MiscUtil;->floatNear(FFF)Z

    move-result v4

    if-eqz v4, :cond_a

    float-to-double v4, v9

    float-to-double v11, v10

    invoke-direct {v0, v4, v5, v11, v12}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->calculateDistance(DD)D

    move-result-wide v4

    iget v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mTouchSlop:F

    float-to-double v11, v6

    cmpl-double v6, v4, v11

    if-ltz v6, :cond_9

    const/4 v4, 0x1

    goto :goto_4

    :cond_9
    const/4 v4, 0x0

    :goto_4
    iput-boolean v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    goto :goto_5

    :cond_a
    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    iput v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchX:F

    iput v11, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondLastTouchY:F

    :goto_5
    const/4 v4, 0x0

    goto :goto_6

    :cond_b
    iput v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mSecondPointerId:I

    :cond_c
    const/4 v4, 0x1

    :goto_6
    if-eqz v4, :cond_e

    float-to-double v4, v9

    float-to-double v11, v10

    invoke-direct {v0, v4, v5, v11, v12}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->calculateDistance(DD)D

    move-result-wide v4

    iget v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mTouchSlop:F

    float-to-double v11, v6

    cmpl-double v6, v4, v11

    if-ltz v6, :cond_d

    const/4 v8, 0x1

    :cond_d
    iput-boolean v8, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    :cond_e
    iget-boolean v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    if-eqz v4, :cond_12

    iget-object v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

    invoke-interface {v4, v9, v10}, Luk/co/senab/photoview/gestures/OnGestureListener;->onDrag(FF)V

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v2, :cond_12

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto/16 :goto_8

    :pswitch_5
    iget-boolean v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    if-eqz v2, :cond_f

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v2, :cond_f

    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveX(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    invoke-virtual/range {p0 .. p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->getActiveY(Landroid/view/MotionEvent;)F

    move-result v2

    iput v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    const/16 v2, 0x3e8

    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->getXVelocity(I)F

    move-result v1

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {v2, v4}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result v2

    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    move-result v4

    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(FF)F

    move-result v4

    iget v5, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mMinimumVelocity:F

    cmpl-float v4, v4, v5

    if-ltz v4, :cond_f

    iget-object v4, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mListener:Luk/co/senab/photoview/gestures/OnGestureListener;

    iget v5, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    iget v6, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    neg-float v1, v1

    neg-float v2, v2

    invoke-interface {v4, v5, v6, v1, v2}, Luk/co/senab/photoview/gestures/OnGestureListener;->onFling(FFFF)V

    :cond_f
    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v1, :cond_10

    iget-object v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v1}, Landroid/view/VelocityTracker;->recycle()V

    iput-object v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    :cond_10
    iput-boolean v8, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    goto :goto_8

    :pswitch_6
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v2

    iput-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    if-eqz v2, :cond_11

    iget-object v2, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mVelocityTracker:Landroid/view/VelocityTracker;

    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    goto :goto_7

    :cond_11
    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v2

    const-string v3, "FroyoGestureDetector"

    const-string v4, "Velocity tracker is null"

    invoke-interface {v2, v3, v4}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v3

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v3

    iput v3, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchX:F

    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    iput v1, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mLastTouchY:F

    iput-boolean v8, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mIsDragging:Z

    sget-boolean v1, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->DEBUG:Z

    if-eqz v1, :cond_12

    invoke-static {}, Luk/co/senab/photoview/log/LogManager;->getLogger()Luk/co/senab/photoview/log/Logger;

    move-result-object v1

    const-string v2, "FroyoGestureDetector"

    const-string v3, "ACTION_DOWN pointer id %s"

    new-array v4, v7, [Ljava/lang/Object;

    iget v5, v0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Luk/co/senab/photoview/log/Logger;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_12
    :goto_8
    return v7

    nop

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


# virtual methods
.method getActiveX(Landroid/view/MotionEvent;)F
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    return p1
.end method

.method getActiveY(Landroid/view/MotionEvent;)F
    .locals 2

    iget v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->checkPointerIndex(Landroid/view/MotionEvent;I)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    return p1
.end method

.method public isScaling()Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0}, Landroid/view/ScaleGestureDetector;->isInProgress()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->mDetector:Landroid/view/ScaleGestureDetector;

    invoke-virtual {v0, p1}, Landroid/view/ScaleGestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    invoke-direct {p0, p1}, Luk/co/senab/photoview/gestures/FroyoGestureDetector;->handleDragEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    return p1
.end method
