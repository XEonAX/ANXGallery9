.class public Lcom/miui/gallery/cloud/card/SyncCardFromServer;
.super Ljava/lang/Object;
.source "SyncCardFromServer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/card/SyncCardFromServer$OperationCardCallback;
    }
.end annotation


# instance fields
.field protected mAccount:Landroid/accounts/Account;


# direct methods
.method public constructor <init>(Landroid/accounts/Account;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    return-void
.end method


# virtual methods
.method public getCardInfoList(JLjava/lang/String;J)Lcom/miui/gallery/cloud/card/model/CardInfoList;
    .locals 2

    new-instance v0, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    new-instance v1, Lcom/miui/gallery/cloud/card/SyncCardFromServer$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/card/SyncCardFromServer$2;-><init>(Lcom/miui/gallery/cloud/card/SyncCardFromServer;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;-><init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V

    const-string v1, "syncTag"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object p1

    const-string p2, "limit"

    invoke-static {p4, p5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p2, p4}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object p1

    const-string p2, "syncExtraInfo"

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object p1

    const-string p2, "language"

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->setUseCache(Z)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object p1

    :try_start_0
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->executeSync()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/cloud/card/model/CardInfoList;
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/miui/gallery/cloud/card/exception/NoResultException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string p2, "SyncCardFromServer"

    const-string p3, "Get getCardInfoList failed, %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :catch_1
    move-exception p1

    const-string p2, "SyncCardFromServer"

    const-string p3, "Get getCardInfoList failed, %s"

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getOperationCards(Ljava/lang/String;Lcom/miui/gallery/cloud/card/SyncCardFromServer$OperationCardCallback;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    new-instance v2, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    new-instance v3, Lcom/miui/gallery/cloud/card/SyncCardFromServer$3;

    invoke-direct {v3, p0, v0}, Lcom/miui/gallery/cloud/card/SyncCardFromServer$3;-><init>(Lcom/miui/gallery/cloud/card/SyncCardFromServer;Z)V

    invoke-direct {v2, v3}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;-><init>(Lcom/miui/gallery/cloud/card/network/RequestArguments;)V

    const-string v0, "limit"

    const-wide/16 v3, 0xa

    invoke-static {v3, v4}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v0, v3}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    const-string v2, "cardId"

    invoke-virtual {v0, v2, p1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->setUseCache(Z)Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/card/SyncCardFromServer$4;

    invoke-direct {v1, p0, p2, p1}, Lcom/miui/gallery/cloud/card/SyncCardFromServer$4;-><init>(Lcom/miui/gallery/cloud/card/SyncCardFromServer;Lcom/miui/gallery/cloud/card/SyncCardFromServer$OperationCardCallback;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/card/network/CommonGalleryRequestHelper;->execute(Lcom/miui/gallery/cloud/card/network/ResponseCallback;)V

    return-void
.end method

.method public final sync()Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :cond_0
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    return-object v0

    :cond_1
    new-instance v2, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/card/SyncCardFromServer$1;-><init>(Lcom/miui/gallery/cloud/card/SyncCardFromServer;)V

    invoke-static {v2}, Lcom/miui/gallery/cloud/base/RetryRequestHelper;->retryTask(Lcom/miui/gallery/cloud/base/SyncTask;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v2

    iget-object v3, v2, Lcom/miui/gallery/cloud/base/GallerySyncResult;->data:Ljava/lang/Object;

    check-cast v3, Lcom/miui/gallery/cloud/card/model/CardInfoList;

    if-eqz v3, :cond_3

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/card/model/CardInfoList;->getGalleryCards()Ljava/util/ArrayList;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/cloud/card/model/CardInfo;

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/card/CardManager;->updateCardFromServer(Lcom/miui/gallery/cloud/card/model/CardInfo;)V

    goto :goto_0

    :cond_2
    iget-object v4, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/card/model/CardInfoList;->getSyncTag()J

    move-result-wide v5

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setCardSyncTag(Landroid/accounts/Account;J)V

    iget-object v4, p0, Lcom/miui/gallery/cloud/card/SyncCardFromServer;->mAccount:Landroid/accounts/Account;

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/card/model/CardInfoList;->getSyncExtraInfo()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->setCardSyncInfo(Landroid/accounts/Account;Ljava/lang/String;)V

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/card/model/CardInfoList;->isLastPage()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lcom/miui/gallery/card/CardManager;->triggerGuaranteeScenarios(Z)V

    :cond_3
    const-string v3, "SyncCardFromServer"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sync story card from server finish, cost time: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-virtual {v4, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object v2
.end method
