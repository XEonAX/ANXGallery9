.class public Lcom/miui/gallery/cloud/jobs/SyncJobService;
.super Landroid/app/job/JobService;
.source "SyncJobService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;,
        Lcom/miui/gallery/cloud/jobs/SyncJobService$JobFactory;
    }
.end annotation


# instance fields
.field private mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method

.method public static scheduleJob(Landroid/content/Context;I)I
    .locals 0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobFactory;->createJob(I)Lcom/miui/gallery/cloud/jobs/AbsSyncJob;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService;->scheduleJob(Landroid/content/Context;Lcom/miui/gallery/cloud/jobs/AbsSyncJob;)I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method private static scheduleJob(Landroid/content/Context;Lcom/miui/gallery/cloud/jobs/AbsSyncJob;)I
    .locals 5

    const-string v0, "jobscheduler"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    invoke-virtual {v0}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object v1

    new-instance v2, Landroid/content/ComponentName;

    const-class v3, Lcom/miui/gallery/cloud/jobs/SyncJobService;

    invoke-direct {v2, p0, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p1, p0, v2}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;

    move-result-object p0

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/app/job/JobInfo;

    invoke-virtual {p1, p0, v2}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->equals(Landroid/app/job/JobInfo;Landroid/app/job/JobInfo;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eqz v1, :cond_2

    const-string p0, "SyncJobService"

    const-string v0, "scheduledJob %d"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->getJobId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v4

    :cond_2
    if-nez p0, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->getJobId()I

    move-result p0

    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->cancel(I)V

    const-string p0, "SyncJobService"

    const-string v0, "cancel Job %d"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->getJobId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    move-result p0

    if-lez p0, :cond_4

    const-string p0, "SyncJobService"

    const-string v0, "scheduleJob %d success"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->getJobId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v4

    :cond_4
    :goto_1
    return v3
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/job/JobService;->onCreate()V

    new-instance v0, Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    return-void
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Landroid/app/job/JobService;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->shutdown()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    :cond_0
    return-void
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 3

    if-eqz p1, :cond_0

    const-string v0, "SyncJobService"

    const-string v1, "onStartJob %s"

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService;->mTaskManager:Lcom/miui/gallery/cloud/taskmanager/TaskManager;

    new-instance v1, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;-><init>(Lcom/miui/gallery/cloud/jobs/SyncJobService;Landroid/app/job/JobParameters;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/taskmanager/TaskManager;->submit(Lcom/miui/gallery/cloud/taskmanager/Task;)V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method
