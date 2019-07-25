.class public Lcom/miui/gallery/cloud/AsyncUpDownloadService;
.super Lcom/miui/gallery/service/ServiceBase;
.source "AsyncUpDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;,
        Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;,
        Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;,
        Lcom/miui/gallery/cloud/AsyncUpDownloadService$WifiLockRef;,
        Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;
    }
.end annotation


# static fields
.field private static final WAKELOCK_ONLY_CHARGING:Z

.field private static final WAKELOCK_ONLY_SCREEN_OFF:Z

.field private static final sPendingRequests:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mBatteryStateReceiver:Landroid/content/BroadcastReceiver;

.field final mConnReceiver:Landroid/content/BroadcastReceiver;

.field private mDoingCancelTasks:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

.field private mScreenStateReceiver:Landroid/content/BroadcastReceiver;

.field private mStartTime:J

.field private final mSyncReceiver:Landroid/content/BroadcastReceiver;

.field private mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

.field private mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/SyncConditionManager;->sGetSyncConfig()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isOnlyScreenOffAcquireWakelock()Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_SCREEN_OFF:Z

    invoke-static {}, Lcom/miui/gallery/cloud/SyncConditionManager;->sGetSyncConfig()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isOnlyChargingAcquireWakelock()Z

    move-result v0

    sput-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_CHARGING:Z

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->sPendingRequests:Ljava/util/List;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/service/ServiceBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$1;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mConnReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mDoingCancelTasks:Ljava/util/concurrent/atomic/AtomicBoolean;

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$3;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mSyncReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$4;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$5;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mBatteryStateReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_SCREEN_OFF:Z

    return v0
.end method

.method static synthetic access$100()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_CHARGING:Z

    return v0
.end method

.method static synthetic access$200(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->tryCancelTasksWhenConnChanged()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)Ljava/util/concurrent/atomic/AtomicBoolean;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mDoingCancelTasks:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->handleScreenOnOff(Z)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->handleChargeStateChanged(Z)V

    return-void
.end method

.method static synthetic access$700(Ljava/lang/String;ZZ)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->startSyncInBackground(Ljava/lang/String;ZZ)V

    return-void
.end method

.method static synthetic access$800(Ljava/lang/String;ZZ)V
    .locals 0

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->stopSyncInBackground(Ljava/lang/String;ZZ)V

    return-void
.end method

.method private handleChargeStateChanged(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->onChargeStateChanged(Z)V

    return-void
.end method

.method private handleScreenOnOff(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->onScreenOnOff(Z)V

    return-void
.end method

.method private isLockInitialized()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private static needHandleRequest(Ljava/lang/String;)Z
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->sPendingRequests:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public static newSyncLock(Ljava/lang/String;)Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;
    .locals 1

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->releaseAll()V

    iput-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->releaseAll()V

    iput-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;->releaseAll()V

    iput-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    :cond_2
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mSyncReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_SCREEN_OFF:Z

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeUnregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)Z

    :cond_3
    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_CHARGING:Z

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mBatteryStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {p0, v0}, Lcom/miui/gallery/util/GalleryUtils;->safeUnregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)Z

    :cond_4
    sget-object v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->sPendingRequests:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    return-void
.end method

