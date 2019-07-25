.class public Lcom/miui/gallery/search/core/source/server/DataListSource;
.super Lcom/miui/gallery/search/core/source/server/ServerSource;
.source "DataListSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;
    }
.end annotation


# static fields
.field private static final SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/miui/gallery/search/SearchConstants$SearchType;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_RESULT_LIST:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/search/core/source/server/DataListSource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected canCarryLog()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected generateDefaultResult(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/result/BaseSourceResult;
    .locals 9

    new-instance v8, Lcom/miui/gallery/search/resultpage/DataListSourceResult;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const-wide/16 v6, -0x1

    move-object v0, v8

    move-object v1, p1

    move-object v2, p0

    move-object v3, p2

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/search/resultpage/DataListSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;IZJ)V

    return-object v8
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "server_controlled_data_list"

    return-object v0
.end method

.method public getPriority(Lcom/miui/gallery/search/core/QueryInfo;)I
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FILTER:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-ne v0, v1, :cond_0

    const/4 p1, 0x3

    return p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getPriority(Lcom/miui/gallery/search/core/QueryInfo;)I

    move-result p1

    return p1
.end method

.method protected getQueryAppendPath(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/String;
    .locals 0

    const-string p1, "list"

    return-object p1
.end method

.method protected getQueryParams(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;
    .locals 3
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

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getQueryParams(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/util/Map;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "rankName"

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    const-string v1, "rankName"

    invoke-interface {p1, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "rankOrder"

    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    const-string v2, "rankOrder"

    invoke-interface {p1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Lcom/miui/gallery/search/core/source/server/ItemRankInfo;

    invoke-direct {v2}, Lcom/miui/gallery/search/core/source/server/ItemRankInfo;-><init>()V

    iput-object v0, v2, Lcom/miui/gallery/search/core/source/server/ItemRankInfo;->name:Ljava/lang/String;

    iput-object v1, v2, Lcom/miui/gallery/search/core/source/server/ItemRankInfo;->order:Ljava/lang/String;

    const-string v0, "rankInfo"

    invoke-static {}, Lcom/miui/gallery/search/core/source/server/HttpUtils;->createGson()Lcom/google/gson/Gson;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object p1
.end method

.method protected getResponseDataType(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/reflect/Type;
    .locals 0

    const-class p1, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    return-object p1
.end method

.method public getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 13

    :try_start_0
    const-string v0, "num"

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x64

    if-le v0, v1, :cond_5

    const-string v2, "pos"

    invoke-virtual {p1, v2}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    add-int/2addr v0, v2

    const/4 v3, 0x1

    sub-int/2addr v0, v3

    new-instance v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;-><init>(Lcom/miui/gallery/search/core/source/server/DataListSource$1;)V

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    iput-object v6, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    :goto_0
    if-gt v2, v0, :cond_4

    iget-boolean v6, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->isLastPage:Z

    if-nez v6, :cond_4

    sub-int v6, v0, v2

    add-int/2addr v6, v3

    invoke-static {v1, v6}, Ljava/lang/Math;->min(II)I

    move-result v6

    new-instance v7, Lcom/miui/gallery/search/core/QueryInfo$Builder;

    invoke-direct {v7}, Lcom/miui/gallery/search/core/QueryInfo$Builder;-><init>()V

    invoke-virtual {v7, p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->cloneFrom(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object v7

    const-string v8, "num"

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v7, v8, v6}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object v6

    const-string v7, "pos"

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v6

    const-string v7, "DataListSource"

    const-string v8, "Start batch request [%s]"

    invoke-static {v7, v8, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, v6}, Lcom/miui/gallery/search/core/source/server/DataListSource;->getRequestBuilder(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest$Builder;->build()Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;

    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    :try_start_1
    invoke-virtual {v6}, Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v7

    if-eqz v7, :cond_3

    array-length v8, v7

    if-lez v8, :cond_3

    const/4 v8, 0x0

    aget-object v9, v7, v8

    instance-of v9, v9, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    if-eqz v9, :cond_3

    aget-object v7, v7, v8

    check-cast v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    iget-wide v8, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    const-wide/16 v10, 0x0

    cmp-long v12, v8, v10

    if-lez v12, :cond_1

    iget-wide v8, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    iget-wide v10, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    cmp-long v12, v8, v10

    if-nez v12, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/net/base/RequestError;

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->DATA_BIND_ERROR:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v2, "Index hash changed!"

    invoke-direct {v0, v1, v2, v5}, Lcom/miui/gallery/net/base/RequestError;-><init>(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0

    :cond_1
    iget-wide v8, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    iput-wide v8, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    :goto_1
    iget-object v8, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    if-eqz v8, :cond_2

    iget-object v8, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_2

    iget v8, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->nextPosition:I

    if-le v8, v2, :cond_2

    iget-object v2, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    iget-object v8, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    invoke-interface {v2, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget v2, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->nextPosition:I

    iput v2, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->nextPosition:I

    const-string v2, "DataListSource"

    const-string v8, "On add batch request result [%d]"

    iget-object v9, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v2, v8, v9}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v2, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->isLastPage:Z

    iput-boolean v2, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->isLastPage:Z

    iget v2, v7, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->nextPosition:I

    goto/16 :goto_0

    :cond_2
    iput-boolean v3, v4, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->isLastPage:Z

    goto :goto_2

    :cond_3
    new-instance v0, Lcom/miui/gallery/net/base/RequestError;

    sget-object v1, Lcom/miui/gallery/net/base/ErrorCode;->BODY_EMPTY:Lcom/miui/gallery/net/base/ErrorCode;

    const-string v2, "Execute result should not be null"

    invoke-direct {v0, v1, v2, v5}, Lcom/miui/gallery/net/base/RequestError;-><init>(Lcom/miui/gallery/net/base/ErrorCode;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
    :try_end_1
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :try_start_2
    new-instance v0, Lcom/miui/gallery/search/core/result/ErrorInfo;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/core/result/ErrorInfo;-><init>(I)V

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/source/server/DataListSource;->onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/result/ErrorInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0

    return-object v0

    :catch_1
    move-exception v0

    invoke-virtual {p0, p1, v6, v0}, Lcom/miui/gallery/search/core/source/server/DataListSource;->onResponseError(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Lcom/miui/gallery/net/base/RequestError;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0

    return-object v0

    :cond_4
    :goto_2
    invoke-virtual {p0, p1, v5, v4}, Lcom/miui/gallery/search/core/source/server/DataListSource;->onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0

    return-object v0

    :cond_5
    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    return-object v0

    :catch_2
    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/source/server/DataListSource;->getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;

    move-result-object p1

    return-object p1
.end method

.method public getSupportSearchTypes()[Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/core/source/server/DataListSource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object v0
.end method

.method protected isPersistable(Lcom/miui/gallery/search/core/QueryInfo;)Z
    .locals 2

    if-eqz p1, :cond_0

    const-string v0, "0"

    const-string v1, "pos"

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 8

    instance-of p2, p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    if-nez p2, :cond_0

    const-string p1, "DataListSource"

    const-string p2, "Not supported response data type"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_0
    check-cast p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;

    new-instance p2, Lcom/miui/gallery/search/resultpage/DataListSourceResult;

    iget-object v0, p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->items:Ljava/util/List;

    invoke-static {v0, p0, p1}, Lcom/miui/gallery/search/core/source/server/ConvertUtil;->createSuggestionCursor(Ljava/util/List;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v3

    iget v4, p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->nextPosition:I

    iget-boolean v5, p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->isLastPage:Z

    iget-wide v6, p3, Lcom/miui/gallery/search/core/source/server/DataListSource$DataListResponseData;->indexHash:J

    move-object v0, p2

    move-object v1, p1

    move-object v2, p0

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/search/resultpage/DataListSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;IZJ)V

    return-object p2
.end method
