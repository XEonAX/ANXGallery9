.class public Lcom/miui/gallery/util/photoview/TileReusedBitCache;
.super Lcom/miui/gallery/util/ReusedBitmapCache;
.source "TileReusedBitCache.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/util/photoview/TileReusedBitCache;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/ReusedBitmapCache;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/util/photoview/TileReusedBitCache;
    .locals 2

    const-class v0, Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->sInstance:Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    invoke-direct {v1}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;-><init>()V

    sput-object v1, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->sInstance:Lcom/miui/gallery/util/photoview/TileReusedBitCache;

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->sInstance:Lcom/miui/gallery/util/photoview/TileReusedBitCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method


# virtual methods
.method protected canUseForInBitmap(Landroid/graphics/Bitmap;Landroid/graphics/BitmapFactory$Options;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->isSupportBytesCount()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->convertToPowerOf2(I)I

    move-result v0

    iget v3, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    div-int/2addr v3, v0

    iget p2, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    div-int/2addr p2, v0

    mul-int v0, v3, p2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/photoview/TileReusedBitCache;->getBytesPerPixel(Landroid/graphics/Bitmap$Config;)I

    move-result v4

    mul-int v0, v0, v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, v3, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    if-ne v3, p2, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getAllocationByteCount()I

    move-result p1

    if-ne v0, p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1

    :cond_1
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iget v3, p2, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-ne v0, v3, :cond_2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iget v0, p2, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne p1, v0, :cond_2

    iget p1, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    if-ne p1, v2, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method protected getConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/Config$TileConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxCount()I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/Config$TileConfig;->getMaxCacheCount()I

    move-result v0

    return v0
.end method

.method protected needMutable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected needRecycle()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