.method private static startSyncInBackground(Ljava/lang/String;ZZ)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->sPendingRequests:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miui.gallery.ACTION_SYNC_IN_BACKGROUND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.miui.gallery.EXTRA_SYNC_NAME"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_STOP"

    const/4 v2, 0x0

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_WIFI"

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_WAKE"

    invoke-virtual {v1, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method private static stopSyncInBackground(Ljava/lang/String;ZZ)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->sPendingRequests:Ljava/util/List;

    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.miui.gallery.ACTION_SYNC_IN_BACKGROUND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "com.miui.gallery.EXTRA_SYNC_NAME"

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_STOP"

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_WIFI"

    invoke-virtual {v1, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    const-string p0, "com.miui.gallery.EXTRA_SYNC_WAKE"

    invoke-virtual {v1, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    return-void
.end method

.method private tryCancelTasksWhenConnChanged()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mDoingCancelTasks:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$2;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    :cond_0
    return-void
.end method


# virtual methods
.method protected getNotification()Landroid/app/Notification;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/NotificationHelper;->getEmptyNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method protected getNotificationId()I
    .locals 1

    const/4 v0, 0x6

    return v0
.end method

.method handleRequest(Landroid/content/Intent;)V
    .locals 8

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AsyncUpDownloadService"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "handleRequest: action="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "com.miui.gallery.ACTION_SYNC_IN_BACKGROUND"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->isLockInitialized()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "AsyncUpDownloadService"

    const-string v0, "service has been released"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->release()V

    return-void

    :cond_0
    const-string v0, "com.miui.gallery.EXTRA_SYNC_NAME"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, "com.miui.gallery.EXTRA_SYNC_STOP"

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    const-string v3, "com.miui.gallery.EXTRA_SYNC_WIFI"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    const-string v5, "com.miui.gallery.EXTRA_SYNC_WAKE"

    invoke-virtual {p1, v5, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p1

    const-string v5, "AsyncUpDownloadService"

    const-string v6, "owner=%s, is stop=%s, wifiNeeded=%s, wakeupNeeded=%s"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v4

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v7, v2

    const/4 v2, 0x2

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v7, v2

    const/4 v2, 0x3

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v7, v2

    invoke-static {v5, v6, v7}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    if-eqz v1, :cond_3

    if-eqz v3, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->release(Ljava/lang/String;)V

    :cond_1
    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->release(Ljava/lang/String;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;->release(Ljava/lang/String;)V

    goto :goto_0

    :cond_3
    invoke-static {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->needHandleRequest(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;->acquire(Ljava/lang/String;)V

    if-eqz p1, :cond_4

    const-string p1, "AsyncUpDownloadService"

    const-string v1, "handle request, owner: %s"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->acquire(Ljava/lang/String;)V

    :cond_4
    if-eqz v3, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->acquire(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string p1, "AsyncUpDownloadService"

    const-string v1, "no need handle request: %s"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_6
    :goto_0
    return-void
.end method

.method public onCreate()V
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/service/ServiceBase;->onCreate()V

    const-string v0, "AsyncUpDownloadService"

    const-string v1, "onCreate"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mStartTime:J

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    const-string v1, "AsyncUpDownloadService#Foreground"

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mForegroundRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ForegroundRef;

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    const-string v1, "AsyncUpDownloadService#WakeLock"

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWakeLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;

    new-instance v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WifiLockRef;

    const-string v1, "AsyncUpDownloadService#WifiLock"

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WifiLockRef;-><init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mWifiLockRef:Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.miui.gallery.ACTION_SYNC_IN_BACKGROUND"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mSyncReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_SCREEN_OFF:Z

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mScreenStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_0
    sget-boolean v0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->WAKELOCK_ONLY_CHARGING:Z

    if-eqz v0, :cond_1

    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mBatteryStateReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_1
    return-void
.end method

.method public onDestroy()V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->release()V

    const-string v0, "AsyncUpDownloadService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDestroy, elapse time="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mStartTime:J

    sub-long/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0}, Lcom/miui/gallery/service/ServiceBase;->onDestroy()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "service_elapse_time"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->mStartTime:J

    sub-long/2addr v2, v4

    long-to-float v2, v2

    const/high16 v3, 0x3f800000    # 1.0f

    mul-float v2, v2, v3

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "Sync"

    const-string v2, "sync_service_time"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/service/ServiceBase;->onStartCommand(Landroid/content/Intent;II)I

    if-nez p1, :cond_0

    const-string v0, "AsyncUpDownloadService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "null intent parameter in onStartCommand! intent="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ", flags="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ", startId="

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->stopSelf()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->handleRequest(Landroid/content/Intent;)V

    :goto_0
    const/4 p1, 0x2

    return p1
.end method
