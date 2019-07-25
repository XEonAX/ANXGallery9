.class public abstract Lcom/miui/gallery/search/core/source/server/ServerSource;
.super Lcom/miui/gallery/search/core/source/InterceptableSource;
.source "ServerSource.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected canCarryLog()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected doGetSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getRequestBuilder(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->canCarryLog()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->pullCachedEvent()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    const-string v2, "logData"

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/net/base/BaseRequest;

    :cond_0
    :try_start_0
    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    array-length v3, v1

    if-lez v3, :cond_6

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->isPersistable(Lcom/miui/gallery/search/core/QueryInfo;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-wide/16 v2, -0x1

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getResponseData()Ljava/lang/Object;

    move-result-object v4

    instance-of v4, v4, Lcom/miui/gallery/search/core/source/server/Cacheable;

    if-eqz v4, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getResponseData()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/search/core/source/server/Cacheable;

    invoke-interface {v2}, Lcom/miui/gallery/search/core/source/server/Cacheable;->getExpireMills()J

    move-result-wide v2

    :cond_1
    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getParams()Ljava/util/Map;

    move-result-object v4

    invoke-static {v4}, Lcom/miui/gallery/search/utils/SearchUtils;->removeExtraParamsForPersistence(Ljava/util/Map;)V

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getUrl()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getResponseRawData()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v4, v6, v2, v3}, Lcom/miui/gallery/util/PersistentResponseHelper;->saveAsync(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;J)V

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getResponseRawData()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/search/utils/SearchUtils;->generateResultHashCode(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :cond_2
    const/4 v3, 0x0

    aget-object v1, v1, v3

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v1

    if-eqz v2, :cond_5

    if-eqz v1, :cond_5

    invoke-interface {v1}, Lcom/miui/gallery/search/core/result/SourceResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object v3

    if-eqz v3, :cond_3

    sget-object v4, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v3, v4, :cond_4

    :cond_3
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v1, v3}, Lcom/miui/gallery/search/core/result/SourceResult;->setResultExtras(Landroid/os/Bundle;)V

    :cond_4
    const-string v4, "result_hash_code"

    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-object v1

    :cond_6
    new-instance v1, Lcom/miui/gallery/net/base/RequestError;

    sget-object v3, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v4, "Execute result should not be null"

    invoke-direct {v1, v3, v4, v2}, Lcom/miui/gallery/net/base/RequestError;-><init>(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    throw v1
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/result/ErrorInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1

    :catch_1
    move-exception v1

    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Lcom/miui/gallery/net/base/RequestError;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method protected getPrejudgeResult(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 11

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;->getPrejudgeResult(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_1

    invoke-virtual {p0, p1, v3}, Lcom/miui/gallery/search/core/source/server/ServerSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    const-string v4, "use_persistent_response"

    invoke-virtual {p1, v4}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-eqz v4, :cond_2

    const/4 v4, 0x1

    goto :goto_1

    :cond_2
    const/4 v4, 0x0

    :goto_1
    if-nez v1, :cond_3

    if-eqz v4, :cond_9

    :cond_3
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->isPersistable(Lcom/miui/gallery/search/core/QueryInfo;)Z

    move-result v4

    if-eqz v4, :cond_9

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getRequestBuilder(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getParams()Ljava/util/Map;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/search/utils/SearchUtils;->removeExtraParamsForPersistence(Ljava/util/Map;)V

    invoke-virtual {v4}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->getUrl()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6, v5}, Lcom/miui/gallery/util/PersistentResponseHelper;->find(Ljava/lang/String;Ljava/util/Map;)Lcom/miui/gallery/model/PersistentResponse;

    move-result-object v5

    if-eqz v5, :cond_9

    invoke-virtual {v5}, Lcom/miui/gallery/model/PersistentResponse;->getResponse()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_9

    invoke-static {}, Lcom/miui/gallery/search/core/source/server/HttpUtils;->createGson()Lcom/google/gson/Gson;

    move-result-object v6

    invoke-virtual {v5}, Lcom/miui/gallery/model/PersistentResponse;->getResponse()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getResponseDataType(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/reflect/Type;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_9

    invoke-virtual {p0, p1, v4, v6}, Lcom/miui/gallery/search/core/source/server/ServerSource;->onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v4

    if-eqz v4, :cond_8

    invoke-virtual {v5}, Lcom/miui/gallery/model/PersistentResponse;->getExpireMillis()J

    move-result-wide v6

    invoke-virtual {v5}, Lcom/miui/gallery/model/PersistentResponse;->getUpdateTime()J

    move-result-wide v8

    const/4 v10, 0x0

    add-long/2addr v8, v6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    cmp-long v10, v8, v6

    if-gez v10, :cond_4

    const/4 v6, 0x1

    goto :goto_2

    :cond_4
    const/4 v6, 0x0

    :goto_2
    invoke-interface {v4}, Lcom/miui/gallery/search/core/result/SourceResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object v7

    if-eqz v7, :cond_5

    sget-object v8, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v7, v8, :cond_6

    :cond_5
    new-instance v7, Landroid/os/Bundle;

    invoke-direct {v7}, Landroid/os/Bundle;-><init>()V

    invoke-interface {v4, v7}, Lcom/miui/gallery/search/core/result/SourceResult;->setResultExtras(Landroid/os/Bundle;)V

    :cond_6
    const-string v8, "need_requery"

    if-nez v1, :cond_7

    if-eqz v6, :cond_7

    const/4 v2, 0x1

    :cond_7
    invoke-virtual {v7, v8, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v2, "result_hash_code"

    invoke-virtual {v5}, Lcom/miui/gallery/model/PersistentResponse;->getResponse()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/miui/gallery/search/utils/SearchUtils;->generateResultHashCode(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v2, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_8
    return-object v4

    :catch_0
    move-exception v2

    const-string v4, "ServerSource"

    invoke-static {v4, v2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    if-eqz v1, :cond_a

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-direct {v0, v3}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1

    :cond_a
    return-object v0
.end method

.method public getPriority(Lcom/miui/gallery/search/core/QueryInfo;)I
    .locals 0

    const/4 p1, 0x2

    return p1
.end method

.method protected abstract getQueryAppendPath(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/String;
.end method

.method protected getQueryParams(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getParams()Ljava/util/Map;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method protected getQueryUserPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->getDefaultUserPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getRequestBuilder(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/search/utils/SearchUtils;->getXiaomiId()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getResponseDataType(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/reflect/Type;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setResultDataType(Ljava/lang/reflect/Type;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v1

    const/16 v2, 0x3e9

    invoke-virtual {v1, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setMethod(I)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getQueryUserPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUserId(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getQueryAppendPath(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setQueryAppendPath(Ljava/lang/String;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getQueryParams(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->addQueryParams(Ljava/util/Map;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->useCache(Lcom/miui/gallery/search/core/QueryInfo;)Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->setUseCache(Z)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object p1

    return-object p1
.end method

.method protected getResponseDataType(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/reflect/Type;
    .locals 0

    const-class p1, Lcom/miui/gallery/search/core/source/server/SectionedResponseData;

    return-object p1
.end method

.method protected getSearchErrorCodeFromNetErrorCode(Lcom/miui/gallery/net/base/ErrorCode;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/core/source/server/ServerSource$1;->$SwitchMap$com$miui$gallery$net$base$ErrorCode:[I

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/ErrorCode;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/16 p1, 0x9

    return p1

    :pswitch_0
    const/4 p1, 0x7

    return p1

    :pswitch_1
    const/4 p1, 0x5

    return p1

    :pswitch_2
    const/4 p1, 0x6

    return p1

    :pswitch_3
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method protected isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z
    .locals 2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    const/4 v1, 0x3

    if-eq p2, v1, :cond_0

    const/16 v1, 0xa

    if-eq p2, v1, :cond_0

    const/16 v1, 0xd

    if-eq p2, v1, :cond_0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result p1

    return p1

    :cond_0
    return v0
.end method

.method protected isPersistable(Lcom/miui/gallery/search/core/QueryInfo;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected abstract onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;
.end method

.method protected onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/result/ErrorInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 2

    const-string v0, "ServerSource"

    const-string v1, "onResponseError for query %s, error %s"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/core/result/BaseSourceResult;->setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1
.end method

.method protected onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Lcom/miui/gallery/net/base/RequestError;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 1

    new-instance p2, Lcom/miui/gallery/search/core/result/ErrorInfo;

    invoke-virtual {p3}, Lcom/miui/gallery/net/base/RequestError;->getErrorCode()Lcom/miui/gallery/net/base/ErrorCode;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getSearchErrorCodeFromNetErrorCode(Lcom/miui/gallery/net/base/ErrorCode;)I

    move-result v0

    invoke-virtual {p3}, Lcom/miui/gallery/net/base/RequestError;->getMessage()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, v0, p3}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/source/server/ServerSource;->onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/result/ErrorInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method protected useCache(Lcom/miui/gallery/search/core/QueryInfo;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
