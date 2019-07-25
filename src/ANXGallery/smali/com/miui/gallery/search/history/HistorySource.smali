.class public Lcom/miui/gallery/search/history/HistorySource;
.super Lcom/miui/gallery/search/core/source/InterceptableSource;
.source "HistorySource.java"


# static fields
.field private static final PROJECTION:[Ljava/lang/String;

.field private static final SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/miui/gallery/search/SearchConstants$SearchType;

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sput-object v0, Lcom/miui/gallery/search/history/HistorySource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v0, "title"

    const-string v1, "subTitle"

    const-string v2, "actionUri"

    const-string v3, "icon"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/search/history/HistorySource;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/source/InterceptableSource;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public doGetSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SourceResult;
    .locals 11

    sget-object v0, Lcom/miui/gallery/search/SearchContract$History;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "query_limit"

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/search/SearchConfig;->getHistoryConfig()Lcom/miui/gallery/search/SearchConfig$HistoryConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/search/SearchConfig$HistoryConfig;->getNavigationReturnCount()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "query_text"

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "query_text"

    const-string v2, "query_text"

    invoke-virtual {p1, v2}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/search/history/HistorySource;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/search/history/HistorySource;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const-string v7, "timestamp DESC"

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/search/SearchConfig;->getHistoryConfig()Lcom/miui/gallery/search/SearchConfig$HistoryConfig;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    new-instance v2, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    invoke-virtual {v1}, Lcom/miui/gallery/search/SearchConfig$HistoryConfig;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;

    invoke-direct {v6, p1, v0}, Lcom/miui/gallery/search/core/suggestion/CursorBackedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Landroid/database/Cursor;)V

    const/4 v7, 0x0

    iget-object v0, p0, Lcom/miui/gallery/search/history/HistorySource;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/SearchConfig$HistoryConfig;->getTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v8

    iget-object v0, p0, Lcom/miui/gallery/search/history/HistorySource;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/SearchConfig$HistoryConfig;->getSubTitle(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    move-object v3, v2

    move-object v4, p1

    invoke-direct/range {v3 .. v10}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/SearchConstants$SectionType;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;)V

    :cond_1
    const-string v0, "HistorySource"

    const-string v1, "On load %s search histories"

    if-nez v2, :cond_2

    const/4 v3, 0x0

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v3

    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/search/core/result/BaseSourceResult;

    invoke-direct {v0, p1, p0, v2}, Lcom/miui/gallery/search/core/result/BaseSourceResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/Source;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    const-string v0, "local_history_source"

    return-object v0
.end method

.method public getPriority(Lcom/miui/gallery/search/core/QueryInfo;)I
    .locals 1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HISTORY:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x3

    return p1
.end method

.method public getSupportSearchTypes()[Lcom/miui/gallery/search/SearchConstants$SearchType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/history/HistorySource;->SUPPORT_SEARCH_TYPE:[Lcom/miui/gallery/search/SearchConstants$SearchType;

    return-object v0
.end method

.method protected isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_NAVIGATION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/SearchConfig;->getNavigationConfig()Lcom/miui/gallery/search/SearchConfig$NavigationConfig;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/SearchConfig$NavigationConfig;->isFatalCondition(I)Z

    move-result p1

    return p1

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/core/source/InterceptableSource;->isFatalCondition(Lcom/miui/gallery/search/core/QueryInfo;I)Z

    move-result p1

    return p1
.end method
