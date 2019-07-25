.class public Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;
.super Lcom/nexstreaming/app/common/nexasset/overlay/impl/AbstractOverlayAsset;
.source "SVGOverlayAsset.java"


# static fields
.field public static final COLOR_REPLACEMENT_TOLERANCE:I = 0x32

.field private static final LOG_TAG:Ljava/lang/String; = "SVGOverlayAsset"

.field private static final MAX_TEX_SIZE:I = 0x7d0

.field private static serial:I


# instance fields
.field private height:I

.field private width:I


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/f;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/AbstractOverlayAsset;-><init>(Lcom/nexstreaming/app/common/nexasset/assetpackage/f;)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->getSVG(Ljava/util/Map;)Lcom/larvalabs/svgandroid/b;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/larvalabs/svgandroid/b;->b()Landroid/graphics/Picture;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Picture;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->width:I

    invoke-virtual {p1}, Lcom/larvalabs/svgandroid/b;->b()Landroid/graphics/Picture;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/Picture;->getHeight()I

    move-result p1

    iput p1, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->height:I

    :cond_0
    return-void
.end method

.method private getSVG(Ljava/util/Map;)Lcom/larvalabs/svgandroid/b;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/larvalabs/svgandroid/b;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    move-object v1, v0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "color:svgcolor_"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v4, "color:svgcolor_"

    const-string v5, "#"

    invoke-virtual {v3, v4, v5}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/nexstreaming/app/common/util/c;->a(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/nexstreaming/app/common/util/c;->a(Ljava/lang/String;)I

    move-result v2

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    :cond_1
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_2
    move-object v1, v0

    :cond_3
    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->getAssetPackageReader()Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;

    move-result-object p1
    :try_end_0
    .catch Lcom/larvalabs/svgandroid/SVGParseException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {p0}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->getItemInfo()Lcom/nexstreaming/app/common/nexasset/assetpackage/f;

    move-result-object v2

    invoke-interface {v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/f;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/nexstreaming/app/common/nexasset/assetpackage/AssetPackageReader;->a(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v2
    :try_end_1
    .catch Lcom/larvalabs/svgandroid/SVGParseException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const/16 v3, 0x32

    :try_start_2
    invoke-static {v2, v1, v3}, Lcom/larvalabs/svgandroid/SVGParser;->a(Ljava/io/InputStream;Ljava/util/Map;I)Lcom/larvalabs/svgandroid/b;

    move-result-object v1
    :try_end_2
    .catch Lcom/larvalabs/svgandroid/SVGParseException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    invoke-static {v2}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    move-object v0, v1

    goto :goto_2

    :catch_0
    move-exception v1

    goto :goto_1

    :catchall_0
    move-exception v1

    move-object v2, v0

    move-object v0, v1

    goto :goto_3

    :catch_1
    move-exception v1

    move-object v2, v0

    goto :goto_1

    :catchall_1
    move-exception p1

    move-object v2, v0

    move-object v0, p1

    move-object p1, v2

    goto :goto_3

    :catch_2
    move-exception v1

    move-object p1, v0

    move-object v2, p1

    :goto_1
    :try_start_3
    const-string v3, "SVGOverlayAsset"

    invoke-virtual {v1}, Lcom/larvalabs/svgandroid/SVGParseException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    invoke-static {v2}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    :goto_2
    return-object v0

    :catchall_2
    move-exception v0

    :goto_3
    invoke-static {v2}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    invoke-static {p1}, Lcom/nexstreaming/app/common/util/b;->a(Ljava/io/Closeable;)V

    throw v0
.end method


# virtual methods
.method public getDefaultDuration()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getIntrinsicHeight()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->height:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    iget v0, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->width:I

    return v0
.end method

.method public onAwake(Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;Landroid/graphics/RectF;Ljava/lang/String;Ljava/util/Map;)Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/nexstreaming/kminternal/nexvideoeditor/LayerRenderer;",
            "Landroid/graphics/RectF;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/nexstreaming/app/common/nexasset/overlay/AwakeAsset;"
        }
    .end annotation

    sget p1, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->serial:I

    add-int/lit8 p3, p1, 0x1

    sput p3, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->serial:I

    const/4 p3, 0x0

    :try_start_0
    invoke-direct {p0, p4}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->getSVG(Ljava/util/Map;)Lcom/larvalabs/svgandroid/b;

    move-result-object p4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p4, :cond_0

    return-object p3

    :cond_0
    const/16 p3, 0x7d0

    iget v0, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->width:I

    iget v1, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->height:I

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    div-int/2addr p3, v0

    invoke-virtual {p4}, Lcom/larvalabs/svgandroid/b;->b()Landroid/graphics/Picture;

    move-result-object p3

    iget p4, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->width:I

    int-to-float p4, p4

    const/high16 v0, 0x3f800000    # 1.0f

    mul-float p4, p4, v0

    float-to-double v1, p4

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int p4, v1

    iget v1, p0, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;->height:I

    int-to-float v1, v1

    mul-float v1, v1, v0

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->floor(D)D

    move-result-wide v1

    double-to-int v1, v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p4, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p4

    new-instance v1, Landroid/graphics/Canvas;

    invoke-direct {v1, p4}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v0, v0}, Landroid/graphics/Canvas;->scale(FF)V

    invoke-virtual {p3, v1}, Landroid/graphics/Picture;->draw(Landroid/graphics/Canvas;)V

    const-string p3, "SVGOverlayAsset"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onAwake OUT : [#"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] actualScale="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v0, " bm="

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p3, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset$1;

    invoke-direct {p3, p0, p1, p2, p4}, Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset$1;-><init>(Lcom/nexstreaming/app/common/nexasset/overlay/impl/SVGOverlayAsset;ILandroid/graphics/RectF;Landroid/graphics/Bitmap;)V

    return-object p3

    :catch_0
    move-exception p1

    const-string p2, "SVGOverlayAsset"

    const-string p4, "Error loading asset"

    invoke-static {p2, p4, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object p3
.end method
