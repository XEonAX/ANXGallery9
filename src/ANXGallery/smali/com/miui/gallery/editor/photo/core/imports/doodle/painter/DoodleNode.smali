.class public abstract Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;
.super Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;
.source "DoodleNode.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;
    }
.end annotation


# instance fields
.field private mCanSelected:Z

.field private mColor:I

.field private mCorrectionDegrees:F

.field protected mDegrees:F

.field protected mEndPoint:Landroid/graphics/PointF;

.field private mIsInit:Z

.field private mMatrix:Landroid/graphics/Matrix;

.field protected final mOutLineOffsetX:F

.field protected final mOutLineOffsetY:F

.field protected mOutLineRectF:Landroid/graphics/RectF;

.field protected mPaint:Landroid/graphics/Paint;

.field protected mRectF:Landroid/graphics/RectF;

.field protected mRectFTemp:Landroid/graphics/RectF;

.field protected mRectTemp:Landroid/graphics/Rect;

.field protected mRotateX:F

.field protected mRotateY:F

.field protected mScale:F

.field protected mStartPoint:Landroid/graphics/PointF;

.field private mStrokeRect:Landroid/graphics/RectF;

.field private mStrokeWidth:F

.field protected mUserLocationX:F

.field protected mUserLocationY:F


# direct methods
.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/common/model/BaseDrawNode;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeRect:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectTemp:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectFTemp:Landroid/graphics/RectF;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mScale:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStartPoint:Landroid/graphics/PointF;

    new-instance v0, Landroid/graphics/PointF;

    invoke-direct {v0}, Landroid/graphics/PointF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mEndPoint:Landroid/graphics/PointF;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mIsInit:Z

    const/high16 v0, 0x40a00000    # 5.0f

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mCorrectionDegrees:F

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mCanSelected:Z

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->initPaint()V

    const v0, 0x7f060124

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineOffsetX:F

    const v0, 0x7f060125

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineOffsetY:F

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->init(Landroid/content/res/Resources;)V

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/content/res/Resources;)V

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeWidth:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mColor:I

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    invoke-virtual {p1}, Landroid/os/Parcel;->readFloat()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    const-class v0, Landroid/graphics/PointF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/graphics/PointF;

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStartPoint:Landroid/graphics/PointF;

    const-class v0, Landroid/graphics/PointF;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Landroid/graphics/PointF;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mEndPoint:Landroid/graphics/PointF;

    return-void
.end method

.method private initPaint()V
    .locals 2

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mPaint:Landroid/graphics/Paint;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mPaint:Landroid/graphics/Paint;

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method private offsetRect(Landroid/graphics/RectF;)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    return-void
.end method

.method private refreshRotateCenter()V
    .locals 7

    const-string v0, "DoodleNode"

    const-string v1, "--- refreshRotateCenter ---"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countRotateX()F

    move-result v2

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countRotateY()F

    move-result v2

    iput v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    cmpl-float v2, v0, v2

    if-nez v2, :cond_0

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    cmpl-float v2, v1, v2

    if-nez v2, :cond_0

    return-void

    :cond_0
    const-string v2, "DoodleNode"

    const-string v3, "--- refreshRotateCenter real ---"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v2, 0x2

    new-array v2, v2, [F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    const/4 v4, 0x0

    aput v3, v2, v4

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    const/4 v5, 0x1

    aput v3, v2, v5

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v3}, Landroid/graphics/Matrix;->reset()V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    iget v6, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    invoke-virtual {v3, v6, v0, v1}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    aget v1, v2, v4

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    sub-float/2addr v1, v3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    aget v1, v2, v5

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    sub-float/2addr v1, v2

    add-float/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countDecoration()V

    return-void
.end method

