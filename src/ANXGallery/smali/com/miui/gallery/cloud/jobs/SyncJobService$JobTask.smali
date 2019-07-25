.class Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;
.super Lcom/miui/gallery/cloud/taskmanager/Task;
.source "SyncJobService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/jobs/SyncJobService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JobTask"
.end annotation


# instance fields
.field private mParameters:Landroid/app/job/JobParameters;

.field final synthetic this$0:Lcom/miui/gallery/cloud/jobs/SyncJobService;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/jobs/SyncJobService;Landroid/app/job/JobParameters;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->this$0:Lcom/miui/gallery/cloud/jobs/SyncJobService;

    invoke-direct {p0}, Lcom/miui/gallery/cloud/taskmanager/Task;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/cloud/taskmanager/Task;)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2

    const/4 v0, 0x0

    if-eqz p1, :cond_3

    instance-of v1, p1, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;

    if-eqz v1, :cond_3

    check-cast p1, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object v1

    if-eqz v1, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->getParameters()Landroid/app/job/JobParameters;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result p1

    if-ne v1, p1, :cond_2

    :cond_1
    const/4 v0, 0x1

    :cond_2
    return v0

    :cond_3
    return v0
.end method

.method public getParameters()Landroid/app/job/JobParameters;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v0}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    :goto_0
    return v0
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 7

    const/4 p1, 0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v2}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobFactory;->createJob(I)Lcom/miui/gallery/cloud/jobs/AbsSyncJob;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    :try_start_1
    invoke-virtual {v2}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;->execute()Ljava/lang/Object;

    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v6, v2

    move-object v2, v0

    move-object v0, v6

    goto :goto_1

    :cond_0
    move-object v2, v0

    :cond_1
    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->this$0:Lcom/miui/gallery/cloud/jobs/SyncJobService;

    iget-object v4, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v3, v4, v1}, Lcom/miui/gallery/cloud/jobs/SyncJobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    if-eqz v2, :cond_2

    const-string v3, "Sync"

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "sync_job_%s"

    new-array p1, p1, [Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, p1, v1

    invoke-static {v4, v5, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    return-object v0

    :catchall_1
    move-exception v2

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->this$0:Lcom/miui/gallery/cloud/jobs/SyncJobService;

    iget-object v4, p0, Lcom/miui/gallery/cloud/jobs/SyncJobService$JobTask;->mParameters:Landroid/app/job/JobParameters;

    invoke-virtual {v3, v4, v1}, Lcom/miui/gallery/cloud/jobs/SyncJobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    if-eqz v0, :cond_3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    new-array p1, p1, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p1, v1

    const-string v0, "sync_job_%s"

    invoke-static {v3, v0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "Sync"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    throw v2
.end method
