.class public Lcom/miui/gallery/provider/cache/SearchHistoryManager;
.super Lcom/miui/gallery/provider/cache/CacheManager;
.source "SearchHistoryManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/CacheManager<",
        "Lcom/miui/gallery/provider/cache/SearchHistoryItem;",
        ">;"
    }
.end annotation


# static fields
.field private static final EMPTY_CACHE:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/SearchHistoryItem;",
            ">;"
        }
    .end annotation
.end field

.field private static sSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/CacheManager;-><init>()V

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/provider/cache/SearchHistoryItem$Generator;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/SearchHistoryItem$Generator;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    return-void
.end method

.method private ensureCache()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->load()V

    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_0
    :goto_0
    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/provider/cache/SearchHistoryManager;
    .locals 2

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->sSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->sSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    invoke-direct {v1}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->sSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->sSearchHistoryManager:Lcom/miui/gallery/provider/cache/SearchHistoryManager;

    return-object v0
.end method

.method private load()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    sget-object v1, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    if-ne v0, v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchHistoryStorageHelper;->getSavedHistories()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_0
    return-void
.end method


# virtual methods
.method public delete(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->deleteAll()I

    move-result p1

    return p1
.end method

.method public deleteAll()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/provider/cache/SearchHistoryStorageHelper;->clearSavedHistories()I

    move-result v1

    if-lez v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    sget-object v3, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    if-eq v2, v3, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    :cond_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public insert(JLandroid/content/ContentValues;)J
    .locals 3

    const-wide/16 v0, -0x1

    if-eqz p3, :cond_5

    invoke-virtual {p3}, Landroid/content/ContentValues;->size()I

    move-result v2

    if-gtz v2, :cond_0

    goto :goto_1

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v2, p1, p2, p3}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->from(JLandroid/content/ContentValues;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;

    if-eqz p1, :cond_4

    iget-object p2, p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->intentActionURI:Ljava/lang/String;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    iget-object p2, p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    if-nez p2, :cond_2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p2

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    iput-object p2, p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1, p3}, Lcom/miui/gallery/provider/cache/SearchHistoryStorageHelper;->addHistoryItem(Lcom/miui/gallery/provider/cache/SearchHistoryItem;Ljava/util/List;)I

    move-result p1

    if-lez p1, :cond_3

    iput-object p3, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    const-wide/16 v0, 0x0

    :cond_3
    monitor-exit p2

    return-wide v0

    :catchall_0
    move-exception p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_4
    :goto_0
    const-string p1, ".searchProvider.SearchHistoryManager"

    const-string p2, "Try to insert history with no action uri!"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0

    :cond_5
    :goto_1
    const-string p1, ".searchProvider.SearchHistoryManager"

    const-string p2, "Try to insert history with empty content value!"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0
.end method

.method protected onCreateCursor([Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/SearchHistoryItem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/database/Cursor;"
        }
    .end annotation

    if-eqz p5, :cond_0

    const-string p3, "query_limit"

    const/4 p4, -0x1

    invoke-virtual {p5, p3, p4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result p3

    :goto_0
    if-ltz p3, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p4

    if-ge p3, p4, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p4

    add-int/lit8 p4, p4, -0x1

    invoke-interface {p2, p4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    new-instance p3, Lcom/miui/gallery/provider/cache/RawCursor;

    iget-object p4, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {p4}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object p4

    invoke-direct {p3, p2, p1, p4}, Lcom/miui/gallery/provider/cache/RawCursor;-><init>(Ljava/util/List;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V

    return-object p3
.end method

.method public query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->ensureCache()V

    if-eqz p6, :cond_2

    const-string v0, "query_text"

    invoke-virtual {p6, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "(title LIKE ? OR subTitle LIKE ?)"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "query_text"

    invoke-virtual {p6, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, "query_text"

    invoke-virtual {p6, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    if-nez p2, :cond_0

    move-object p2, v0

    goto :goto_0

    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ") AND "

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    :goto_0
    if-nez p3, :cond_1

    move-object p3, v1

    goto :goto_1

    :cond_1
    invoke-static {p3, v1}, Lcom/miui/gallery/util/StringUtils;->mergeStringArray([Ljava/lang/String;[Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p3

    :cond_2
    :goto_1
    move-object v2, p2

    move-object v3, p3

    move-object v0, p0

    move-object v1, p1

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-super/range {v0 .. v6}, Lcom/miui/gallery/provider/cache/CacheManager;->query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public releaseCache()V
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->EMPTY_CACHE:Ljava/util/List;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/SearchHistoryManager;->mCache:Ljava/util/List;

    return-void
.end method

.method public update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 0

    const-string p1, ".searchProvider.SearchHistoryManager"

    const-string p2, "[Update] operation not supported! "

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method
