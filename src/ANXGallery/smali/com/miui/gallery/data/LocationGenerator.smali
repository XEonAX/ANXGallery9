.class public Lcom/miui/gallery/data/LocationGenerator;
.super Ljava/lang/Object;
.source "LocationGenerator.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/data/LocationGenerator;


# instance fields
.field private CLOUD_PROJECTION:[Ljava/lang/String;

.field private mFuture:Lcom/miui/gallery/threadpool/Future;


# direct methods
.method private constructor <init>()V
    .locals 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "_id"

    const-string v1, "exifGPSLatitude"

    const-string v2, "exifGPSLatitudeRef"

    const-string v3, "exifGPSLongitude"

    const-string v4, "exifGPSLongitudeRef"

    const-string v5, "fileName"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/LocationGenerator;->CLOUD_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/data/LocationGenerator;)[Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/data/LocationGenerator;->CLOUD_PROJECTION:[Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/data/LocationGenerator;Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/data/LocationGenerator;->toValues(Ljava/lang/String;)Landroid/content/ContentValues;

    move-result-object p0

    return-object p0
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/data/LocationGenerator;
    .locals 2

    const-class v0, Lcom/miui/gallery/data/LocationGenerator;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/data/LocationGenerator;->sInstance:Lcom/miui/gallery/data/LocationGenerator;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/data/LocationGenerator;

    invoke-direct {v1}, Lcom/miui/gallery/data/LocationGenerator;-><init>()V

    sput-object v1, Lcom/miui/gallery/data/LocationGenerator;->sInstance:Lcom/miui/gallery/data/LocationGenerator;

    :cond_0
    sget-object v1, Lcom/miui/gallery/data/LocationGenerator;->sInstance:Lcom/miui/gallery/data/LocationGenerator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private toValues(Ljava/lang/String;)Landroid/content/ContentValues;
    .locals 2

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "location"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v1, "location"

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-object v0
.end method


# virtual methods
.method public declared-synchronized generate(Landroid/content/Context;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/data/LocationGenerator;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/LocationGenerator;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->isDone()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/data/LocationGenerator$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/data/LocationGenerator$1;-><init>(Lcom/miui/gallery/data/LocationGenerator;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/data/LocationGenerator;->mFuture:Lcom/miui/gallery/threadpool/Future;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized release()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/data/LocationGenerator;->mFuture:Lcom/miui/gallery/threadpool/Future;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/LocationGenerator;->mFuture:Lcom/miui/gallery/threadpool/Future;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/Future;->cancel()V

    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/miui/gallery/data/LocationGenerator;->sInstance:Lcom/miui/gallery/data/LocationGenerator;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
