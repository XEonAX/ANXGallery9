.class public Lcom/miui/gallery/cloud/card/SyncCardToServer;
.super Ljava/lang/Object;
.source "SyncCardToServer.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private syncCreateCard(Lcom/miui/gallery/card/Card;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/CardManager;->getCardInfoFromCard(Lcom/miui/gallery/card/Card;)Lcom/miui/gallery/card/CardSyncInfo;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    new-instance v2, Lcom/miui/gallery/cloud/card/SyncCardToServer$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/card/SyncCardToServer$1;-><init>(Lcom/miui/gallery/cloud/card/SyncCardToServer;)V

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;-><init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V

    const-string v2, "data"

    invoke-static {v0}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->executeSync()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/card/model/CardCreateResult;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/cloud/card/SyncCardToServer;->updateCard(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardCreateResult;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/miui/gallery/cloud/card/exception/NoResultException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post CreateCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post CreateCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method private updateCard(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardCreateResult;)V
    .locals 6

    if-eqz p1, :cond_6

    if-eqz p2, :cond_6

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardCreateResult;->getGalleryCard()Lcom/miui/gallery/cloud/card/model/CardInfo;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardCreateResult;->isDuplicate()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardCreateResult;->getGalleryCard()Lcom/miui/gallery/cloud/card/model/CardInfo;

    move-result-object p2

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

    move-object v2, v1

    goto :goto_1

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getAllMediaList()Ljava/util/List;

    move-result-object v2

    :goto_1
    if-nez v2, :cond_2

    move-object v2, v0

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getMediaInfo()Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/card/model/CardInfo$MediaInfoBean;->getCoverMediaList()Ljava/util/List;

    move-result-object v1

    :goto_2
    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getExtraInfo()Ljava/lang/String;

    move-result-object v3

    const-class v4, Lcom/miui/gallery/card/Card$CardExtraInfo;

    invoke-static {v3, v4}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/card/Card$CardExtraInfo;

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/miui/gallery/card/Card;->setTitle(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getDescription()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Lcom/miui/gallery/card/Card;->setDescription(Ljava/lang/String;)V

    invoke-virtual {p1, v3}, Lcom/miui/gallery/card/Card;->setCardExtraInfo(Lcom/miui/gallery/card/Card$CardExtraInfo;)V

    invoke-static {v2}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {p1, v2}, Lcom/miui/gallery/card/Card;->setAllMediaSha1s(Ljava/util/List;)V

    invoke-static {v0}, Lcom/miui/gallery/card/CardUtil;->getSha1sByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    const-string v2, "cardCardFromServer"

    invoke-virtual {p1, v0, v2}, Lcom/miui/gallery/card/Card;->setSelectedMediaSha1s(Ljava/util/List;Ljava/lang/String;)V

    invoke-static {v1}, Lcom/miui/gallery/card/CardUtil;->getCoverMediaItemsByServerIds(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setCoverMediaFeatureItems(Ljava/util/List;)V

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

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setCreateBy(I)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getSortTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setCreateTime(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    goto :goto_3

    :cond_4
    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerTag()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardCreateResult;->getGalleryCard()Lcom/miui/gallery/cloud/card/model/CardInfo;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_5

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardCreateResult;->getGalleryCard()Lcom/miui/gallery/cloud/card/model/CardInfo;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setServerId(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setServerTag(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    :cond_5
    :goto_3
    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    :cond_6
    return-void
.end method

.method private updateCard(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V
    .locals 5

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerTag()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const-string v0, "SyncCardToServer"

    const-string v1, "updateCard after SyncCardToServer"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/Card;->setServerId(Ljava/lang/String;)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getTag()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setServerTag(J)V

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/card/model/CardInfo;->getUpdateTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/card/Card;->setUpdateTime(J)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p1, v0}, Lcom/miui/gallery/card/CardManager;->update(Lcom/miui/gallery/card/Card;Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public sync()V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/CardManager;->getUnsynchronizedCards(I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/card/Card;

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result v2

    packed-switch v2, :pswitch_data_0

    const-string v2, "SyncCardToServer"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get local card flag error:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/miui/gallery/card/Card;->getLocalFlag()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :pswitch_0
    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloud/card/SyncCardToServer;->syncModifyCard(Lcom/miui/gallery/card/Card;)V

    goto :goto_0

    :pswitch_1
    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloud/card/SyncCardToServer;->syncDeleteCard(Lcom/miui/gallery/card/Card;)V

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, v1}, Lcom/miui/gallery/cloud/card/SyncCardToServer;->syncCreateCard(Lcom/miui/gallery/card/Card;)V

    goto :goto_0

    :cond_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public syncDeleteCard(Lcom/miui/gallery/card/Card;)V
    .locals 3

    new-instance v0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    new-instance v1, Lcom/miui/gallery/cloud/card/SyncCardToServer$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/card/SyncCardToServer$3;-><init>(Lcom/miui/gallery/cloud/card/SyncCardToServer;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;-><init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V

    const-string v1, "cardId"

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->executeSync()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/card/model/CardInfo;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/model/CardInfo;->isStatusDelete()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/card/CardManager;->delete(Lcom/miui/gallery/card/Card;Z)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    const-string v0, "serverSynced"

    invoke-virtual {p1, v0}, Lcom/miui/gallery/card/CardManager;->recordCardDeleteReason(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string p1, "SyncCardToServer"

    const-string v0, "Post DeleteCard failed!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/miui/gallery/cloud/card/exception/NoResultException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post DeleteCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post DeleteCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method

.method public syncModifyCard(Lcom/miui/gallery/card/Card;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/CardManager;->getCardInfoFromCard(Lcom/miui/gallery/card/Card;)Lcom/miui/gallery/card/CardSyncInfo;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    new-instance v2, Lcom/miui/gallery/cloud/card/SyncCardToServer$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/card/SyncCardToServer$2;-><init>(Lcom/miui/gallery/cloud/card/SyncCardToServer;)V

    invoke-direct {v1, v2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;-><init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V

    const-string v2, "data"

    invoke-static {v0}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    const-string v1, "cardId"

    invoke-virtual {p1}, Lcom/miui/gallery/card/Card;->getServerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->executeSync()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/card/model/CardInfo;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/cloud/card/SyncCardToServer;->updateCard(Lcom/miui/gallery/card/Card;Lcom/miui/gallery/cloud/card/model/CardInfo;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/miui/gallery/cloud/card/exception/NoResultException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post ModifyCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string v0, "SyncCardToServer"

    const-string v1, "Post ModifyCard failed, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-void
.end method
