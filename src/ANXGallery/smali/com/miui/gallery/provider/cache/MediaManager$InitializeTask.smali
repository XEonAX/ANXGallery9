.class Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;
.super Ljava/lang/Object;
.source "MediaManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "InitializeTask"
.end annotation


# instance fields
.field private mDBHelper:Landroid/database/sqlite/SQLiteOpenHelper;

.field final synthetic this$0:Lcom/miui/gallery/provider/cache/MediaManager;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/MediaManager;Landroid/database/sqlite/SQLiteOpenHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->mDBHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    return-void
.end method

.method private getLoadSortBy()Ljava/lang/String;
    .locals 6

    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->getSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;->MODIFY_TIME:Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    invoke-interface {v0, v1}, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;->getAlbumIdsBySortDate(Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "mixedDateTime"

    return-object v0

    :cond_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "(case when %s in (%s) then %s else %s end)"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "localGroupId"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, ","

    invoke-static {v5, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    const/4 v0, 0x2

    const-string v4, "dateModified"

    aput-object v4, v3, v0

    const/4 v0, 0x3

    const-string v4, "mixedDateTime"

    aput-object v4, v3, v0

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private loadFullPart(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 17

    move-object/from16 v1, p0

    const-string v0, ".provider.cache.MediaManager"

    const-string v2, "start load second part"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, v1, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v4}, Lcom/miui/gallery/provider/cache/MediaManager;->access$900(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v4, :cond_0

    const-string v4, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType IN (1,2)"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->getLoadSortBy()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " DESC LIMIT -1 OFFSET "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v8, 0x80

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    :goto_0
    move-object v11, v4

    move-object v15, v7

    goto :goto_1

    :cond_0
    const-string v4, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType IN (1,2) AND _id NOT IN (%s)"

    new-array v7, v5, [Ljava/lang/Object;

    iget-object v8, v1, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v8}, Lcom/miui/gallery/provider/cache/MediaManager;->access$900(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v6

    invoke-static {v4, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->getLoadSortBy()Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    :goto_1
    const-string v9, "cloud"

    iget-object v4, v1, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v4, v4, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v4}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->getProjection()[Ljava/lang/String;

    move-result-object v10

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v16, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v16}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4

    if-nez v4, :cond_1

    return-void

    :cond_1
    const/16 v7, 0x1000

    :try_start_0
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->ensureCapacity(I)V

    :goto_2
    const/4 v8, 0x0

    :cond_2
    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_4

    iget-object v9, v1, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v9, v9, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v9, v4}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/2addr v8, v5

    if-eq v8, v7, :cond_3

    invoke-interface {v4}, Landroid/database/Cursor;->isLast()Z

    move-result v9

    if-eqz v9, :cond_2

    :cond_3
    invoke-direct {v1, v0}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->publishResult(Ljava/util/List;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_2

    :cond_4
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    const-string v0, ".provider.cache.MediaManager"

    const-string v5, "load second part cost: %d. current position = %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v4}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v5, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    throw v0
.end method

.method private loadMinimumPart(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 13

    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "read first part"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v3}, Lcom/miui/gallery/provider/cache/MediaManager;->access$900(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v3, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType IN (1,2)"

    :goto_0
    move-object v7, v3

    goto :goto_1

    :cond_0
    const-string v3, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType IN (1,2) AND _id IN (%s)"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v5}, Lcom/miui/gallery/provider/cache/MediaManager;->access$900(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0

    :goto_1
    const-string v5, "cloud"

    iget-object v3, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v3, v3, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v3}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->getProjection()[Ljava/lang/String;

    move-result-object v6

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->getLoadSortBy()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, " DESC"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    const/16 v3, 0x80

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v12

    move-object v4, p1

    invoke-virtual/range {v4 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v3
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez v3, :cond_1

    const-string p1, ".provider.cache.MediaManager"

    const-string v2, "fill provider failed with a null cursor"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :try_start_1
    new-instance p1, Ljava/util/ArrayList;

    const/16 v2, 0x40

    invoke-direct {p1, v2}, Ljava/util/ArrayList;-><init>(I)V

    :goto_2
    invoke-interface {v3}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v2, v2, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v2, v3}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_2
    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->publishResult(Ljava/util/List;)V

    const-string p1, ".provider.cache.MediaManager"

    const-string v2, "load %d item for the first time, costs %dms"

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v2, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    return-void

    :catchall_0
    move-exception p1

    invoke-interface {v3}, Landroid/database/Cursor;->close()V

    throw p1

    :catch_0
    move-exception v0

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    const-string v3, "dbversion"

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, " : "

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteException;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v3, "exception"

    invoke-interface {v1, v3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "db_helper"

    const-string v3, "db_mediamanager_load"

    invoke-static {p1, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v2}, Lcom/miui/gallery/util/DebugUtil;->exportDB(Z)V

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->deleteDatabase()Z

    throw v0
.end method

.method private lockedLoadMinimumPart(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$600(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0

    const/4 v1, 0x1

    :try_start_0
    const-string v2, ".provider.cache.MediaManager"

    const-string v3, "read albums"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v2}, Lcom/miui/gallery/provider/cache/MediaManager;->access$700(Lcom/miui/gallery/provider/cache/MediaManager;)Lcom/miui/gallery/provider/cache/AlbumDelegate;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->load(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v2}, Lcom/miui/gallery/provider/cache/MediaManager;->access$800(Lcom/miui/gallery/provider/cache/MediaManager;)Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/miui/gallery/provider/cache/FavoritesDelegate;->load(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$HomePage;->getHomePageImageIds()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/provider/cache/MediaManager;->access$902(Lcom/miui/gallery/provider/cache/MediaManager;Ljava/lang/String;)Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->loadMinimumPart(Landroid/database/sqlite/SQLiteDatabase;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {p1, v1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$1002(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$600(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v2, v1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$1002(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$600(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    throw p1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p1
.end method

.method private notifyProgressUpdate()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v1}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;

    if-eqz v2, :cond_0

    invoke-interface {v2}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;->onProgressUpdate()V

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private publishResult(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v0, v0, Lcom/miui/gallery/provider/cache/MediaManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/cache/MediaItem;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iget-object v2, v2, Lcom/miui/gallery/provider/cache/MediaManager;->mCache:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->notifyProgressUpdate()V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public run()V
    .locals 3

    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "acquire initialize lock"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    :try_start_0
    const-string v1, ".provider.cache.MediaManager"

    const-string v2, "start initialize"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->mDBHelper:Landroid/database/sqlite/SQLiteOpenHelper;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->lockedLoadMinimumPart(Landroid/database/sqlite/SQLiteDatabase;)V

    const/16 v2, 0xa

    invoke-static {v2}, Landroid/os/Process;->setThreadPriority(I)V

    invoke-direct {p0, v1}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->loadFullPart(Landroid/database/sqlite/SQLiteDatabase;)V

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v1, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$202(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v1, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$302(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$400(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v1

    monitor-enter v1

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    monitor-exit v1

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_1
    move-exception v1

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$302(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$400(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/concurrent/CountDownLatch;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v0}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    :try_start_2
    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-static {v2}, Lcom/miui/gallery/provider/cache/MediaManager;->access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    throw v1

    :catchall_2
    move-exception v1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    throw v1
.end method