.method private static resolveRotateDegree(FF)F
    .locals 3

    const/4 v0, 0x0

    cmpg-float v1, p0, v0

    const/high16 v2, 0x43b40000    # 360.0f

    if-gez v1, :cond_0

    add-float/2addr p0, v2

    :cond_0
    rem-float/2addr p0, v2

    cmpl-float v1, p0, v0

    if-lez v1, :cond_1

    cmpg-float v1, p0, p1

    if-gez v1, :cond_1

    const/4 p0, 0x0

    :cond_1
    sub-float/2addr v2, p1

    cmpl-float v1, p0, v2

    if-lez v1, :cond_2

    const/4 p0, 0x0

    :cond_2
    const/high16 v0, 0x42b40000    # 90.0f

    cmpl-float v1, p0, v0

    if-eqz v1, :cond_3

    sub-float v1, v0, p1

    cmpl-float v1, p0, v1

    if-lez v1, :cond_3

    add-float v1, p1, v0

    cmpg-float v1, p0, v1

    if-gez v1, :cond_3

    const/high16 p0, 0x42b40000    # 90.0f

    :cond_3
    const/high16 v0, 0x43340000    # 180.0f

    cmpl-float v1, p0, v0

    if-eqz v1, :cond_4

    sub-float v1, v0, p1

    cmpl-float v1, p0, v1

    if-lez v1, :cond_4

    add-float v1, p1, v0

    cmpg-float v1, p0, v1

    if-gez v1, :cond_4

    const/high16 p0, 0x43340000    # 180.0f

    :cond_4
    const/high16 v0, 0x43870000    # 270.0f

    cmpl-float v1, p0, v0

    if-eqz v1, :cond_5

    sub-float v1, v0, p1

    cmpl-float v1, p0, v1

    if-lez v1, :cond_5

    add-float/2addr p1, v0

    cmpg-float p1, p0, p1

    if-gez p1, :cond_5

    const/high16 p0, 0x43870000    # 270.0f

    :cond_5
    return p0
.end method


