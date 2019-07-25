.class public Lcom/miui/gallery/provider/cache/AlbumDelegate;
.super Ljava/lang/Object;
.source "AlbumDelegate.java"


# static fields
.field private static final INITIALIZATION_LOCK:Ljava/lang/Object;

.field private static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mAttributes:Landroid/support/v4/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LongSparseArray<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mInitialized:Z

.field private mSortDate:Landroid/support/v4/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/LongSparseArray<",
            "Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->INITIALIZATION_LOCK:Ljava/lang/Object;

    const-string v0, "_id"

    const-string v1, "attributes"

    const-string v2, "localFile"

    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mInitialized:Z

    new-instance v0, Landroid/support/v4/util/LongSparseArray;

    invoke-direct {v0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    new-instance v0, Landroid/support/v4/util/LongSparseArray;

    invoke-direct {v0}, Landroid/support/v4/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mSortDate:Landroid/support/v4/util/LongSparseArray;

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    const-wide/16 v1, 0x1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const-wide/16 v2, -0x3e8

    invoke-virtual {v0, v2, v3, v1}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public delete(J)V
    .locals 3

    const-string v0, ".provider.cache.AlbumDelegate"

    const-string v1, "delete album[%d] attributes"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/support/v4/util/LongSparseArray;->delete(J)V

    return-void
.end method

.method public getSortDate(J)Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mSortDate:Landroid/support/v4/util/LongSparseArray;

    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->getSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v1

    invoke-interface {v1}, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;->getDefaultSortDate()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    return-object p1
.end method

.method public insert(JJ)V
    .locals 3

    const-string v0, ".provider.cache.AlbumDelegate"

    const-string v1, "insert album[%d] attributes"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    return-void
.end method

.method public isAutoUpload(J)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, p1, p2, v3}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    const-wide/16 v3, 0x1

    and-long/2addr p1, v3

    cmp-long v0, p1, v1

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isHidden(J)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, p1, p2, v3}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    const-wide/16 v3, 0x10

    and-long/2addr p1, v3

    cmp-long v0, p1, v1

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->isShowHiddenAlbum()Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isShowInHomePage(J)Z
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, p1, p2, v3}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide p1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$HiddenAlbum;->isShowHiddenAlbum()Z

    move-result v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-wide/16 v5, 0x4

    if-eqz v0, :cond_1

    and-long/2addr p1, v5

    cmp-long v0, p1, v1

    if-eqz v0, :cond_0

    const/4 v3, 0x1

    :cond_0
    return v3

    :cond_1
    and-long/2addr v5, p1

    cmp-long v0, v5, v1

    if-eqz v0, :cond_2

    const-wide/16 v5, 0x10

    and-long/2addr p1, v5

    cmp-long v0, p1, v1

    if-nez v0, :cond_2

    const/4 v3, 0x1

    :cond_2
    return v3
.end method

.method public load(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 12

    sget-object v0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->INITIALIZATION_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v3, 0x0

    :try_start_1
    const-string v5, "cloud"

    sget-object v6, Lcom/miui/gallery/provider/cache/AlbumDelegate;->PROJECTION:[Ljava/lang/String;

    const-string v7, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (serverType=0)"

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    move-object v4, p1

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v4
    :try_end_1
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/4 p1, 0x1

    if-eqz v4, :cond_1

    :try_start_2
    invoke-static {}, Lcom/miui/gallery/provider/MediaSortDateHelper;->getSortDateProvider()Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;

    move-result-object v5

    invoke-interface {v4}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {v4}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v6

    if-nez v6, :cond_0

    invoke-interface {v4, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    iget-object v8, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-interface {v4, p1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    invoke-virtual {v8, v6, v7, v9}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    iget-object v8, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mSortDate:Landroid/support/v4/util/LongSparseArray;

    const/4 v9, 0x2

    invoke-interface {v4, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-interface {v5, v9}, Lcom/miui/gallery/provider/MediaSortDateHelper$SortDateProvider;->getSortDateByAlbumPath(Ljava/lang/String;)Lcom/miui/gallery/provider/MediaSortDateHelper$SortDate;

    move-result-object v9

    invoke-virtual {v8, v6, v7, v9}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    invoke-interface {v4}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_0
    const-string v3, ".provider.cache.AlbumDelegate"

    const-string v5, "loaded %d albums from cursor[%d]"

    iget-object v6, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-virtual {v6}, Landroid/support/v4/util/LongSparseArray;->size()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4}, Landroid/database/Cursor;->getCount()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v3, v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_1
    const-string v3, ".provider.cache.AlbumDelegate"

    const-string v5, "fill provider failed with a null cursor"

    invoke-static {v3, v5}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :goto_1
    if-eqz v4, :cond_2

    :try_start_3
    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    :cond_2
    const-string v3, ".provider.cache.AlbumDelegate"

    const-string v4, "load attributes cost: %s"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    sub-long/2addr v5, v1

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mInitialized:Z

    monitor-exit v0

    return-void

    :goto_2
    if-eqz v4, :cond_3

    invoke-interface {v4}, Landroid/database/Cursor;->close()V

    :cond_3
    throw p1

    :catch_0
    move-exception v1

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v2

    const-string v4, "dbversion"

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->getVersion()I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v2, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "exception"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, " : "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->getCause()Ljava/lang/Throwable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, p1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "db_helper"

    const-string v4, "db_mediamanager_load"

    invoke-static {p1, v4, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {v3}, Lcom/miui/gallery/util/DebugUtil;->exportDB(Z)V

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->deleteDatabase()Z

    throw v1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method public queryAttributes(J)Ljava/lang/Long;
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mInitialized:Z

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p1, p2, v1}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    return-object p1

    :cond_0
    const-string v0, ".provider.cache.AlbumDelegate"

    const-string v3, "not initialized, wait"

    invoke-static {v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->INITIALIZATION_LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v3, p1, p2, v1}, Landroid/support/v4/util/LongSparseArray;->get(JLjava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Long;

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public update(JJ)V
    .locals 3

    const-string v0, ".provider.cache.AlbumDelegate"

    const-string v1, "update album[%d] attributes"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/AlbumDelegate;->mAttributes:Landroid/support/v4/util/LongSparseArray;

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v4/util/LongSparseArray;->put(JLjava/lang/Object;)V

    return-void
.end method
