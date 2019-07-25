.class public Lcom/miui/gallery/util/uil/CloudImageLoader;
.super Ljava/lang/Object;
.source "CloudImageLoader.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$DecodeListenerWrapper;,
        Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;
    }
.end annotation


# static fields
.field private static sLoader:Lcom/miui/gallery/util/uil/CloudImageLoader;


# instance fields
.field private final mDelayRequest:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

.field private mMainThreadHandler:Landroid/os/Handler;

.field private volatile mPauseLoading:Z

.field private final mPendingRequest:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;>;"
        }
    .end annotation
.end field

.field private mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

.field private final mRequestingRequest:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$1;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/uil/CloudImageLoader$2;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    iput-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/uil/CloudImageLoader;ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchMessage(ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    return-void
.end method

.method private cancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getAllRequestingAware()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v4

    if-ne v4, p1, :cond_1

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalKey()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4, v3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isValidRequest(Ljava/lang/String;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v3

    if-ne v3, p1, :cond_3

    invoke-virtual {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    const-string v3, "CloudImageLoader"

    const-string v4, "cancel invalid request %s"

    invoke-virtual {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalKey()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v3

    invoke-virtual {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalUri()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v2

    invoke-virtual {v3, v4, v2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    goto :goto_1

    :cond_4
    return-void
.end method

.method private directShowImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Landroid/graphics/drawable/Drawable;)V
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1, p2}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->setImageDrawable(Landroid/graphics/drawable/Drawable;)Z

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader$8;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$8;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method private dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V
    .locals 2

    invoke-direct {p0, p1, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getMatchAware(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Z)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    if-eqz v1, :cond_0

    invoke-interface {p2, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;->call(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V

    goto :goto_0

    :cond_1
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    if-nez p2, :cond_2

    const-string p2, "CloudImageLoader"

    const-string p3, "The ref for %s should not be null"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object p1

    invoke-static {p2, p3, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method private dispatchMessage(ILcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->what:I

    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method private doRequestDelay(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Map;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz p1, :cond_2

    monitor-enter p1

    :try_start_1
    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->map2List(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map;->clear()V

    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalKey()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isValidRequest(Ljava/lang/String;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalUri()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getInternalDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v3

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getWrappedView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getLoadingListener()Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-result-object v1

    invoke-direct {p0, v2, v3, v4, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onInvalidDownloadItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V

    goto :goto_0

    :cond_1
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->requestLoading(Ljava/util/List;)Z

    move-result p1

    if-nez p1, :cond_2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->putToPending(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    goto :goto_1

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :cond_2
    return-void

    :catchall_1
    move-exception p1

    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1
.end method

.method private static generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getAllRequestingAware()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    invoke-static {v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->map2List(Ljava/util/Map;)Ljava/util/List;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private getDelayMap(Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDelayRequest:Ljava/util/Map;

    invoke-interface {v2, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private getDelayMessage(Lcom/miui/gallery/sdk/download/DownloadType;)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/uil/CloudImageLoader$10;->$SwitchMap$com$miui$gallery$sdk$download$DownloadType:[I

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadType;->ordinal()I

    move-result p1

    aget p1, v0, p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, -0x1

    return p1

    :pswitch_0
    const/4 p1, 0x6

    return p1

    :pswitch_1
    const/4 p1, 0x5

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static getInstance()Lcom/miui/gallery/util/uil/CloudImageLoader;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/uil/CloudImageLoader;->sLoader:Lcom/miui/gallery/util/uil/CloudImageLoader;

    return-object v0
.end method

.method private getMatchAware(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Z)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;",
            "Z)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$300(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getRequestingAwareBy(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    if-eqz p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->removeMatchAware(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-direct {p0, v0, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isValidRequest(Ljava/lang/String;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result p2

    if-nez p2, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_2
    return-object v2

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private getRequestingAwareBy(Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Set;

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->set2List(Ljava/util/Set;)Ljava/util/List;

    move-result-object p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private getResources(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Landroid/content/res/Resources;
    .locals 0

    invoke-interface {p1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method public static declared-synchronized init(Landroid/content/Context;)V
    .locals 2

    const-class v0, Lcom/miui/gallery/util/uil/CloudImageLoader;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/uil/CloudImageLoader;->sLoader:Lcom/miui/gallery/util/uil/CloudImageLoader;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/uil/CloudImageLoader;

    invoke-direct {v1, p0}, Lcom/miui/gallery/util/uil/CloudImageLoader;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/miui/gallery/util/uil/CloudImageLoader;->sLoader:Lcom/miui/gallery/util/uil/CloudImageLoader;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private isValidRequest(Ljava/lang/String;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p2, :cond_0

    return v0

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getImageAware()Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;

    move-result-object p1

    invoke-interface {p1}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->isCollected()Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    const/4 p1, 0x1

    return p1

    :cond_3
    :goto_0
    return v0
.end method

.method private loadImageDelay(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getDelayMap(Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/util/Map;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    invoke-static {v0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->put(Ljava/util/Map;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->sendDelayMessage(Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private static map2List(Ljava/util/Map;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            "T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map<",
            "TE;",
            "Ljava/util/Set<",
            "TT;>;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-eqz v1, :cond_0

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private needCancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private onCancelLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onLoadingCancelled %s"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$5;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$5;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V

    return v1
.end method

.method private onFailLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onLoadingFailed %s"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$6;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$6;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V

    return v1
.end method

.method private onInvalidDownloadItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V
    .locals 1

    if-eqz p4, :cond_1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    :cond_0
    sget-object v0, Lcom/miui/gallery/error/core/ErrorCode;->PARAMS_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-interface {p4, p1, p2, p3, v0}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V

    :cond_1
    return-void
.end method

.method private onProgressUpdate(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
    .locals 5

    const-string v0, "CloudImageLoader"

    const-string v1, "onProgressUpdate(%d/%d) %s"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$600(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$700(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$7;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$7;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V

    const/4 p1, 0x1

    return p1
.end method

.method private onStartLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onStartLoading %s"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$3;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$3;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V

    const/4 p1, 0x1

    return p1
.end method

.method private onSuccessLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z
    .locals 3

    const-string v0, "CloudImageLoader"

    const-string v1, "onEndLoading remove requesting item %s"

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$4;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$4;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->dispatchListener(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;Lcom/miui/gallery/util/uil/CloudImageLoader$Caller;Z)V

    return v1
.end method

.method private static put(Ljava/util/Map;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;>;",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ")Z"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Set;

    if-nez v1, :cond_1

    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p0, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private putToPending(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    invoke-static {v1, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->put(Ljava/util/Map;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private putToRequesting(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    invoke-static {v1, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->put(Ljava/util/Map;Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private removeMatchAware(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$200(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;->access$300(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method private requestLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z
    .locals 11

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPauseLoading:Z

    const/4 v1, 0x0

    if-nez v0, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->putToRequesting(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v3

    const/4 v4, 0x1

    if-nez v3, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v3, 0x1

    :goto_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v5

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v1

    invoke-virtual {v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isManual()Z

    move-result v1

    :cond_2
    new-instance v6, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v6}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    invoke-static {v0}, Lcom/miui/gallery/Config$ImageDownload;->requireWLAN(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v7

    invoke-virtual {v6, v7}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setQueueFirst(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setInterruptExecuting(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setManual(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v8

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v5

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getUri()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v7

    iget-object v9, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    iget-object v10, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    invoke-virtual/range {v5 .. v10}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)V

    if-eqz v2, :cond_3

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->needCancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result p1

    if-eqz p1, :cond_3

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->cancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_3
    return v4

    :cond_4
    return v1
.end method

.method private requestLoading(Ljava/util/List;)Z
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;",
            ">;)Z"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPauseLoading:Z

    const/4 v1, 0x0

    if-nez v0, :cond_6

    const/4 v0, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-ge v0, v3, :cond_4

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    invoke-direct {p0, v3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->putToRequesting(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v6

    or-int/2addr v2, v6

    invoke-virtual {p0, v5}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v6

    if-nez v6, :cond_1

    invoke-virtual {p0, v5}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    :cond_0
    const/4 v6, 0x0

    goto :goto_2

    :cond_1
    :goto_1
    const/4 v6, 0x1

    :goto_2
    invoke-virtual {p0, v5}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v7

    if-eqz v7, :cond_2

    if-nez v0, :cond_2

    goto :goto_3

    :cond_2
    const/4 v4, 0x0

    :goto_3
    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    if-eqz v7, :cond_3

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v7

    invoke-virtual {v7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isManual()Z

    move-result v7

    goto :goto_4

    :cond_3
    const/4 v7, 0x0

    :goto_4
    new-instance v8, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v8}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    invoke-static {v5}, Lcom/miui/gallery/Config$ImageDownload;->requireWLAN(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v5

    invoke-virtual {v8, v5}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    invoke-virtual {v5, v6}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setQueueFirst(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setInterruptExecuting(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v4

    invoke-virtual {v4, v7}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setManual(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v8

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v5

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getUri()Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v3}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v7

    iget-object v9, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mDownloadListener:Lcom/miui/gallery/sdk/download/listener/DownloadListener;

    iget-object v10, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mProgressListener:Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;

    invoke-virtual/range {v5 .. v10}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    if-eqz v2, :cond_5

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_5

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-virtual {p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;->getDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->needCancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->cancelInvalidRequest(Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_5
    return v4

    :cond_6
    return v1
.end method

.method private sendDelayMessage(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getDelayMessage(Lcom/miui/gallery/sdk/download/DownloadType;)I

    move-result p1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->removeMessages(I)V

    iget-object v0, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v0

    iput p1, v0, Landroid/os/Message;->what:I

    iget-object p1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mMainThreadHandler:Landroid/os/Handler;

    const-wide/16 v1, 0xc8

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :cond_0
    return-void
.end method

.method private static set2List(Ljava/util/Set;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 3

    invoke-static {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p2, v0, :cond_0

    sget-object p2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :cond_0
    sget-object p2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_0
    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V

    :cond_1
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ZZ)V
    .locals 11

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v8, p6

    move/from16 v9, p7

    move/from16 v10, p8

    invoke-virtual/range {v0 .. v10}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)V
    .locals 11

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    invoke-virtual/range {v0 .. v10}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/widget/ImageView;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V
    .locals 11

    new-instance v3, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;

    move-object v0, p3

    invoke-direct {v3, p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageViewAware;-><init>(Landroid/widget/ImageView;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    invoke-virtual/range {v0 .. v10}, Lcom/miui/gallery/util/uil/CloudImageLoader;->displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V

    return-void
.end method

.method public displayImage(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;ZZ)V
    .locals 13

    move-object v10, p0

    move-object v2, p1

    move-object v11, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v7, p6

    if-nez v2, :cond_1

    const-string v0, "CloudImageLoader"

    const-string v1, "Can\'t display an image with null uri"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_0

    invoke-virtual/range {p4 .. p4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->shouldShowImageForEmptyUri()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v4}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getResources(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageForEmptyUri(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->directShowImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Landroid/graphics/drawable/Drawable;)V

    :cond_0
    invoke-interface/range {p3 .. p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0, v7}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onInvalidDownloadItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V

    return-void

    :cond_1
    invoke-static {p1}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v0

    const-wide/16 v8, 0x0

    cmp-long v3, v0, v8

    if-gtz v3, :cond_4

    const-string v3, "CloudImageLoader"

    const-string v6, "Can\'t display an image with illegal id %s"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v3, v6, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz v5, :cond_2

    invoke-virtual/range {p4 .. p4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->shouldShowImageOnFail()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-direct {p0, v4}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getResources(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageOnFail(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->directShowImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Landroid/graphics/drawable/Drawable;)V

    :cond_2
    if-eqz v7, :cond_3

    invoke-interface/range {p3 .. p3}, Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;->getWrappedView()Landroid/view/View;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/error/core/ErrorCode;->UNKNOWN:Lcom/miui/gallery/error/core/ErrorCode;

    invoke-interface {v7, p1, p2, v0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;->onLoadingFailed(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/error/core/ErrorCode;)V

    :cond_3
    return-void

    :cond_4
    if-eqz v5, :cond_5

    invoke-virtual/range {p4 .. p4}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->shouldShowImageOnLoading()Z

    move-result v0

    if-eqz v0, :cond_5

    if-eqz p10, :cond_5

    invoke-direct {p0, v4}, Lcom/miui/gallery/util/uil/CloudImageLoader;->getResources(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;)Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v5, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageOnLoading(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-direct {p0, v4, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->directShowImage(Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Landroid/graphics/drawable/Drawable;)V

    :cond_5
    new-instance v12, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;

    move-object v0, v12

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v8, p7

    move-object/from16 v9, p8

    invoke-direct/range {v0 .. v9}, Lcom/miui/gallery/util/uil/CloudImageLoader$WeakRefViewAwareImpl;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/nostra13/universalimageloader/core/imageaware/ImageAware;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;Landroid/graphics/RectF;)V

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq v11, v0, :cond_7

    if-eqz p9, :cond_6

    goto :goto_0

    :cond_6
    invoke-direct {p0, v12}, Lcom/miui/gallery/util/uil/CloudImageLoader;->requestLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    move-result v0

    if-nez v0, :cond_8

    invoke-direct {p0, v12}, Lcom/miui/gallery/util/uil/CloudImageLoader;->putToPending(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    goto :goto_1

    :cond_7
    :goto_0
    invoke-direct {p0, v12}, Lcom/miui/gallery/util/uil/CloudImageLoader;->loadImageDelay(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)V

    :cond_8
    :goto_1
    return-void
.end method

.method public getStatusAsync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;)V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/uil/CloudImageLoader$9;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/miui/gallery/util/uil/CloudImageLoader$9;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoader$GetStatusCallBack;)V

    const/4 p1, 0x0

    new-array p1, p1, [Ljava/lang/Void;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader$9;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 2

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x0

    packed-switch p1, :pswitch_data_0

    return v1

    :pswitch_0
    sget-object p1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->doRequestDelay(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return v1

    :pswitch_1
    sget-object p1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->doRequestDelay(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return v1

    :pswitch_2
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onProgressUpdate(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z

    move-result p1

    return p1

    :pswitch_3
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onCancelLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z

    move-result p1

    return p1

    :pswitch_4
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onFailLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z

    move-result p1

    return p1

    :pswitch_5
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onSuccessLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z

    move-result p1

    return p1

    :pswitch_6
    invoke-direct {p0, v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onStartLoading(Lcom/miui/gallery/util/uil/CloudImageLoader$DownloadWrapper;)Z

    move-result p1

    return p1

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    if-eqz p1, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isRequesting(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/uil/CloudImageLoader;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mPendingRequest:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/util/uil/CloudImageLoader;->mRequestingRequest:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public isThumbnail(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    if-eqz p1, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public loadImages(Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/net/Uri;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoadingListener;",
            ">;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;",
            ">;)V"
        }
    .end annotation

    move-object v6, p0

    move-object v7, p1

    move-object/from16 v8, p2

    move-object/from16 v9, p3

    move-object/from16 v10, p4

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v11, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-direct {v11, v0}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v0, 0x0

    const/4 v12, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    if-ge v12, v0, :cond_5

    invoke-interface {p1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    const-string v0, "CloudImageLoader"

    const-string v2, "Null download uri!"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/Uri;

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/sdk/download/DownloadType;

    if-nez v9, :cond_1

    move-object v3, v1

    goto :goto_1

    :cond_1
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    :goto_1
    invoke-direct {p0, v0, v2, v1, v3}, Lcom/miui/gallery/util/uil/CloudImageLoader;->onInvalidDownloadItem(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Landroid/view/View;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;)V

    goto :goto_4

    :cond_2
    new-instance v13, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;

    invoke-interface {p1, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/net/Uri;

    invoke-interface {v8, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/miui/gallery/sdk/download/DownloadType;

    if-nez v9, :cond_3

    move-object v4, v1

    goto :goto_2

    :cond_3
    invoke-interface {v9, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/uil/CloudImageLoadingListener;

    move-object v4, v0

    :goto_2
    if-nez v10, :cond_4

    move-object v5, v1

    goto :goto_3

    :cond_4
    invoke-interface {v10, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;

    move-object v5, v0

    :goto_3
    move-object v0, v13

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/uil/CloudImageLoader$NonViewAwareImpl;-><init>(Lcom/miui/gallery/util/uil/CloudImageLoader;Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/util/uil/CloudImageLoadingListener;Lcom/miui/gallery/util/uil/CloudImageLoadingProgressListener;)V

    invoke-interface {v11, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_4
    add-int/lit8 v12, v12, 0x1

    goto :goto_0

    :cond_5
    invoke-direct {p0, v11}, Lcom/miui/gallery/util/uil/CloudImageLoader;->requestLoading(Ljava/util/List;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-interface {v11}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;

    invoke-direct {p0, v1}, Lcom/miui/gallery/util/uil/CloudImageLoader;->putToPending(Lcom/miui/gallery/util/uil/CloudImageLoader$ViewAware;)Z

    goto :goto_5

    :cond_6
    return-void
.end method
