.class public Lcom/miui/gallery/assistant/library/Library;
.super Lcom/miui/gallery/dao/base/Entity;
.source "Library.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    }
.end annotation


# instance fields
.field private mLibraryId:J

.field private mLibraryItems:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "galleryResourceInfoList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/assistant/library/LibraryItem;",
            ">;"
        }
    .end annotation
.end field

.field private mLibraryStatus:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

.field private mRefreshTime:J


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/dao/base/Entity;-><init>()V

    sget-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_DEFAULT:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryStatus:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-void
.end method

.method private ensureLibraryDependency()V
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_6

    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    new-instance v2, Ljava/util/LinkedList;

    iget-object v3, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-direct {v2, v3}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/library/LibraryItem;->getParentId()J

    move-result-wide v5

    const-wide/16 v7, -0x1

    cmp-long v9, v5, v7

    if-nez v9, :cond_0

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v3}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_1
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    :goto_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_5

    invoke-interface {v3}, Ljava/util/List;->clear()V

    invoke-interface {v0, v1}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_3
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v7}, Lcom/miui/gallery/assistant/library/LibraryItem;->getParentId()J

    move-result-wide v8

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v10

    cmp-long v12, v8, v10

    if-nez v12, :cond_3

    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v6}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_4
    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-interface {v1, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_1

    :cond_5
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    monitor-exit p0

    goto :goto_3

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :cond_6
    :goto_3
    return-void
.end method

.method private loadInternal(Ljava/lang/String;)Z
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UnsafeDynamicallyLoadedCode"
        }
    .end annotation

    :try_start_0
    invoke-static {p1}, Ljava/lang/System;->load(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, 0x1

    return p1

    :catch_0
    move-exception p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/library/Library;->reportAlgorithmLoadError(Ljava/lang/Throwable;)V

    const/4 p1, 0x0

    return p1
.end method

.method private reportAlgorithmLoadError(Ljava/lang/Throwable;)V
    .locals 3

    const-string v0, "Library"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "algorithm"

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "error"

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string p1, ""

    :goto_0
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "assistant"

    const-string v1, "assistant_algorithm_error"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method getLibraryId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    return-wide v0
.end method

.method public getLibraryItems()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/library/LibraryItem;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryStatus:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-object v0
.end method

.method protected getTableColumns()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/dao/base/TableColumn;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "libraryId"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/library/Library;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "libraryItems"

    const-string v2, "TEXT"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/library/Library;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "refreshTime"

    const-string v2, "INTEGER"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/assistant/library/Library;->addColumn(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method protected getUniqueConstraints()[Ljava/lang/String;
    .locals 1

    const-string v0, "libraryId"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized isExist()Z
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return v1

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->isExist()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v2, :cond_1

    monitor-exit p0

    return v1

    :cond_2
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isLibraryItemInfosConsistent()Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/LibraryItem;->getExtraInfo()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/library/LibraryItem;->getExtraInfo()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    return v1

    :cond_1
    const/4 v0, 0x1

    return v0

    :cond_2
    return v1
.end method

.method public declared-synchronized isLoaded()Z
    .locals 4

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->isTypeSo()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->isLoaded()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_0

    monitor-exit p0

    return v1

    :cond_1
    const/4 v0, 0x1

    monitor-exit p0

    return v0

    :cond_2
    monitor-exit p0

    return v1

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method isOverDue()Z
    .locals 6

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/assistant/library/Library;->mRefreshTime:J

    const-wide/32 v4, 0x240c8400

    add-long/2addr v2, v4

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public declared-synchronized load()Z
    .locals 7

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/assistant/library/Library;->ensureLibraryDependency()V

    iget-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->isLoaded()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->isTypeSo()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->isLocal()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    :try_start_1
    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lcom/miui/gallery/assistant/library/LibraryItem;->setLoaded(Z)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    :try_start_2
    const-string v2, "Library"

    const-string v3, "Load internal local library %d error"

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->getTargetPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/miui/gallery/assistant/library/Library;->loadInternal(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string v2, "Library"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Library loaded success:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Lcom/miui/gallery/assistant/library/LibraryItem;->setLoaded(Z)V

    goto :goto_0

    :cond_3
    const-string v1, "Library"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Library load failed:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/library/Library;->isLoaded()Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onConvertToContents(Landroid/content/ContentValues;)V
    .locals 3

    const-string v0, "libraryId"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "libraryItems"

    iget-object v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;

    invoke-static {v1}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "refreshTime"

    iget-wide v1, p0, Lcom/miui/gallery/assistant/library/Library;->mRefreshTime:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    return-void
.end method

.method protected onInitFromCursor(Landroid/database/Cursor;)V
    .locals 4

    const-string v0, "libraryId"

    invoke-static {p1, v0}, Lcom/miui/gallery/assistant/library/Library;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    :try_start_0
    const-string v0, "libraryItems"

    invoke-static {p1, v0}, Lcom/miui/gallery/assistant/library/Library;->getString(Landroid/database/Cursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GsonUtils;->getArray(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryItems:Ljava/util/ArrayList;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v0, "Library"

    const-string v1, "Create libraryItems of library %d from cursor error"

    iget-wide v2, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    const-string v0, "refreshTime"

    invoke-static {p1, v0}, Lcom/miui/gallery/assistant/library/Library;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/library/Library;->mRefreshTime:J

    return-void
.end method

.method public setLibraryId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    return-void
.end method

.method public setLibraryStatus(Lcom/miui/gallery/assistant/library/Library$LibraryStatus;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryStatus:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    return-void
.end method

.method setRefreshTime(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/assistant/library/Library;->mRefreshTime:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Library{mLibraryId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/assistant/library/Library;->mLibraryId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
