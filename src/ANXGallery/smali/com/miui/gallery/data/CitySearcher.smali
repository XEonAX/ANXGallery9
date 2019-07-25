.class public Lcom/miui/gallery/data/CitySearcher;
.super Ljava/lang/Object;
.source "CitySearcher.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/CitySearcher$DataBaseFileLoader;,
        Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;
    }
.end annotation


# static fields
.field private static sThis:Lcom/miui/gallery/data/CitySearcher;


# instance fields
.field mCityBoundRects:Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

.field mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;",
            ">;"
        }
    .end annotation
.end field

.field private mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

.field mPhotoGpsCache:Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    new-instance v0, Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;

    invoke-direct {v0}, Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mPhotoGpsCache:Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/data/CitySearcher;->openDB(Landroid/content/Context;)Z

    return-void
.end method

.method private declared-synchronized appendBoundaryList(Ljava/util/concurrent/ConcurrentMap;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;",
            ">;)V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    goto :goto_2

    :cond_0
    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v2

    add-int/2addr v0, v2

    if-le v0, v1, :cond_3

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {p1, v3}, Ljava/util/concurrent/ConcurrentMap;->containsKey(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v0, v3}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v3

    add-int/2addr v2, v3

    if-le v2, v1, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->putAll(Ljava/util/Map;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :goto_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private findBoundaries(Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;)Ljava/util/concurrent/ConcurrentMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;",
            ")",
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;->keySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, v2}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;

    if-nez v3, :cond_0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-interface {v0, v2, v3}, Ljava/util/concurrent/ConcurrentMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/data/CityDatabaseHelper;->queryCityBoundary(Ljava/util/ArrayList;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->putAll(Ljava/util/Map;)V

    :cond_2
    return-object v0
.end method

.method private findInBoundRects(IILcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x0

    if-eqz p3, :cond_5

    invoke-virtual {p3}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    invoke-direct {p0, p3}, Lcom/miui/gallery/data/CitySearcher;->findBoundaries(Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;)Ljava/util/concurrent/ConcurrentMap;

    move-result-object p3

    if-eqz p3, :cond_4

    invoke-interface {p3}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0, p3}, Lcom/miui/gallery/data/CitySearcher;->appendBoundaryList(Ljava/util/concurrent/ConcurrentMap;)V

    invoke-interface {p3}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_2
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;->containsIntCoordinate(II)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v0, v1, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;->cityId:Ljava/lang/String;

    :cond_3
    return-object v0

    :cond_4
    :goto_0
    return-object v0

    :cond_5
    :goto_1
    return-object v0
.end method

.method private declared-synchronized getCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundRects:Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundRects:Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    monitor-exit p0

    return-object v0

    :cond_1
    :try_start_2
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/data/CityDatabaseHelper;->loadCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundRects:Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundRects:Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/data/CitySearcher;
    .locals 2

    const-class v0, Lcom/miui/gallery/data/CitySearcher;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/data/CitySearcher;->sThis:Lcom/miui/gallery/data/CitySearcher;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/data/CitySearcher;

    invoke-direct {v1}, Lcom/miui/gallery/data/CitySearcher;-><init>()V

    sput-object v1, Lcom/miui/gallery/data/CitySearcher;->sThis:Lcom/miui/gallery/data/CitySearcher;

    :cond_0
    sget-object v1, Lcom/miui/gallery/data/CitySearcher;->sThis:Lcom/miui/gallery/data/CitySearcher;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private declared-synchronized isDBOpened()Z
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/data/CityDatabaseHelper;->isDbOpened()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method


# virtual methods
.method public decode(Lcom/miui/gallery/data/Coordinate;)Ljava/lang/String;
    .locals 6

    if-eqz p1, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/data/CitySearcher;->isDBOpened()Z

    move-result v0

    if-eqz v0, :cond_5

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;->makeKey(Lcom/miui/gallery/data/Coordinate;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/data/CitySearcher;->mPhotoGpsCache:Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    return-object v1

    :cond_0
    iget-wide v1, p1, Lcom/miui/gallery/data/Coordinate;->latitude:D

    invoke-static {v1, v2}, Lcom/miui/gallery/data/LocationUtil;->convertIntLat(D)I

    move-result v1

    iget-wide v2, p1, Lcom/miui/gallery/data/Coordinate;->longitude:D

    invoke-static {v2, v3}, Lcom/miui/gallery/data/LocationUtil;->convertIntLat(D)I

    move-result p1

    iget-object v2, p0, Lcom/miui/gallery/data/CitySearcher;->mCityBoundaries:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v2}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;

    invoke-virtual {v3, v1, p1}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;->containsIntCoordinate(II)Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object p1, v3, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundary;->cityId:Ljava/lang/String;

    return-object p1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/data/CitySearcher;->getCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;

    invoke-direct {v3}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;-><init>()V

    invoke-virtual {v2}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;

    invoke-virtual {v4, v1, p1}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;->containsIntCoordinate(II)Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, v4, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRect;->cityId:Ljava/lang/String;

    invoke-virtual {v3, v5, v4}, Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_4
    invoke-direct {p0, v1, p1, v3}, Lcom/miui/gallery/data/CitySearcher;->findInBoundRects(IILcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/data/CitySearcher;->mPhotoGpsCache:Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;

    invoke-virtual {v1, v0, p1}, Lcom/miui/gallery/data/CitySearcher$PhotoGpsCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "CitySearcher"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_5
    const/4 p1, 0x0

    return-object p1
.end method

.method public declared-synchronized openDB(Landroid/content/Context;)Z
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/data/CityDatabaseHelper;->isDbOpened()Z

    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return p1

    :cond_0
    :try_start_1
    new-instance v0, Lcom/miui/gallery/data/CitySearcher$DataBaseFileLoader;

    invoke-direct {v0, p1}, Lcom/miui/gallery/data/CitySearcher$DataBaseFileLoader;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/miui/gallery/data/CitySearcher$DataBaseFileLoader;->loadFile()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-direct {v1, p1, v0}, Lcom/miui/gallery/data/CityDatabaseHelper;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v1, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    iget-object p1, p0, Lcom/miui/gallery/data/CitySearcher;->mDbHelper:Lcom/miui/gallery/data/CityDatabaseHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/data/CityDatabaseHelper;->isDbOpened()Z

    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized preLoadData()V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0}, Lcom/miui/gallery/data/CitySearcher;->isDBOpened()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/data/CitySearcher;->getCityBoundRects()Lcom/miui/gallery/data/CityDatabaseHelper$CityBoundRectList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
