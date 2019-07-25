.class public Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;
.super Lcom/miui/gallery/assistant/algorithm/Algorithm;
.source "SceneFilterAlgorithm.java"


# instance fields
.field private mNativePtr:J

.field private mSceneClassifyJNI:Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;


# direct methods
.method constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x3eb

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/algorithm/Algorithm;-><init>(J)V

    return-void
.end method


# virtual methods
.method public declared-synchronized getSceneResult([BII)Lcom/miui/gallery/assistant/jni/filter/SceneResult;
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mIsNativeInitiated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mSceneClassifyJNI:Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;

    iget-wide v2, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mNativePtr:J

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;->nativeGetImageSceneCls(J[BII)Lcom/miui/gallery/assistant/jni/filter/SceneResult;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catch_0
    move-exception p1

    :try_start_2
    iget-object p2, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected onDestroyAlgorithm()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mSceneClassifyJNI:Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mNativePtr:J

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;->nativeDestroy(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mNativePtr:J

    return-void
.end method

.method protected onInitAlgorithm()Z
    .locals 2

    new-instance v0, Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;

    invoke-direct {v0}, Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mSceneClassifyJNI:Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mSceneClassifyJNI:Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/jni/filter/SceneClassifyJNI;->nativeCreate()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->mNativePtr:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/SceneFilterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return v0
.end method