# virtual methods
.method public appendDegrees(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    const/4 v0, 0x0

    cmpg-float p1, p1, v0

    const/high16 v0, 0x43b40000    # 360.0f

    if-gez p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    add-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    rem-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    :cond_1
    return-void
.end method

.method public abstract appendScale(F)V
.end method

.method public appendUserLocationX(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    return-void
.end method

.method public appendUserLocationY(F)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    add-float/2addr v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    return-void
.end method

.method protected configCanvas(Landroid/graphics/Canvas;Z)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    if-eqz p2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateDegrees()F

    move-result p2

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    invoke-virtual {p1, p2, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    :cond_0
    return-void
.end method

.method public contains(FF)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getStrokeRectF(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectFTemp:Landroid/graphics/RectF;

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->offsetRect(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateDegrees()F

    move-result v1

    neg-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    add-float/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    iget v4, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    add-float/2addr v3, v4

    invoke-virtual {v0, v1, v2, v3}, Landroid/graphics/Matrix;->postRotate(FFF)Z

    const/4 v0, 0x2

    new-array v0, v0, [F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x1

    aput p2, v0, p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectFTemp:Landroid/graphics/RectF;

    aget v1, v0, v1

    aget p1, v0, p1

    invoke-virtual {p2, v1, p1}, Landroid/graphics/RectF;->contains(FF)Z

    move-result p1

    return p1
.end method

.method protected abstract count()V
.end method

.method public countDecoration()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->width()F

    move-result v0

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mScale:F

    mul-float v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    iget v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mScale:F

    mul-float v2, v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    sub-float/2addr v2, v3

    div-float/2addr v2, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    neg-float v0, v0

    neg-float v2, v2

    invoke-virtual {v1, v0, v2}, Landroid/graphics/RectF;->inset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    iget v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineOffsetX:F

    neg-float v1, v1

    iget v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineOffsetY:F

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/RectF;->inset(FF)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeRect:Landroid/graphics/RectF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {v0, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public abstract countRotateX()F
.end method

.method public abstract countRotateY()F
.end method

.method public countSize()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->count()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countDecoration()V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countRotateX()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countRotateY()F

    move-result v0

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    return-void
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public abstract getDoodleName()Ljava/lang/String;
.end method

.method public abstract getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;
.end method

.method public getRectF(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public getRotateDegrees()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    return v0
.end method

.method public getRotateX()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    return v0
.end method

.method public getRotateY()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    return v0
.end method

.method public getStrokeRectF(Landroid/graphics/RectF;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mOutLineRectF:Landroid/graphics/RectF;

    invoke-virtual {p1, v0}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method

.method public getUserLocationX()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    return v0
.end method

.method public getUserLocationY()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    return v0
.end method

.method protected abstract init(Landroid/content/res/Resources;)V
.end method

.method public initForParcelable(Landroid/content/Context;)V
    .locals 0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeWidth:F

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintSize(F)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mColor:I

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setPaintColor(I)V

    return-void
.end method

.method public isCanSelected()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mCanSelected:Z

    return v0
.end method

.method protected abstract onReceivePosition(FFZ)V
.end method

.method public abstract processOnDownEvent(FF)V
.end method

.method public processOnUp()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->refreshRotateCenter()V

    return-void
.end method

.method public processRotateEvent(FFFFFFFF)V
    .locals 0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    add-float/2addr p1, p2

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    iget p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    add-float/2addr p2, p5

    sub-float/2addr p8, p2

    float-to-double p5, p8

    sub-float/2addr p7, p1

    float-to-double p7, p7

    invoke-static {p5, p6, p7, p8}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p5

    sub-float/2addr p4, p2

    float-to-double p7, p4

    sub-float/2addr p3, p1

    float-to-double p1, p3

    invoke-static {p7, p8, p1, p2}, Ljava/lang/Math;->atan2(DD)D

    move-result-wide p1

    sub-double/2addr p1, p5

    invoke-static {p1, p2}, Ljava/lang/Math;->toDegrees(D)D

    move-result-wide p1

    double-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->appendDegrees(F)V

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mCorrectionDegrees:F

    invoke-static {p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->resolveRotateDegree(FF)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->setDegrees(F)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->countDecoration()V

    return-void
.end method

.method public abstract processScaleEvent(FFFFFFFF)V
.end method

.method public receivePosition(FF)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mIsInit:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mIsInit:Z

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->onReceivePosition(FFZ)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->onReceivePosition(FFZ)V

    :goto_0
    return-void
.end method

.method protected refreshPointByRect(Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->left:F

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    iget v1, v1, Landroid/graphics/RectF;->top:F

    invoke-virtual {p1, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    iget p1, p1, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    iget v0, v0, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p2, p1, v0}, Landroid/graphics/PointF;->set(FF)V

    return-void
.end method

.method protected refreshRectByPoint()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStartPoint:Landroid/graphics/PointF;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->refreshRectByPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)V

    return-void
.end method

.method protected refreshRectByPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)V
    .locals 5

    iget v0, p1, Landroid/graphics/PointF;->x:F

    iget v1, p2, Landroid/graphics/PointF;->x:F

    cmpg-float v0, v0, v1

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget v3, p1, Landroid/graphics/PointF;->y:F

    iget v4, p2, Landroid/graphics/PointF;->y:F

    cmpg-float v3, v3, v4

    if-gtz v3, :cond_1

    const/4 v1, 0x1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    if-eqz v0, :cond_2

    iget v3, p1, Landroid/graphics/PointF;->x:F

    goto :goto_1

    :cond_2
    iget v3, p2, Landroid/graphics/PointF;->x:F

    :goto_1
    iput v3, v2, Landroid/graphics/RectF;->left:F

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    if-nez v0, :cond_3

    iget v0, p1, Landroid/graphics/PointF;->x:F

    goto :goto_2

    :cond_3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    :goto_2
    iput v0, v2, Landroid/graphics/RectF;->right:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    if-eqz v1, :cond_4

    iget v2, p1, Landroid/graphics/PointF;->y:F

    goto :goto_3

    :cond_4
    iget v2, p2, Landroid/graphics/PointF;->y:F

    :goto_3
    iput v2, v0, Landroid/graphics/RectF;->top:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRectF:Landroid/graphics/RectF;

    if-nez v1, :cond_5

    iget p1, p1, Landroid/graphics/PointF;->y:F

    goto :goto_4

    :cond_5
    iget p1, p2, Landroid/graphics/PointF;->y:F

    :goto_4
    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method public setCanSelected(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mCanSelected:Z

    return-void
.end method

.method public setDegrees(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    const/4 v0, 0x0

    cmpg-float p1, p1, v0

    const/high16 v0, 0x43b40000    # 360.0f

    if-gez p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    add-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    :cond_0
    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    rem-float/2addr p1, v0

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mDegrees:F

    :cond_1
    return-void
.end method

.method public setPaintColor(I)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mColor:I

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method

.method public setPaintSize(F)V
    .locals 1

    iput p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeWidth:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStrokeWidth:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mColor:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationX:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mUserLocationY:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->getRotateDegrees()F

    move-result v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateX:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mRotateY:F

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeFloat(F)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mStartPoint:Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->mEndPoint:Landroid/graphics/PointF;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
