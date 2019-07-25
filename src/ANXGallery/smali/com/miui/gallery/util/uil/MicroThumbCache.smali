.class public Lcom/miui/gallery/util/uil/MicroThumbCache;
.super Ljava/lang/Object;
.source "MicroThumbCache.java"

# interfaces
.implements Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IMicroThumbCache;


# static fields
.field private static final MICRO_THUMBNAIL_SIZE:I

.field private static final THUMB_CONFIG_ORDINAL:I

.field private static sCache:Lcom/miui/gallery/util/uil/MicroThumbCache;


# instance fields
.field private mBitmapPool:Lmiui/util/Pools$SoftReferencePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$SoftReferencePool<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

.field private mBlobLock:Ljava/lang/Object;

.field private final mCacheDir:Ljava/io/File;

.field private final mCacheMaxSize:I

.field private mLookupRequestPool:Lmiui/util/Pools$SoftReferencePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/Pools$SoftReferencePool<",
            "Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;",
            ">;"
        }
    .end annotation
.end field

.field private final mMaxEntries:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;->getWidth()I

    move-result v0

    sput v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Bitmap$Config;->ordinal()I

    move-result v0

    sput v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->THUMB_CONFIG_ORDINAL:I

    return-void
.end method

.method private constructor <init>(Ljava/io/File;II)V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobLock:Ljava/lang/Object;

    const-string v0, "MicroThumbCache"

    const-string v1, "MicroThumbCache cache size %d"

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheDir:Ljava/io/File;

    iput p2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mMaxEntries:I

    iput p3, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheMaxSize:I

    return-void
.end method

.method static synthetic access$000()I
    .locals 1

    sget v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    return v0
.end method

.method private declared-synchronized ensureInitialized()V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheDir:Ljava/io/File;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheDir:Ljava/io/File;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :try_start_2
    new-instance v8, Lcom/miui/gallery/util/uil/BlobCache;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "micro_thumbnail_blob"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mMaxEntries:I

    iget v5, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mCacheMaxSize:I

    const/4 v6, 0x0

    const/16 v7, 0x9

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/util/uil/BlobCache;-><init>(Ljava/lang/String;IIZI)V

    iput-object v8, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    new-instance v2, Lcom/miui/gallery/util/uil/MicroThumbCache$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/util/uil/MicroThumbCache$1;-><init>(Lcom/miui/gallery/util/uil/MicroThumbCache;)V

    const/16 v3, 0x20

    invoke-static {v2, v3}, Lmiui/util/Pools;->createSoftReferencePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SoftReferencePool;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mLookupRequestPool:Lmiui/util/Pools$SoftReferencePool;

    new-instance v2, Lcom/miui/gallery/util/uil/MicroThumbCache$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/util/uil/MicroThumbCache$2;-><init>(Lcom/miui/gallery/util/uil/MicroThumbCache;)V

    const/16 v3, 0xa

    invoke-static {v2, v3}, Lmiui/util/Pools;->createSoftReferencePool(Lmiui/util/Pools$Manager;I)Lmiui/util/Pools$SoftReferencePool;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBitmapPool:Lmiui/util/Pools$SoftReferencePool;

    const-string v2, "MicroThumbCache"

    const-string v3, "init cost %s"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    monitor-exit p0

    return-void

    :catch_0
    move-exception v0

    :try_start_4
    const-string v1, "MicroThumbCache"

    const-string v2, "cache creation failed, use dummy"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static getInstance()Lcom/miui/gallery/util/uil/MicroThumbCache;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->sCache:Lcom/miui/gallery/util/uil/MicroThumbCache;

    return-object v0
.end method

.method public static init(Ljava/io/File;II)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/uil/MicroThumbCache;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/util/uil/MicroThumbCache;-><init>(Ljava/io/File;II)V

    sput-object v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->sCache:Lcom/miui/gallery/util/uil/MicroThumbCache;

    return-void
.end method

