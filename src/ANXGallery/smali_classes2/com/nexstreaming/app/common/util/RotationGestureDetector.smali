.class public Lcom/nexstreaming/app/common/util/RotationGestureDetector;
.super Ljava/lang/Object;
.source "RotationGestureDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;
    }
.end annotation


# instance fields
.field private mFocusX:F

.field private mFocusY:F

.field private mInProgress:Z

.field private mInitialTheta:D

.field private final mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

.field private mPrimaryPointerId:I

.field private mSecondaryPointerId:I


# direct methods
.method public constructor <init>(Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    iput-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    return-void
.end method


# virtual methods
.method public isInProgress()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    return v2

    :pswitch_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mSecondaryPointerId:I

    if-eq v0, p1, :cond_0

    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mPrimaryPointerId:I

    if-ne v0, p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {p1, v1}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onEndRotate(Z)V

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    :cond_1
    return v2

    :pswitch_2
    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    if-nez v0, :cond_5

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mSecondaryPointerId:I

    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mSecondaryPointerId:I

    iget v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mPrimaryPointerId:I

    if-ne v0, v3, :cond_2

    return v2

    :cond_2
    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iget v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mSecondaryPointerId:I

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v3

    if-ltz v0, :cond_4

    if-gez v3, :cond_3

    goto :goto_0

    :cond_3
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    add-float v3, v1, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v3, v5

    iput v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusX:F

    add-float v3, v0, p1

    div-float/2addr v3, v5

    iput v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusY:F

    sub-float/2addr v0, p1

    float-to-double v5, v0

    sub-float/2addr v1, v4

    float-to-double v0, v1

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    iput-wide v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInitialTheta:D

    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusX:F

    iget v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusY:F

    invoke-interface {p1, v0, v1}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onBeginRotate(FF)Z

    move-result p1

    if-eqz p1, :cond_5

    iput-boolean v2, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    goto :goto_1

    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {p1, v1}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onEndRotate(Z)V

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    return v2

    :cond_5
    :goto_1
    return v2

    :pswitch_3
    iget-boolean p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {p1, v2}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onEndRotate(Z)V

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    :cond_6
    return v2

    :pswitch_4
    iget-boolean v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    if-eqz v0, :cond_9

    iget v0, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mPrimaryPointerId:I

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v0

    iget v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mSecondaryPointerId:I

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v3

    if-ltz v0, :cond_8

    if-gez v3, :cond_7

    goto :goto_2

    :cond_7
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v0

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    sub-float/2addr v0, p1

    float-to-double v5, v0

    sub-float/2addr v1, v4

    float-to-double v0, v1

    invoke-static {v5, v6, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v0

    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    iget v3, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusX:F

    iget v4, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mFocusY:F

    iget-wide v5, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInitialTheta:D

    sub-double/2addr v0, v5

    const-wide v5, 0x4066800000000000L    # 180.0

    mul-double v0, v0, v5

    const-wide v5, 0x400921fb54442d18L    # Math.PI

    div-double/2addr v0, v5

    double-to-float v0, v0

    invoke-interface {p1, v3, v4, v0}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onRotate(FFF)V

    goto :goto_3

    :cond_8
    :goto_2
    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {p1, v1}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onEndRotate(Z)V

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    return v2

    :cond_9
    :goto_3
    return v2

    :pswitch_5
    iget-boolean p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    if-eqz p1, :cond_a

    iget-object p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mListener:Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;

    invoke-interface {p1, v1}, Lcom/nexstreaming/app/common/util/RotationGestureDetector$OnRotationGestureListener;->onEndRotate(Z)V

    iput-boolean v1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mInProgress:Z

    :cond_a
    return v2

    :pswitch_6
    invoke-virtual {p1, v1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/app/common/util/RotationGestureDetector;->mPrimaryPointerId:I

    return v2

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
