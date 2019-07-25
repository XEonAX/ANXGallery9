.class public Lcom/miui/gallery/editor/photo/sdk/CleanService;
.super Landroid/app/job/JobService;
.source "CleanService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;
    }
.end annotation


# instance fields
.field private mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/app/job/JobService;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/sdk/CleanService;Landroid/app/job/JobParameters;)Ljava/util/List;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->parse(Landroid/app/job/JobParameters;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/editor/photo/sdk/CleanService;Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;)Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    return-object p1
.end method

.method private parse(Landroid/app/job/JobParameters;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/job/JobParameters;",
            ")",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p1

    const-string v1, "extra_file_paths"

    invoke-virtual {p1, v1}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    if-eqz p1, :cond_4

    array-length v1, p1

    const/4 v2, 0x1

    if-ge v1, v2, :cond_1

    goto :goto_2

    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, v2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    array-length v1, p1

    const/4 v2, 0x0

    :goto_1
    if-ge v2, v1, :cond_3

    aget-object v3, p1, v2

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    return-object v0

    :cond_4
    :goto_2
    return-object v0
.end method

.method public static schedule(Landroid/content/Context;Ljava/lang/String;)V
    .locals 8

    if-eqz p0, :cond_4

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "CleanService"

    const-string v1, "received file: %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "jobscheduler"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/job/JobScheduler;

    invoke-virtual {v0}, Landroid/app/job/JobScheduler;->getAllPendingJobs()Ljava/util/List;

    move-result-object v1

    const/4 v2, 0x0

    const/16 v3, 0x3e7

    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/job/JobInfo;

    invoke-virtual {v4}, Landroid/app/job/JobInfo;->getId()I

    move-result v5

    if-ne v5, v3, :cond_0

    move-object v2, v4

    :cond_1
    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v2, :cond_2

    const-string v2, "CleanService"

    const-string v6, "non job exists, create one"

    invoke-static {v2, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "extra_file_paths"

    new-array v6, v5, [Ljava/lang/String;

    aput-object p1, v6, v4

    invoke-virtual {v1, v2, v6}, Landroid/os/PersistableBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v2}, Landroid/app/job/JobInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v2

    const-string v6, "extra_file_paths"

    invoke-virtual {v2, v6}, Landroid/os/PersistableBundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v6, Landroid/util/ArraySet;

    array-length v7, v2

    add-int/2addr v7, v5

    invoke-direct {v6, v7}, Landroid/util/ArraySet;-><init>(I)V

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-virtual {v6, v2}, Landroid/util/ArraySet;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v6, p1}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6}, Landroid/util/ArraySet;->size()I

    move-result p1

    new-array p1, p1, [Ljava/lang/String;

    invoke-virtual {v6, p1}, Landroid/util/ArraySet;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    const-string v2, "CleanService"

    const-string v6, "append, current files: %s"

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v2, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "extra_file_paths"

    invoke-virtual {v1, v2, p1}, Landroid/os/PersistableBundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Landroid/app/job/JobScheduler;->cancel(I)V

    :goto_0
    new-instance p1, Landroid/app/job/JobInfo$Builder;

    new-instance v2, Landroid/content/ComponentName;

    const-class v6, Lcom/miui/gallery/editor/photo/sdk/CleanService;

    invoke-direct {v2, p0, v6}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-direct {p1, v3, v2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    invoke-virtual {p1, v4}, Landroid/app/job/JobInfo$Builder;->setPersisted(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/job/JobScheduler;->schedule(Landroid/app/job/JobInfo;)I

    return-void

    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "illegal path"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_4
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "context can\'t be null"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public onStartJob(Landroid/app/job/JobParameters;)Z
    .locals 5

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->parse(Landroid/app/job/JobParameters;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;-><init>(Lcom/miui/gallery/editor/photo/sdk/CleanService;Lcom/miui/gallery/editor/photo/sdk/CleanService$1;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 v3, 0x1

    new-array v4, v3, [Landroid/app/job/JobParameters;

    aput-object p1, v4, v1

    invoke-virtual {v0, v2, v4}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    return v3

    :cond_0
    return v1
.end method

.method public onStopJob(Landroid/app/job/JobParameters;)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->getStatus()Landroid/os/AsyncTask$Status;

    move-result-object v0

    sget-object v2, Landroid/os/AsyncTask$Status;->FINISHED:Landroid/os/AsyncTask$Status;

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;->cancel(Z)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/sdk/CleanService;->mCleanTask:Lcom/miui/gallery/editor/photo/sdk/CleanService$CleanTask;

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/sdk/CleanService;->parse(Landroid/app/job/JobParameters;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    const-string p1, "CleanService"

    const-string v0, "onStopJob: %b"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p1, v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1
.end method
