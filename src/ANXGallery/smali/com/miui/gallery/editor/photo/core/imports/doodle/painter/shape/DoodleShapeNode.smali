.class public abstract Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;
.super Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;
.source "DoodleShapeNode.java"


# static fields
.field private static final DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;


# instance fields
.field private mCurrentPoint:[F

.field private mMatrix:Landroid/graphics/Matrix;

.field private mPrePoint:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;->SHAPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/content/res/Resources;)V

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->setEmpty()V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/os/Parcel;)V

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    const/4 p1, 0x2

    new-array v0, p1, [F

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    new-array p1, p1, [F

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    return-void
.end method


# virtual methods
.method public appendScale(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    mul-float v2, v0, p1

    sub-float/2addr v2, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v2, v0

    mul-float p1, p1, v1

    sub-float/2addr p1, v1

    div-float/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    neg-float v2, v2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->y:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->y:F

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    neg-float p1, p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    sub-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->y:F

    sub-float/2addr v1, p1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    add-float/2addr v1, v2

    iput v1, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->y:F

    add-float/2addr v1, p1

    iput v1, v0, Landroid/graphics/PointF;->y:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->refreshRectByPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->countDecoration()V

    return-void
.end method

.method protected count()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iput v1, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iput v1, v0, Landroid/graphics/PointF;->y:F

    return-void
.end method

.method public countRotateX()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    return v0
.end method

.method public countRotateY()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    return-object v0
.end method

.method protected onReceivePosition(FFZ)V
    .locals 0

    if-nez p3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->refreshRectByPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    :cond_0
    return-void
.end method

.method public processOnDownEvent(FF)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->refreshPointByRect(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-void
.end method

.method public processOnUp()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->processOnUp()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->right:F

    iput v1, v0, Landroid/graphics/PointF;->x:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    iput v1, v0, Landroid/graphics/PointF;->y:F

    return-void
.end method

.method public processScaleEvent(FFFFFFFF)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    const/4 p2, 0x0

    aput p3, p1, p2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    const/4 p3, 0x1

    aput p4, p1, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    aget p4, p4, p2

    sub-float/2addr p4, p5

    aput p4, p1, p2

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    aget p4, p4, p3

    sub-float/2addr p4, p6

    aput p4, p1, p3

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    iget p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mDegrees:F

    neg-float p4, p4

    iget p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRotateX:F

    iget p6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mUserLocationX:F

    add-float/2addr p5, p6

    iget p6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mRotateY:F

    iget p7, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mUserLocationY:F

    add-float/2addr p6, p7

    invoke-virtual {p1, p4, p5, p6}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    invoke-virtual {p1, p4}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    invoke-virtual {p1, p4}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    aget p1, p1, p2

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    aget p2, p4, p2

    sub-float/2addr p1, p2

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mCurrentPoint:[F

    aget p2, p2, p3

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mPrePoint:[F

    aget p3, p4, p3

    sub-float/2addr p2, p3

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget p4, p3, Landroid/graphics/PointF;->x:F

    sub-float/2addr p4, p1

    iput p4, p3, Landroid/graphics/PointF;->x:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    iget p3, p1, Landroid/graphics/PointF;->y:F

    sub-float/2addr p3, p2

    iput p3, p1, Landroid/graphics/PointF;->y:F

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->refreshRectByPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/shape/DoodleShapeNode;->countDecoration()V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->writeToParcel(Landroid/os/Parcel;I)V

    return-void
.end method
