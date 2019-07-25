.class public Lcom/miui/gallery/threadpool/ThreadManager;
.super Ljava/lang/Object;
.source "ThreadManager.java"


# static fields
.field private static final sDecodeLock:Ljava/lang/Object;

.field private static sDecodePool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private static sMainHandler:Lcom/android/internal/CompatHandler;

.field private static final sMainHandlerLock:Ljava/lang/Object;

.field private static final sMiscLock:Ljava/lang/Object;

.field private static sMiscPool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private static final sNetworkLock:Ljava/lang/Object;

.field private static sNetworkPool:Lcom/miui/gallery/threadpool/ThreadPool;

.field private static final sPreviewLock:Ljava/lang/Object;

.field private static sPreviewThread:Lcom/miui/gallery/threadpool/ThreadPool;

.field private static final sRequestLock:Ljava/lang/Object;

.field private static sRequestThread:Landroid/os/HandlerThread;

.field private static sRequestThreadHandler:Lcom/android/internal/CompatHandler;

.field private static sWorkHandler:Lcom/android/internal/CompatHandler;

.field private static final sWorkHandlerLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sMiscLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sMainHandlerLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sDecodeLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sNetworkLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sPreviewLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestLock:Ljava/lang/Object;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sWorkHandlerLock:Ljava/lang/Object;

    return-void
.end method

.method public static getDecodePool()Lcom/miui/gallery/threadpool/ThreadPool;
    .locals 4

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sDecodeLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sDecodePool:Lcom/miui/gallery/threadpool/ThreadPool;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v2, 0x2

    const/4 v3, 0x4

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sDecodePool:Lcom/miui/gallery/threadpool/ThreadPool;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sDecodePool:Lcom/miui/gallery/threadpool/ThreadPool;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getMainHandler()Lcom/android/internal/CompatHandler;
    .locals 3

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sMainHandlerLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMainHandler:Lcom/android/internal/CompatHandler;

    if-nez v1, :cond_0

    new-instance v1, Lcom/android/internal/CompatHandler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/CompatHandler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMainHandler:Lcom/android/internal/CompatHandler;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMainHandler:Lcom/android/internal/CompatHandler;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;
    .locals 2

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sMiscLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMiscPool:Lcom/miui/gallery/threadpool/ThreadPool;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    invoke-direct {v1}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>()V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMiscPool:Lcom/miui/gallery/threadpool/ThreadPool;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sMiscPool:Lcom/miui/gallery/threadpool/ThreadPool;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getNetworkPool()Lcom/miui/gallery/threadpool/ThreadPool;
    .locals 3

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sNetworkLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sNetworkPool:Lcom/miui/gallery/threadpool/ThreadPool;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v2, 0x2

    invoke-direct {v1, v2, v2}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sNetworkPool:Lcom/miui/gallery/threadpool/ThreadPool;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sNetworkPool:Lcom/miui/gallery/threadpool/ThreadPool;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getPreviewPool()Lcom/miui/gallery/threadpool/ThreadPool;
    .locals 3

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sPreviewLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sPreviewThread:Lcom/miui/gallery/threadpool/ThreadPool;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/threadpool/ThreadPool;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v2}, Lcom/miui/gallery/threadpool/ThreadPool;-><init>(II)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sPreviewThread:Lcom/miui/gallery/threadpool/ThreadPool;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sPreviewThread:Lcom/miui/gallery/threadpool/ThreadPool;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getRequestThreadHandler()Lcom/android/internal/CompatHandler;
    .locals 3

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThreadHandler:Lcom/android/internal/CompatHandler;

    if-nez v1, :cond_0

    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "request_thread"

    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v1, Lcom/android/internal/CompatHandler;

    sget-object v2, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThread:Landroid/os/HandlerThread;

    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/android/internal/CompatHandler;-><init>(Landroid/os/Looper;)V

    sput-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThreadHandler:Lcom/android/internal/CompatHandler;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sRequestThreadHandler:Lcom/android/internal/CompatHandler;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static getRequestThreadLooper()Landroid/os/Looper;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getRequestThreadHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/CompatHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public static getWorkHandler()Lcom/android/internal/CompatHandler;
    .locals 4

    sget-object v0, Lcom/miui/gallery/threadpool/ThreadManager;->sWorkHandlerLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sWorkHandler:Lcom/android/internal/CompatHandler;

    if-nez v1, :cond_0

    new-instance v1, Landroid/os/HandlerThread;

    const-string v2, "work_thread"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v1}, Landroid/os/HandlerThread;->start()V

    new-instance v2, Lcom/android/internal/CompatHandler;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/android/internal/CompatHandler;-><init>(Landroid/os/Looper;)V

    sput-object v2, Lcom/miui/gallery/threadpool/ThreadManager;->sWorkHandler:Lcom/android/internal/CompatHandler;

    :cond_0
    sget-object v1, Lcom/miui/gallery/threadpool/ThreadManager;->sWorkHandler:Lcom/android/internal/CompatHandler;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static isMainThread()Z
    .locals 2

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static runOnMainThread(Ljava/lang/Runnable;)V
    .locals 2

    if-nez p0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method public static sleepThread(J)V
    .locals 0

    :try_start_0
    invoke-static {p0, p1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/InterruptedException;->printStackTrace()V

    :goto_0
    return-void
.end method
