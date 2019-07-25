.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;
.super Ljava/lang/Object;
.source "TranslateDetector.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;,
        Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;
    }
.end annotation


# instance fields
.field private mGestureListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;

.field private mStartPoint:Landroid/graphics/PointF;

.field private mStartPointOne:Landroid/graphics/PointF;

.field private mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPointOne:Landroid/graphics/PointF;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mGestureListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;

    return-void
.end method


# virtual methods
.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 6

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mGestureListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;->onTranslateBegin()Z

    move-result p1

    if-eqz p1, :cond_0

    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;->IN_PROGRESS:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    goto :goto_0

    :cond_0
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    :goto_0
    return v3

    :cond_1
    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    sget-object v5, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;->IN_PROGRESS:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    if-eq v4, v5, :cond_2

    return v2

    :cond_2
    const/4 v4, 0x2

    if-ne v0, v4, :cond_4

    if-nez v1, :cond_8

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getPointerCount()I

    move-result v2

    if-le v2, v3, :cond_3

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v2

    add-float/2addr v0, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPointOne:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    sub-float/2addr v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v4

    add-float/2addr v1, v4

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPointOne:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v4

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPointOne:Landroid/graphics/PointF;

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v4

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/graphics/PointF;->set(FF)V

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mGestureListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;

    invoke-interface {v2, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;->onTranslate(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v1

    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_1

    :cond_4
    const/4 v4, 0x5

    if-ne v0, v4, :cond_6

    if-nez v1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_1

    :cond_5
    if-ne v1, v3, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPointOne:Landroid/graphics/PointF;

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_1

    :cond_6
    const/4 v2, 0x6

    if-ne v0, v2, :cond_7

    if-nez v1, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getX(I)F

    move-result v1

    invoke-virtual {p1, v3}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    invoke-virtual {v0, v1, p1}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_1

    :cond_7
    sget-object p1, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;->IDLE:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mState:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$State;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector;->mGestureListener:Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/TranslateDetector$OnTranslateListener;->onTranslateEnd()V

    :cond_8
    :goto_1
    return v3
.end method
