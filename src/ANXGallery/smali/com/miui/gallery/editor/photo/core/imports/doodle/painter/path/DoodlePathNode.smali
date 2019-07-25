.class public Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;
.super Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;
.source "DoodlePathNode.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;",
            ">;"
        }
    .end annotation
.end field

.field private static final DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

.field private static final DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;


# instance fields
.field private mMatrix:Landroid/graphics/Matrix;

.field private mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

.field private mPath:Landroid/graphics/Path;

.field private mPointFList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->PATH:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    new-instance v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode$1;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/content/res/Resources;)V

    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    new-instance p1, Landroid/graphics/Matrix;

    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    new-instance p1, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;-><init>(Landroid/os/Parcel;)V

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    new-instance v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    sget-object v0, Landroid/graphics/PointF;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->createTypedArrayList(Landroid/os/Parcelable$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    const-class v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    return-void
.end method


# virtual methods
.method public append(FF)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    invoke-virtual {v0, p1, p2}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/graphics/PointF;

    iget v1, v0, Landroid/graphics/PointF;->x:F

    add-float/2addr v1, p1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v3, v0, Landroid/graphics/PointF;->y:F

    add-float/2addr v3, p2

    div-float/2addr v3, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget v4, v0, Landroid/graphics/PointF;->x:F

    iget v0, v0, Landroid/graphics/PointF;->y:F

    invoke-virtual {v2, v4, v0, v1, v3}, Landroid/graphics/Path;->quadTo(FFFF)V

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1, p1, p2}, Landroid/graphics/PointF;-><init>(FF)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public appendScale(F)V
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    cmpg-float v0, p1, v0

    if-gez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mScale:F

    float-to-double v0, v0

    const-wide v2, 0x3fc999999999999aL    # 0.2

    cmpg-double v4, v0, v2

    if-gez v4, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mScale:F

    mul-float v0, v0, p1

    iput v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mScale:F

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    move-result v2

    invoke-virtual {v0, p1, p1, v1, v2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->postConcat(Landroid/graphics/Matrix;)Z

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    invoke-virtual {p0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->countDecoration()V

    return-void
.end method

.method public count()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectF:Landroid/graphics/RectF;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    return-void
.end method

.method public countRotateX()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerX()F

    move-result v0

    return v0
.end method

.method public countRotateY()F
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectF:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->centerY()F

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->configCanvas(Landroid/graphics/Canvas;Z)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public getDoodleName()Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->DOODLE_ITEM:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleItem;->name()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDoodleType()Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->DOODLE_TYPE:Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode$DoodleDrawableType;

    return-object v0
.end method

.method protected init(Landroid/content/res/Resources;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    return-void
.end method

.method public initForParcelable(Landroid/content/Context;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->initForParcelable(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPaint:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelablePathUtils;->getPathFromPointList(Ljava/util/List;)Landroid/graphics/Path;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPath:Landroid/graphics/Path;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method

.method protected onReceivePosition(FFZ)V
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->append(FF)V

    return-void
.end method

.method public processOnDownEvent(FF)V
    .locals 0

    return-void
.end method

.method public processScaleEvent(FFFFFFFF)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->getRectF(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectFTemp:Landroid/graphics/RectF;

    iget p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mUserLocationX:F

    iget p5, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mUserLocationY:F

    invoke-virtual {p1, p2, p5}, Landroid/graphics/RectF;->offset(FF)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mRectFTemp:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->centerY()F

    move-result p2

    sub-float/2addr p7, p1

    float-to-double p5, p7

    sub-float/2addr p8, p2

    float-to-double p7, p8

    invoke-static {p5, p6, p7, p8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p5

    sub-float/2addr p3, p1

    float-to-double p7, p3

    sub-float/2addr p4, p2

    float-to-double p1, p4

    invoke-static {p7, p8, p1, p2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide p1

    div-double/2addr p1, p5

    double-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->appendScale(F)V

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/DoodleNode;->writeToParcel(Landroid/os/Parcel;I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mPointFList:Ljava/util/List;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/doodle/painter/path/DoodlePathNode;->mParcelableMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
