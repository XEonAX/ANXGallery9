.class public Lcom/miui/gallery/util/PrintInstallHelper;
.super Ljava/lang/Object;
.source "PrintInstallHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;,
        Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/miui/gallery/util/PrintInstallHelper;


# instance fields
.field private mCurSilentInstallTimes:I

.field private mDownloadManager:Lcom/xiaomi/market/IAppDownloadManager;

.field private mInstallConnection:Landroid/content/ServiceConnection;

.field private mInstallReceiver:Landroid/content/BroadcastReceiver;

.field private mInstallState:I

.field private mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArraySet<",
            "Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mLastStartTime:J

.field private mPackageName:Ljava/lang/String;

.field private mStartCount:I


# direct methods
.method private constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallState:I

    const-wide/16 v1, 0x0

    iput-wide v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mLastStartTime:J

    iput v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    iput v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mCurSilentInstallTimes:I

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/PrintInstallHelper;)Lcom/xiaomi/market/IAppDownloadManager;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mDownloadManager:Lcom/xiaomi/market/IAppDownloadManager;

    return-object p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/util/PrintInstallHelper;Lcom/xiaomi/market/IAppDownloadManager;)Lcom/xiaomi/market/IAppDownloadManager;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mDownloadManager:Lcom/xiaomi/market/IAppDownloadManager;

    return-object p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/PrintInstallHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->registerInstallReceiver()V

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/util/PrintInstallHelper;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->isInstallSuccess(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$1102(Lcom/miui/gallery/util/PrintInstallHelper;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallState:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/util/PrintInstallHelper;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mCurSilentInstallTimes:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/util/PrintInstallHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->unregisterInstallReceiver()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/util/PrintInstallHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->unbindInstallService()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/util/PrintInstallHelper;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mPackageName:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/util/PrintInstallHelper;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->isInstallExists(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/util/PrintInstallHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->resumeInstall()V

    return-void
.end method

.method static synthetic access$900(Lcom/miui/gallery/util/PrintInstallHelper;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/util/PrintInstallHelper;->isInstallFinish(I)Z

    move-result p0

    return p0
.end method

.method public static getFailReasonMsg(II)I
    .locals 1

    const/4 v0, -0x6

    if-ne p0, v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/16 p0, 0x10

    if-eq p1, p0, :cond_2

    const/16 p0, 0x1c

    if-eq p1, p0, :cond_1

    packed-switch p1, :pswitch_data_0

    const p0, 0x7f100436

    goto :goto_0

    :pswitch_0
    const p0, 0x7f10034e

    goto :goto_0

    :cond_1
    const p0, 0x7f10034d

    goto :goto_0

    :cond_2
    :pswitch_1
    const p0, 0x7f10034f

    :goto_0
    return p0

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/util/PrintInstallHelper;
    .locals 2

    const-class v0, Lcom/miui/gallery/util/PrintInstallHelper;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/PrintInstallHelper;->sInstance:Lcom/miui/gallery/util/PrintInstallHelper;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/PrintInstallHelper;

    invoke-direct {v1}, Lcom/miui/gallery/util/PrintInstallHelper;-><init>()V

    sput-object v1, Lcom/miui/gallery/util/PrintInstallHelper;->sInstance:Lcom/miui/gallery/util/PrintInstallHelper;

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/PrintInstallHelper;->sInstance:Lcom/miui/gallery/util/PrintInstallHelper;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private isInstallExists(I)Z
    .locals 1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isInstallFinish(I)Z
    .locals 1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_1

    const/4 v0, -0x2

    if-eq p1, v0, :cond_1

    const/4 v0, -0x3

    if-eq p1, v0, :cond_1

    const/4 v0, -0x4

    if-eq p1, v0, :cond_1

    const/4 v0, -0x5

    if-eq p1, v0, :cond_1

    const/4 v0, -0x6

    if-ne p1, v0, :cond_0

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

.method private isInstallSuccess(I)Z
    .locals 1

    const/4 v0, 0x4

    if-ne p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private registerInstallReceiver()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    const-string v0, "PrintInstallHelper"

    const-string v1, "register install receiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/util/PrintInstallHelper$InstallReceiver;-><init>(Lcom/miui/gallery/util/PrintInstallHelper;Lcom/miui/gallery/util/PrintInstallHelper$1;)V

    iput-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.xiaomi.market.DOWNLOAD_INSTALL_RESULT"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_0
    return-void
.end method

.method private resumeInstall()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mDownloadManager:Lcom/xiaomi/market/IAppDownloadManager;

    if-eqz v0, :cond_0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mDownloadManager:Lcom/xiaomi/market/IAppDownloadManager;

    iget-object v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mPackageName:Ljava/lang/String;

    const-string v2, "com.miui.gallery"

    invoke-interface {v0, v1, v2}, Lcom/xiaomi/market/IAppDownloadManager;->resume(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    const-string v1, "PrintInstallHelper"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resume install:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "PrintInstallHelper"

    const-string v2, "RemoteException when resume"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_0
    return-void
.end method

.method private unbindInstallService()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallConnection:Landroid/content/ServiceConnection;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallConnection:Landroid/content/ServiceConnection;

    :cond_0
    return-void
.end method

.method private unregisterInstallReceiver()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    const-string v0, "PrintInstallHelper"

    const-string v1, "unregister install receiver"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallReceiver:Landroid/content/BroadcastReceiver;

    :cond_0
    return-void
.end method


# virtual methods
.method public addInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public ensurePrintFucntionAvailable()Z
    .locals 5

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPrintPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    const-string v0, "PrintInstallHelper"

    const-string v1, "get package from cloud control failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_0
    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->getAppVersionCode(Ljava/lang/String;)I

    move-result v1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->getMinPrintVersionCode()I

    move-result v3

    if-ge v1, v3, :cond_1

    invoke-virtual {p0, v2, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;)Z

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->setSilentInstallTimesDisable()V

    const-string v0, "PrintInstallHelper"

    const-string v1, "Current print app version is lower then needed, upgrading!"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v2

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v1

    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.VIEW"

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->getPrintIntentUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v3, v4, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "prodType"

    const/4 v4, 0x2

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const/4 v1, 0x1

    invoke-virtual {v3, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p0, v2, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;)Z

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->setSilentInstallTimesDisable()V

    return v2

    :cond_2
    return v1
.end method

.method public installPrintPackage(ZLjava/lang/String;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)Z

    move-result p1

    return p1
.end method

.method public installPrintPackage(ZLjava/lang/String;Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)Z
    .locals 10

    iput-object p2, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mPackageName:Ljava/lang/String;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallState:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    packed-switch v1, :pswitch_data_0

    const-string p1, "PrintInstallHelper"

    const-string p2, "wrong install state"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v3

    :pswitch_0
    if-eqz p1, :cond_0

    return v3

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->resumeInstall()V

    goto :goto_0

    :pswitch_1
    if-eqz p1, :cond_1

    return v3

    :cond_1
    :goto_0
    const/4 v2, 0x0

    goto :goto_3

    :pswitch_2
    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->getSilentInstallTimes()I

    move-result v1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    iput v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mCurSilentInstallTimes:I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-wide v6, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mLastStartTime:J

    sub-long v6, v4, v6

    const-wide/32 v8, 0xea60

    cmp-long v1, v6, v8

    if-gez v1, :cond_3

    iget v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    add-int/2addr v1, v2

    iput v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    goto :goto_2

    :cond_3
    iput-wide v4, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mLastStartTime:J

    iput v2, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    :goto_2
    iget v1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    const/16 v4, 0xa

    if-le v1, v4, :cond_4

    const-string p1, "PrintInstallHelper"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "limit install, start times:"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mStartCount:I

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v3, 0x1

    goto :goto_3

    :cond_4
    iput v2, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallState:I

    new-instance v1, Landroid/content/Intent;

    const-string v4, "com.xiaomi.market.service.AppDownloadService"

    invoke-direct {v1, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v4, "com.xiaomi.market"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    new-instance v4, Lcom/miui/gallery/util/PrintInstallHelper$1;

    invoke-direct {v4, p0, p2, p1}, Lcom/miui/gallery/util/PrintInstallHelper$1;-><init>(Lcom/miui/gallery/util/PrintInstallHelper;Ljava/lang/String;Z)V

    iput-object v4, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallConnection:Landroid/content/ServiceConnection;

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallConnection:Landroid/content/ServiceConnection;

    invoke-virtual {v0, v1, p1, v2}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    const-string p2, "PrintInstallHelper"

    const-string v0, "bind install service failed"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_3
    if-eqz p3, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {p1, p3}, Ljava/util/concurrent/CopyOnWriteArraySet;->add(Ljava/lang/Object;)Z

    :cond_5
    if-eqz v3, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->notifyInstallLimited()V

    goto :goto_4

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->notifyInstalling()V

    :goto_4
    return v2

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public isPhotoPrintEnable()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    const-string v1, "photo-print"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->queryFeatureStatus(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->ENABLE:Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloudcontrol/FeatureProfile$Status;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isPad()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPrintInstalling()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallState:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public notifyInstallFinish(ZII)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    invoke-interface {v1, p1, p2, p3}, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;->onFinish(ZII)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public notifyInstallLimited()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    invoke-interface {v1}, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;->onInstallLimited()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public notifyInstalling()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArraySet;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;

    invoke-interface {v1}, Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;->onInstalling()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public printPhotos(Landroid/app/Activity;[Landroid/net/Uri;Ljava/util/List;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "[",
            "Landroid/net/Uri;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/util/PrintInstallHelper;->ensurePrintFucntionAvailable()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPrintPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getCreationStrategy()Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.intent.action.VIEW"

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/CreationStrategy;->getPrintIntentUri()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v3, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v1, "prodType"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result v5

    if-ge v4, v5, :cond_1

    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;

    invoke-virtual {v5}, Lcom/miui/gallery/picker/uri/OriginUrlRequestor$OriginInfo;->toJson()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    const-string p3, "pick-result-origin-download-info"

    invoke-virtual {v2, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const-string p3, "pick-result-data"

    new-instance v1, Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-direct {v1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, p3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    const/4 p2, 0x1

    invoke-virtual {v2, p2}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result p2

    if-eqz p2, :cond_2

    :try_start_0
    invoke-virtual {p1, v2}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string p1, "PrintInstallHelper"

    const-string p2, "Select images to print failed"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v3, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;)Z

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->setSilentInstallTimesDisable()V

    :goto_1
    return-void

    :cond_3
    const-string p1, "PrintInstallHelper"

    const-string p2, "No OriginInfo for print"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public removeInstallStateListener(Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/PrintInstallHelper;->mInstallStateListeners:Ljava/util/concurrent/CopyOnWriteArraySet;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArraySet;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public start(Landroid/content/Context;)V
    .locals 5

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPrintPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string p1, "PrintInstallHelper"

    const-string v0, "get package from cloud control failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.intent.action.MAIN"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isIntentSupported(Landroid/content/Intent;)Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v2, :cond_2

    :try_start_0
    invoke-virtual {p1, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const-string p1, "photo_print"

    const-string v0, "photo_print_app_start_success"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p1, "PrintInstallHelper"

    const-string v0, "find print activity failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 p1, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p0, v4, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;)Z

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->setSilentInstallTimesDisable()V

    const/4 p1, 0x0

    :goto_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->isPrintFirstClicked()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {v4}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->setIsPrintFirstClicked(Z)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "isInstalled_%s"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->getSilentInstallTimes()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "photo_print"

    const-string v1, "photo_print_first_clicked"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_3
    return-void
.end method
