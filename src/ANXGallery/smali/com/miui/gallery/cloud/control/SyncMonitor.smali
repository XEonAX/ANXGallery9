.class public final Lcom/miui/gallery/cloud/control/SyncMonitor;
.super Ljava/lang/Object;
.source "SyncMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/control/SyncMonitor$UploadInfoAnalyzer;,
        Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;,
        Lcom/miui/gallery/cloud/control/SyncMonitor$Singleton;
    }
.end annotation


# instance fields
.field private isSyncStarted:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mContext:Landroid/content/Context;

.field private mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;


# direct methods
.method private constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->isSyncStarted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mContext:Landroid/content/Context;

    new-instance v0, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    iget-object v1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;-><init>(Landroid/content/Context;Lcom/miui/gallery/cloud/control/SyncMonitor$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->monitorProcessLifecycle()V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->monitorNetworkingAccepted()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/control/SyncMonitor$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;-><init>()V

    return-void
.end method

.method public static final getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor$Singleton;->access$200()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object v0

    return-object v0
.end method

.method private isEnable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isMonitorEnable()Z

    move-result v0

    return v0
.end method

.method private monitorNetworkingAccepted()V
    .locals 3

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.action.CTA_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mContext:Landroid/content/Context;

    invoke-static {v1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/control/SyncMonitor$2;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/control/SyncMonitor$2;-><init>(Lcom/miui/gallery/cloud/control/SyncMonitor;)V

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    return-void
.end method

.method private monitorProcessLifecycle()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/control/SyncMonitor$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/control/SyncMonitor$1;-><init>(Lcom/miui/gallery/cloud/control/SyncMonitor;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public onNetworkingAcceptedToggled(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onNetworkingAcceptedToggled(Z)V

    return-void
.end method

.method public onProcessLifecycleToggled(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onProcessLifecycleToggled(Z)V

    return-void
.end method

.method public onSyncEnd()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->isSyncStarted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "SyncMonitor"

    const-string v1, "monitor sync stop"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onSyncEnd()V

    goto :goto_0

    :cond_1
    const-string v0, "SyncMonitor"

    const-string v1, "sync hasn\'t stopped"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onSyncStart()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->isSyncStarted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    const-string v0, "SyncMonitor"

    const-string v1, "monitor sync start"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onSyncStart()V

    goto :goto_0

    :cond_1
    const-string v0, "SyncMonitor"

    const-string v1, "sync has started"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onSyncThrowable(Ljava/lang/Throwable;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onSyncThrowable(Ljava/lang/Throwable;)V

    return-void
.end method

.method public onUpload(Lcom/miui/gallery/cloud/control/UploadInfo;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->isEnable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/control/SyncMonitor;->mWorker:Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/control/SyncMonitor$Worker;->onUpload(Lcom/miui/gallery/cloud/control/UploadInfo;)V

    return-void
.end method
