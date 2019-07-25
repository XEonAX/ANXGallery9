.class public Lcom/miui/gallery/util/DecodeRegionImageUtils;
.super Ljava/lang/Object;
.source "DecodeRegionImageUtils.java"


# direct methods
.method private static closeSilently(Ljava/io/Closeable;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v0, "DecodeRegionImageUtils"

    const-string v1, "close fail"

    invoke-static {v0, v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    return-void
.end method

.method private static computeSampleSize(F)I
    .locals 2

    const/high16 v0, 0x3f800000    # 1.0f

    div-float/2addr v0, p0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p0, v0

    const/4 v0, 0x1

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/16 v0, 0x8

    if-gt p0, v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->nextPowerOf2(I)I

    move-result p0

    goto :goto_0

    :cond_0
    add-int/lit8 p0, p0, 0x7

    div-int/2addr p0, v0

    mul-int/lit8 p0, p0, 0x8

    :goto_0
    return p0
.end method

.method private static decodeFace(Landroid/graphics/RectF;Landroid/graphics/BitmapRegionDecoder;FIILcom/miui/gallery/util/ReusedBitmapCache;)Landroid/graphics/Bitmap;
    .locals 7

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v1

    instance-of v2, p0, Lcom/miui/gallery/util/face/FaceRegionRectF;

    if-eqz v2, :cond_0

    move-object v2, p0

    check-cast v2, Lcom/miui/gallery/util/face/FaceRegionRectF;

    iget v2, v2, Lcom/miui/gallery/util/face/FaceRegionRectF;->orientation:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    const/4 v3, 0x1

    if-eq v2, v3, :cond_0

    if-eqz v2, :cond_0

    if-eq v2, p4, :cond_0

    invoke-static {v3, v3, p0, v2, v3}, Lcom/miui/gallery/util/ExifUtil;->adjustRectOrientation(IILandroid/graphics/RectF;IZ)Landroid/graphics/RectF;

    move-result-object p0

    :cond_0
    new-instance p4, Landroid/graphics/Rect;

    iget v2, p0, Landroid/graphics/RectF;->left:F

    int-to-float v3, v0

    mul-float v2, v2, v3

    float-to-int v2, v2

    iget v4, p0, Landroid/graphics/RectF;->top:F

    int-to-float v5, v1

    mul-float v4, v4, v5

    float-to-int v4, v4

    iget v6, p0, Landroid/graphics/RectF;->right:F

    mul-float v6, v6, v3

    float-to-int v3, v6

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    mul-float p0, p0, v5

    float-to-int p0, p0

    invoke-direct {p4, v2, v4, v3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    if-lez p3, :cond_1

    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge p3, v2, :cond_1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v2, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput p3, p0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput p3, p0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    int-to-float p3, p3

    invoke-virtual {p4}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {p4}, Landroid/graphics/Rect;->height()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    div-float/2addr p3, v2

    invoke-static {p3}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->computeSampleSize(F)I

    move-result p3

    iput p3, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-eqz p5, :cond_1

    invoke-virtual {p5, p0}, Lcom/miui/gallery/util/ReusedBitmapCache;->get(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p3

    iput-object p3, p0, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    :cond_1
    invoke-static {p4, v0, v1, p2}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->roundToSquareAndScale(Landroid/graphics/Rect;IIF)Landroid/graphics/Rect;

    move-result-object p2

    invoke-static {p1, p2, p0}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->safeDecodeRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method public static decodeFaceRegion(Landroid/graphics/RectF;Ljava/io/InputStream;FII)Landroid/graphics/Bitmap;
    .locals 6

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->requestCreateBitmapRegionDecoder(Ljava/io/InputStream;)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p1

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    :try_start_0
    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->decodeFace(Landroid/graphics/RectF;Landroid/graphics/BitmapRegionDecoder;FIILcom/miui/gallery/util/ReusedBitmapCache;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_1
    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_2
    throw p0
.end method

.method public static decodeFaceRegion(Landroid/graphics/RectF;Ljava/lang/String;FIILcom/miui/gallery/util/ReusedBitmapCache;)Landroid/graphics/Bitmap;
    .locals 6

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->requestCreateBitmapRegionDecoder(Ljava/lang/String;)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p1

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    :try_start_0
    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->decodeFace(Landroid/graphics/RectF;Landroid/graphics/BitmapRegionDecoder;FIILcom/miui/gallery/util/ReusedBitmapCache;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_1
    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_2
    throw p0
.end method

.method private static decodeRegion(Landroid/graphics/RectF;Landroid/graphics/BitmapRegionDecoder;I)Landroid/graphics/Bitmap;
    .locals 6

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->getHeight()I

    move-result v1

    new-instance v2, Landroid/graphics/Rect;

    iget v3, p0, Landroid/graphics/RectF;->left:F

    int-to-float v0, v0

    mul-float v3, v3, v0

    float-to-int v3, v3

    iget v4, p0, Landroid/graphics/RectF;->top:F

    int-to-float v1, v1

    mul-float v4, v4, v1

    float-to-int v4, v4

    iget v5, p0, Landroid/graphics/RectF;->right:F

    mul-float v5, v5, v0

    float-to-int v0, v5

    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    mul-float p0, p0, v1

    float-to-int p0, p0

    invoke-direct {v2, v3, v4, v0, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance p0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    if-lez p2, :cond_0

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    if-ge p2, v0, :cond_0

    sget-object v0, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    iput-object v0, p0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    int-to-float p2, p2

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    div-float/2addr p2, v0

    invoke-static {p2}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->computeSampleSize(F)I

    move-result p2

    iput p2, p0, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    :cond_0
    invoke-static {p1, v2, p0}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->safeDecodeRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static decodeRegion(Landroid/graphics/RectF;Ljava/io/InputStream;I)Landroid/graphics/Bitmap;
    .locals 0

    if-nez p1, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->requestCreateBitmapRegionDecoder(Ljava/io/InputStream;)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p1

    :try_start_0
    invoke-static {p0, p1, p2}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->decodeRegion(Landroid/graphics/RectF;Landroid/graphics/BitmapRegionDecoder;I)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_1
    return-object p0

    :catchall_0
    move-exception p0

    invoke-static {p1}, Lcom/miui/gallery/util/BitmapUtils;->isValidate(Landroid/graphics/BitmapRegionDecoder;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Landroid/graphics/BitmapRegionDecoder;->recycle()V

    :cond_2
    throw p0
.end method

.method private static nextPowerOf2(I)I
    .locals 1

    if-lez p0, :cond_0

    const/high16 v0, 0x40000000    # 2.0f

    if-gt p0, v0, :cond_0

    add-int/lit8 p0, p0, -0x1

    shr-int/lit8 v0, p0, 0x10

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x8

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x4

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x2

    or-int/2addr p0, v0

    shr-int/lit8 v0, p0, 0x1

    or-int/2addr p0, v0

    add-int/lit8 p0, p0, 0x1

    return p0

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    invoke-direct {p0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw p0
.end method

.method private static requestCreateBitmapRegionDecoder(Ljava/io/InputStream;)Landroid/graphics/BitmapRegionDecoder;
    .locals 1

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p0, v0}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    const-string v0, "DecodeRegionImageUtils"

    invoke-static {v0, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p0, 0x0

    return-object p0
.end method

.method private static requestCreateBitmapRegionDecoder(Ljava/lang/String;)Landroid/graphics/BitmapRegionDecoder;
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p0, 0x0

    :try_start_1
    invoke-static {v1, p0}, Landroid/graphics/BitmapRegionDecoder;->newInstance(Ljava/io/InputStream;Z)Landroid/graphics/BitmapRegionDecoder;

    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    invoke-static {v1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->closeSilently(Ljava/io/Closeable;)V

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catchall_0
    move-exception p0

    move-object v1, v0

    goto :goto_1

    :catch_1
    move-exception p0

    move-object v1, v0

    :goto_0
    :try_start_2
    const-string v2, "DecodeRegionImageUtils"

    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    invoke-static {v1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->closeSilently(Ljava/io/Closeable;)V

    return-object v0

    :catchall_1
    move-exception p0

    :goto_1
    invoke-static {v1}, Lcom/miui/gallery/util/DecodeRegionImageUtils;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method

.method public static roundToSquareAndScale(Landroid/graphics/Rect;IIF)Landroid/graphics/Rect;
    .locals 4

    iget v0, p0, Landroid/graphics/Rect;->right:I

    iget v1, p0, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    iget v1, p0, Landroid/graphics/Rect;->bottom:I

    iget v2, p0, Landroid/graphics/Rect;->top:I

    sub-int/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p3

    float-to-int p3, v2

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerX()I

    move-result v3

    sub-int/2addr p1, v3

    invoke-virtual {p0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    sub-int/2addr p2, v3

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v2, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    mul-int/lit8 p1, p1, 0x2

    invoke-static {p3, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    sub-int p2, p1, v0

    div-int/lit8 p2, p2, 0x2

    sub-int/2addr p1, v1

    div-int/lit8 p1, p1, 0x2

    iget p3, p0, Landroid/graphics/Rect;->left:I

    sub-int/2addr p3, p2

    iput p3, p0, Landroid/graphics/Rect;->left:I

    iget p3, p0, Landroid/graphics/Rect;->top:I

    sub-int/2addr p3, p1

    iput p3, p0, Landroid/graphics/Rect;->top:I

    iget p3, p0, Landroid/graphics/Rect;->right:I

    add-int/2addr p3, p2

    iput p3, p0, Landroid/graphics/Rect;->right:I

    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p2, p1

    iput p2, p0, Landroid/graphics/Rect;->bottom:I

    return-object p0
.end method

.method private static safeDecodeRegion(Landroid/graphics/BitmapRegionDecoder;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Landroid/graphics/BitmapRegionDecoder;->decodeRegion(Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    const-string p1, "DecodeRegionImageUtils"

    const-string p2, "safeDecodeRegion() failed: "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    :catch_1
    move-exception p0

    const-string p1, "DecodeRegionImageUtils"

    const-string p2, "safeDecodeRegion() failed OOM: "

    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method
