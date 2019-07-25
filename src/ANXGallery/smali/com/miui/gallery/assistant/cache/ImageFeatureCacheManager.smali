.class public Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;
.super Ljava/lang/Object;
.source "ImageFeatureCacheManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;,
        Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$ImageFeatureManagerHolder;
    }
.end annotation


# instance fields
.field private mGroupBestMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;",
            ">;"
        }
    .end annotation
.end field

.field private mImageTinyFeatureMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mInitialized:Z

.field private volatile mIsFirstShowImageSelection:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mIsFirstShowImageSelection:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;-><init>()V

    return-void
.end method

.method private addImageFeature(Lcom/miui/gallery/assistant/model/TinyImageFeature;)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-eqz v0, :cond_0

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->refreshGroupBestMap(Lcom/miui/gallery/assistant/model/TinyImageFeature;Z)V

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-void
.end method

.method private fillTinyFeaturesFromCursor(Ljava/util/List;Landroid/database/Cursor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;",
            "Landroid/database/Cursor;",
            ")V"
        }
    .end annotation

    if-eqz p1, :cond_1

    if-eqz p2, :cond_1

    :goto_0
    :try_start_0
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-direct {v0, p2}, Lcom/miui/gallery/assistant/model/TinyImageFeature;-><init>(Landroid/database/Cursor;)V

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception p1

    invoke-interface {p2}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_1
    :goto_1
    return-void
.end method

