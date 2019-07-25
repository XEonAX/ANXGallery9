.class Lcom/miui/gallery/discovery/GalleryJobService$JobTask;
.super Lmiui/util/async/Task;
.source "GalleryJobService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/discovery/GalleryJobService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "JobTask"
.end annotation


# instance fields
.field private mJob:Lcom/miui/gallery/discovery/AbstractJob;

.field private mJobParams:Landroid/app/job/JobParameters;

.field final synthetic this$0:Lcom/miui/gallery/discovery/GalleryJobService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/discovery/GalleryJobService;Landroid/app/job/JobParameters;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->this$0:Lcom/miui/gallery/discovery/GalleryJobService;

    invoke-direct {p0}, Lmiui/util/async/Task;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    return-void
.end method


# virtual methods
.method public doLoad()Ljava/lang/Object;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/discovery/GalleryJobService;->access$000()Ljava/util/Map;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Class;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/discovery/AbstractJob;

    iput-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    iget-object v2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v2}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/discovery/AbstractJob;->setJobId(I)V

    const-string v1, "GalleryJobService"

    const-string v2, "Exec job %d"

    iget-object v3, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v3}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "JobServiceStarted"

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    iget-object v0, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    invoke-virtual {v0}, Lcom/miui/gallery/discovery/AbstractJob;->execJob()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public onResult(Lmiui/util/async/TaskManager;Ljava/lang/Object;)V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object p1

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    instance-of v1, p2, Ljava/lang/Boolean;

    if-eqz v1, :cond_3

    check-cast p2, Ljava/lang/Boolean;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p2

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    invoke-virtual {p2}, Lcom/miui/gallery/discovery/AbstractJob;->needsReschedule()Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->this$0:Lcom/miui/gallery/discovery/GalleryJobService;

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {p2, v1, v0}, Lcom/miui/gallery/discovery/GalleryJobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    const-string p2, "GalleryJobService"

    const-string v1, "Job %d failed, rescheduled: %b."

    iget-object v2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v2}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {p2, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string p2, "JobServiceFailed"

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "jobId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v2}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-static {p2, v1, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    if-eqz v0, :cond_2

    const-string p2, "JobServiceRescheduled"

    iget-object v0, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    return-void

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->this$0:Lcom/miui/gallery/discovery/GalleryJobService;

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {p2, v1, v0}, Lcom/miui/gallery/discovery/GalleryJobService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    const-string p2, "GalleryJobService"

    const-string v0, "Job %d done"

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p2, "JobServiceDone"

    iget-object v0, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJob:Lcom/miui/gallery/discovery/AbstractJob;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "jobId: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/discovery/GalleryJobService$JobTask;->mJobParams:Landroid/app/job/JobParameters;

    invoke-virtual {v1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {p2, v0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method
