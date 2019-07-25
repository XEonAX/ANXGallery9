.class public Lcom/miui/gallery/provider/cache/MediaManager;
.super Lcom/miui/gallery/provider/cache/CacheManager;
.source "MediaManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;,
        Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;,
        Lcom/miui/gallery/provider/cache/MediaManager$SingletonHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/CacheManager<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# static fields
.field private static sFeatureComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private static sTimeComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

.field private mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

.field private mFirstPartIds:Ljava/lang/String;

.field private mFullLoadDoneSignal:Ljava/util/concurrent/CountDownLatch;

.field private final mInitializeListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;",
            ">;"
        }
    .end annotation
.end field

.field private volatile mInitialized:Z

.field private volatile mIsFullLoadDone:Z

.field private volatile mIsLoadStarted:Z

.field private volatile mIsMinimumLoadDone:Z

.field private final mMinimumLoadLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/CacheManager;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsLoadStarted:Z

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsFullLoadDone:Z

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mMinimumLoadLock:Ljava/lang/Object;

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsMinimumLoadDone:Z

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitialized:Z

    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFullLoadDoneSignal:Ljava/util/concurrent/CountDownLatch;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitializeListeners:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/AlbumDelegate;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    new-instance v0, Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/FavoritesDelegate;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mCache:Ljava/util/List;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$Generator;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaItem$Generator;-><init>(Lcom/miui/gallery/provider/cache/AlbumDelegate;Lcom/miui/gallery/provider/cache/FavoritesDelegate;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/provider/cache/MediaManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cache/MediaManager;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/cache/MediaManager;Ljava/lang/String;Ljava/lang/String;)I
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static synthetic access$1002(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsMinimumLoadDone:Z

    return p1
.end method

.method static synthetic access$202(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitialized:Z

    return p1
.end method

.method static synthetic access$302(Lcom/miui/gallery/provider/cache/MediaManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsFullLoadDone:Z

    return p1
.end method

.method static synthetic access$400(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFullLoadDoneSignal:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitializeListeners:Ljava/util/ArrayList;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mMinimumLoadLock:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/provider/cache/MediaManager;)Lcom/miui/gallery/provider/cache/AlbumDelegate;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/provider/cache/MediaManager;)Lcom/miui/gallery/provider/cache/FavoritesDelegate;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/provider/cache/MediaManager;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFirstPartIds:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$902(Lcom/miui/gallery/provider/cache/MediaManager;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFirstPartIds:Ljava/lang/String;

    return-object p1
.end method

.method private static filterBestItems(Ljava/util/List;I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/provider/cache/MediaManager;->getFeatureComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    const/4 v0, 0x0

    invoke-interface {p0, v0, p1}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/provider/cache/MediaManager;->getTimeComparator()Ljava/util/Comparator;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object p0
.end method

.method private generateGroup(Ljava/util/List;Ljava/util/Comparator;)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;",
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/TimelineHeadersGroup;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v6, v4

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_6

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/provider/cache/MediaItem;

    if-nez v4, :cond_2

    new-instance v4, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    invoke-direct {v4}, Lcom/miui/gallery/provider/TimelineHeadersGroup;-><init>()V

    iput v5, v4, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget-object v6, v4, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v6

    iput-object v6, v4, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    :cond_1
    move-object v6, v4

    :goto_1
    move-object v4, v7

    goto :goto_2

    :cond_2
    invoke-interface {p2, v7, v4}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v8

    if-nez v8, :cond_3

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/2addr v1, v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iget-object v8, v6, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v8, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v8, v6, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_5

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_5

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v6, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    goto :goto_2

    :cond_3
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    iput v1, v6, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    invoke-direct {v1}, Lcom/miui/gallery/provider/TimelineHeadersGroup;-><init>()V

    iput v5, v1, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget-object v4, v1, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    invoke-virtual {v7}, Lcom/miui/gallery/provider/cache/MediaItem;->getLocation()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    :cond_4
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    move-object v6, v1

    move-object v1, v4

    goto :goto_1

    :cond_5
    :goto_2
    add-int/lit8 v5, v5, 0x1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v7

    if-ne v5, v7, :cond_0

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iput v7, v6, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_6
    return-object v2
.end method

.method private generateMonthItems(Ljava/util/List;)Ljava/util/List;
    .locals 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/TimelineHeadersGroup;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Lcom/miui/gallery/provider/cache/MediaManager$2;

    invoke-direct {v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager$2;-><init>(Lcom/miui/gallery/provider/cache/MediaManager;)V

    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->generateGroup(Ljava/util/List;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v2

    const-string v6, ".provider.cache.MediaManager"

    const-string v7, "generate date groups cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Lcom/miui/gallery/provider/cache/MediaManager$3;

    invoke-direct {v4, v0}, Lcom/miui/gallery/provider/cache/MediaManager$3;-><init>(Lcom/miui/gallery/provider/cache/MediaManager;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x0

    if-eqz v7, :cond_11

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v9

    iget v10, v7, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v11, v7, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v12, v7, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v11, v12

    invoke-interface {v1, v10, v11}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v10

    invoke-direct {v0, v10, v4}, Lcom/miui/gallery/provider/cache/MediaManager;->generateGroup(Ljava/util/List;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v10

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_e

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v14

    if-le v14, v9, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v14

    add-int/lit8 v14, v14, -0x1

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    goto :goto_2

    :cond_1
    const/4 v14, 0x0

    :goto_2
    iget v15, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v11, v7, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    add-int/2addr v15, v11

    iput v15, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    if-nez v12, :cond_4

    invoke-direct {v0, v13}, Lcom/miui/gallery/provider/cache/MediaManager;->isValidLocationGroup(Lcom/miui/gallery/provider/TimelineHeadersGroup;)Z

    move-result v11

    if-eqz v11, :cond_d

    if-eqz v14, :cond_3

    iget-object v11, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    iget-object v15, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-direct {v0, v11, v15}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    if-eqz v11, :cond_2

    goto :goto_3

    :cond_2
    iget v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v11, v15

    iput v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v13, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v11, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_b

    :cond_3
    :goto_3
    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_b

    :cond_4
    iget-object v11, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_7

    if-eqz v14, :cond_5

    iget-object v11, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    iget-object v15, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-direct {v0, v11, v15}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    if-nez v11, :cond_5

    iget v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v11, v15

    iput v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v11, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v12, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v11, v12}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_4
    const/4 v11, 0x0

    goto :goto_5

    :cond_5
    if-eqz v14, :cond_6

    iget-object v11, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    iget-object v15, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-direct {v0, v11, v15}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v11

    if-nez v11, :cond_7

    :cond_6
    iget v11, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iput v11, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v11, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v11, v15

    iput v11, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v11, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v12, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v11, v8, v12}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    goto :goto_4

    :cond_7
    move-object v11, v12

    :goto_5
    if-eqz v11, :cond_a

    if-eqz v14, :cond_8

    iget v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v15, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {v12}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide v17

    iget v12, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {v12}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide v19

    sub-long v17, v17, v19

    invoke-static/range {v17 .. v18}, Ljava/lang/Math;->abs(J)J

    move-result-wide v17

    goto :goto_6

    :cond_8
    const-wide v17, 0x7fffffffffffffffL

    :goto_6
    iget v12, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v15, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    add-int/lit8 v12, v12, -0x1

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {v12}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide v19

    iget v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {v12}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide v21

    sub-long v19, v19, v21

    invoke-static/range {v19 .. v20}, Ljava/lang/Math;->abs(J)J

    move-result-wide v19

    cmp-long v12, v17, v19

    if-gtz v12, :cond_9

    iget v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    iput v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v11, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v12, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_7
    const/4 v11, 0x0

    goto :goto_8

    :cond_9
    iget v12, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iput v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    iput v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v11, v11, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v12, v8, v11}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    goto :goto_7

    :cond_a
    :goto_8
    invoke-direct {v0, v13}, Lcom/miui/gallery/provider/cache/MediaManager;->isValidLocationGroup(Lcom/miui/gallery/provider/TimelineHeadersGroup;)Z

    move-result v12

    if-eqz v12, :cond_d

    if-eqz v14, :cond_c

    iget-object v12, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    iget-object v15, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-direct {v0, v12, v15}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v12

    if-eqz v12, :cond_b

    goto :goto_9

    :cond_b
    iget v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v15, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    iput v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v12, v14, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v13, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v12, v13}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_a

    :cond_c
    :goto_9
    invoke-interface {v3, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_a
    move-object v12, v11

    goto :goto_b

    :cond_d
    move-object v12, v13

    :goto_b
    move-object v13, v14

    goto/16 :goto_1

    :cond_e
    if-eqz v12, :cond_0

    if-nez v13, :cond_f

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_f
    invoke-direct {v0, v12}, Lcom/miui/gallery/provider/cache/MediaManager;->isValidLocationGroup(Lcom/miui/gallery/provider/TimelineHeadersGroup;)Z

    move-result v7

    if-eqz v7, :cond_10

    iget-object v7, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    iget-object v8, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-direct {v0, v7, v8}, Lcom/miui/gallery/provider/cache/MediaManager;->locationCompare(Ljava/lang/String;Ljava/lang/String;)I

    move-result v7

    if-eqz v7, :cond_10

    invoke-interface {v3, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_10
    iget v7, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget v8, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v7, v8

    iput v7, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    iget-object v7, v13, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    iget-object v8, v12, Lcom/miui/gallery/provider/TimelineHeadersGroup;->itemLocations:Ljava/util/List;

    invoke-interface {v7, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_0

    :cond_11
    const-string v2, ".provider.cache.MediaManager"

    const-string v4, "generate location groups cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v5

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v2, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    new-instance v6, Lcom/miui/gallery/provider/cache/MediaManager$4;

    invoke-direct {v6, v0}, Lcom/miui/gallery/provider/cache/MediaManager$4;-><init>(Lcom/miui/gallery/provider/cache/MediaManager;)V

    const-string v7, ".provider.cache.MediaManager"

    const-string v9, "image feature initialized %s"

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v10

    invoke-virtual {v10}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isInitialized()Z

    move-result v10

    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v10

    invoke-static {v7, v9, v10}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_c
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_20

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    new-instance v10, Ljava/util/LinkedList;

    invoke-direct {v10}, Ljava/util/LinkedList;-><init>()V

    iget v11, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    const/16 v12, 0xa

    if-gt v11, v12, :cond_12

    iget v11, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v12, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v13, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v13

    invoke-interface {v1, v11, v12}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v11

    invoke-interface {v10, v11}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto/16 :goto_f

    :cond_12
    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->isInitialized()Z

    move-result v11

    if-eqz v11, :cond_1a

    iget v11, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    const/4 v12, -0x1

    const-wide/16 v16, -0x1

    const-wide/high16 v18, -0x4010000000000000L    # -1.0

    :goto_d
    iget v13, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v14, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v13, v14

    if-ge v11, v13, :cond_18

    invoke-interface {v1, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v14

    move-object/from16 v23, v9

    invoke-virtual {v13}, Lcom/miui/gallery/provider/cache/MediaItem;->getId()J

    move-result-wide v8

    invoke-virtual {v14, v8, v9}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getImageFeature(J)Lcom/miui/gallery/assistant/model/TinyImageFeature;

    move-result-object v8

    if-eqz v8, :cond_16

    invoke-virtual {v8}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v13

    cmp-long v9, v13, v16

    if-eqz v9, :cond_14

    const/4 v9, -0x1

    if-eq v12, v9, :cond_13

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    invoke-virtual {v8}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getClusterGroupId()J

    move-result-wide v12

    invoke-virtual {v8}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v8

    move-wide/from16 v18, v8

    move-wide/from16 v16, v12

    const/4 v8, -0x1

    move v12, v11

    goto :goto_e

    :cond_14
    invoke-virtual {v8}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v13

    cmpl-double v9, v13, v18

    if-lez v9, :cond_15

    invoke-virtual {v8}, Lcom/miui/gallery/assistant/model/TinyImageFeature;->getScore()D

    move-result-wide v8

    move-wide/from16 v18, v8

    move v12, v11

    :cond_15
    const/4 v8, -0x1

    goto :goto_e

    :cond_16
    const/4 v8, -0x1

    if-eq v12, v8, :cond_17

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    invoke-interface {v10, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_17
    invoke-interface {v10, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    const/4 v12, -0x1

    const-wide/16 v16, -0x1

    const-wide/high16 v18, -0x4010000000000000L    # -1.0

    :goto_e
    add-int/lit8 v11, v11, 0x1

    move-object/from16 v9, v23

    goto :goto_d

    :cond_18
    move-object/from16 v23, v9

    const/4 v8, -0x1

    if-eq v12, v8, :cond_19

    invoke-interface {v1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-interface {v10, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_19
    move-object/from16 v9, v23

    goto :goto_f

    :cond_1a
    iget v8, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v11, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v12, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v11, v12

    invoke-interface {v1, v8, v11}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v8

    invoke-interface {v10, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :goto_f
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v8

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v11

    const/16 v12, 0x28

    if-le v11, v12, :cond_1e

    const/high16 v11, 0x42200000    # 40.0f

    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v13

    int-to-float v13, v13

    div-float/2addr v11, v13

    invoke-direct {v0, v10, v6}, Lcom/miui/gallery/provider/cache/MediaManager;->generateGroup(Ljava/util/List;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v13

    invoke-interface {v13}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    const/4 v14, 0x0

    :goto_10
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1d

    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/miui/gallery/provider/TimelineHeadersGroup;

    iget v12, v15, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    int-to-float v12, v12

    mul-float v12, v12, v11

    move-object/from16 v24, v6

    move-object/from16 v25, v7

    float-to-double v6, v12

    invoke-static {v6, v7}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v6

    double-to-int v6, v6

    if-lez v6, :cond_1b

    iget v7, v15, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v12, v15, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    iget v15, v15, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    add-int/2addr v12, v15

    invoke-interface {v10, v7, v12}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v7

    invoke-static {v7, v6}, Lcom/miui/gallery/provider/cache/MediaManager;->filterBestItems(Ljava/util/List;I)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v7

    add-int/2addr v14, v7

    invoke-interface {v2, v6}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    const/16 v6, 0x28

    if-lt v14, v6, :cond_1c

    const/4 v6, 0x0

    :goto_11
    add-int/lit8 v7, v14, -0x28

    if-ge v6, v7, :cond_1f

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v2, v7}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    goto :goto_11

    :cond_1b
    const/16 v6, 0x28

    :cond_1c
    move-object/from16 v6, v24

    move-object/from16 v7, v25

    const/16 v12, 0x28

    goto :goto_10

    :cond_1d
    move-object/from16 v24, v6

    move-object/from16 v25, v7

    goto :goto_12

    :cond_1e
    move-object/from16 v24, v6

    move-object/from16 v25, v7

    invoke-interface {v2, v10}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1f
    :goto_12
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    iput v8, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->start:I

    sub-int/2addr v6, v8

    iput v6, v9, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    move-object/from16 v6, v24

    move-object/from16 v7, v25

    const/4 v8, 0x0

    goto/16 :goto_c

    :cond_20
    const-string v6, ".provider.cache.MediaManager"

    const-string v7, "filter items cost %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    sub-long/2addr v8, v4

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v6, v7, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface/range {p1 .. p1}, Ljava/util/List;->clear()V

    invoke-interface {v1, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-object v3
.end method

.method private static getFeatureComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sFeatureComparator:Ljava/util/Comparator;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaManager$5;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaManager$5;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sFeatureComparator:Ljava/util/Comparator;

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sFeatureComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method public static getInstance()Lcom/miui/gallery/provider/cache/MediaManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaManager$SingletonHolder;->INSTANCE:Lcom/miui/gallery/provider/cache/MediaManager;

    return-object v0
.end method

.method private static getTimeComparator()Ljava/util/Comparator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sTimeComparator:Ljava/util/Comparator;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/provider/cache/MediaManager$6;

    invoke-direct {v0}, Lcom/miui/gallery/provider/cache/MediaManager$6;-><init>()V

    sput-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sTimeComparator:Ljava/util/Comparator;

    :cond_0
    sget-object v0, Lcom/miui/gallery/provider/cache/MediaManager;->sTimeComparator:Ljava/util/Comparator;

    return-object v0
.end method

.method private isValidLocationGroup(Lcom/miui/gallery/provider/TimelineHeadersGroup;)Z
    .locals 2

    iget v0, p1, Lcom/miui/gallery/provider/TimelineHeadersGroup;->count:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/provider/TimelineHeadersGroup;->validLocation:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private locationCompare(Ljava/lang/String;Ljava/lang/String;)I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/data/LocationManager;->subToCity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/data/LocationManager;->getInstance()Lcom/miui/gallery/data/LocationManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/LocationManager;->subToCity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p1, p2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-virtual {p2, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x1

    :cond_2
    :goto_0
    return v1

    :cond_3
    return v2
.end method

.method private transformOrderByColumnIndex(I)I
    .locals 1

    const/16 v0, 0x12

    if-eq p1, v0, :cond_2

    const/16 v0, 0x1e

    if-eq p1, v0, :cond_1

    const/16 v0, 0x24

    if-eq p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 p1, 0x25

    goto :goto_0

    :cond_1
    const/16 p1, 0x1f

    goto :goto_0

    :cond_2
    const/16 p1, 0x13

    :goto_0
    return p1
.end method


# virtual methods
.method public addInitializeListener(Lcom/miui/gallery/provider/cache/MediaManager$InitializeListener;)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsFullLoadDone:Z

    if-eqz v0, :cond_0

    const-string p1, ".provider.cache.MediaManager"

    const-string v0, "no need to add listener after full load done!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitializeListeners:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitializeListeners:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public deleteAttributes(J)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->delete(J)V

    return-void
.end method

.method public ensureMinimumPartDone()V
    .locals 6

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsMinimumLoadDone:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mMinimumLoadLock:Ljava/lang/Object;

    monitor-enter v2

    :try_start_0
    iget-boolean v3, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsMinimumLoadDone:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v3, :cond_1

    :try_start_1
    iget-object v3, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mMinimumLoadLock:Ljava/lang/Object;

    invoke-virtual {v3}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v3

    :try_start_2
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    :goto_0
    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string v2, ".provider.cache.MediaManager"

    const-string v3, "wait for minimum part loading cost : %dms "

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0
.end method

.method protected filterLogInfo(Landroid/content/ContentValues;)Landroid/content/ContentValues;
    .locals 1

    if-eqz p1, :cond_0

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0, p1}, Landroid/content/ContentValues;-><init>(Landroid/content/ContentValues;)V

    const-string p1, "location"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p1, "extraGPS"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p1, "address"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p1, "exifGPSLatitude"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p1, "exifGPSLongitude"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    const-string p1, "exifGPSAltitude"

    invoke-virtual {v0, p1}, Landroid/content/ContentValues;->remove(Ljava/lang/String;)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public initialized()Z
    .locals 7

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsFullLoadDone:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitialized:Z

    return v0

    :cond_0
    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "not initialized, waiting lock from: %s"

    const-string v2, "\n\t"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFullLoadDoneSignal:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v2}, Ljava/util/concurrent/CountDownLatch;->await()V

    const-string v2, ".provider.cache.MediaManager"

    const-string v3, "wait full load done costs %d ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    const/4 v6, 0x0

    sub-long/2addr v4, v0

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, ".provider.cache.MediaManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "initialization finished: %b"

    iget-boolean v2, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitialized:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mInitialized:Z

    return v0
.end method

.method public insert(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 10

    const-string v1, "cloud"

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->getProjection()[Ljava/lang/String;

    move-result-object v2

    const-string v0, "%s AND (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND serverType IN (1,2)"

    const/4 v9, 0x0

    aput-object v4, v3, v9

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v0, p1

    move-object v4, p3

    invoke-virtual/range {v0 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_1

    :goto_0
    :try_start_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mGenerator:Lcom/miui/gallery/provider/cache/CacheItem$Generator;

    invoke-interface {p2, p1}, Lcom/miui/gallery/provider/cache/CacheItem$Generator;->from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cache/CacheItem;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    iget-object p3, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mModifyLock:Ljava/lang/Object;

    monitor-enter p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mCache:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    monitor-exit p3

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :catchall_0
    move-exception p2

    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_1
    move-exception p2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    throw p2

    :cond_1
    :goto_1
    return v9
.end method

.method public insert(JLandroid/content/ContentValues;)J
    .locals 1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/provider/cache/MediaManager;->isItemDeleted(Landroid/content/ContentValues;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/CacheManager;->insert(JLandroid/content/ContentValues;)J

    move-result-wide p1

    return-wide p1

    :cond_0
    const-wide/16 p1, 0x0

    return-wide p1
.end method

.method public insertAttributes(JJ)V
    .locals 4

    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "insert attributes[%d] for album[%d]"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->insert(JJ)V

    return-void
.end method

.method public insertToFavorites(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/provider/cache/FavoritesDelegate;->insertToFavorites(Ljava/lang/String;)V

    return-void
.end method

.method public isItemDeleted(Landroid/content/ContentValues;)Z
    .locals 4

    const-string v0, "localFlag"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsInteger(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    const/16 v3, 0xb

    if-eq v2, v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    :cond_0
    const-string p1, ".provider.cache.MediaManager"

    const-string v0, "find a deleted local flag"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    const-string v0, "serverStatus"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "serverStatus"

    invoke-virtual {p1, v0}, Landroid/content/ContentValues;->getAsString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "deleted"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "purged"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_2
    const-string p1, ".provider.cache.MediaManager"

    const-string v0, "find a deleted server type"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public declared-synchronized load(Landroid/database/sqlite/SQLiteOpenHelper;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsLoadStarted:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsFullLoadDone:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mIsLoadStarted:Z

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/provider/cache/MediaManager$InitializeTask;-><init>(Lcom/miui/gallery/provider/cache/MediaManager;Landroid/database/sqlite/SQLiteOpenHelper;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_1
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method protected onCreateCursor([Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/cache/MediaItem;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/database/Cursor;"
        }
    .end annotation

    new-instance p3, Lcom/miui/gallery/provider/cache/RawCursor;

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object v0

    invoke-direct {p3, p2, p1, v0}, Lcom/miui/gallery/provider/cache/RawCursor;-><init>(Ljava/util/List;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V

    if-eqz p5, :cond_4

    const-string p1, "extra_generate_header"

    invoke-virtual {p5, p1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, ".provider.cache.MediaManager"

    const-string v0, "caller need a header data, start generate for %d"

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-string p1, "extra_media_group_by"

    invoke-virtual {p5, p1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const/4 p5, 0x0

    if-nez p1, :cond_2

    const/16 v2, 0x20

    invoke-virtual {p4, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p4}, Ljava/lang/String;->length()I

    move-result v2

    :goto_0
    invoke-virtual {p4, p5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p4

    iget-object p5, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mQueryFactory:Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;

    invoke-interface {p5}, Lcom/miui/gallery/provider/cache/CacheItem$QueryFactory;->getMapper()Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;

    move-result-object p5

    invoke-interface {p5, p4}, Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;->getIndex(Ljava/lang/String;)I

    move-result p5

    if-ltz p5, :cond_1

    invoke-direct {p0, p5}, Lcom/miui/gallery/provider/cache/MediaManager;->transformOrderByColumnIndex(I)I

    move-result p4

    new-instance p5, Lcom/miui/gallery/provider/cache/MediaManager$1;

    invoke-direct {p5, p0, p4}, Lcom/miui/gallery/provider/cache/MediaManager$1;-><init>(Lcom/miui/gallery/provider/cache/MediaManager;I)V

    invoke-direct {p0, p2, p5}, Lcom/miui/gallery/provider/cache/MediaManager;->generateGroup(Ljava/util/List;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object p2

    goto :goto_1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, " not found"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_2
    const/4 p4, 0x1

    if-ne p1, p4, :cond_3

    invoke-direct {p0, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->generateMonthItems(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    :goto_1
    invoke-static {p2, p3}, Lcom/miui/gallery/provider/TimelineHeadersGroup;->bindGroup(Ljava/util/List;Landroid/database/Cursor;)V

    const-string p2, ".provider.cache.MediaManager"

    const-string p4, "header[%d] generated cost %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    invoke-static {p2, p4, p1, p5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_2

    :cond_3
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-array p3, p4, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p3, p5

    const-string p1, "unsupported group type %s"

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :cond_4
    :goto_2
    return-object p3
.end method

.method public removeFromFavorites(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mFavoritesDelegate:Lcom/miui/gallery/provider/cache/FavoritesDelegate;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/provider/cache/FavoritesDelegate;->removeFromFavorites(Ljava/lang/String;)V

    return-void
.end method

.method public update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I
    .locals 1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/provider/cache/MediaManager;->isItemDeleted(Landroid/content/ContentValues;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cache/CacheManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    move-result p1

    return p1
.end method

.method public updateAttributes(JJ)V
    .locals 4

    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "update album[%d]\'s attributes to %d"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->update(JJ)V

    return-void
.end method

.method public updateAttributes(JJZZ)V
    .locals 5

    const-string v0, ".provider.cache.MediaManager"

    const-string v1, "updating attributesBit[%d] for album[%d] to %s"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->queryAttributes(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    invoke-static {p3, p4, p5, p6}, Lcom/miui/gallery/provider/AlbumManager;->packageAttributeBit(JZZ)J

    move-result-wide p5

    const/4 v2, 0x1

    invoke-static {p3, p4, v2, v2}, Lcom/miui/gallery/provider/AlbumManager;->packageAttributeBit(JZZ)J

    move-result-wide p3

    const-wide/16 v2, -0x1

    xor-long/2addr p3, v2

    and-long/2addr p3, v0

    or-long/2addr p3, p5

    iget-object p5, p0, Lcom/miui/gallery/provider/cache/MediaManager;->mAlbumDelegate:Lcom/miui/gallery/provider/cache/AlbumDelegate;

    invoke-virtual {p5, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cache/AlbumDelegate;->update(JJ)V

    return-void
.end method
