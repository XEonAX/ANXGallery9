.class Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;
.super Ljava/lang/Object;
.source "PendingTaskService.java"

# interfaces
.implements Lcom/miui/gallery/threadpool/ThreadPool$Job;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/pendingtask/base/PendingTaskService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PendingTaskJob"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/threadpool/ThreadPool$Job<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private mParams:Landroid/app/job/JobParameters;

.field final synthetic this$0:Lcom/miui/gallery/pendingtask/base/PendingTaskService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/pendingtask/base/PendingTaskService;Landroid/app/job/JobParameters;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->this$0:Lcom/miui/gallery/pendingtask/base/PendingTaskService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->mParams:Landroid/app/job/JobParameters;

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 2

    new-instance v0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob$1;-><init>(Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->mParams:Landroid/app/job/JobParameters;

    invoke-virtual {p1, v1, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->executeTask(Landroid/app/job/JobParameters;Lcom/miui/gallery/pendingtask/base/PendingTask$Callback;)V

    iget-object p1, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->this$0:Lcom/miui/gallery/pendingtask/base/PendingTaskService;

    iget-object v0, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->mParams:Landroid/app/job/JobParameters;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService;->jobFinished(Landroid/app/job/JobParameters;Z)V

    iget-object p1, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->this$0:Lcom/miui/gallery/pendingtask/base/PendingTaskService;

    invoke-static {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService;->access$000(Lcom/miui/gallery/pendingtask/base/PendingTaskService;)Ljava/util/Map;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/pendingtask/base/PendingTaskService$PendingTaskJob;->mParams:Landroid/app/job/JobParameters;

    invoke-virtual {v0}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 p1, 0x0

    return-object p1
.end method
