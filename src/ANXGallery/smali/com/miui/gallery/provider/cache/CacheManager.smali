.class public abstract Lcom/miui/gallery/provider/cache/CacheManager;
.super Ljava/lang/Object;
.source "CacheManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/miui/gallery/provider/cache/CacheItem;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected mCache:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/CacheItem$Generator<",
            "TT;>;"
        }
    .end annotation
.end field

.field protected final mModifyLock:Ljava/lang/Object;

.field protected mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    return-void
.end method

.method private sort(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/16 v2, 0x20

    invoke-virtual {p2, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-lez v2, :cond_0

    move v3, v2

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    :goto_0
    const/4 v4, 0x0

    invoke-virtual {p2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v5}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object v5

    invoke-interface {v5, v3}, Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;->getIndex(Ljava/lang/String;)I

    move-result v5

    if-ltz v5, :cond_2

    if-lez v2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {p2, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    const-string v2, "desc"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 v4, 0x1

    :cond_1
    invoke-virtual {p0, p1, v5, v4}, Lcom/miui/gallery/provider/cache/CacheManager;->sort(Ljava/util/List;IZ)V

    const-string p2, ".provider.cache.CacheManager"

    const-string v2, "sort cost: %sms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " not found"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public delete(Ljava/lang/String;[Ljava/lang/String;)I
    .locals 3

    const-string v0, ".provider.cache.CacheManager"

    const-string v1, "deleting %s, %s"

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mCache:Ljava/util/List;

    invoke-virtual {p0, p1, p2, v1}, Lcom/miui/gallery/provider/cache/CacheManager;->internalDelete(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;)I

    move-result p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p2, ".provider.cache.CacheManager"

    const-string v0, "delete finished"

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected filter(Lcom/miui/gallery/provider/cache/Filter;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/cache/Filter<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mCache:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v3, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mCache:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/provider/cache/CacheItem;

    invoke-virtual {p1, v4}, Lcom/miui/gallery/provider/cache/Filter;->filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string p1, ".provider.cache.CacheManager"

    const-string v3, "filter cost: %sms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2
.end method

.method protected filterLogInfo(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 0

    return-object p1
.end method

.method protected group(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v2}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object v2

    invoke-interface {v2, p2}, Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;->getIndex(Ljava/lang/String;)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v3, v2}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMerger(I)Lcom/miui/gallery/provider/cache/CacheItem$Merger;

    move-result-object v3

    const/4 v4, -0x1

    if-eq v2, v4, :cond_2

    new-instance p2, Ljava/util/HashMap;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    div-int/lit8 v4, v4, 0x3

    invoke-direct {p2, v4}, Ljava/util/HashMap;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/provider/cache/CacheItem;

    const/4 v5, 0x0

    invoke-interface {v4, v2, v5}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/provider/cache/CacheItem;

    if-nez v6, :cond_0

    invoke-virtual {p2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    invoke-interface {v3, v6, v4, v2}, Lcom/miui/gallery/provider/cache/CacheItem$Merger;->merge(Lcom/miui/gallery/provider/cache/CacheItem;Lcom/miui/gallery/provider/cache/CacheItem;I)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object v4

    invoke-virtual {p2, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const-string p2, ".provider.cache.CacheManager"

    const-string v2, "group cost: %sms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p2, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object p1

    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " not found."

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public insert(JLandroid/content/ContentValues;)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->from(JLandroid/content/ContentValues;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mCache:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    monitor-exit v0

    return-wide p1

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mCache:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-wide p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method protected final internalDelete(Ljava/lang/String;[Ljava/lang/String;Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "TT;>;)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/provider/cache/Filter;->from(Ljava/lang/String;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/CacheManager;->filter(Lcom/miui/gallery/provider/cache/Filter;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    invoke-interface {p3, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const-string v1, ".provider.cache.CacheManager"

    const-string v2, "deleted %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return p2
.end method

.method protected final internalUpdate(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/provider/cache/Filter;->from(Ljava/lang/String;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter p2

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/CacheManager;->filter(Lcom/miui/gallery/provider/cache/Filter;)Ljava/util/List;

    move-result-object p1

    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v1, v0, p3}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->update(Lcom/miui/gallery/provider/cache/CacheItem;Landroid/content/ContentValues;)V

    const-string v1, ".provider.cache.CacheManager"

    const-string v2, "updated %s"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    return p2

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected onCreateCursor([Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "TT;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/database/Cursor;"
        }
    .end annotation

    new-instance p4, Lcom/miui/gallery/provider/cache/MemoryCursor;

    new-instance p5, Lcom/miui/gallery/provider/cache/DataResult;

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object v0

    invoke-direct {p5, p1, p2, v0}, Lcom/miui/gallery/provider/cache/DataResult;-><init>([Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V

    invoke-direct {p4, p5, p3}, Lcom/miui/gallery/provider/cache/MemoryCursor;-><init>(Lcom/miui/gallery/provider/cache/ResultSet;Ljava/lang/String;)V

    return-object p4
.end method

.method public query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-static {p2, p3, v2}, Lcom/miui/gallery/provider/cache/Filter;->from(Ljava/lang/String;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/Filter$FilterFactory;)Lcom/miui/gallery/provider/cache/Filter;

    move-result-object p3

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    invoke-virtual {p0, p3}, Lcom/miui/gallery/provider/cache/CacheManager;->filter(Lcom/miui/gallery/provider/cache/Filter;)Ljava/util/List;

    move-result-object p3

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0, p3, p5}, Lcom/miui/gallery/provider/cache/CacheManager;->group(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object p3

    :cond_0
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p5

    if-nez p5, :cond_1

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p5

    if-nez p5, :cond_1

    invoke-direct {p0, p3, p4}, Lcom/miui/gallery/provider/cache/CacheManager;->sort(Ljava/util/List;Ljava/lang/String;)Ljava/util/List;

    move-result-object p3

    :cond_1
    move-object v4, p3

    const-string p3, ".provider.cache.CacheManager"

    const-string p5, "query cost: %sms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p3, p5, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    move-object v2, p0

    move-object v3, p1

    move-object v5, p2

    move-object v6, p4

    move-object v7, p6

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/provider/cache/CacheManager;->onCreateCursor([Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method protected sort(Ljava/util/List;IZ)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;IZ)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v0, p2, p3}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getComparator(IZ)Ljava/util/Comparator;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-static {p1, p2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method

.method public update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 4

    const-string v0, ".provider.cache.CacheManager"

    const-string v1, "updating %s, args: %s with ContentValues[%s]"

    invoke-static {p2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, p3}, Lcom/miui/gallery/provider/cache/CacheManager;->filterLogInfo(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v3

    invoke-static {v0, v1, p1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/CacheManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/CacheManager;->internalUpdate(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p2, ".provider.cache.CacheManager"

    const-string p3, "update finished"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
