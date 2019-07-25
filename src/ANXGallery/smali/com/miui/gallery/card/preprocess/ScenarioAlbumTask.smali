.class public Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;
.super Lcom/miui/gallery/card/preprocess/ScenarioTask;
.source "ScenarioAlbumTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;
    }
.end annotation


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/preprocess/ScenarioTask;-><init>(I)V

    return-void
.end method

.method private statScenarioCreateFailed()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "reason"

    const-string v2, "No enough image"

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    const-string v2, "assistant_card_create_failed"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V
    .locals 0

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    const/4 p2, 0x2

    goto :goto_0

    :cond_0
    const/4 p2, 0x3

    :goto_0
    invoke-virtual {p1, p2}, Lcom/miui/gallery/card/scenario/Record;->setState(I)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method public generateCard(Lorg/json/JSONObject;Lcom/miui/gallery/card/scenario/Record;Z)Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;
    .locals 17

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_0
    new-instance v2, Lcom/miui/gallery/card/scenario/ScenarioTrigger;

    invoke-direct {v2}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;-><init>()V

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/card/scenario/Record;->getScenarioId()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/card/scenario/ScenarioTrigger;->getScenarioById(I)Lcom/miui/gallery/card/scenario/Scenario;

    move-result-object v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_1
    const-string v4, "ScenarioAlbumTask"

    const-string v5, "ScenarioAlbumTask %d begin!"

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/card/scenario/Record;->getMediaIds()Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->queryMediaItemByIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string v2, "ScenarioAlbumTask"

    const-string v4, "no media item found"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->statScenarioCreateFailed()V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->INPUT_ERROR:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_2
    const-string v5, "ScenarioAlbumTask"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "media count:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v4}, Lcom/miui/gallery/card/CardUtil;->getUnProcessedMediaItems(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v6

    if-eqz v6, :cond_3

    if-nez p3, :cond_3

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_3
    const/4 v6, 0x1

    move-object/from16 v7, p1

    invoke-virtual {v0, v7, v5, v3, v6}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->processImages(Lorg/json/JSONObject;Ljava/util/List;ZZ)Z

    move-result v7

    if-eqz v7, :cond_d

    const-string v7, "ScenarioAlbumTask"

    const-string v8, "process %d images success"

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v7, v8, v5}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {v4}, Lcom/miui/gallery/card/CardUtil;->bindImageFeatures(Ljava/util/List;)V

    invoke-static {v4}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->getSelectedImages(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getMinSelectedImageCount()I

    move-result v7

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getMaxSelectedImageCount()I

    move-result v8

    if-eqz v5, :cond_c

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v9

    if-ge v9, v7, :cond_4

    goto/16 :goto_2

    :cond_4
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, v8, :cond_5

    invoke-static {v5}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    :goto_0
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v7

    if-le v7, v8, :cond_5

    invoke-interface {v5, v8}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_5
    const-string v7, "album"

    invoke-static {v7}, Lcom/miui/gallery/card/CardUtil;->getAlbumUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    new-instance v8, Lcom/miui/gallery/card/Card$Builder;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v9

    invoke-direct {v8, v9}, Lcom/miui/gallery/card/Card$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v1, v5}, Lcom/miui/gallery/card/scenario/Scenario;->generateTitle(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/miui/gallery/card/Card$Builder;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v8

    invoke-virtual {v2, v1, v5}, Lcom/miui/gallery/card/scenario/Scenario;->generateDescription(Lcom/miui/gallery/card/scenario/Record;Ljava/util/List;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Lcom/miui/gallery/card/Card$Builder;->setDescription(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v8

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->isDeletable()Z

    move-result v9

    invoke-virtual {v8, v9}, Lcom/miui/gallery/card/Card$Builder;->setDeletable(Z)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v8

    invoke-virtual {v8, v3}, Lcom/miui/gallery/card/Card$Builder;->setType(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v8

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Lcom/miui/gallery/card/Card$Builder;->setImageUri(Landroid/net/Uri;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v8

    if-nez v7, :cond_6

    goto :goto_1

    :cond_6
    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v9

    :goto_1
    invoke-virtual {v8, v9}, Lcom/miui/gallery/card/Card$Builder;->setDetailUrl(Ljava/lang/String;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v7

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/card/scenario/Record;->getUniqueKey()Lcom/miui/gallery/card/scenario/Record$UniqueKey;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/miui/gallery/card/Card$Builder;->setUniqueKey(Lcom/miui/gallery/card/scenario/Record$UniqueKey;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v7

    invoke-static {v4}, Lcom/miui/gallery/card/CardUtil;->getSha1sFromImages(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v7, v4}, Lcom/miui/gallery/card/Card$Builder;->setAllMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    invoke-static {v5}, Lcom/miui/gallery/card/CardUtil;->getSha1sFromImages(Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    invoke-virtual {v4, v7}, Lcom/miui/gallery/card/Card$Builder;->setSelectedMediaSha1s(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    invoke-static {v5}, Lcom/miui/gallery/card/CardUtil;->getCardCovers(Ljava/util/List;)Ljava/util/List;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/miui/gallery/card/Card$Builder;->setCoverMediaFeatureItems(Ljava/util/List;)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/card/scenario/Record;->getScenarioId()I

    move-result v5

    invoke-virtual {v4, v5}, Lcom/miui/gallery/card/Card$Builder;->setScenarioId(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/miui/gallery/card/Card$Builder;->setCreateBy(I)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    const-wide/16 v7, 0x0

    invoke-virtual {v4, v7, v8}, Lcom/miui/gallery/card/Card$Builder;->setValidStartTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    const-wide v9, 0x7fffffffffffffffL

    invoke-virtual {v4, v9, v10}, Lcom/miui/gallery/card/Card$Builder;->setValidEndTime(J)Lcom/miui/gallery/card/Card$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/card/Card$Builder;->build()Lcom/miui/gallery/card/Card;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ignored = 0 AND scenarioId = "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lcom/miui/gallery/card/scenario/Record;->getScenarioId()I

    move-result v9

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v9, " AND "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "createTime"

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, " > "

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    const-wide/32 v11, 0x240c8400

    sub-long/2addr v9, v11

    invoke-virtual {v5, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v11

    const-class v12, Lcom/miui/gallery/card/Card;

    const/4 v14, 0x0

    const-string v15, "createTime desc"

    const/16 v16, 0x0

    invoke-virtual/range {v11 .. v16}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_7
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_8

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/card/Card;

    invoke-static {v4, v9}, Lcom/miui/gallery/card/CardUtil;->isDuplicated(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/card/Card;)Z

    move-result v9

    if-eqz v9, :cond_7

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->DUPLICATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_8
    invoke-static {}, Lcom/xiaomi/micloudsdk/request/utils/CloudUtils;->getXiaomiAccount()Landroid/accounts/Account;

    move-result-object v5

    if-eqz v5, :cond_a

    new-instance v9, Lcom/miui/gallery/cloud/card/SyncCardFromServer;

    invoke-direct {v9, v5}, Lcom/miui/gallery/cloud/card/SyncCardFromServer;-><init>(Landroid/accounts/Account;)V

    invoke-static {v5}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getCardSyncTag(Landroid/accounts/Account;)J

    move-result-wide v10

    invoke-static {v5}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getCardSyncInfo(Landroid/accounts/Account;)Ljava/lang/String;

    move-result-object v12

    const-wide/16 v13, 0xa

    invoke-virtual/range {v9 .. v14}, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->getCardInfoList(JLjava/lang/String;J)Lcom/miui/gallery/cloud/card/model/CardInfoList;

    move-result-object v5

    if-eqz v5, :cond_a

    invoke-virtual {v5}, Lcom/miui/gallery/cloud/card/model/CardInfoList;->getGalleryCards()Ljava/util/ArrayList;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_9
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/cloud/card/model/CardInfo;

    if-eqz v9, :cond_9

    invoke-virtual {v9}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isStatusDelete()Z

    move-result v10

    if-nez v10, :cond_9

    invoke-static {v4, v9}, Lcom/miui/gallery/card/CardUtil;->isDuplicated(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)Z

    move-result v9

    if-eqz v9, :cond_9

    const-string v2, "ScenarioAlbumTask"

    const-string v4, "Create a local card duplicated with server"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    new-instance v1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v1

    const-wide/16 v2, 0x44

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->DUPLICATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_a
    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v3

    invoke-virtual {v3, v4, v6}, Lcom/miui/gallery/card/CardManager;->add(Lcom/miui/gallery/card/Card;Z)V

    const-string v3, "ScenarioAlbumTask"

    const-string v4, "Card generated"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "scenario_id"

    invoke-virtual {v2}, Lcom/miui/gallery/card/scenario/Scenario;->getScenarioId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {}, Lcom/miui/gallery/card/CardUtil;->getLastCardCreateTime()J

    move-result-wide v4

    cmp-long v2, v4, v7

    if-lez v2, :cond_b

    const-string v2, "date_interval_with_last_card"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-static {v4, v5, v7, v8}, Lcom/miui/gallery/util/GalleryDateUtils;->daysBetween(JJ)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_b
    const-string v2, "assistant"

    const-string v4, "assistant_card_created_success"

    invoke-static {v2, v4, v3}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-direct {v0, v1, v6}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->CREATED:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_c
    :goto_2
    const-string v2, "ScenarioAlbumTask"

    const-string v4, "no enough selected Images from row images"

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v0, v1, v3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->updateRecord(Lcom/miui/gallery/card/scenario/Record;Z)V

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->statScenarioCreateFailed()V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->NO_ENOUGH_IMAGE:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1

    :cond_d
    const-string v1, "ScenarioAlbumTask"

    const-string v2, "process images failed"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->IMAGE_PROCESS_FAIL:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    return-object v1
.end method

.method public onGetImageDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public onProcess(Lorg/json/JSONObject;J)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/card/scenario/Record;

    invoke-virtual {v0, v1, p2, p3}, Lcom/miui/gallery/dao/base/EntityManager;->find(Ljava/lang/Class;J)Lcom/miui/gallery/dao/base/Entity;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/card/scenario/Record;

    const/4 p3, 0x0

    if-nez p2, :cond_0

    return p3

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "ScenarioAlbumTask"

    const-string p2, "task is cancelled"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p3

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_0

    :cond_2
    const-string v0, "ScenarioAlbumTask"

    const-string v1, "power do not meet requirements\uff0ctry generate card without processing images"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->generateCard(Lorg/json/JSONObject;Lcom/miui/gallery/card/scenario/Record;Z)Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;->HAVE_UNPROCESSED_IMAGES:Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    if-ne p1, v0, :cond_4

    const-string p1, "ScenarioAlbumTask"

    const-string v0, "generate card without processing images failed , schedule charging task"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0xa

    invoke-virtual {p2}, Lcom/miui/gallery/card/scenario/Record;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/card/scenario/Record;->getId()J

    move-result-wide v1

    invoke-static {p1, v0, v1, v2}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->post(ILjava/lang/String;J)V

    goto :goto_1

    :cond_3
    :goto_0
    const-string v0, "ScenarioAlbumTask"

    const-string v1, "power meet requirements\uff0cstart generate card"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask;->generateCard(Lorg/json/JSONObject;Lcom/miui/gallery/card/scenario/Record;Z)Lcom/miui/gallery/card/preprocess/ScenarioAlbumTask$CardResult;

    :cond_4
    :goto_1
    return p3
.end method
