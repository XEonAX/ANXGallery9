.class public Lcom/miui/gallery/module/ModuleManagerService;
.super Landroid/app/job/JobService;
.source "ModuleManagerService.java"


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    const-string v0, "ModuleManagerService"

    iput-object v0, p0, Lcom/miui/gallery/module/ModuleManagerService;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/module/ModuleManagerService;)Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/module/ModuleManagerService;->TAG:Ljava/lang/String;

    return-object p0
.end method


# virtual methods
.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/module/ModuleManagerService;->TAG:Ljava/lang/String;

    const-string v1, "onStartJob"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v0

    const-string v1, "module"

    invoke-virtual {v0, v1}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/module/ModuleManagerService;->TAG:Ljava/lang/String;

    const-string v2, "onStartLoadingModulesFromCloud"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/module/ModuleManagerService$1;

    invoke-direct {v2, p0, v0, p1}, Lcom/miui/gallery/module/ModuleManagerService$1;-><init>(Lcom/miui/gallery/module/ModuleManagerService;Ljava/lang/String;Landroid/app/job/JobParameters;)V

    invoke-virtual {v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/module/ModuleManagerService;->TAG:Ljava/lang/String;

    const-string v0, "onStopJob"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1
.end method
