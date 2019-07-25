.class public Lcom/miui/gallery/card/CardManager;
.super Ljava/lang/Object;
.source "CardManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/CardManager$ServerIdSha1Pair;,
        Lcom/miui/gallery/card/CardManager$CardObserver;,
        Lcom/miui/gallery/card/CardManager$CardObserverHolder;,
        Lcom/miui/gallery/card/CardManager$CardCache;
    }
.end annotation


# static fields
.field public static final CONVERT_PROJECTION:[Ljava/lang/String;

.field private static sInstance:Lcom/miui/gallery/card/CardManager;


# instance fields
.field private mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

.field private final mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "serverId"

    const-string v1, "sha1"

    filled-new-array {v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/card/CardManager;->CONVERT_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/card/CardManager$CardObserverHolder;-><init>(Lcom/miui/gallery/card/CardManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/card/CardManager;->mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/CardManager;)Lcom/miui/gallery/card/CardManager$CardCache;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/card/CardManager;)Lcom/miui/gallery/card/CardManager$CardObserverHolder;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/CardManager;->mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/card/CardManager;Ljava/util/List;)Ljava/util/Map;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->getImageFeatureMap(Ljava/util/List;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/card/CardManager;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->triggerGuaranteeScenariosInternal(Z)V

    return-void
.end method

.method private declared-synchronized addInternal(Lcom/miui/gallery/card/Card;)V
    .locals 3

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v0, "CardManager"

    const-string v1, "Card %s exist in db, do not insert again!"

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/dao/base/EntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/card/CardManager$1;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/card/CardManager$1;-><init>(Lcom/miui/gallery/card/CardManager;Lcom/miui/gallery/card/Card;)V

    invoke-virtual {v1, v2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    const-string p1, "CardManager"

    const-string v1, "add result %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private createNewCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;
    .locals 11

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v1

    const/16 v2, 0x2af8

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v2, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    new-instance v2, Lcom/miui/gallery/card/Card$Builder;

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v5

    invoke-direct {v2, v5}, Lcom/miui/gallery/card/Card$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTitle()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setDescription(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Lcom/miui/gallery/card/Card$Builder;->setDeletable(Z)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setScenarioId(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setServerId(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/card/Card$Builder;->setServerTag(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isAppCreate()Z

    move-result v5

    xor-int/2addr v5, v4

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setCreateBy(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getSortTime()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/card/Card$Builder;->setCreateTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/card/Card$Builder;->setUpdateTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getValidStartDate()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/card/Card$Builder;->setValidStartTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getValidEndDate()J

    move-result-wide v5

    invoke-virtual {v2, v5, v6}, Lcom/miui/gallery/card/Card$Builder;->setValidEndTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isTop()Z

    move-result v5

    invoke-virtual {v2, v5}, Lcom/miui/gallery/card/Card$Builder;->setTop(Z)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v2

    const/4 v5, 0x2

    if-nez v1, :cond_8

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v1

    const-class v6, Lcom/miui/gallery/card/Card$CardExtraInfo;

    invoke-static {v1, v6}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/Card$CardExtraInfo;

    if-eqz v1, :cond_2

    iget-object v6, v1, Lcom/miui/gallery/card/Card$CardExtraInfo;->uniqueKey:Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    iget-boolean v1, v1, Lcom/miui/gallery/card/Card$CardExtraInfo;->isIgnored:Z

    goto :goto_1

    :cond_2
    move-object v6, v0

    const/4 v1, 0x0

    :goto_1
    if-nez v1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isAppCreate()Z

    move-result v7

    if-nez v7, :cond_4

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAssistantScenarioStrategy()Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;

    move-result-object v7

    if-eqz v7, :cond_4

    invoke-virtual {v7}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getLocalScenarioRules()Ljava/util/List;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;

    invoke-virtual {v8}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;->getScenarioId()I

    move-result v8

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v9

    if-ne v8, v9, :cond_3

    const/4 v1, 0x1

    goto :goto_2

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v7

    if-nez v7, :cond_5

    return-object v0

    :cond_5
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v7

    invoke-virtual {v7}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getMediaList()Ljava/util/List;

    move-result-object v7

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v8

    invoke-virtual {v8}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getAllMediaList()Ljava/util/List;

    move-result-object v8

    if-nez v8, :cond_6

    move-object v8, v7

    :cond_6
    invoke-static {v7}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    invoke-static {v7}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v9

    if-nez v9, :cond_7

    return-object v0

    :cond_7
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v9

    invoke-virtual {v9}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getCoverMediaList()Ljava/util/List;

    move-result-object v9

    invoke-virtual {v2, v3}, Lcom/miui/gallery/card/Card$Builder;->setType(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v10

    invoke-virtual {v10, v0}, Lcom/miui/gallery/card/Card$Builder;->setImageUri(Landroid/net/Uri;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    const-string v10, "album"

    invoke-static {v10}, Lcom/miui/gallery/card/CardUtil;->getAlbumUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v10

    invoke-virtual {v10}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Lcom/miui/gallery/card/Card$Builder;->setDetailUrl(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v6}, Lcom/miui/gallery/card/Card$Builder;->setUniqueKey(Lcom/miui/gallery/card/scenario/Record$UniqueKey;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-static {v8}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/miui/gallery/card/Card$Builder;->setAllMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v7}, Lcom/miui/gallery/card/Card$Builder;->setSelectedMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-static {v9}, Lcom/miui/gallery/card/CardUtil;->getCoverMediaItemsByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    invoke-virtual {v0, v6}, Lcom/miui/gallery/card/Card$Builder;->setCoverMediaFeatureItems(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v4}, Lcom/miui/gallery/card/Card$Builder;->setSyncable(Z)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/Card$Builder;->setIsIgnored(Z)Lcom/miui/gallery/card/Card$Builder;

    goto :goto_3

    :cond_8
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getOperationInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;

    move-result-object v0

    invoke-virtual {v2, v0}, Lcom/miui/gallery/card/Card$Builder;->setOperationInfo(Lcom/miui/gallery/cloud/card/model/CardInfo$OperationInfo;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    const-string v1, "operation"

    invoke-static {v1}, Lcom/miui/gallery/card/CardUtil;->getAlbumUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/Card$Builder;->setDetailUrl(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/card/Card$Builder;->setSyncable(Z)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Lcom/miui/gallery/card/Card$Builder;->setType(I)Lcom/miui/gallery/card/Card$Builder;

    :goto_3
    invoke-virtual {v2}, Lcom/miui/gallery/card/Card$Builder;->build()Lcom/miui/gallery/card/Card;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/CardManager;->updateCardCoversIfNecessary(Lcom/miui/gallery/card/Card;)Z

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isStatusDelete()Z

    move-result p1

    if-eqz p1, :cond_9

    const/4 p1, 0x4

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    :cond_9
    invoke-virtual {p0, v0, v3}, Lcom/miui/gallery/card/CardManager;->add(Lcom/miui/gallery/card/Card;Z)V

    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->getInstance()Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->getMovieTemplateFromCard(Lcom/miui/gallery/card/Card;)I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->downloadTemplate(Landroid/content/Context;I)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getType()I

    move-result v1

    if-ne v1, v5, :cond_a

    const-string v1, "server_id"

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_a
    const-string v1, "scenario_id"

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_server_card_created"

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method private declared-synchronized deleteInternal(Lcom/miui/gallery/card/Card;Z)V
    .locals 2

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    if-eqz p2, :cond_1

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result p2

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    :cond_1
    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result p2

    :goto_0
    if-eqz p2, :cond_2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/CardManager$2;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/card/CardManager$2;-><init>(Lcom/miui/gallery/card/CardManager;Lcom/miui/gallery/card/Card;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_2
    const-string p1, "CardManager"

    const-string v0, "delete result %s"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0

    throw p1
.end method

.method private getDuplicatedCard(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;
    .locals 8

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isAppCreate()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "ignored = 0 AND scenarioId = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, " AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "createTime"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " > "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/32 v4, 0x5265c00

    sub-long/2addr v2, v4

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " AND "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "localFlag"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v7, 0x0

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s,%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v0, v2, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-class v2, Lcom/miui/gallery/card/Card;

    const/4 v4, 0x0

    const-string v5, "createTime desc"

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/Card;

    invoke-static {v0, p1}, Lcom/miui/gallery/card/CardUtil;->isDuplicated(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private getImageFeatureMap(Ljava/util/List;)Ljava/util/Map;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/assistant/model/ImageFeature;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/assistant/model/ImageFeature;

    const-string v3, "sha1 IN (\'%s\') "

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const-string v6, "\',\'"

    invoke-static {v6, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const-string v5, "score desc"

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/card/CardManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/card/CardManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/card/CardManager;->sInstance:Lcom/miui/gallery/card/CardManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/card/CardManager;

    invoke-direct {v1}, Lcom/miui/gallery/card/CardManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/card/CardManager;->sInstance:Lcom/miui/gallery/card/CardManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/card/CardManager;->sInstance:Lcom/miui/gallery/card/CardManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private mergeCardFromServer(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V
    .locals 5

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getMediaList()Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getAllMediaList()Ljava/util/List;

    move-result-object v1

    :goto_1
    if-nez v1, :cond_2

    move-object v1, v0

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/card/Card$CardExtraInfo;

    invoke-static {v2, v3}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/card/Card$CardExtraInfo;

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getSortTime()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/card/Card;->setCreateTime(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    invoke-virtual {p1, v2}, Lcom/miui/gallery/card/Card;->setCardExtraInfo(Lcom/miui/gallery/card/Card$CardExtraInfo;)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getAllMediaSha1s()Ljava/util/List;

    move-result-object v2

    invoke-static {v1}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/card/CardManager;->mergeSha1s(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/card/Card;->setAllMediaSha1s(Ljava/util/List;)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v1

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/card/CardManager;->mergeSha1s(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    const-string v1, "mergeFromServerDupCard"

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setScenarioId(I)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setServerId(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setServerTag(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isAppCreate()Z

    move-result p2

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/Card;->setCreateBy(I)V

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    :cond_3
    return-void
.end method

.method private mergeSha1s(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_0
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object p1
.end method

.method private declared-synchronized triggerGuaranteeScenariosInternal(Z)V
    .locals 10

    monitor-enter p0

    :try_start_0
    const-string v2, "ignored = 0"

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/Card;

    const/4 v3, 0x0

    const/4 v4, 0x0

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s,%s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "CardManager"

    const-string v0, "Card exists,no need trigger guarantee card!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;

    invoke-direct {v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->triggerGuaranteeScenario()V

    if-eqz p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setLastGuaranteeTriggerTime(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_2
    const-string v0, "CardManager"

    const-string v1, "trigger scenario occur error.\n"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized updateCardCoversIfNecessary(Lcom/miui/gallery/card/Card;)Z
    .locals 11

    monitor-enter p0

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isCoversNeedRefresh()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_0

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    const-string v4, "remove_duplicate_items"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v5

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "(localGroupId!=-1000) AND "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "%s IN (\'%s\')"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "sha1"

    aput-object v7, v6, v1

    const-string v1, "\',\'"

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v6, v2

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v4

    sget-object v6, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->MEDIA_PROJECTION:[Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "alias_create_time DESC"

    new-instance v10, Lcom/miui/gallery/card/CardManager$5;

    invoke-direct {v10, p0, v0, p1}, Lcom/miui/gallery/card/CardManager$5;-><init>(Lcom/miui/gallery/card/CardManager;Ljava/util/List;Lcom/miui/gallery/card/Card;)V

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return v2

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->isCoverMediaPathEmpty(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->downloadCoverThumb(Ljava/util/List;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setCoverMediaFeatureItems(Ljava/util/List;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return v2

    :cond_2
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private updateCardFromServerInternal(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V
    .locals 5

    if-eqz p2, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerTag()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    goto/16 :goto_3

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    move-object v0, v1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getMediaList()Ljava/util/List;

    move-result-object v0

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v2

    if-nez v2, :cond_2

    move-object v2, v1

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getAllMediaList()Ljava/util/List;

    move-result-object v2

    :goto_1
    if-nez v2, :cond_3

    move-object v2, v0

    :cond_3
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v3

    if-nez v3, :cond_4

    goto :goto_2

    :cond_4
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getCoverMediaList()Ljava/util/List;

    move-result-object v1

    :goto_2
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTitle()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/Card;->setTitle(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getDescription()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/Card;->setDescription(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getScenarioId()I

    move-result v3

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/Card;->setScenarioId(I)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/Card;->setServerId(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    invoke-static {v2}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/card/Card;->setAllMediaSha1s(Ljava/util/List;)V

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    const-string v2, "updateCardFromServer"

    invoke-virtual {p1, v0, v2}, Lcom/miui/gallery/card/Card;->setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/miui/gallery/card/CardUtil;->getCoverMediaItemsByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setCoverMediaFeatureItems(Ljava/util/List;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setServerTag(J)V

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    return-void

    :cond_5
    :goto_3
    return-void
.end method

.method private declared-synchronized updateInternal(Lcom/miui/gallery/card/Card;)V
    .locals 3

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/card/CardManager$4;

    invoke-direct {v2, p0, p1}, Lcom/miui/gallery/card/CardManager$4;-><init>(Lcom/miui/gallery/card/CardManager;Lcom/miui/gallery/card/Card;)V

    invoke-virtual {v1, v2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_1
    const-string p1, "CardManager"

    const-string v1, "update result %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public declared-synchronized add(Lcom/miui/gallery/card/Card;Z)V
    .locals 3

    monitor-enter p0

    if-eqz p1, :cond_6

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    :cond_0
    const/4 v0, 0x3

    if-eqz p2, :cond_1

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/card/Card;->setCreateTime(J)V

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isIgnored()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    goto :goto_0

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result v1

    const/4 v2, 0x4

    if-eq v1, v2, :cond_3

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    :cond_3
    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->addInternal(Lcom/miui/gallery/card/Card;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setHasCardEver()V

    if-nez p2, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result p1

    if-eq p1, v0, :cond_5

    :cond_4
    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x44

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_5
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1

    :cond_6
    :goto_1
    monitor-exit p0

    return-void
.end method

.method public createOperationCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->createNewCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method

.method public declared-synchronized delete(Lcom/miui/gallery/card/Card;Z)V
    .locals 4

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    const-string v0, "CardManager"

    const-string v1, "delete card %s"

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result p2

    if-eqz p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isSyncable()Z

    move-result p2

    if-nez p2, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->updateInternal(Lcom/miui/gallery/card/Card;)V

    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x44

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/card/CardManager;->deleteInternal(Lcom/miui/gallery/card/Card;Z)V

    goto :goto_1

    :cond_3
    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/card/CardManager;->deleteInternal(Lcom/miui/gallery/card/Card;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getCardByCardId(J)Lcom/miui/gallery/card/Card;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/card/CardManager$CardCache;->getCard(J)Lcom/miui/gallery/card/Card;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;
    .locals 8

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-string v0, "serverId = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v2, v7

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-nez p2, :cond_0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " AND ignored = 0"

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    move-object v3, p1

    const-class v2, Lcom/miui/gallery/card/Card;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/card/Card;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCardInfoFromCard(Lcom/miui/gallery/card/Card;)Lcom/miui/gallery/card/CardSyncInfo;
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getSelectedMediaSha1s()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/card/CardManager;->getServerIdSha1PairBySha1s(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getAllMediaSha1s()Ljava/util/List;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/card/CardManager;->getServerIdSha1PairBySha1s(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCoverMediaFeatureItems()Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/card/CardSyncInfo;->newBuilder()Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setName(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getScenarioId()I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setScenarioId(I)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    const-string v4, "normal"

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setStatus(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->generateDuplicateKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setDuplicateKey(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setDescription(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-static {v0}, Lcom/miui/gallery/card/CardManager$ServerIdSha1Pair;->getServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v3

    invoke-static {v1}, Lcom/miui/gallery/card/CardManager$ServerIdSha1Pair;->getServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v3, v1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setAllMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v1

    invoke-static {v0, v2}, Lcom/miui/gallery/card/CardManager$ServerIdSha1Pair;->getServerIdsOfCover(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setCoverMediaList(Ljava/util/List;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCardExtraInfo()Lcom/miui/gallery/card/Card$CardExtraInfo;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setExtraInfo(Ljava/lang/String;)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getCreateTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->setSortTime(J)Lcom/miui/gallery/card/CardSyncInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/card/CardSyncInfo$Builder;->build()Lcom/miui/gallery/card/CardSyncInfo;

    move-result-object p1

    return-object p1
.end method

.method public getLoadedCard()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    return-object v0
.end method

.method public getServerIdSha1PairBySha1s(Ljava/util/List;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/CardManager$ServerIdSha1Pair;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    const-string v0, "%s IN (\'%s\')"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v3, "sha1"

    const/4 v5, 0x0

    aput-object v3, v1, v5

    const-string v3, "\',\'"

    invoke-static {v3, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const-string p1, "%s DESC"

    new-array v0, v2, [Ljava/lang/Object;

    const-string v1, "alias_create_time"

    aput-object v1, v0, v5

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    sget-object v5, Lcom/miui/gallery/card/CardManager;->CONVERT_PROJECTION:[Ljava/lang/String;

    new-instance v9, Lcom/miui/gallery/card/CardManager$8;

    invoke-direct {v9, p0}, Lcom/miui/gallery/card/CardManager$8;-><init>(Lcom/miui/gallery/card/CardManager;)V

    const/4 v7, 0x0

    invoke-static/range {v3 .. v9}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method

.method public getUnsynchronizedCards(I)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;"
        }
    .end annotation

    if-gtz p1, :cond_0

    const/16 p1, 0xa

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s,%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v4

    const-class v5, Lcom/miui/gallery/card/Card;

    sget-object v6, Lcom/miui/gallery/card/Card;->BASE_UNSYNC_CARD_SELECTION:Ljava/lang/String;

    const/4 v7, 0x0

    const-string v8, "createTime desc"

    invoke-virtual/range {v4 .. v9}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public declared-synchronized loadMoreCard()Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/Card;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    invoke-virtual {v0}, Lcom/miui/gallery/card/CardManager$CardCache;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%s,%s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v4, v1

    const/4 v0, 0x1

    const/16 v1, 0x14

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v4, v0

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v5

    const-class v6, Lcom/miui/gallery/card/Card;

    sget-object v7, Lcom/miui/gallery/card/Card;->BASE_UI_CARD_SELECTION:Ljava/lang/String;

    const/4 v8, 0x0

    const-string v9, "createTime desc"

    invoke-virtual/range {v5 .. v10}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    if-nez v1, :cond_1

    new-instance v1, Lcom/miui/gallery/card/CardManager$CardCache;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/miui/gallery/card/CardManager$CardCache;-><init>(Lcom/miui/gallery/card/CardManager;Lcom/miui/gallery/card/CardManager$1;)V

    iput-object v1, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    :cond_1
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/card/CardManager$CardCache;->addCards(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_2
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized onAccountDelete()V
    .locals 3

    monitor-enter p0

    :try_start_0
    const-string v0, "CardManager"

    const-string v1, "onAccountDelete"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    invoke-virtual {v0}, Lcom/miui/gallery/card/CardManager$CardCache;->clear()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/Card;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/scenario/Record;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/SyncTag;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->deleteAll(Ljava/lang/Class;)Z

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    const/4 v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->onCardDeleted(ILcom/miui/gallery/card/Card;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v1, 0x6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancelAll(I)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_2
    const-string v1, "CardManager"

    const-string v2, "onAccountDelete occur error.\n"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public onDeleteImages(Ljava/util/List;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/card/CardManager;->mCardCache:Lcom/miui/gallery/card/CardManager$CardCache;

    invoke-virtual {v2}, Lcom/miui/gallery/card/CardManager$CardCache;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/Card;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/Card;->removeImages(Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "ImageDeleteOutside"

    invoke-virtual {p0, v1}, Lcom/miui/gallery/card/CardManager;->recordCardImageEmptyReason(Ljava/lang/String;)V

    :cond_0
    invoke-virtual {p0, v0, v3}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getCreateTime()J

    move-result-wide v0

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ignored = 0 AND localFlag NOT IN (1,-2,-1,4) AND createTime<"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    const-class v5, Lcom/miui/gallery/card/Card;

    const/4 v7, 0x0

    const-string v8, "createTime desc"

    const/4 v9, 0x0

    invoke-virtual/range {v4 .. v9}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/Card;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/card/Card;->removeImages(Ljava/util/List;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, "ImageDeleteOutside"

    invoke-virtual {p0, v2}, Lcom/miui/gallery/card/CardManager;->recordCardImageEmptyReason(Ljava/lang/String;)V

    :cond_4
    invoke-virtual {p0, v1, v3}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    goto :goto_1

    :cond_5
    return-void
.end method

.method public recordCardDeleteReason(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "reason"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "assistant"

    const-string v1, "assistant_card_delete_card_reason"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p1, "CardManager"

    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public recordCardImageEmptyReason(Ljava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    const-string v1, "from"

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "assistant"

    const-string v1, "assistant_card_remove_all_image"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GalleryStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string p1, "CardManager"

    new-instance v0, Ljava/lang/Throwable;

    invoke-direct {v0}, Ljava/lang/Throwable;-><init>()V

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public registerObserver(Lcom/miui/gallery/card/CardManager$CardObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public triggerGuaranteeScenarios(Z)V
    .locals 5

    const-string v0, "CardManager"

    const-string v1, "Try trigger Guarantee Scenario"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isStoryGenerateEnable()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "CardManager"

    const-string v0, "Card funtion disable"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->getLastGuaranteeTriggerTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    const-string p1, "CardManager"

    const-string v0, "triggerScenarios too often"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/CardManager$6;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/card/CardManager$6;-><init>(Lcom/miui/gallery/card/CardManager;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public declared-synchronized triggerScenarios()V
    .locals 7

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isStoryGenerateEnable()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CardManager"

    const-string v1, "Card funtion disable"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->getLastTriggerTime()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/32 v4, 0x1b7740

    cmp-long v6, v2, v4

    if-ltz v6, :cond_2

    invoke-static {v0, v1}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateTime(J)J

    move-result-wide v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    goto :goto_1

    :cond_1
    :try_start_2
    new-instance v0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;

    invoke-direct {v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;-><init>()V

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->trigger()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setLastTriggerTime(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_3
    const-string v1, "CardManager"

    const-string v2, "trigger scenario occur error.\n"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :cond_2
    :goto_1
    :try_start_4
    const-string v0, "CardManager"

    const-string v1, "triggerScenarios too often"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public unregisterObserver(Lcom/miui/gallery/card/CardManager$CardObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/CardManager;->mObserverHolder:Lcom/miui/gallery/card/CardManager$CardObserverHolder;

    iget-object v0, v0, Lcom/miui/gallery/card/CardManager$CardObserverHolder;->observers:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public declared-synchronized update(Lcom/miui/gallery/card/Card;Z)V
    .locals 7

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    const-string v0, "CardManager"

    const-string v1, "Update card id: %s,By local: %b"

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->isEmpty()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/card/CardManager;->delete(Lcom/miui/gallery/card/Card;Z)V

    const-string p1, "updateCardEmpty"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-gez v0, :cond_2

    const-string p1, "CardManager"

    const-string p2, "Update a card with no card Id!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :cond_2
    if-eqz p2, :cond_3

    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result v0

    if-eqz v0, :cond_5

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v2

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getId()J

    move-result-wide v4

    cmp-long v6, v2, v4

    if-eqz v6, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->isValid()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0, p1, v1}, Lcom/miui/gallery/card/CardManager;->deleteInternal(Lcom/miui/gallery/card/Card;Z)V

    const-string p1, "localExistSameCard"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-void

    :cond_4
    const/4 v0, 0x3

    :try_start_3
    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setLocalFlag(I)V

    :cond_5
    :goto_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->updateCardCoversIfNecessary(Lcom/miui/gallery/card/Card;)Z

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->updateInternal(Lcom/miui/gallery/card/Card;)V

    if-eqz p2, :cond_6

    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x44

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_6
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public updateCard(Lcom/miui/gallery/card/Card;)V
    .locals 2

    if-eqz p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/CardManager$3;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/card/CardManager$3;-><init>(Lcom/miui/gallery/card/CardManager;Lcom/miui/gallery/card/Card;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method

.method public declared-synchronized updateCardCovers()V
    .locals 6

    monitor-enter p0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/Card;

    sget-object v2, Lcom/miui/gallery/card/Card;->BASE_UI_CARD_SELECTION:Ljava/lang/String;

    const/4 v3, 0x0

    const-string v4, "createTime desc"

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/Card;

    invoke-direct {p0, v1}, Lcom/miui/gallery/card/CardManager;->updateCardCoversIfNecessary(Lcom/miui/gallery/card/Card;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v1}, Lcom/miui/gallery/card/CardManager;->updateInternal(Lcom/miui/gallery/card/Card;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public updateCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)V
    .locals 3

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->getCardByServerId(Ljava/lang/String;Z)Lcom/miui/gallery/card/Card;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->getDuplicatedCard(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isStatusDelete()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->delete(Lcom/miui/gallery/card/Card;Z)V

    const-string p1, "serverDeleteDupCard"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/card/CardManager;->mergeCardFromServer(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isStoryGenerateEnable()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/CardManager;->createNewCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)Lcom/miui/gallery/card/Card;

    goto :goto_0

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isStatusDelete()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/card/CardManager;->delete(Lcom/miui/gallery/card/Card;Z)V

    const-string p1, "serverDeleteExistCard"

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V

    goto :goto_0

    :cond_4
    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->isLocalDeleted()Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_0

    :cond_5
    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/card/CardManager;->updateCardFromServerInternal(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V

    :cond_6
    :goto_0
    return-void
.end method
