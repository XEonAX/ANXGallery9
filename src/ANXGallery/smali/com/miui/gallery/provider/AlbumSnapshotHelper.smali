.class public Lcom/miui/gallery/provider/AlbumSnapshotHelper;
.super Ljava/lang/Object;
.source "AlbumSnapshotHelper.java"


# direct methods
.method static synthetic lambda$persist$20(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide p0

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Long;->compare(JJ)I

    move-result p0

    return p0
.end method

.method public static declared-synchronized persist(Ljava/util/List;)I
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;)I"
        }
    .end annotation

    const-class v0, Lcom/miui/gallery/provider/AlbumSnapshotHelper;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    sget-object v2, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    if-eq p0, v2, :cond_3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sget-object v4, Lcom/miui/gallery/provider/-$$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY;->INSTANCE:Lcom/miui/gallery/provider/-$$Lambda$AlbumSnapshotHelper$XhaKj7ydYj21gKVmCuxq2f3VSLY;

    invoke-static {p0, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getTransaction()Lcom/miui/gallery/dao/base/EntityTransaction;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->begin()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v5

    const-class v6, Lcom/miui/gallery/model/Album;

    invoke-virtual {v5, v6}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->deleteAll(Ljava/lang/Class;)Z

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/model/Album;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    const-class v7, Lcom/miui/gallery/model/Album;

    if-ne v6, v7, :cond_0

    invoke-virtual {v5}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result v6

    if-eqz v6, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v5

    add-int/2addr v1, v5

    const/16 v5, 0xb4

    if-lt v1, v5, :cond_0

    :cond_2
    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->commit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->end()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 p0, 0x0

    sub-long/2addr v4, v2

    const-string p0, "AlbumSnapshotHelper"

    const-string v2, "Save snapshot for [%d] albums costs [%dms]"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p0, v2, v3, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "album_count"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "costs"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "album"

    const-string v3, "album_snapshot_save_time"

    invoke-static {v2, v3, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->end()V

    throw p0

    :cond_3
    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object p0

    const-class v2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->deleteAll(Ljava/lang/Class;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_1
    monitor-exit v0

    return v1

    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static queryAndPersist(Landroid/content/Context;)V
    .locals 8

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_face"

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_video"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_share"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_recent"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_favorites"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "exclude_empty_album"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "fill_covers"

    const-string v2, "true"

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v2

    const-string v4, "classification = 0"

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v3, Lcom/miui/gallery/model/AlbumConstants;->PROJECTION:[Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    new-instance v0, Lcom/miui/gallery/loader/AlbumConvertCallback;

    invoke-direct {v0}, Lcom/miui/gallery/loader/AlbumConvertCallback;-><init>()V

    invoke-virtual {v0, p0}, Lcom/miui/gallery/loader/AlbumConvertCallback;->convert(Landroid/database/Cursor;)Lcom/miui/gallery/model/AlbumList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/AlbumSnapshotHelper;->persist(Ljava/util/List;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v7, v0

    move-object v0, p0

    move-object p0, v7

    goto :goto_3

    :catch_1
    move-exception p0

    move-object v7, v0

    move-object v0, p0

    move-object p0, v7

    :goto_1
    :try_start_2
    const-string v1, "AlbumSnapshotHelper"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-void

    :catchall_1
    move-exception v0

    :goto_3
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method
