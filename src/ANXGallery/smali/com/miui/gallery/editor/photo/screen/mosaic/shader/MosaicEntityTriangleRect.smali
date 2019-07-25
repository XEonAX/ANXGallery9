.class public Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityTriangleRect;
.super Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityRely;
.source "MosaicEntityTriangleRect.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntityRely;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;)V

    return-void
.end method


# virtual methods
.method public generateShader(Landroid/graphics/Bitmap;FLandroid/graphics/Matrix;)Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;
    .locals 12

    const/high16 p3, 0x42100000    # 36.0f

    mul-float p2, p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p3

    if-lt p3, p2, :cond_c

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    if-ge p3, p2, :cond_0

    goto/16 :goto_5

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p3

    div-int/2addr p3, p2

    add-int/lit8 p3, p3, 0x1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/2addr v2, p2

    add-int/lit8 v2, v2, 0x1

    filled-new-array {p3, v2}, [I

    move-result-object p3

    const-class v2, I

    invoke-static {v2, p3}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [[I

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    div-int/2addr v2, p2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    div-int/2addr v3, p2

    add-int/lit8 v3, v3, 0x1

    filled-new-array {v2, v3}, [I

    move-result-object v2

    const-class v3, I

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[I

    const-string v3, "MosaicEntityTriangleRect"

    const-string v4, "allocate cache costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    if-ge v4, v6, :cond_6

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    if-ge v6, v8, :cond_5

    div-int/lit8 v8, p2, 0x4

    add-int v9, v6, v8

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    if-lt v9, v10, :cond_1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    add-int/2addr v9, v6

    div-int/lit8 v9, v9, 0x2

    :cond_1
    add-int/2addr v8, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    if-lt v8, v10, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    add-int/2addr v8, v4

    div-int/lit8 v8, v8, 0x2

    :cond_2
    aget-object v10, p3, v5

    invoke-virtual {p1, v9, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v8

    aput v8, v10, v7

    mul-int/lit8 v8, p2, 0x3

    div-int/lit8 v8, v8, 0x4

    add-int v9, v6, v8

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v10

    if-lt v9, v10, :cond_3

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    add-int/2addr v9, v6

    div-int/lit8 v9, v9, 0x2

    :cond_3
    add-int/2addr v8, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    if-lt v8, v10, :cond_4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    add-int/2addr v8, v4

    div-int/lit8 v8, v8, 0x2

    :cond_4
    aget-object v10, v2, v5

    invoke-virtual {p1, v9, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v8

    aput v8, v10, v7

    add-int/lit8 v7, v7, 0x1

    add-int/2addr v6, p2

    goto :goto_1

    :cond_5
    add-int/lit8 v5, v5, 0x1

    add-int/2addr v4, p2

    goto :goto_0

    :cond_6
    const-string v4, "MosaicEntityTriangleRect"

    const-string v5, "init cache costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    mul-int v4, v4, v5

    new-array v4, v4, [I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    :goto_2
    array-length v8, v4

    if-ge v5, v8, :cond_b

    move v9, v5

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v10, 0x0

    :goto_3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    if-ge v5, v11, :cond_9

    if-ge v6, v8, :cond_7

    aget-object v11, p3, v7

    aget v11, v11, v10

    aput v11, v4, v9

    goto :goto_4

    :cond_7
    aget-object v11, v2, v7

    aget v11, v11, v10

    aput v11, v4, v9

    :goto_4
    add-int/lit8 v8, v8, 0x1

    if-ne v8, p2, :cond_8

    add-int/lit8 v10, v10, 0x1

    const/4 v8, 0x0

    :cond_8
    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    :cond_9
    add-int/lit8 v6, v6, 0x1

    if-ne v6, p2, :cond_a

    add-int/lit8 v7, v7, 0x1

    move v5, v9

    const/4 v6, 0x0

    goto :goto_2

    :cond_a
    move v5, v9

    goto :goto_2

    :cond_b
    const-string p2, "MosaicEntityTriangleRect"

    const-string p3, "generate pixels costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p2, p3, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    sget-object p3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v4, p2, p1, p3}, Landroid/graphics/Bitmap;->createBitmap([IIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    const-string p2, "MosaicEntityTriangleRect"

    const-string p3, "finish costs %dms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, p3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Landroid/graphics/BitmapShader;

    sget-object p3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p2, p1, p3, v0}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    sget-object p3, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;-><init>(Landroid/graphics/BitmapShader;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;)V

    return-object p1

    :cond_c
    :goto_5
    new-instance p2, Landroid/graphics/BitmapShader;

    sget-object p3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p2, p1, p3, v0}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;

    sget-object p3, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;->TRIANGLE_RECT:Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicShaderHolder;-><init>(Landroid/graphics/BitmapShader;Lcom/miui/gallery/editor/photo/screen/mosaic/shader/MosaicEntity$TYPE;)V

    return-object p1
.end method
