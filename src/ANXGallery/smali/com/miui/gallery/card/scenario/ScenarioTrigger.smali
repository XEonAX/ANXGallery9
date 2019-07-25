.class public Lcom/miui/gallery/card/scenario/ScenarioTrigger;
.super Ljava/lang/Object;
.source "ScenarioTrigger.java"


# instance fields
.field private mFreeScenarioTriggerInterval:I

.field private final mFreeScenarios:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;"
        }
    .end annotation
.end field

.field private final mGuaranteeScenarios:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;"
        }
    .end annotation
.end field

.field private final mNormalScenarios:Ljava/util/TreeSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/TreeSet<",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/TreeSet;

    invoke-direct {v0}, Ljava/util/TreeSet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mNormalScenarios:Ljava/util/TreeSet;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarios:Ljava/util/List;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mGuaranteeScenarios:Ljava/util/List;

    const/4 v0, 0x6

    iput v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarioTriggerInterval:I

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getAssistantScenarioStrategy()Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;

    move-result-object v0

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getDuplicateRemovalInterval()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/Scenario;->setDuplicateRemovalInterval(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getDefaultMinImageCount()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/Scenario;->setDefaultMinImageCount(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getDefaultMaxImageCount()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/Scenario;->setDefaultMaxImageCount(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getDefaultMinSelectedImageCount()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/Scenario;->setDefaultSelectedMinImageCount(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getDefaultMaxSelectedImageCount()I

    move-result v1

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/Scenario;->setDefaultSelectedMaxImageCount(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getFreeScenarioTriggerInterval()I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarioTriggerInterval:I

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getLocalScenarioRules()Ljava/util/List;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;

    invoke-static {v2}, Lcom/miui/gallery/card/scenario/ScenarioFactory;->createLocalScenario(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$ScenarioRule;)Lcom/miui/gallery/card/scenario/Scenario;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getFlag()I

    move-result v3

    const/4 v4, 0x4

    if-ne v3, v4, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarios:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getFlag()I

    move-result v3

    const/16 v4, 0x10

    if-ne v3, v4, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mGuaranteeScenarios:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mNormalScenarios:Ljava/util/TreeSet;

    invoke-virtual {v3, v2}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy;->getCloudTimeScenarioRules()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;

    invoke-static {v1}, Lcom/miui/gallery/card/scenario/ScenarioFactory;->createCloudTimeScenario(Lcom/miui/gallery/cloudcontrol/strategies/AssistantScenarioStrategy$CloudTimeScenarioRule;)Lcom/miui/gallery/card/scenario/Scenario;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mNormalScenarios:Ljava/util/TreeSet;

    invoke-virtual {v2, v1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    return-void
.end method

.method private static addFailedRecord(Lcom/miui/gallery/card/scenario/Record;Lcom/miui/gallery/card/scenario/Scenario;)Z
    .locals 0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/scenario/Record;->setState(I)V

    invoke-static {p0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->addRecord(Lcom/miui/gallery/card/scenario/Record;)Z

    move-result p0

    return p0
.end method

.method private static addRecord(Lcom/miui/gallery/card/scenario/Record;)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/dao/base/EntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result p0

    return p0
.end method

.method private isCardGeneratedRecently(J)Z
    .locals 8

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%s,%s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v6

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const-class v1, Lcom/miui/gallery/card/Card;

    const-string v2, "ignored = 0"

    const-string v4, "createTime desc"

    const/4 v3, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/Card;

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v1

    sub-long/2addr v1, p1

    invoke-virtual {v0}, Lcom/miui/gallery/card/Card;->getCreateTime()J

    move-result-wide p1

    cmp-long v0, v1, p1

    if-gez v0, :cond_0

    const/4 v6, 0x1

    :cond_0
    return v6

    :cond_1
    return v6
.end method

.method private randomSort(Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/card/scenario/Scenario;

    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/miui/gallery/card/scenario/Scenario;

    array-length v1, v0

    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    :goto_0
    if-lez v1, :cond_0

    add-int/lit8 v3, v1, -0x1

    invoke-virtual {v2, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    aget-object v4, v0, v1

    aget-object v5, v0, v3

    aput-object v5, v0, v1

    aput-object v4, v0, v3

    move v1, v3

    goto :goto_0

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object p1

    const/4 v1, 0x0

    :goto_1
    array-length v2, v0

    if-ge v1, v2, :cond_1

    invoke-interface {p1}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    aget-object v2, v0, v1

    invoke-interface {p1, v2}, Ljava/util/ListIterator;->set(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    return-void
.end method

.method private statScenarioTriggerFailed()V
    .locals 3

    const-string v0, "ScenarioTrigger"

    const-string v1, "Scenario Trigger Failed."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "reason"

    const-string v2, "No triggered scenario"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_create_failed"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private triggerInternal(Ljava/util/Collection;I)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "Lcom/miui/gallery/card/scenario/Scenario;",
            ">;I)I"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/card/scenario/Scenario;

    const-string v1, "ScenarioTrigger"

    const-string v2, "%s,scenario: %s %s start..."

    invoke-static {}, Lcom/miui/gallery/card/scenario/DateUtils;->getCurrentTimeMillis()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateFormat(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getFlag()I

    move-result v1

    invoke-static {p2, v1}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v1

    if-nez v1, :cond_7

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->findRecords()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->findCards()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/card/scenario/Scenario;->prepare(Ljava/util/List;Ljava/util/List;)Z

    move-result v1

    if-nez v1, :cond_1

    goto/16 :goto_3

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->loadMediaItem()Ljava/util/List;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/card/scenario/Record;

    invoke-direct {v2, v0, v1}, Lcom/miui/gallery/card/scenario/Record;-><init>(Lcom/miui/gallery/card/scenario/Scenario;Ljava/util/List;)V

    const/4 v3, 0x0

    if-eqz v1, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getMinImageCount()I

    move-result v5

    if-ge v4, v5, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {v2}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->addRecord(Lcom/miui/gallery/card/scenario/Record;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v0, "ScenarioTrigger"

    const-string v1, "add record error"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getFlagDisableMask()I

    move-result v1

    or-int/2addr p2, v1

    const-string v1, "ScenarioTrigger"

    const-string v4, "Scenario %s trigger successfully. Try generate card!"

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;

    const/4 v4, 0x2

    invoke-direct {v1, v4}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;-><init>(I)V

    const/4 v5, 0x0

    invoke-virtual {v0}, Lcom/miui/gallery/card/scenario/Scenario;->getFlag()I

    move-result v0

    const/16 v6, 0x10

    if-ne v0, v6, :cond_4

    const/4 v3, 0x1

    :cond_4
    invoke-virtual {v1, v5, v2, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->generateCard(Lorg/json/JSONObject;Lcom/miui/gallery/card/scenario/Record;Z)Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    if-ne v0, v1, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Record;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Record;->getId()J

    move-result-wide v1

    invoke-static {v4, v0, v1, v2}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->post(ILjava/lang/String;J)V

    goto/16 :goto_0

    :cond_5
    :goto_1
    const-string v4, "ScenarioTrigger"

    const-string v5, "media items is too few %s"

    if-nez v1, :cond_6

    goto :goto_2

    :cond_6
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    :goto_2
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v4, v5, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v2, v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->addFailedRecord(Lcom/miui/gallery/card/scenario/Record;Lcom/miui/gallery/card/scenario/Scenario;)Z

    goto/16 :goto_0

    :cond_7
    :goto_3
    const-string v0, "ScenarioTrigger"

    const-string v1, "prepare failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_8
    return p2
.end method


# virtual methods
.method public getScenarioById(I)Lcom/miui/gallery/card/scenario/Scenario;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mNormalScenarios:Ljava/util/TreeSet;

    invoke-virtual {v0}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/scenario/Scenario;

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v2

    if-ne v2, p1, :cond_0

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/scenario/Scenario;

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v2

    if-ne v2, p1, :cond_2

    return-object v1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mGuaranteeScenarios:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/scenario/Scenario;

    invoke-virtual {v1}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v2

    if-ne v2, p1, :cond_4

    return-object v1

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method

.method public declared-synchronized trigger()V
    .locals 5

    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mNormalScenarios:Ljava/util/TreeSet;

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->triggerInternal(Ljava/util/Collection;I)I

    move-result v0

    if-nez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarios:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-wide/32 v1, 0x5265c00

    iget v3, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarioTriggerInterval:I

    int-to-long v3, v3

    mul-long v3, v3, v1

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->isCardGeneratedRecently(J)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mFreeScenarios:Ljava/util/List;

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->randomSort(Ljava/util/List;)V

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->triggerInternal(Ljava/util/Collection;I)I

    move-result v0

    :cond_0
    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->statScenarioTriggerFailed()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public triggerGuaranteeScenario()V
    .locals 2

    const-string v0, "ScenarioTrigger"

    const-string v1, "Trigger guarantee scenarios"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->mGuaranteeScenarios:Ljava/util/List;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->triggerInternal(Ljava/util/Collection;I)I

    return-void
.end method
