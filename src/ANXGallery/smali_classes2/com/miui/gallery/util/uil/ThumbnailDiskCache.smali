.class public Lcom/miui/gallery/util/uil/ThumbnailDiskCache;
.super Ljava/lang/Object;
.source "ThumbnailDiskCache.java"

# interfaces
.implements Lcom/nostra13/universalimageloader/cache/disc/DiskCache;


# instance fields
.field private mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

.field private mBlobLock:Ljava/lang/Object;

.field private final mCacheDir:Ljava/io/File;

.field private final mCacheMaxSize:I

.field private final mMaxEntries:I


# direct methods
.method public constructor <init>(Ljava/io/File;II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobLock:Ljava/lang/Object;

    iput-object p1, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheDir:Ljava/io/File;

    iput p2, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mMaxEntries:I

    div-int/lit8 v0, p3, 0x4

    iput v0, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheMaxSize:I

    iget v0, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheMaxSize:I

    sub-int/2addr p3, v0

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/uil/MicroThumbCache;->init(Ljava/io/File;II)V

    return-void
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
    iget-object v0, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheDir:Ljava/io/File;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheDir:Ljava/io/File;

    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheDir:Ljava/io/File;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    :try_start_2
    new-instance v8, Lcom/miui/gallery/util/uil/BlobCache;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheDir:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "thumbnail_blob"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mMaxEntries:I

    iget v5, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mCacheMaxSize:I

    const/4 v6, 0x0

    const/16 v7, 0x9

    move-object v2, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/util/uil/BlobCache;-><init>(Ljava/lang/String;IIZI)V

    iput-object v8, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    const-string v2, "ThumbnailDiskCache"

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
    const-string v1, "ThumbnailDiskCache"

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


# virtual methods
.method public get(Ljava/lang/String;)Ljava/io/File;
    .locals 1

    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "get File: Stub!"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7

    invoke-static {p1}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->generateThumbnailKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobLock:Ljava/lang/Object;

    monitor-enter v2

    const/4 v3, 0x0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->ensureInitialized()V

    iget-object v4, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/miui/gallery/util/uil/BlobCache;->lookup(J)[B

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    move-object p1, v3

    :goto_0
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    array-length v3, p1

    invoke-static {p1, v2, v3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object v3

    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    move-result-wide v4

    sub-long/2addr v4, v0

    if-eqz v3, :cond_1

    const/4 p1, 0x1

    invoke-static {p1, v4, v5}, Lcom/miui/gallery/util/uil/LoadMonitor;->record(IJ)V

    :cond_1
    return-object v3

    :goto_1
    :try_start_2
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->ensureInitialized()V

    invoke-static {p1}, Lcom/nostra13/universalimageloader/utils/MemoryCacheUtils;->generateThumbnailKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    :try_start_0
    sget-object v2, Landroid/graphics/Bitmap$CompressFormat;->JPEG:Landroid/graphics/Bitmap$CompressFormat;

    const/16 v3, 0x5a

    invoke-virtual {p2, v2, v3, v1}, Landroid/graphics/Bitmap;->compress(Landroid/graphics/Bitmap$CompressFormat;ILjava/io/OutputStream;)Z

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    const-string v4, "ThumbnailDiskCache"

    const-string v5, "Save data size %d"

    array-length v6, v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v4, p0, Lcom/miui/gallery/util/uil/ThumbnailDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6, v2}, Lcom/miui/gallery/util/uil/BlobCache;->insert(J[B)V

    monitor-exit v3

    goto :goto_0

    :catchall_0
    move-exception p1

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    invoke-static {}, Lcom/miui/gallery/util/uil/MicroThumbCache;->getInstance()Lcom/miui/gallery/util/uil/MicroThumbCache;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/util/uil/MicroThumbCache;->save(Ljava/lang/String;Landroid/graphics/Bitmap;)Z

    move-result p1

    return p1

    :catchall_1
    move-exception p1

    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->close()V

    throw p1
.end method

.method public save(Ljava/lang/String;Ljava/io/InputStream;Lcom/nostra13/universalimageloader/utils/IoUtils$CopyListener;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "save: Stub!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