.method private isCorrectConfig(Landroid/graphics/Bitmap;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isCorrectSize(Landroid/graphics/Bitmap;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    sget v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    if-lt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isReusableBitmap(Landroid/graphics/Bitmap;)Z
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    sget v3, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    if-ne v2, v3, :cond_1

    if-ne v2, p1, :cond_1

    sget p1, Lcom/miui/gallery/util/uil/MicroThumbCache;->THUMB_CONFIG_ORDINAL:I

    invoke-virtual {v1}, Landroid/graphics/Bitmap$Config;->ordinal()I

    move-result v1

    if-ne p1, v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method


# virtual methods
.method public getCenterCropBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 7

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/MicroThumbCache;->ensureInitialized()V

    iget-object v4, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mLookupRequestPool:Lmiui/util/Pools$SoftReferencePool;

    invoke-virtual {v4}, Lmiui/util/Pools$SoftReferencePool;->acquire()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v5

    iput-wide v5, v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->key:J

    iput v2, v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    iget-object p1, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobLock:Ljava/lang/Object;

    monitor-enter p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    iget-object v5, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {v5, v4}, Lcom/miui/gallery/util/uil/BlobCache;->lookup(Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p2

    goto :goto_3

    :catch_0
    move-exception v5

    :try_start_2
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    iget p1, v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    if-lez p1, :cond_1

    iget-object p1, v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->buffer:[B

    iget v5, v4, Lcom/miui/gallery/util/uil/BlobCache$LookupRequest;->length:I

    invoke-static {p1, v2, v5}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    invoke-direct {p0, p2}, Lcom/miui/gallery/util/uil/MicroThumbCache;->isReusableBitmap(Landroid/graphics/Bitmap;)Z

    move-result v5

    if-eqz v5, :cond_0

    :goto_1
    move-object v3, p2

    goto :goto_2

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBitmapPool:Lmiui/util/Pools$SoftReferencePool;

    invoke-virtual {p2}, Lmiui/util/Pools$SoftReferencePool;->acquire()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/graphics/Bitmap;

    goto :goto_1

    :goto_2
    invoke-virtual {v3, p1}, Landroid/graphics/Bitmap;->copyPixelsFromBuffer(Ljava/nio/Buffer;)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mLookupRequestPool:Lmiui/util/Pools$SoftReferencePool;

    invoke-virtual {p1, v4}, Lmiui/util/Pools$SoftReferencePool;->release(Ljava/lang/Object;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_4

    :goto_3
    :try_start_4
    monitor-exit p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :try_start_5
    throw p2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_4
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide p1

    sub-long/2addr p1, v0

    if-eqz v3, :cond_2

    invoke-static {v2, p1, p2}, Lcom/miui/gallery/util/uil/LoadMonitor;->record(IJ)V

    :cond_2
    return-object v3
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/MicroThumbCache;->ensureInitialized()V

    const/4 v0, 0x0

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v1

    if-eqz v1, :cond_0

    goto/16 :goto_3

    :cond_0
    const/4 v1, 0x0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-lez v2, :cond_2

    sget v3, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    if-ge v2, v3, :cond_2

    sget v3, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    int-to-float v3, v3

    int-to-float v2, v2

    div-float/2addr v3, v2

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/ReusedBitmapCache;->getBytesPerPixel(Landroid/graphics/Bitmap$Config;)I

    move-result v2

    mul-int v2, v2, v5

    mul-int v2, v2, v6

    int-to-float v2, v2

    mul-float v2, v2, v3

    mul-float v2, v2, v3

    const/high16 v4, 0x4a000000    # 2097152.0f

    cmpl-float v2, v2, v4

    if-lez v2, :cond_1

    return v0

    :cond_1
    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    invoke-virtual {v7, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v8, 0x1

    move-object v2, p2

    invoke-static/range {v2 .. v8}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    :cond_2
    move-object v2, p2

    invoke-direct {p0, v2}, Lcom/miui/gallery/util/uil/MicroThumbCache;->isCorrectSize(Landroid/graphics/Bitmap;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    sget v3, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    sub-int/2addr p2, v3

    div-int/lit8 v3, p2, 0x2

    sget p2, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    sub-int/2addr v0, p2

    div-int/lit8 v4, v0, 0x2

    invoke-direct {p0, v2}, Lcom/miui/gallery/util/uil/MicroThumbCache;->isCorrectConfig(Landroid/graphics/Bitmap;)Z

    move-result p2

    if-eqz p2, :cond_3

    sget p2, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    sget v0, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    invoke-static {v2, v3, v4, p2, v0}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIII)Landroid/graphics/Bitmap;

    move-result-object p2

    :goto_0
    move-object v2, p2

    goto :goto_1

    :cond_3
    const-string p2, "MicroThumbCache"

    const-string v0, "is not correct config %s, %s"

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v5

    invoke-static {p2, v0, p1, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    sget v5, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    sget v6, Lcom/miui/gallery/util/uil/MicroThumbCache;->MICRO_THUMBNAIL_SIZE:I

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->getThumbConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v9

    invoke-static/range {v2 .. v9}, Lcom/miui/gallery/util/BitmapUtils;->safeCreateBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;ZLandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p2

    goto :goto_0

    :goto_1
    invoke-direct {p0, v2}, Lcom/miui/gallery/util/uil/MicroThumbCache;->isCorrectConfig(Landroid/graphics/Bitmap;)Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result p2

    invoke-static {p2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    invoke-virtual {v2, v1}, Landroid/graphics/Bitmap;->copyPixelsToBuffer(Ljava/nio/Buffer;)V

    :cond_4
    if-eqz v1, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    const-string v0, "MicroThumbCache"

    const-string v3, "save data size %d"

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getByteCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v3, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/MicroThumbCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v2

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    invoke-virtual {v0, v2, v3, p1}, Lcom/miui/gallery/util/uil/BlobCache;->insert(J[B)V

    monitor-exit p2

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_5
    :goto_2
    const/4 p1, 0x1

    return p1

    :cond_6
    :goto_3
    return v0
.end method
