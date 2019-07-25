.class public Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;
.super Ljava/lang/Object;
.source "PeopleFaceSnapshotHelper.java"


# direct methods
.method public static cursor2Entities(Landroid/database/Cursor;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/face/PeopleItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v1, 0x0

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleItem;->fromCursor(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/PeopleItem;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Lcom/miui/gallery/util/face/PeopleItem;->getRelationType()I

    move-result v3

    invoke-static {v3}, Lcom/miui/gallery/model/PeopleContactInfo;->isUnKnownRelation(I)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/util/face/PeopleItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    add-int/lit8 v1, v1, 0x1

    :cond_1
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_2

    const/16 v2, 0x12

    if-lt v1, v2, :cond_0

    :cond_2
    return-object v0
.end method

.method public static declared-synchronized persist(Ljava/util/List;)I
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/face/PeopleItem;",
            ">;)I"
        }
    .end annotation

    const-class v0, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

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

    const-class v6, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-virtual {v5, v6}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->deleteAll(Ljava/lang/Class;)Z

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/util/face/PeopleItem;

    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    move-result v5

    add-int/2addr v1, v5

    goto :goto_0

    :cond_0
    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->commit()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->end()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 p0, 0x0

    sub-long/2addr v4, v2

    const-string p0, "PeopleFaceSnapshotHelper"

    const-string v2, "save people count %d, cost %d"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-static {p0, v2, v3, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    const-string v2, "costs"

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "count"

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "people"

    const-string v3, "people_snapshot_save_time"

    invoke-static {v2, v3, p0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_1

    :catchall_0
    move-exception p0

    invoke-virtual {v4}, Lcom/miui/gallery/dao/base/EntityTransaction;->end()V

    throw p0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object p0

    const-class v2, Lcom/miui/gallery/util/face/PeopleItem;

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

    const-string v0, "PeopleFaceSnapshotHelper"

    const-string v1, "queryAndPersist on thread: %s"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$PeopleFace;->PERSONS_URI:Landroid/net/Uri;

    sget-object v3, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {p0}, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;->cursor2Entities(Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;->persist(Ljava/util/List;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-void

    :catchall_0
    move-exception v0

    move-object v7, v0

    move-object v0, p0

    move-object p0, v7

    goto :goto_0

    :catchall_1
    move-exception p0

    :goto_0
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p0
.end method
