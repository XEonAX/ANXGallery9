.class public Lcom/miui/gallery/util/uil/PhotoReusedBitCache;
.super Lcom/miui/gallery/util/ReusedBitmapCache;
.source "PhotoReusedBitCache.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/ReusedBitmapCache;-><init>()V

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/util/uil/PhotoReusedBitCache;
    .locals 2

    const-class v0, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->sInstance:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    invoke-direct {v1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;-><init>()V

    sput-object v1, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->sInstance:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->sInstance:Lcom/miui/gallery/util/uil/PhotoReusedBitCache;
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
.method protected getConfig()Landroid/graphics/Bitmap$Config;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/Config$BigPhotoConfig;->getBitmapConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    return-object v0
.end method

.method protected getMaxCount()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public declared-synchronized initFirstCacheBitmap()V
    .locals 2

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->isInBitmapSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache$1;-><init>(Lcom/miui/gallery/util/uil/PhotoReusedBitCache;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
