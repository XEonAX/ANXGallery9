.class public abstract Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;
.super Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;
.source "DoodleVectorNode.java"


# static fields
.field private static final DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;


# instance fields
.field private mCurrentPoint:[F

.field private mEnd:[F

.field private mInverse:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field private mStart:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;->VECTOR:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/content/res/Resources;)V

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;Z)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/content/res/Resources;)V

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/os/Parcel;)V

    const/4 v0, 0x2

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    new-array v1, v0, [F

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    const-class v0, Landroid/graphics/RectF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/graphics/RectF;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    return-void
.end method


# virtual methods
.method public appendScale(F)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    mul-float p1, p1, v0

    sub-float/2addr p1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mDegrees:F

    neg-float v1, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerX()F

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->centerY()F

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    const/4 v3, 0x1

    aput v1, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    aput v1, v0, v3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v1, v0, v2

    sub-float/2addr v1, p1

    aput v1, v0, v2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    aget v1, v0, v2

    add-float/2addr v1, p1

    aput v1, v0, v2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mDegrees:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v4}, Landroid/graphics/RectF;->centerY()F

    move-result v4

    invoke-virtual {p1, v0, v1, v4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v0, v0, v2

    iput v0, p1, Landroid/graphics/PointF;->x:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v0, v0, v3

    iput v0, p1, Landroid/graphics/PointF;->y:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    aget v0, v0, v2

    iput v0, p1, Landroid/graphics/PointF;->x:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    aget v0, v0, v3

    iput v0, p1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->refreshRectByPoint()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countDecoration()V

    return-void
.end method

.method protected count()V
    .locals 0

    return-void
.end method

.method public countRotateX()F
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    :goto_0
    iget v0, v0, Landroid/graphics/PointF;->x:F

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public countRotateY()F
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    :goto_0
    iget v0, v0, Landroid/graphics/PointF;->y:F

    goto :goto_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    goto :goto_0

    :goto_1
    return v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->drawSafely(Landroid/graphics/Canvas;)V

    :cond_0
    return-void
.end method

.method protected abstract drawSafely(Landroid/graphics/Canvas;)V
.end method

.method public getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    return-object v0
.end method

.method protected onReceivePosition(FFZ)V
    .locals 0

    if-nez p3, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->refreshRectByPoint()V

    :cond_0
    return-void
.end method

.method public processOnDownEvent(FF)V
    .locals 0

    return-void
.end method

.method public processRotateEvent(FFFFFFFF)V
    .locals 0

    return-void
.end method

.method public processScaleEvent(FFFFFFFF)V
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    const/4 p2, 0x0

    aput p3, p1, p2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    const/4 p3, 0x1

    aput p4, p1, p3

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateX:F

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationX:F

    add-float/2addr p1, p4

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateY:F

    iget p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationY:F

    add-float/2addr p4, p5

    sub-float/2addr p8, p4

    float-to-double p5, p8

    sub-float/2addr p7, p1

    float-to-double p7, p7

    invoke-static {p5, p6, p7, p8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p5

    iget-object p7, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p7, p7, p3

    sub-float/2addr p7, p4

    float-to-double p7, p7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget v0, v0, p2

    sub-float/2addr v0, p1

    float-to-double v0, v0

    invoke-static {p7, p8, v0, v1}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p7

    sub-double/2addr p7, p5

    invoke-static {p7, p8}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p5

    double-to-float p5, p5

    invoke-virtual {p0, p5}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->appendDegrees(F)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p5}, Landroid/graphics/Matrix;->reset()V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->getRotateDegrees()F

    move-result p6

    neg-float p6, p6

    invoke-virtual {p5, p6, p1, p4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object p6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    invoke-virtual {p5, p6}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {p5}, Landroid/graphics/RectF;->height()F

    move-result p5

    const/high16 p6, 0x40000000    # 2.0f

    div-float/2addr p5, p6

    iget-object p6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p7, p6, p3

    sub-float/2addr p7, p5

    aput p7, p6, p3

    iget-boolean p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    if-eqz p5, :cond_0

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p6, p5, p2

    iget p7, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mOutLineOffsetX:F

    add-float/2addr p6, p7

    aput p6, p5, p2

    goto :goto_0

    :cond_0
    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p6, p5, p2

    iget p7, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mOutLineOffsetX:F

    sub-float/2addr p6, p7

    aput p6, p5, p2

    :goto_0
    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p5}, Landroid/graphics/Matrix;->reset()V

    iget-object p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->getRotateDegrees()F

    move-result p6

    invoke-virtual {p5, p6, p1, p4}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    invoke-virtual {p1, p4}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mInverse:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p2, p4, p2

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationX:F

    sub-float/2addr p2, p4

    iput p2, p1, Landroid/graphics/PointF;->x:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p2, p2, p3

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationY:F

    sub-float/2addr p2, p3

    iput p2, p1, Landroid/graphics/PointF;->y:F

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p2, p4, p2

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationX:F

    sub-float/2addr p2, p4

    iput p2, p1, Landroid/graphics/PointF;->x:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mCurrentPoint:[F

    aget p2, p2, p3

    iget p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mUserLocationY:F

    sub-float/2addr p2, p3

    iput p2, p1, Landroid/graphics/PointF;->y:F

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->refreshRectByPoint()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countDecoration()V

    return-void
.end method

.method protected refreshRectByPoint()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, v2

    float-to-double v1, v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v3, v3, Landroid/graphics/PointF;->x:F

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v4, v4, Landroid/graphics/PointF;->x:F

    sub-float/2addr v3, v4

    float-to-double v3, v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide v1

    double-to-float v1, v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->setDegrees(F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    const/4 v3, 0x0

    aput v2, v1, v3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStartPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    const/4 v4, 0x1

    aput v2, v1, v4

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->x:F

    aput v2, v1, v3

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEndPoint:Landroid/graphics/PointF;

    iget v2, v2, Landroid/graphics/PointF;->y:F

    aput v2, v1, v4

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countRotateX()F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countRotateY()F

    move-result v1

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateY:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->getRotateDegrees()F

    move-result v2

    neg-float v2, v2

    iget v5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateX:F

    iget v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateY:F

    invoke-virtual {v1, v2, v5, v6}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v2, v2, v3

    iput v2, v1, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mEnd:[F

    aget v2, v2, v3

    iput v2, v1, Landroid/graphics/RectF;->right:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v2, v2, v4

    sub-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->top:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mStart:[F

    aget v2, v2, v4

    add-float/2addr v2, v0

    iput v2, v1, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countRotateX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->countRotateY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRotateY:F

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/vector/DoodleVectorNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
