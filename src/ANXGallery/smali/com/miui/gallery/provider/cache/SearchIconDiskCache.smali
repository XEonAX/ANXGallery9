.class Lcom/miui/gallery/provider/cache/SearchIconDiskCache;
.super Ljava/lang/Object;
.source "SearchIconDiskCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/SearchIconDiskCache$SingletonHolder;
    }
.end annotation


# instance fields
.field private mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

.field private final mLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/io/File;II)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mLock:Ljava/lang/Object;

    if-eqz p1, :cond_0

    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/util/FileUtils;->createFolder(Ljava/io/File;Z)Z

    goto :goto_0

    :catch_0
    move-exception p1

    goto :goto_1

    :cond_0
    :goto_0
    new-instance v6, Lcom/miui/gallery/util/uil/BlobCache;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object p1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "search_icon_blob"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, v6

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/uil/BlobCache;-><init>(Ljava/lang/String;IIZI)V

    iput-object v6, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :goto_1
    const-string p2, "SearchIconDiskCache"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_2
    return-void
.end method

.method synthetic constructor <init>(Ljava/io/File;IILcom/miui/gallery/provider/cache/SearchIconDiskCache$1;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;-><init>(Ljava/io/File;II)V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/provider/cache/SearchIconDiskCache;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchIconDiskCache$SingletonHolder;->access$100()Lcom/miui/gallery/provider/cache/SearchIconDiskCache;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method getIcon(Ljava/lang/String;)Lcom/miui/gallery/provider/cache/SearchIconItem;
    .locals 5

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    if-eqz v2, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Lcom/miui/gallery/util/uil/BlobCache;->lookup(J)[B

    move-result-object p1

    if-eqz p1, :cond_1

    sget-object v2, Lcom/miui/gallery/provider/cache/SearchIconItem;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-static {p1, v2}, Lcom/miui/gallery/util/ParcelableUtil;->unmarshall([BLandroid/os/Parcelable$Creator;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/cache/SearchIconItem;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-object v0, p1

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :catch_0
    move-exception p1

    :try_start_1
    const-string v2, "SearchIconDiskCache"

    invoke-static {v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    monitor-exit v1

    return-object v0

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method putIcon(Ljava/lang/String;Lcom/miui/gallery/provider/cache/SearchIconItem;)Z
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_1

    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchIconDiskCache;->mBlobCache:Lcom/miui/gallery/util/uil/BlobCache;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->crc64Long([B)J

    move-result-wide v3

    invoke-static {p2}, Lcom/miui/gallery/util/ParcelableUtil;->marshall(Landroid/os/Parcelable;)[B

    move-result-object p1

    invoke-virtual {v2, v3, v4, p1}, Lcom/miui/gallery/util/uil/BlobCache;->insert(J[B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string p2, "SearchIconDiskCache"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    monitor-exit v1

    return v0

    :cond_1
    :goto_0
    const/4 p1, 0x1

    monitor-exit v1

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :cond_2
    :goto_1
    return v0
.end method
