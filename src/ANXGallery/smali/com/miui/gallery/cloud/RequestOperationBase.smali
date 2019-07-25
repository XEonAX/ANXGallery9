.class public abstract Lcom/miui/gallery/cloud/RequestOperationBase;
.super Ljava/lang/Object;
.source "RequestOperationBase.java"

# interfaces
.implements Lcom/miui/gallery/cloud/Operation;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/cloud/Operation<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private TAG:Ljava/lang/String;

.field protected mContext:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/RequestOperationBase;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method protected abstract buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public checkState(Lcom/miui/gallery/cloud/RequestItemBase;)I
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkForItem(Lcom/miui/gallery/cloud/RequestItemBase;)I

    move-result p1

    return p1
.end method

.method public final execute(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/lang/String;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloud/RequestItemBase;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lorg/json/JSONObject;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v4, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v4}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloud/RequestOperationBase;->checkState(Lcom/miui/gallery/cloud/RequestItemBase;)I

    move-result v5

    if-eqz v5, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "condition for %s isn\'t ok"

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->CONDITION_INTERRUPTED:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_0
    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloud/RequestOperationBase;->onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;

    move-result-object v5

    sget-object v6, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq v5, v6, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "onPreExecute error %s"

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v4, v5}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_1
    move-object v11, p1

    invoke-virtual {p0, p1, v1}, Lcom/miui/gallery/cloud/RequestOperationBase;->buildRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/RequestOperationBase$Request;

    move-result-object v12

    if-eqz v12, :cond_8

    invoke-static {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->access$000(Lcom/miui/gallery/cloud/RequestOperationBase$Request;)Z

    move-result v5

    if-nez v5, :cond_2

    goto/16 :goto_0

    :cond_2
    const/4 v5, 0x0

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getMethod()I

    move-result v6

    const/4 v7, 0x1

    if-ne v6, v7, :cond_3

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getParams()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getRetryTimes()I

    move-result v9

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->isNeedReRequest()Z

    move-result v10

    move-object v7, p1

    move-object v8, p2

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/cloud/CloudUtils;->getFromXiaomi(Ljava/lang/String;Ljava/util/List;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object v5

    :cond_3
    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getMethod()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_4

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getParams()Ljava/util/List;

    move-result-object v6

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getPostData()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->getRetryTimes()I

    move-result v10

    invoke-virtual {v12}, Lcom/miui/gallery/cloud/RequestOperationBase$Request;->isNeedReRequest()Z

    move-result v12

    move-object v8, p1

    move-object v9, p2

    move v11, v12

    invoke-static/range {v5 .. v11}, Lcom/miui/gallery/cloud/CloudUtils;->postToXiaomi(Ljava/lang/String;Ljava/util/List;Lorg/json/JSONObject;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object v5

    :cond_4
    if-nez v5, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "response null"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;

    move-result-object v6

    invoke-static {v5, v1, v6}, Lcom/miui/gallery/cloud/CheckResult;->checkXMResultCode(Lorg/json/JSONObject;Lcom/miui/gallery/cloud/RequestItemBase;Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v6

    iget-object v7, v6, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v8, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-eq v7, v8, :cond_6

    iget-object v2, v6, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p0, v2, v1, v5}, Lcom/miui/gallery/cloud/RequestOperationBase;->onRequestError(Lcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v2

    const-string v3, "error result %s, retry times %s"

    iget v1, v1, Lcom/miui/gallery/cloud/RequestItemBase;->otherRetryTimes:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2, v3, v6, v1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v6, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_6
    const-string v6, "data"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    if-nez v6, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v2

    const-string v3, "response has no data %s"

    invoke-static {v2, v3, v6}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p0, v2, v1, v5}, Lcom/miui/gallery/cloud/RequestOperationBase;->onRequestError(Lcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_7
    invoke-virtual {p0, v1, v6}, Lcom/miui/gallery/cloud/RequestOperationBase;->onRequestSuccess(Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v5, "execute success, cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long/2addr v7, v2

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v1, v5, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v6}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setData(Ljava/lang/Object;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1

    :cond_8
    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestOperationBase;->getTag()Ljava/lang/String;

    move-result-object v1

    const-string v2, "illegal request %s"

    invoke-static {v1, v2, v12}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->NOT_RETRY_ERROR:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v4, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v1

    return-object v1
.end method

.method protected getSpaceFullListener()Lcom/miui/gallery/cloud/SpaceFullHandler$SpaceFullListener;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase;->TAG:Ljava/lang/String;

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase;->TAG:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestOperationBase;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method protected onPreRequest(Lcom/miui/gallery/cloud/RequestItemBase;)Lcom/miui/gallery/cloud/base/GallerySyncCode;
    .locals 0

    sget-object p1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    return-object p1
.end method

.method protected abstract onRequestError(Lcom/miui/gallery/cloud/base/GallerySyncCode;Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected abstract onRequestSuccess(Lcom/miui/gallery/cloud/RequestItemBase;Lorg/json/JSONObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
