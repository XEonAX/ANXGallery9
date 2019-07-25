.class public Lcom/miui/gallery/search/core/source/server/HintSource;
.super Lcom/miui/gallery/search/core/source/server/ServerSource;
.source "HintSource.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/source/server/HintSource$HintResponseData;
    }
.end annotation


# static fields
.field private static final SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/miui/gallery/search/SearchConstants$SearchType;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HINT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/search/core/source/server/HintSource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method private static createSuggestionCursor(Ljava/util/List;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/source/server/HintSuggestion;",
            ">;",
            "Lcom/miui/gallery/search/core/source/Source;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            ")",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;"
        }
    .end annotation

    if-eqz p0, :cond_3

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_1

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/source/server/HintSuggestion;

    new-instance v2, Ljava/util/HashMap;

    const/4 v3, 0x3

    invoke-direct {v2, v3}, Ljava/util/HashMap;-><init>(I)V

    const-string v3, "hint_text"

    iget-object v4, v1, Lcom/miui/gallery/search/core/source/server/HintSuggestion;->hintText:Ljava/lang/String;

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v3, "display_duration"

    iget v4, v1, Lcom/miui/gallery/search/core/source/server/HintSuggestion;->displayDurationMs:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v3, v1, Lcom/miui/gallery/search/core/source/server/HintSuggestion;->queryText:Ljava/lang/String;

    if-eqz v3, :cond_1

    const-string v3, "query_text"

    iget-object v1, v1, Lcom/miui/gallery/search/core/source/server/HintSuggestion;->queryText:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-static {v2, p1}, Lcom/miui/gallery/search/core/source/server/ConvertUtil;->createSuggestion(Ljava/util/Map;Lcom/miui/gallery/search/core/source/Source;)Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-static {v0, p2}, Lcom/miui/gallery/search/core/source/server/ConvertUtil;->createSuggestionCursor(Ljava/util/List;Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_1
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method protected canCarryLog()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "server_controlled_hints"

    return-object v0
.end method

.method protected getQueryAppendPath(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/String;
    .locals 0

    const-string p1, "hint"

    return-object p1
.end method

.method protected getQueryUserPath(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    if-nez p1, :cond_0

    const-string p1, "anonymous"

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/source/server/ServerSource;->getQueryUserPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method protected getResponseDataType(Lcom/miui/gallery/search/core/QueryInfo;)Ljava/lang/reflect/Type;
    .locals 0

    const-class p1, Lcom/miui/gallery/search/core/source/server/HintSource$HintResponseData;

    return-object p1
.end method

.method public getSupportSearchTypes()[Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/core/source/server/HintSource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object v0
.end method

.method protected isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected onResponse(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/server/ServerSearchRequest;Ljava/lang/Object;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 0

    instance-of p2, p3, Lcom/miui/gallery/search/core/source/server/HintSource$HintResponseData;

    if-nez p2, :cond_0

    const-string p1, "HintSource"

    const-string p2, "Not supported response data type"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_0
    check-cast p3, Lcom/miui/gallery/search/core/source/server/HintSource$HintResponseData;

    new-instance p2, Lcom/miui/gallery/search/core/result/BaseSourceResult;

    iget-object p3, p3, Lcom/miui/gallery/search/core/source/server/HintSource$HintResponseData;->hintSuggestions:Ljava/util/List;

    invoke-static {p3, p0, p1}, Lcom/miui/gallery/search/core/source/server/HintSource;->createSuggestionCursor(Ljava/util/List;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p3

    invoke-direct {p2, p1, p0, p3}, Lcom/miui/gallery/search/core/result/BaseSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-object p2
.end method

.method protected useCache(Lcom/miui/gallery/search/core/QueryInfo;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method
