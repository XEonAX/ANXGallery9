.class public Lcom/miui/gallery/util/uil/PhotoBytesCache;
.super Ljava/lang/Object;
.source "PhotoBytesCache.java"

# interfaces
.implements Lcom/miui/gallery/imageloader/GalleryImageLoaderCache$IPhotoBytesCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/uil/PhotoBytesCache$Singleton;
    }
.end annotation


# instance fields
.field private mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

.field private mLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/io/File;II)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mLock:Ljava/lang/Object;

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z

    goto :goto_0

    :catch_0
    move-exception p2

    goto :goto_1

    :cond_0
    :goto_0
    new-instance v6, Lcom/miui/gallery/util/uil/BlobCache;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "photo_blob"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    const/4 v5, 0x4

    move-object v0, v6

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/uil/BlobCache;-><init>(Ljava/lang/String;IIZI)V

    iput-object v6, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    const-string p3, "PhotoBytesCache"

    invoke-static {p3, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/util/uil/PhotoBytesCache;->recordInitError(Ljava/lang/Exception;Ljava/io/File;)V

    :goto_2
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;IILcom/miui/gallery/util/uil/PhotoBytesCache$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/util/uil/PhotoBytesCache;-><init>(Ljava/io/File;II)V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/util/uil/PhotoBytesCache;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoBytesCache$Singleton;->access$100()Lcom/miui/gallery/util/uil/PhotoBytesCache;

    move-result-object v0

    return-object v0
.end method

.method private recordInitError(Ljava/lang/Exception;Ljava/io/File;)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/imageloader/ImageLoaderSamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "cacheDir"

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "exception"

    invoke-virtual {p1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "pager_decode_bitmap"

    const-string p2, "pager_photo_cache_init_error"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/imageloader/ImageLoaderSamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public getData(Ljava/lang/String;)[B
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    if-eqz v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/miui/gallery/util/uil/BlobCache;->lookup(J)[B

    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v1, "PhotoBytesCache"

    const-string v5, "getData [%s] cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const/4 v8, 0x0

    sub-long/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v5, p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v1, v4

    goto :goto_1

    :catch_0
    move-exception p1

    move-object v1, v4

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_1
    move-exception p1

    :goto_0
    :try_start_2
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_1
    monitor-exit v0

    return-object v1

    :goto_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public putData(Ljava/lang/String;[B)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    :try_start_1
    const-string v1, "PhotoBytesCache"

    const-string v2, "Save data size %d"

    array-length v3, p2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/miui/gallery/util/uil/PhotoBytesCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v2

    invoke-virtual {v1, v2, v3, p2}, Lcom/miui/gallery/util/uil/BlobCache;->insert(J[B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "PhotoBytesCache"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    monitor-exit v0

    return p1

    :cond_0
    :goto_0
    const/4 p1, 0x1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
