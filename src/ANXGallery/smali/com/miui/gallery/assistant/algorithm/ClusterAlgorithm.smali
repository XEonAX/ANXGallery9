.class public Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;
.super Lcom/miui/gallery/assistant/algorithm/Algorithm;
.source "ClusterAlgorithm.java"


# instance fields
.field mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

.field mNativePtr:J


# direct methods
.method constructor <init>()V
    .locals 2

    const-wide/32 v0, 0xf51e1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/algorithm/Algorithm;-><init>(J)V

    return-void
.end method


# virtual methods
.method public declared-synchronized extractFeature([BII)[F
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mIsNativeInitiated:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    iget-wide v2, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mNativePtr:J

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;->extractFeature(J[BII)[F

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized getClusterResult([F[J[JI)Ljava/util/ArrayList;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([F[J[JI)",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/assistant/jni/cluster/Cluster;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mIsNativeInitiated:Z

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    iget-wide v2, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mNativePtr:J

    const/16 v8, 0x400

    move-object v4, p1

    move-object v5, p2

    move-object v6, p3

    move v7, p4

    invoke-virtual/range {v1 .. v8}, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;->getClusterResult(J[F[J[JII)Ljava/util/ArrayList;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

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
    iget-object v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mNativePtr:J

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;->nativeDestroy(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mNativePtr:J

    return-void
.end method

.method protected onInitAlgorithm()Z
    .locals 4

    new-instance v0, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    invoke-direct {v0}, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mImageClusterJNI:Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;

    const v1, 0x3f3db22d    # 0.741f

    const-wide/32 v2, 0x36ee80

    invoke-virtual {v0, v1, v2, v3}, Lcom/miui/gallery/assistant/jni/cluster/ImageClusterJNI;->nativeCreate(FJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->mNativePtr:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/ClusterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    const/4 v0, 0x0

    return v0
.end method
