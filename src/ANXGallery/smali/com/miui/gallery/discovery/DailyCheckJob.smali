.class public Lcom/miui/gallery/discovery/DailyCheckJob;
.super Lcom/miui/gallery/discovery/AbstractJob;
.source "DailyCheckJob.java"


# static fields
.field private static isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/miui/gallery/discovery/DailyCheckJob;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/discovery/AbstractJob;-><init>()V

    return-void
.end method

.method private doCheck()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->checkTaskList()V

    invoke-static {}, Lcom/miui/gallery/discovery/PrintSilentInstallTask;->isPrintSilentInstallEnable()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object v0

    const/4 v2, 0x4

    invoke-virtual {v0, v2, v1, v1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object v0

    const/4 v2, 0x6

    const-class v3, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v1, v3}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/AlbumSnapshotHelper;->queryAndPersist(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/provider/PeopleFaceSnapshotHelper;->queryAndPersist(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public execJob()Ljava/lang/Object;
    .locals 3

    sget-object v0, Lcom/miui/gallery/discovery/DailyCheckJob;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/discovery/DailyCheckJob;->doCheck()V

    sget-object v0, Lcom/miui/gallery/discovery/DailyCheckJob;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    :cond_0
    const-string v0, "DailyCheckJob"

    const-string v1, "A same job is still running."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;
    .locals 2

    new-instance p1, Landroid/app/job/JobInfo$Builder;

    iget v0, p0, Lcom/miui/gallery/discovery/DailyCheckJob;->mJobId:I

    invoke-direct {p1, v0, p2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const-wide/32 v0, 0x5265c00

    invoke-virtual {p1, v0, v1}, Landroid/app/job/JobInfo$Builder;->setPeriodic(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    return-object p1
.end method