.method private declared-synchronized getAllImageFeatures()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/assistant/model/ImageFeature;

    sget-object v3, Lcom/miui/gallery/assistant/model/TinyImageFeature;->PROJECTION:[Ljava/lang/String;

    sget-object v4, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_IQA_CLUSTER_SELECTION:Ljava/lang/String;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, "imageId ASC"

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/miui/gallery/dao/GalleryEntityManager;->rawQuery(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->fillTinyFeaturesFromCursor(Ljava/util/List;Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized getImageFeaturesById(Ljava/util/List;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_IQA_CLUSTER_SELECTION:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " AND "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "%s IN (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "imageId"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, ","

    invoke-static {v5, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/assistant/model/ImageFeature;

    sget-object v4, Lcom/miui/gallery/assistant/model/TinyImageFeature;->PROJECTION:[Ljava/lang/String;

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "imageId ASC"

    const/4 v10, 0x0

    invoke-virtual/range {v2 .. v10}, Lcom/miui/gallery/dao/GalleryEntityManager;->rawQuery(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->fillTinyFeaturesFromCursor(Ljava/util/List;Landroid/database/Cursor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$ImageFeatureManagerHolder;->access$100()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    return-object v0
.end method

.method private declared-synchronized initGroupBestMap()V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    const/4 v2, 0x1

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->refreshGroupBestMap(Lcom/miui/gallery/assistant/model/TinyImageFeature;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private declared-synchronized refreshGroupBestMap(Lcom/miui/gallery/assistant/model/TinyImageFeature;Z)V
    .locals 5

    monitor-enter p0

    if-nez p1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    if-eqz p2, :cond_1

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->increase()I

    :cond_1
    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->tryReplace(Lcom/miui/gallery/assistant/model/TinyImageFeature;)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v2

    const/4 v4, 0x1

    invoke-direct {v1, v2, v3, v4, p1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;-><init>(JILcom/miui/gallery/assistant/model/TinyImageFeature;)V

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized refreshGroupBestMapbyGroupId(J)V
    .locals 3

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    if-eqz v0, :cond_1

    iget-object v1, v0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->clear()V

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeaturesByGroup(J)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-direct {p0, p2, v2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->refreshGroupBestMap(Lcom/miui/gallery/assistant/model/TinyImageFeature;Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_1
    :goto_1
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method


# virtual methods
.method public getAllGroups(Z)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-boolean v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    if-eqz v2, :cond_0

    if-nez p1, :cond_1

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->getImageCount()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    :cond_1
    iget-object v3, v2, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    if-eqz v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public getBestImageCount(Z)I
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    if-eqz v2, :cond_0

    if-nez p1, :cond_1

    iget-object v3, v2, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mImageCount:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_0

    :cond_1
    iget-object v2, v2, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    if-eqz v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method public getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getImageFeaturesByGroup(J)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/TinyImageFeature;",
            ">;"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-eqz v0, :cond_2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v3

    cmp-long v5, v3, p1

    if-nez v5, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public declared-synchronized init()V
    .locals 8

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-nez v0, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getAllImageFeatures()Ljava/util/List;

    move-result-object v2

    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    const/16 v4, 0x10

    if-eqz v2, :cond_0

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    goto :goto_0

    :cond_0
    const/16 v5, 0x10

    :goto_0
    invoke-direct {v3, v5}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v3, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    :cond_1
    invoke-direct {v3, v4}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(I)V

    iput-object v3, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    iget-object v5, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->clear()V

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->initGroupBestMap()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->isFirstShowImageSelection()Z

    move-result v2

    iput-boolean v2, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mIsFirstShowImageSelection:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    const-string v2, "ImageFeatureCacheManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Initialize use time: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    sub-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, "ms."

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "ImageFeatureCacheManager"

    const-string v1, "ImageFeature count: %d ; Cluster group count: %d "

    iget-object v2, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_4
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public isBestImage(JZZLjava/util/List;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZZ",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_6

    if-eqz v0, :cond_6

    iget-object v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mGroupBestMap:Ljava/util/Map;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;

    if-eqz v0, :cond_6

    iget-object v1, v0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->mBestImage:Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->getImageFeatureInGroup()Ljava/util/TreeSet;

    move-result-object v3

    const/4 v4, 0x1

    if-eqz p5, :cond_2

    invoke-virtual {v3}, Ljava/util/TreeSet;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-virtual {v6}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {p5, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_0

    :cond_1
    const/4 p5, 0x1

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p5, 0x0

    :goto_1
    if-nez v1, :cond_3

    if-eqz p4, :cond_3

    invoke-virtual {v3}, Ljava/util/TreeSet;->first()Ljava/lang/Object;

    move-result-object p4

    move-object v1, p4

    check-cast v1, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    :cond_3
    if-nez p3, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager$GroupBestImage;->getImageCount()I

    move-result p3

    if-le p3, v4, :cond_5

    :cond_4
    if-eqz v1, :cond_5

    invoke-virtual {v1}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getImageId()J

    move-result-wide p3

    cmp-long v0, p3, p1

    if-nez v0, :cond_5

    if-nez p5, :cond_5

    const/4 v2, 0x1

    :cond_5
    return v2

    :cond_6
    return v2
.end method

.method public isInitialized()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    return v0
.end method

.method public declared-synchronized onImageDelete(J)Z
    .locals 9

    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-lez v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "imageType"

    const/4 v6, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v5, "%s = %s"

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "imageId"

    aput-object v7, v6, v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v7, 0x1

    aput-object v2, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v5

    const-class v6, Lcom/miui/gallery/assistant/model/ImageFeature;

    const/4 v8, 0x0

    invoke-virtual {v5, v6, v1, v2, v8}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v0

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->refreshGroupBestMapbyGroupId(J)V

    const-string v0, "ImageFeatureCacheManager"

    const-string v1, "Delete image %d using %d ms!"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 p2, 0x0

    sub-long/2addr v5, v3

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v7

    :cond_0
    monitor-exit p0

    return v2

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized onImageDeleteBatch(Ljava/util/List;)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v7

    const-wide/16 v9, 0x0

    cmp-long v11, v7, v9

    if-lez v11, :cond_1

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v7, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-interface {v7, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v5

    invoke-direct {p0, v5, v6}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->refreshGroupBestMapbyGroupId(J)V

    goto :goto_0

    :cond_2
    new-instance v4, Landroid/content/ContentValues;

    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    const-string v5, "imageType"

    const/4 v6, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v5, "%s IN (%s)"

    new-array v6, v6, [Ljava/lang/Object;

    const-string v7, "imageId"

    aput-object v7, v6, v1

    const-string v1, ","

    invoke-static {v1, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v6, v1

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v5

    const-class v6, Lcom/miui/gallery/assistant/model/ImageFeature;

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v4, v0, v7}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z

    const-string v0, "ImageFeatureCacheManager"

    const-string v4, "Delete %d images batch using %d ms!"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const/4 v7, 0x0

    sub-long/2addr v5, v2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v4, p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :cond_3
    :goto_1
    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public onImageFeaturesChanged(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeaturesById(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/model/TinyImageFeature;

    invoke-direct {p0, v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->addImageFeature(Lcom/miui/gallery/assistant/model/TinyImageFeature;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setFirstShowImageSelection(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mIsFirstShowImageSelection:Z

    return-void
.end method

.method public shouldShowImageSelectionTip()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mInitialized:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mIsFirstShowImageSelection:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->mImageTinyFeatureMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public shouldShowSelectionStar(JZZ)Z
    .locals 7

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureSelectionVisiable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v6, 0x0

    move-object v1, p0

    move-wide v2, p1

    move v4, p3

    move v5, p4

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isBestImage(JZZLjava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public shouldShowSelectionStar(JZZLjava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZZ",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureSelectionVisiable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual/range {p0 .. p5}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isBestImage(JZZLjava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
