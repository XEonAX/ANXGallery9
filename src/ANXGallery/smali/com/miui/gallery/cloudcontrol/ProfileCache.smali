.class Lcom/miui/gallery/cloudcontrol/ProfileCache;
.super Ljava/lang/Object;
.source "ProfileCache.java"


# instance fields
.field private mCloudCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/FeatureProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mCloudStrategyCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mIsLoadFinished:Z

.field private mLocalCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/FeatureProfile;",
            ">;"
        }
    .end annotation
.end field

.field private mLocalStrategyCache:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mPendingNotify:Z

.field private final mStatusSubject:Lio/reactivex/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/PublishSubject<",
            "Landroid/support/v4/util/Pair<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;",
            ">;>;"
        }
    .end annotation
.end field

.field private final mStrategySubject:Lio/reactivex/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/PublishSubject<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final mSyncLock:Ljava/lang/Object;


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalStrategyCache:Ljava/util/HashMap;

    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStatusSubject:Lio/reactivex/subjects/PublishSubject;

    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStrategySubject:Lio/reactivex/subjects/PublishSubject;

    return-void
.end method

.method public static synthetic lambda$loadFromDB$3(Lcom/miui/gallery/cloudcontrol/ProfileCache;JLandroid/database/Cursor;)Ljava/lang/Object;
    .locals 4

    if-eqz p3, :cond_1

    invoke-interface {p3}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :goto_0
    :try_start_0
    invoke-interface {p3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {p3}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->fromCursor(Landroid/database/Cursor;)Lcom/miui/gallery/cloudcontrol/FeatureDBItem;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v0, "CloudControl.ProfileCache"

    const-string v1, "Load %d items from database, cost %d ms."

    invoke-interface {p3}, Landroid/database/Cursor;->getCount()I

    move-result p3

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, p1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, v1, p3, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :cond_1
    const-string p1, "CloudControl.ProfileCache"

    const-string p2, "Fill cache failed with a null cursor."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    const/4 p1, 0x0

    return-object p1
.end method

.method static synthetic lambda$registerStatusObserver$0(Ljava/lang/String;Landroid/support/v4/util/Pair;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p1, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$registerStrategyObserver$1(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static synthetic lambda$registerStrategyObserver$2(Lcom/miui/gallery/cloudcontrol/ProfileCache;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Ljava/lang/String;)Landroid/support/v4/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Landroid/support/v4/util/Pair;

    invoke-virtual {p0, p3, p1, p2}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->queryStrategy(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object p1

    invoke-direct {v0, p3, p1}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method private loadFromDB(Landroid/content/Context;)V
    .locals 9

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$CloudControl;->URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/cloudcontrol/FeatureDBItem;->PROJECTION:[Ljava/lang/String;

    new-instance v8, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$bJ-QSGFgQAND9j-HqRhCDPAu3EE;

    invoke-direct {v8, p0, v0, v1}, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$bJ-QSGFgQAND9j-HqRhCDPAu3EE;-><init>(Lcom/miui/gallery/cloudcontrol/ProfileCache;J)V

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v2, p1

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    return-void
.end method

.method private loadFromLocalFile(Ljava/io/Reader;)V
    .locals 5

    :try_start_0
    new-instance v0, Lcom/google/gson/GsonBuilder;

    invoke-direct {v0}, Lcom/google/gson/GsonBuilder;-><init>()V

    const-class v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    new-instance v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Deserializer;

    invoke-direct {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Deserializer;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/google/gson/GsonBuilder;->registerTypeAdapter(Ljava/lang/reflect/Type;Ljava/lang/Object;)Lcom/google/gson/GsonBuilder;

    invoke-virtual {v0}, Lcom/google/gson/GsonBuilder;->create()Lcom/google/gson/Gson;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloudcontrol/ProfileCache$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloudcontrol/ProfileCache$1;-><init>(Lcom/miui/gallery/cloudcontrol/ProfileCache;)V

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/ProfileCache$1;->getType()Ljava/lang/reflect/Type;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/io/Reader;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    iget-object v3, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {p1}, Ljava/io/Reader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    :try_start_5
    const-string v1, "CloudControl.ProfileCache"

    const-string v2, "Failed to load from local file, errorClause: %s, errorMessage: %s."

    invoke-virtual {v0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v1

    const-string v2, "errorMsg"

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "cloud_control"

    const-string v2, "parse_local_file_failed"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    invoke-virtual {p1}, Ljava/io/Reader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-void

    :goto_2
    :try_start_7
    invoke-virtual {p1}, Ljava/io/Reader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_3
    throw v0
.end method

.method private notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStatusSubject:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Landroid/support/v4/util/Pair;

    invoke-static {p2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->fromValue(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object p2

    invoke-direct {v1, p1, p2}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method private notifyStrategyChanged(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStrategySubject:Lio/reactivex/subjects/PublishSubject;

    invoke-virtual {v0, p1}, Lio/reactivex/subjects/PublishSubject;->onNext(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method clearCloudCache()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_0
    sget-object v3, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v3

    :goto_1
    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method insertToCloudCache(Lcom/miui/gallery/cloudcontrol/FeatureProfile;)V
    .locals 6

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    iget-object v3, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v3

    :try_start_0
    sget-object v4, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->REMOVE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v4}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    if-eqz v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v5}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->getValue()Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    invoke-virtual {v2, p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setStrategy(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStrategyChanged(Ljava/lang/String;)V

    :cond_3
    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    invoke-virtual {v2, v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setStatus(Ljava/lang/String;)V

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    new-instance v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-direct {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;-><init>()V

    invoke-virtual {v2, p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setStrategy(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setStatus(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->setName(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStrategyChanged(Ljava/lang/String;)V

    :cond_5
    :goto_0
    monitor-exit v3

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method load(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->loadFromDB(Landroid/content/Context;)V

    new-instance v0, Ljava/io/InputStreamReader;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const/high16 v1, 0x7f0f0000

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->loadFromLocalFile(Ljava/io/Reader;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mIsLoadFinished:Z

    return-void
.end method

.method notifyAfterLoadFinished()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mPendingNotify:Z

    if-eqz v1, :cond_2

    const-string v1, "CloudControl.ProfileCache"

    const-string v2, "Notify all feature status after cache load finished:"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/CharSequence;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_0

    const-string v3, "CloudControl.ProfileCache"

    const-string v4, "Feature name: %s, feature status: %s"

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {v6}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {v4}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStatusChanged(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-direct {p0, v2}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->notifyStrategyChanged(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mPendingNotify:Z

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method queryStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mIsLoadFinished:Z

    if-eqz v1, :cond_3

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStatus()Ljava/lang/String;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    sget-object p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-object p1

    :cond_2
    :try_start_1
    invoke-static {v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->fromValue(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    monitor-exit v0

    return-object p1

    :catch_0
    sget-object p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    monitor-exit v0

    return-object p1

    :cond_3
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mPendingNotify:Z

    sget-object p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :cond_4
    sget-object p1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->UNAVAILABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    return-object p1
.end method

.method queryStrategy(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/miui/gallery/cloudcontrol/Merger<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mSyncLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-boolean v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mIsLoadFinished:Z

    if-eqz v2, :cond_9

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_1

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-object v3, v2

    goto :goto_1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v3, Lcom/google/gson/Gson;

    invoke-direct {v3}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v3, v2, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v3, :cond_3

    :try_start_2
    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;->doAdditionalProcessing()V

    iget-object v4, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mCloudStrategyCache:Ljava/util/HashMap;

    invoke-virtual {v4, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v4

    goto :goto_0

    :catch_1
    move-exception v4

    move-object v3, v1

    :goto_0
    :try_start_3
    const-string v5, "CloudControl.ProfileCache"

    const-string v6, "Failed to deserialize strategy: %s"

    invoke-static {v5, v6, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_2
    move-object v3, v1

    :cond_3
    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalStrategyCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_4

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {p2, v4}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object v1, v2

    check-cast v1, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    goto :goto_4

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalCache:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/FeatureProfile;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/FeatureProfile;->getStrategy()Ljava/lang/String;

    move-result-object v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    new-instance v4, Lcom/google/gson/Gson;

    invoke-direct {v4}, Lcom/google/gson/Gson;-><init>()V

    invoke-virtual {v4, v2, p2}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-eqz p2, :cond_5

    :try_start_5
    invoke-virtual {p2}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;->doAdditionalProcessing()V

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mLocalStrategyCache:Ljava/util/HashMap;

    invoke-virtual {v1, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    :catch_2
    move-exception p1

    move-object v1, p2

    goto :goto_3

    :cond_5
    :goto_2
    move-object v1, p2

    goto :goto_4

    :catch_3
    move-exception p1

    :goto_3
    :try_start_6
    const-string p2, "CloudControl.ProfileCache"

    const-string v4, "Failed to deserialize strategy: %s"

    invoke-static {p2, v4, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_6
    :goto_4
    if-eqz p3, :cond_7

    if-eqz v3, :cond_7

    if-eqz v1, :cond_7

    invoke-interface {p3, v1, v3}, Lcom/miui/gallery/cloudcontrol/Merger;->merge(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    monitor-exit v0

    return-object p1

    :cond_7
    if-eqz v3, :cond_8

    move-object v1, v3

    :cond_8
    monitor-exit v0

    return-object v1

    :cond_9
    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mPendingNotify:Z

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    throw p1
.end method

.method registerStatusObserver(Ljava/lang/String;Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStatusSubject:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$HNOzDu6Ro-kgTIQqQ1r-37KGiYQ;

    invoke-direct {v1, p1}, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$HNOzDu6Ro-kgTIQqQ1r-37KGiYQ;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->queryStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "feature should not be empty or null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method registerStrategyObserver(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Lcom/miui/gallery/cloudcontrol/Merger<",
            "TT;>;",
            "Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver<",
            "TT;>;)TT;"
        }
    .end annotation

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    if-eqz p4, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/ProfileCache;->mStrategySubject:Lio/reactivex/subjects/PublishSubject;

    new-instance v1, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$yAwWHb7U_Ylw3AFNqmwKhlTtTAg;

    invoke-direct {v1, p1}, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$yAwWHb7U_Ylw3AFNqmwKhlTtTAg;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;

    invoke-direct {v1, p0, p2, p3}, Lcom/miui/gallery/cloudcontrol/-$$Lambda$ProfileCache$1Q724HrxhEehynTQNZoEMTMnfGc;-><init>(Lcom/miui/gallery/cloudcontrol/ProfileCache;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0, p4}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/Observer;)V

    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/cloudcontrol/ProfileCache;->queryStrategy(Ljava/lang/String;Ljava/lang/Class;Lcom/miui/gallery/cloudcontrol/Merger;)Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;

    move-result-object p1

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "feature should not be empty or null."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method unregisterStatusObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;)V
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStatusObserver;->dispose()V

    :cond_0
    return-void
.end method

.method unregisterStrategyObserver(Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;)V
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;->isDisposed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/cloudcontrol/observers/FeatureStrategyObserver;->dispose()V

    :cond_0
    return-void
.end method
