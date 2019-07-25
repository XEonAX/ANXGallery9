.class public Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;
.super Ljava/lang/Object;
.source "AlgorithmFactroy.java"


# static fields
.field private static final sAlgorithmCache:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/ref/SoftReference<",
            "Lcom/miui/gallery/assistant/algorithm/Algorithm;",
            ">;>;"
        }
    .end annotation
.end field

.field private static sRunnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sAlgorithmCache:Landroid/util/SparseArray;

    new-instance v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy$1;

    invoke-direct {v0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Landroid/util/SparseArray;
    .locals 1

    sget-object v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sAlgorithmCache:Landroid/util/SparseArray;

    return-object v0
.end method

.method private static declared-synchronized addAlgorithmToCache(ILcom/miui/gallery/assistant/algorithm/Algorithm;)V
    .locals 3

    const-class v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;

    monitor-enter v0

    if-nez p1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->getCacheKey(I)I

    move-result p0

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sAlgorithmCache:Landroid/util/SparseArray;

    new-instance v2, Ljava/lang/ref/SoftReference;

    invoke-direct {v2, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, p0, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->scheduleAlgorithmRelease()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static createAlgorithmByFlag(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;
    .locals 1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p0, Lcom/miui/gallery/assistant/algorithm/QualityScoreAlgorithm;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/algorithm/QualityScoreAlgorithm;-><init>()V

    goto :goto_1

    :cond_0
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;-><init>()V

    goto :goto_1

    :cond_1
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v0

    if-nez v0, :cond_4

    const/16 v0, 0x8

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const/16 v0, 0x10

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result p0

    if-eqz p0, :cond_3

    new-instance p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;-><init>()V

    goto :goto_1

    :cond_3
    const/4 p0, 0x0

    goto :goto_1

    :cond_4
    :goto_0
    new-instance p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;-><init>()V

    :goto_1
    if-eqz p0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->init()Z

    :cond_5
    return-object p0
.end method

.method private static ensureFlag(I)I
    .locals 2

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    const/4 v0, 0x2

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_1

    return v0

    :cond_1
    const/4 v0, 0x4

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-eqz v1, :cond_2

    return v0

    :cond_2
    const/16 v0, 0x8

    invoke-static {p0, v0}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result p0

    if-eqz p0, :cond_3

    return v0

    :cond_3
    const/16 p0, 0x10

    return p0
.end method

.method public static declared-synchronized getAlgorithmByFlag(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/assistant/algorithm/Algorithm;",
            ">(I)TT;"
        }
    .end annotation

    const-class v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;

    monitor-enter v0

    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->ensureFlag(I)I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->getAlgorithmFromCache(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->createAlgorithmByFlag(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;

    move-result-object v1

    const-string v2, "AlgorithmFactroy"

    const-string v3, "Create new algorithm %d"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string v2, "AlgorithmFactroy"

    const-string v3, "Get algorithm %d from Cache"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    if-eqz v1, :cond_1

    invoke-static {p0, v1}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->addAlgorithmToCache(ILcom/miui/gallery/assistant/algorithm/Algorithm;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static declared-synchronized getAlgorithmFromCache(I)Lcom/miui/gallery/assistant/algorithm/Algorithm;
    .locals 3

    const-class v0, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;

    monitor-enter v0

    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->getCacheKey(I)I

    move-result p0

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sAlgorithmCache:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/ref/SoftReference;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/algorithm/Algorithm;

    invoke-virtual {v1}, Ljava/lang/ref/SoftReference;->clear()V

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sAlgorithmCache:Landroid/util/SparseArray;

    invoke-virtual {v1, p0}, Landroid/util/SparseArray;->remove(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static getCacheKey(I)I
    .locals 1

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    return p0

    :cond_1
    :goto_0
    const/16 p0, 0xc

    return p0
.end method

.method private static scheduleAlgorithmRelease()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/assistant/algorithm/AlgorithmFactroy;->sRunnable:Ljava/lang/Runnable;

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
