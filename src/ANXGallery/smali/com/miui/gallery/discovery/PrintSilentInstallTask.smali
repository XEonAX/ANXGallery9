.class public Lcom/miui/gallery/discovery/PrintSilentInstallTask;
.super Lcom/miui/gallery/pendingtask/base/PendingTask;
.source "PrintSilentInstallTask.java"


# instance fields
.field private mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(I)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTask;-><init>(I)V

    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object p1, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/discovery/PrintSilentInstallTask;)Ljava/util/concurrent/CountDownLatch;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    return-object p0
.end method

.method public static isPrintSilentInstallEnable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPrintPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->isPrintSilentInstallEnable(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private static isPrintSilentInstallEnable(Ljava/lang/String;)Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/PrintInstallHelper;->isPhotoPrintEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->isSilentInstallTimesEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isPackageInstalled(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static isSilentInstallTimesEnable()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->getSilentInstallTimes()I

    move-result v0

    const/4 v1, 0x3

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static setSilentInstallTimesDisable()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->isSilentInstallTimesEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->setSilentInstallTimes(I)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getNetworkType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public parseData([B)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    return-object p1
.end method

.method public process(Ljava/lang/Object;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getPrintPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->isPrintSilentInstallEnable(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$PhotoPrint;->increaseSilentInstallTimes()V

    new-instance v0, Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/discovery/PrintSilentInstallTask$1;-><init>(Lcom/miui/gallery/discovery/PrintSilentInstallTask;)V

    invoke-static {}, Lcom/miui/gallery/util/PrintInstallHelper;->getInstance()Lcom/miui/gallery/util/PrintInstallHelper;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2, p1, v0}, Lcom/miui/gallery/util/PrintInstallHelper;->installPrintPackage(ZLjava/lang/String;Lcom/miui/gallery/util/PrintInstallHelper$InstallStateListener;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "PrintSilentInstallTask"

    const-string v0, "start silent install print package"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object p1, p0, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->mSyncExecuteLock:Ljava/util/concurrent/CountDownLatch;

    const-wide/16 v0, 0x5

    sget-object v2, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {p1, v0, v1, v2}, Ljava/util/concurrent/CountDownLatch;->await(JLjava/util/concurrent/TimeUnit;)Z
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/InterruptedException;->printStackTrace()V

    :cond_0
    :goto_0
    const/4 p1, 0x0

    return p1
.end method

.method public requireCharging()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public requireDeviceIdle()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public wrapData(Ljava/lang/Object;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 p1, 0x0

    new-array p1, p1, [B

    return-object p1
.end method
