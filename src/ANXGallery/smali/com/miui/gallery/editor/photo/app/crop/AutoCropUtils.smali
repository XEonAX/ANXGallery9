.class public Lcom/miui/gallery/editor/photo/app/crop/AutoCropUtils;
.super Ljava/lang/Object;
.source "AutoCropUtils.java"


# direct methods
.method public static getAutoCropData(Landroid/graphics/Bitmap;Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;)V
    .locals 4

    const-string v0, "AutoCropUtils"

    const-string v1, "autoCrop start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_3

    invoke-static {}, Lcom/miui/gallery/editor/photo/app/crop/AutoCropJni;->isAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    :cond_0
    const/16 v0, 0x280

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    const/4 v3, 0x1

    if-le v1, v2, :cond_1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    mul-int/lit16 v1, v1, 0x280

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/2addr v1, v2

    invoke-static {p0, v0, v1, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    mul-int/lit16 v1, v1, 0x280

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/2addr v1, v2

    invoke-static {p0, v1, v0, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object p0

    :cond_2
    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/editor/photo/app/crop/AutoCropUtils;->getGrayBytes(Landroid/graphics/Bitmap;)[B

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    invoke-static {v0, v1, p0, p1}, Lcom/miui/gallery/editor/photo/app/crop/AutoCropJni;->autoRotation([BIILcom/miui/gallery/editor/photo/app/crop/AutoCropData;)I

    move-result p0

    iput p0, p1, Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;->rotationResult:I

    const-string p0, "AutoCropUtils"

    const-string v0, "autoCrop result: %f: %d"

    iget-wide v1, p1, Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;->angle:D

    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iget p1, p1, Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;->rotationResult:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_3
    :goto_1
    const/4 p0, -0x1

    iput p0, p1, Lcom/miui/gallery/editor/photo/app/crop/AutoCropData;->rotationResult:I

    return-void
.end method

.method private static getGrayBytes(Landroid/graphics/Bitmap;)[B
    .locals 14

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    mul-int v0, v8, v9

    new-array v10, v0, [I

    new-array v11, v0, [B

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v10

    move v3, v8

    move v6, v8

    move v7, v9

    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Bitmap;->getPixels([IIIIIII)V

    const/4 p0, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v9, :cond_1

    const/4 v1, 0x0

    :goto_1
    if-ge v1, v8, :cond_0

    mul-int v2, v8, v0

    add-int/2addr v2, v1

    aget v3, v10, v2

    const/high16 v4, 0xff0000

    and-int/2addr v4, v3

    shr-int/lit8 v4, v4, 0x10

    const v5, 0xff00

    and-int/2addr v5, v3

    shr-int/lit8 v5, v5, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-float v4, v4

    float-to-double v6, v4

    const-wide v12, 0x3fd3333333333333L    # 0.3

    invoke-static {v6, v7}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v6, v6, v12

    int-to-float v4, v5

    float-to-double v4, v4

    const-wide v12, 0x3fe2e147ae147ae1L    # 0.59

    invoke-static {v4, v5}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v4, v4, v12

    add-double/2addr v6, v4

    int-to-float v3, v3

    float-to-double v3, v3

    const-wide v12, 0x3fbc28f5c28f5c29L    # 0.11

    invoke-static {v3, v4}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v3, v3, v12

    add-double/2addr v6, v3

    double-to-int v3, v6

    int-to-byte v3, v3

    aput-byte v3, v11, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-object v11
.end method
