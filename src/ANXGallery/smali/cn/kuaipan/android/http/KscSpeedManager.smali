.class public Lcn/kuaipan/android/http/KscSpeedManager;
.super Ljava/lang/Object;
.source "KscSpeedManager.java"


# instance fields
.field private mLatestEraseTime:J

.field private final mRecodeDuration:I

.field private final mRecordMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Landroid/util/SparseArray<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(I)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mLatestEraseTime:J

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecordMap:Ljava/util/HashMap;

    if-gez p1, :cond_0

    const/16 p1, 0x258

    :cond_0
    const/16 v0, 0xe10

    const/16 v1, 0x12c

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecodeDuration:I

    return-void
.end method

.method private appendRecoder(Ljava/lang/String;IF)V
    .locals 2

    iget-object v0, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecordMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/SparseArray;

    if-nez v0, :cond_0

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecordMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Float;

    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    move-result v1

    add-float/2addr v1, p3

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    invoke-direct {p0, p1, p2, p3}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    :cond_1
    return-void
.end method

.method private appendRecoders(Ljava/lang/String;IIF)V
    .locals 1

    if-lt p3, p2, :cond_0

    :goto_0
    if-gt p2, p3, :cond_2

    invoke-direct {p0, p1, p2, p4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    :goto_1
    const v0, 0x36ee80

    if-ge p2, v0, :cond_1

    invoke-direct {p0, p1, p2, p4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    :goto_2
    if-gt p2, p3, :cond_2

    invoke-direct {p0, p1, p2, p4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    :cond_2
    return-void
.end method

.method private static computeKey(J)I
    .locals 2

    const-wide/16 v0, 0x3e8

    div-long/2addr p0, v0

    const-wide/32 v0, 0x36ee80

    rem-long/2addr p0, v0

    long-to-int p0, p0

    return p0
.end method

.method public static current()J
    .locals 2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    return-wide v0
.end method

.method private eraseExpired()V
    .locals 12

    invoke-static {}, Lcn/kuaipan/android/http/KscSpeedManager;->current()J

    move-result-wide v0

    iget-wide v2, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mLatestEraseTime:J

    sub-long v2, v0, v2

    const-wide/32 v4, 0x493e0

    cmp-long v6, v2, v4

    if-gtz v6, :cond_0

    return-void

    :cond_0
    invoke-static {v0, v1}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v2

    iget v3, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecodeDuration:I

    sub-int v3, v2, v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    const/4 v5, 0x1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    :goto_0
    new-instance v6, Ljava/util/LinkedList;

    invoke-direct {v6}, Ljava/util/LinkedList;-><init>()V

    iget-object v7, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecordMap:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_9

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/Map$Entry;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v8}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/util/SparseArray;

    if-eqz v5, :cond_5

    const/4 v10, 0x0

    :goto_2
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v11

    if-ge v10, v11, :cond_8

    invoke-virtual {v8, v10}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v11

    if-le v11, v2, :cond_3

    if-ge v11, v3, :cond_3

    invoke-virtual {v8, v11}, Landroid/util/SparseArray;->delete(I)V

    goto :goto_2

    :cond_3
    if-lt v11, v3, :cond_4

    goto :goto_5

    :cond_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_5
    const/4 v10, 0x0

    :goto_3
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v11

    if-ge v10, v11, :cond_8

    invoke-virtual {v8, v10}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v11

    if-gt v11, v2, :cond_7

    if-ge v11, v3, :cond_6

    goto :goto_4

    :cond_6
    add-int/lit8 v10, v10, 0x1

    goto :goto_3

    :cond_7
    :goto_4
    invoke-virtual {v8, v11}, Landroid/util/SparseArray;->delete(I)V

    goto :goto_3

    :cond_8
    :goto_5
    invoke-virtual {v8}, Landroid/util/SparseArray;->size()I

    move-result v8

    if-gtz v8, :cond_2

    invoke-virtual {v6, v9}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_9
    invoke-virtual {v6}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_6
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mRecordMap:Ljava/util/HashMap;

    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_6

    :cond_a
    iput-wide v0, p0, Lcn/kuaipan/android/http/KscSpeedManager;->mLatestEraseTime:J

    return-void
.end method


# virtual methods
.method public getMoniter(Ljava/lang/String;)Lcn/kuaipan/android/http/KscSpeedMonitor;
    .locals 1

    new-instance v0, Lcn/kuaipan/android/http/KscSpeedMonitor;

    invoke-direct {v0, p0, p1}, Lcn/kuaipan/android/http/KscSpeedMonitor;-><init>(Lcn/kuaipan/android/http/KscSpeedManager;Ljava/lang/String;)V

    return-object v0
.end method

.method public declared-synchronized recoder(Ljava/lang/String;JJF)V
    .locals 16

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    move/from16 v4, p6

    monitor-enter p0

    cmp-long v5, p4, p2

    if-ltz v5, :cond_3

    const/4 v5, 0x0

    cmpg-float v5, v4, v5

    if-gez v5, :cond_0

    goto :goto_1

    :cond_0
    const-wide/16 v5, 0x3e8

    :try_start_0
    div-long v7, p2, v5

    div-long v9, p4, v5

    cmp-long v11, v9, v7

    if-nez v11, :cond_1

    invoke-static/range {p2 .. p3}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v2

    invoke-direct {v1, v0, v2, v4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    goto :goto_0

    :cond_1
    const/4 v11, 0x0

    sub-long/2addr v9, v7

    const-wide/16 v7, 0x1

    cmp-long v11, v9, v7

    if-gtz v11, :cond_2

    sub-long v7, p4, p2

    rem-long v9, p2, v5

    const/4 v11, 0x0

    sub-long v9, v5, v9

    long-to-float v9, v9

    mul-float v9, v9, v4

    long-to-float v7, v7

    div-float/2addr v9, v7

    rem-long v5, p4, v5

    long-to-float v5, v5

    mul-float v4, v4, v5

    div-float/2addr v4, v7

    invoke-static/range {p2 .. p3}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v2

    invoke-static/range {p4 .. p5}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v3

    invoke-direct {v1, v0, v2, v9}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    invoke-direct {v1, v0, v3, v4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    goto :goto_0

    :cond_2
    const/4 v11, 0x0

    sub-long v11, p4, p2

    rem-long v13, p2, v5

    const/4 v15, 0x0

    sub-long v7, v5, v13

    long-to-float v7, v7

    mul-float v7, v7, v4

    long-to-float v8, v11

    div-float/2addr v7, v8

    rem-long v5, p4, v5

    long-to-float v5, v5

    mul-float v5, v5, v4

    div-float/2addr v5, v8

    sub-float/2addr v4, v7

    sub-float/2addr v4, v5

    const-wide/16 v11, 0x1

    sub-long/2addr v9, v11

    long-to-float v6, v9

    div-float/2addr v4, v6

    invoke-static/range {p2 .. p3}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v2

    invoke-static/range {p4 .. p5}, Lcn/kuaipan/android/http/KscSpeedManager;->computeKey(J)I

    move-result v3

    invoke-direct {v1, v0, v2, v7}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    invoke-direct {v1, v0, v3, v5}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoder(Ljava/lang/String;IF)V

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v3, v3, -0x1

    invoke-direct {v1, v0, v2, v3, v4}, Lcn/kuaipan/android/http/KscSpeedManager;->appendRecoders(Ljava/lang/String;IIF)V

    :goto_0
    invoke-direct/range {p0 .. p0}, Lcn/kuaipan/android/http/KscSpeedManager;->eraseExpired()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    :cond_3
    :goto_1
    monitor-exit p0

    return-void
.end method
