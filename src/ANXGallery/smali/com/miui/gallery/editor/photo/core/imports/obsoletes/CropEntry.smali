.class public Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;
.super Ljava/lang/Object;
.source "CropEntry.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/core/common/model/IPositionChangeData;


# instance fields
.field protected mCropArea:Landroid/graphics/RectF;

.field protected mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

.field protected mSampleSize:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    new-instance v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix;F)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    new-instance v0, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p1, p2}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;->set(Landroid/graphics/Matrix;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    iget-object p3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->normalize(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix;F)V

    return-void
.end method

.method private static normalize(Landroid/graphics/RectF;Landroid/graphics/RectF;Landroid/graphics/Matrix;F)V
    .locals 3

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    new-instance v2, Landroid/graphics/RectF;

    invoke-direct {v2}, Landroid/graphics/RectF;-><init>()V

    invoke-virtual {v0, p3}, Landroid/graphics/Matrix;->setRotate(F)V

    invoke-virtual {v0, v2, p0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {p2, v1, p0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;Landroid/graphics/RectF;)Z

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result p0

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result p3

    div-float/2addr p0, p3

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result p3

    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    move-result v1

    div-float/2addr p3, v1

    invoke-virtual {v0, p0, p3}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    return-void
.end method


# virtual methods
.method public apply(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 5

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    int-to-float v2, v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    neg-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    const/high16 v3, 0x3f800000    # 1.0f

    div-float v4, v3, v1

    div-float/2addr v3, v2

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v3

    div-float/2addr v3, v1

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    if-lez v1, :cond_1

    if-gtz v2, :cond_0

    goto :goto_0

    :cond_0
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    new-instance v2, Landroid/graphics/Canvas;

    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x3

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v2, p1, v0, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Matrix;Landroid/graphics/Paint;)V

    return-object v1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public refreshTargetAreaPosition(Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 5

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    move-result v1

    invoke-virtual {p1}, Landroid/graphics/RectF;->width()F

    move-result v2

    div-float/2addr v1, v2

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mSampleSize:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->height()F

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/RectF;->height()F

    move-result v3

    div-float/2addr v2, v3

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mMatrix:Lcom/miui/gallery/editor/photo/utils/parcelable/ParcelableMatrix;

    invoke-virtual {v0, v3}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    iget v3, v3, Landroid/graphics/RectF;->left:F

    neg-float v3, v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    iget v4, v4, Landroid/graphics/RectF;->top:F

    neg-float v4, v4

    invoke-virtual {v0, v3, v4}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    const/high16 v3, 0x3f800000    # 1.0f

    div-float v4, v3, v1

    div-float/2addr v3, v2

    invoke-virtual {v0, v4, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p2

    div-float/2addr p2, v1

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/core/imports/obsoletes/CropEntry;->mCropArea:Landroid/graphics/RectF;

    invoke-virtual {v0}, Landroid/graphics/RectF;->height()F

    move-result v0

    div-float/2addr v0, v2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    new-instance v1, Landroid/graphics/RectF;

    int-to-float p2, p2

    int-to-float v0, v0

    const/4 v2, 0x0

    invoke-direct {v1, v2, v2, p2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {p1, v1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    return-void
.end method
