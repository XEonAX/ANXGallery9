.class public abstract Lcom/miui/gallery/assistant/algorithm/Algorithm;
.super Ljava/lang/Object;
.source "Algorithm.java"


# static fields
.field public static final FLAG_FEATURE_ALL:I

.field public static final FLAG_FEATURE_ALL_ARRAY:[I


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private final mAlgorithmId:J

.field protected volatile mIsNativeInitiated:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0x15

    goto :goto_0

    :cond_0
    const/4 v0, 0x5

    :goto_0
    sput v0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL:I

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    goto :goto_1

    :cond_1
    const/4 v0, 0x2

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    :goto_1
    sput-object v0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    return-void

    :array_0
    .array-data 4
        0x1
        0x4
        0x10
    .end array-data

    :array_1
    .array-data 4
        0x1
        0x4
    .end array-data
.end method

.method constructor <init>(J)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z

    iput-wide p1, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mAlgorithmId:J

    return-void
.end method

.method private declared-synchronized destroy()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->onDestroyAlgorithm()V
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    :goto_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    invoke-direct {p0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->destroy()V

    return-void
.end method

.method declared-synchronized init()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    :try_start_1
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->onInitAlgorithm()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z
    :try_end_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/algorithm/Algorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->mIsNativeInitiated:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected abstract onDestroyAlgorithm()V
.end method

.method protected abstract onInitAlgorithm()Z
.end method

.method reportAlgorithmError(Ljava/lang/Throwable;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "algorithm"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "assistant"

    const-string v1, "assistant_algorithm_error"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
