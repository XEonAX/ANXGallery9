.class public Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;
.super Ljava/lang/Object;
.source "PeopleCoverManager.java"


# static fields
.field private static final SCORES:[I

.field private static final SCORE_STAGE:[I

.field private static sInstance:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;


# instance fields
.field private mCoverIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCoverStrategies:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/peoplecover/BaseStrategy;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mLoadPeopleCoverDone:Z

.field private mMaxCoverScore:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x8

    new-array v1, v0, [I

    fill-array-data v1, :array_0

    sput-object v1, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->SCORES:[I

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->SCORE_STAGE:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x1
        0xb
        0x6f
        0x457
        0x2b67
        0x1b207
        0x10f447
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x1
        0x2
        0x3
        0x4
        0x5
        0x6
        0x7
    .end array-data
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverStrategies:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mMaxCoverScore:I

    iput-boolean v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mLoadPeopleCoverDone:Z

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverImageSizeStrategy;

    const v1, 0x186a0

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverImageSizeStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverScaleStrategy;

    const/16 v1, 0x2710

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverScaleStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverCountStrategy;

    const/16 v1, 0x3e8

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverCountStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverCenterStrategy;

    const/16 v1, 0x64

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverCenterStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverEyeXStrategy;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverEyeXStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverEyeYStrategy;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverEyeYStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    new-instance v0, Lcom/miui/gallery/provider/peoplecover/CoverColorStrategy;

    const v1, 0xf4240

    invoke-direct {v0, v1}, Lcom/miui/gallery/provider/peoplecover/CoverColorStrategy;-><init>(I)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;)I
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->doChoosePeopleCover(Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;)I

    move-result p0

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;I)I
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->generatorScoreStage(I)I

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;FI)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->statPeopleCover(FI)V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->finishChoosePeopleCover()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverStrategies:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mMaxCoverScore:I

    return p0
.end method

.method private doChoosePeopleCover(Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;)I
    .locals 14

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v9, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->ONE_PERSON_URI:Landroid/net/Uri;

    sget-object v10, Lcom/miui/gallery/provider/peoplecover/BaseStrategy;->PROJECTION:[Ljava/lang/String;

    const/4 v11, 0x0

    const/4 v2, 0x2

    new-array v12, v2, [Ljava/lang/String;

    aput-object p1, v12, v1

    const/4 v1, 0x1

    const-string v2, "-1"

    aput-object v2, v12, v1

    const-string v1, "dateTaken DESC "

    new-instance v13, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$2;

    move-object v2, v13

    move-object v3, p0

    move-object v4, p1

    move-object/from16 v7, p2

    move-object/from16 v8, p3

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$2;-><init>(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;Ljava/lang/String;JLjava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;)V

    move-object v7, v0

    move-object v8, v9

    move-object v9, v10

    move-object v10, v11

    move-object v11, v12

    move-object v12, v1

    invoke-static/range {v7 .. v13}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private ensureLoadPeopleCoverDone()V
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mLoadPeopleCoverDone:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    monitor-enter v2

    :try_start_0
    iget-boolean v3, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mLoadPeopleCoverDone:Z

    if-nez v3, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->loadPeopleCover()V

    :cond_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "PeopleCoverManager"

    const-string v3, "wait for load cost : %d "

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private finishChoosePeopleCover()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverStrategies:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/peoplecover/BaseStrategy;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/peoplecover/BaseStrategy;->onFinish()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private generatorScoreStage(I)I
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->SCORES:[I

    array-length v0, v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    sget-object v3, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->SCORES:[I

    aget v3, v3, v2

    if-gt p1, v3, :cond_0

    move v1, v2

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v1
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->sInstance:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    invoke-direct {v1}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->sInstance:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->sInstance:Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private declared-synchronized loadPeopleCover()V
    .locals 8

    monitor-enter p0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    invoke-virtual {v3}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->getCoverId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v2, "PeopleCoverManager"

    const-string v3, "finish load people cover, cost time: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mLoadPeopleCoverDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private registerCoverStrategy(Lcom/miui/gallery/provider/peoplecover/BaseStrategy;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverStrategies:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mMaxCoverScore:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mMaxCoverScore:I

    return-void
.end method

.method private statPeopleCover(FI)V
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->SCORE_STAGE:[I

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorValueStage(F[I)I

    move-result p1

    const-string v0, "people"

    const-string v1, "people_cover_score"

    int-to-long v2, p1

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    const-string p1, "people"

    const-string v0, "people_cover_success_count"

    int-to-long v1, p2

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    return-void
.end method


# virtual methods
.method public getCoverIds()Ljava/util/ArrayList;
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->ensureLoadPeopleCoverDone()V

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public declared-synchronized onAccountDelete()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mCoverIds:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;->mLoadPeopleCoverDone:Z

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z

    const-string v0, "PeopleCoverManager"

    const-string v1, "on account delete"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setPeopleCover(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/provider/peoplecover/PeopleCover;I)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    if-nez p4, :cond_0

    new-instance p4, Lcom/miui/gallery/provider/peoplecover/PeopleCover;

    invoke-direct {p4, p1, p2, p3, p5}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, p4}, Lcom/miui/gallery/dao/base/EntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {p4, p2}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->setCoverId(Ljava/lang/String;)V

    invoke-virtual {p4, p3}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->setServerTag(Ljava/lang/String;)V

    invoke-virtual {p4, p5}, Lcom/miui/gallery/provider/peoplecover/PeopleCover;->setCoverScore(I)V

    invoke-virtual {v0, p4}, Lcom/miui/gallery/dao/base/EntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public startChooseCoverForAllPeople()V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PEOPLE_TAG_URI:Landroid/net/Uri;

    const-string v2, "serverId"

    const-string v3, "eTag"

    filled-new-array {v2, v3}, [Ljava/lang/String;

    move-result-object v2

    new-instance v6, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager$1;-><init>(Lcom/miui/gallery/provider/peoplecover/PeopleCoverManager;)V

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method
