.class public Lcom/miui/gallery/util/CropUtil;
.super Ljava/lang/Object;
.source "CropUtil.java"


# direct methods
.method public static circleBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 2

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/CropUtil;->circleBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static circleBitmap(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    .locals 4

    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p1, p1, v1}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    div-int/lit8 p1, p1, 0x2

    new-instance v0, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    sget-object v3, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p0, v2, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance p0, Landroid/graphics/Canvas;

    invoke-direct {p0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    int-to-float p1, p1

    invoke-virtual {p0, p1, p1, p1, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-object v1

    :cond_2
    :goto_0
    return-object v0
.end method

.method public static cropImage(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    .locals 11

    if-nez p0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    const/4 v3, 0x1

    const/4 v5, 0x0

    if-eqz v1, :cond_1

    if-eqz p2, :cond_1

    const/4 v6, 0x1

    goto :goto_0

    :cond_1
    const/4 v6, 0x0

    :goto_0
    const-string v7, "wrong dimension"

    new-array v8, v5, [Ljava/lang/Object;

    invoke-static {v6, v7, v8}, Lcom/miui/gallery/util/Utils;->assertTrue(ZLjava/lang/String;[Ljava/lang/Object;)V

    int-to-float v6, v0

    int-to-float v7, v1

    div-float/2addr v6, v7

    int-to-float v8, p1

    int-to-float v9, p2

    div-float v10, v8, v9

    cmpg-float v6, v6, v10

    if-gez v6, :cond_2

    move v1, v0

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    const/4 v0, 0x0

    :goto_1
    if-eqz v0, :cond_3

    int-to-float v1, v1

    div-float/2addr v8, v1

    move v1, v8

    goto :goto_2

    :cond_3
    int-to-float v1, v1

    div-float/2addr v9, v1

    move v1, v9

    :goto_2
    const/high16 v3, 0x3f800000    # 1.0f

    cmpg-float v3, v1, v3

    if-gez v3, :cond_4

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/CropUtil;->cropLargeBitmap(ZFLandroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_3

    :cond_4
    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/CropUtil;->cropSmallBitmap(ZFLandroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_3
    return-object v0
.end method

.method private static cropLargeBitmap(ZFLandroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    .locals 1

    invoke-static {p2, p1, p5}, Lcom/miui/gallery/util/BitmapUtils;->resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;

    move-result-object p1

    if-nez p1, :cond_0

    return-object p2

    :cond_0
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    if-gt p4, p0, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    sub-int/2addr p0, p4

    div-int/lit8 p0, p0, 0x2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    invoke-static {p1, v0, p0, p3, p4}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    if-gt p3, p0, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p0

    sub-int/2addr p0, p3

    div-int/lit8 p0, p0, 0x2

    invoke-static {p1, p0, v0, p3, p4}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    :cond_2
    move-object p0, p1

    :goto_0
    if-nez p0, :cond_3

    move-object p0, p1

    :cond_3
    if-eq p1, p0, :cond_4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_4
    if-eq p0, p2, :cond_5

    if-eqz p5, :cond_5

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->recycle()V

    :cond_5
    return-object p0
.end method

.method private static cropSmallBitmap(ZFLandroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;
    .locals 2

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p0, :cond_1

    int-to-float p0, p4

    div-float/2addr p0, p1

    float-to-int p0, p0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    if-lt p3, p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/miui/gallery/util/Utils;->assertTrue(Z)V

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    sub-int/2addr p3, p0

    div-int/lit8 p3, p3, 0x2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p4

    invoke-static {p2, v1, p3, p4, p0}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_1

    :cond_1
    int-to-float p0, p3

    div-float/2addr p0, p1

    float-to-int p0, p0

    if-nez p0, :cond_2

    const/4 p0, 0x1

    :cond_2
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    sub-int/2addr p3, p0

    div-int/lit8 p3, p3, 0x2

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p4

    invoke-static {p2, p3, v1, p0, p4}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p0

    :goto_1
    if-nez p0, :cond_3

    const/4 p0, 0x0

    return-object p0

    :cond_3
    invoke-static {p0, p1, p5}, Lcom/miui/gallery/util/BitmapUtils;->resizeBitmapByScale(Landroid/graphics/Bitmap;FZ)Landroid/graphics/Bitmap;

    move-result-object p1

    if-eq p0, p1, :cond_4

    if-eq p0, p2, :cond_4

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_4
    return-object p1
.end method
