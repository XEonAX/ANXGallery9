.class public Lcom/miui/gallery/net/HttpManager;
.super Ljava/lang/Object;
.source "HttpManager.java"


# static fields
.field private static instance:Lcom/miui/gallery/net/HttpManager;


# instance fields
.field private mRequestCache:Lcom/miui/gallery/net/GalleryCache;

.field private mRequestQueue:Lcom/android/volley/RequestQueue;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/net/HttpManager;->initRequestQueue()Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/net/HttpManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/net/HttpManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/net/HttpManager;->instance:Lcom/miui/gallery/net/HttpManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/net/HttpManager;

    invoke-direct {v1}, Lcom/miui/gallery/net/HttpManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/net/HttpManager;->instance:Lcom/miui/gallery/net/HttpManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/net/HttpManager;->instance:Lcom/miui/gallery/net/HttpManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private initRequestQueue()Lcom/android/volley/RequestQueue;
    .locals 5

    new-instance v0, Lcom/miui/gallery/net/GalleryCache;

    invoke-static {}, Lcom/miui/gallery/util/StorageUtils;->getNetworkCacheDirectory()Ljava/io/File;

    move-result-object v1

    const/high16 v2, 0x500000

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/net/GalleryCache;-><init>(Ljava/io/File;I)V

    iput-object v0, p0, Lcom/miui/gallery/net/HttpManager;->mRequestCache:Lcom/miui/gallery/net/GalleryCache;

    new-instance v0, Lcom/android/volley/RequestQueue;

    iget-object v1, p0, Lcom/miui/gallery/net/HttpManager;->mRequestCache:Lcom/miui/gallery/net/GalleryCache;

    new-instance v2, Lcom/miui/gallery/net/GalleryNetwork;

    invoke-direct {v2}, Lcom/miui/gallery/net/GalleryNetwork;-><init>()V

    new-instance v3, Lcom/android/volley/ExecutorDelivery;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getRequestThreadHandler()Lcom/android/internal/CompatHandler;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/android/volley/ExecutorDelivery;-><init>(Landroid/os/Handler;)V

    const/4 v4, 0x2

    invoke-direct {v0, v1, v2, v4, v3}, Lcom/android/volley/RequestQueue;-><init>(Lcom/android/volley/Cache;Lcom/android/volley/Network;ILcom/android/volley/ResponseDelivery;)V

    invoke-virtual {v0}, Lcom/android/volley/RequestQueue;->start()V

    return-object v0
.end method


# virtual methods
.method public addToRequestQueue(Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request<",
            "TT;>;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    return-void
.end method

.method public cancelAll(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/net/HttpManager;->mRequestQueue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    return-void
.end method

.method public putToCache(Ljava/lang/String;[BJJ)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/net/HttpManager;->mRequestCache:Lcom/miui/gallery/net/GalleryCache;

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p3

    move-wide v5, p5

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/net/GalleryCache;->put(Ljava/lang/String;[BJJ)V

    return-void
.end method
