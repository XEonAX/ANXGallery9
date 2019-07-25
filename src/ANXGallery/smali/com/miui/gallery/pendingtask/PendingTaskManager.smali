.class public Lcom/miui/gallery/pendingtask/PendingTaskManager;
.super Ljava/lang/Object;
.source "PendingTaskManager.java"


# static fields
.field private static final TIME_STAGE:[I

.field private static instance:Lcom/miui/gallery/pendingtask/PendingTaskManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x9

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/pendingtask/PendingTaskManager;->TIME_STAGE:[I

    return-void

    :array_0
    .array-data 4
        0x1
        0x2
        0x3
        0x6
        0xc
        0x18
        0x30
        0x48
        0xa8
    .end array-data
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private cancelJob(J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->generateJobId(J)I

    move-result p1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService;->cancelJob(Landroid/content/Context;I)V

    return-void
.end method

.method private generateJobId(J)I
    .locals 2

    const-wide/16 v0, 0x3e8

    rem-long/2addr p1, v0

    add-long/2addr p1, v0

    long-to-int p1, p1

    return p1
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;
    .locals 2

    const-class v0, Lcom/miui/gallery/pendingtask/PendingTaskManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/pendingtask/PendingTaskManager;->instance:Lcom/miui/gallery/pendingtask/PendingTaskManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/pendingtask/PendingTaskManager;

    invoke-direct {v1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;-><init>()V

    sput-object v1, Lcom/miui/gallery/pendingtask/PendingTaskManager;->instance:Lcom/miui/gallery/pendingtask/PendingTaskManager;

    :cond_0
    sget-object v1, Lcom/miui/gallery/pendingtask/PendingTaskManager;->instance:Lcom/miui/gallery/pendingtask/PendingTaskManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private static recordDropReason(ILjava/lang/String;)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "reason"

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "pending_task"

    const-string p1, "pending_task_drop_reason"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static recordExpireCount()V
    .locals 8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x240c8400

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    sub-long v2, v0, v2

    const-string v4, "%s > %s AND %s < %s"

    const/4 v5, 0x4

    new-array v5, v5, [Ljava/lang/Object;

    const-string v6, "createTime"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v5, v3

    const-string v2, "createTime"

    const/4 v3, 0x2

    aput-object v2, v5, v3

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x3

    aput-object v0, v5, v1

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v0, v3}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "count"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "pending_task"

    const-string v3, "pending_task_expire_count"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string v1, "PendingTaskManager"

    const-string v2, "%s tasks expire."

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method private static recordFinishDuration(J)V
    .locals 5

    long-to-float p0, p0

    const/high16 p1, 0x3f800000    # 1.0f

    mul-float p0, p0, p1

    const p1, 0x4a5bba00    # 3600000.0f

    div-float/2addr p0, p1

    sget-object p1, Lcom/miui/gallery/pendingtask/PendingTaskManager;->TIME_STAGE:[I

    invoke-static {p0, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorValueStage(F[I)I

    move-result p1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "stage"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "pending_task"

    const-string v2, "pending_task_finish_duration"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    const-string v0, "PendingTaskManager"

    const-string v1, "task spend %s hour since post, record stage %s."

    new-instance v2, Ljava/text/DecimalFormat;

    const-string v3, "#.00"

    invoke-direct {v2, v3}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    float-to-double v3, p0

    invoke-virtual {v2, v3, v4}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p0, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method private static recordProcessDuration(IJ)V
    .locals 3

    const-wide/32 v0, 0x927c0

    cmp-long v2, p1, v0

    if-gez v2, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "type"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "cost"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "pending_task"

    const-string p1, "pending_task_process_cost"

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private static recordRescheduleCount(I)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "count"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "pending_task"

    const-string v1, "pending_task_reschedule"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private scheduleTask(Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;)V
    .locals 8

    const-string v0, "PendingTaskManager"

    const-string v1, "scheduleTask type: %s taskId: %s"

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getTaskType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v0, Landroid/content/ComponentName;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/pendingtask/base/PendingTaskService;

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    const-string v2, "taskId"

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Landroid/os/PersistableBundle;->putLong(Ljava/lang/String;J)V

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getMinLatencyMillis()J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getCreateTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    sub-long/2addr v2, v4

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getNetType()I

    move-result v4

    const/4 v5, 0x2

    packed-switch v4, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 v5, 0x1

    goto :goto_0

    :pswitch_1
    const/4 v5, 0x0

    :goto_0
    :pswitch_2
    new-instance v4, Landroid/app/job/JobInfo$Builder;

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->generateJobId(J)I

    move-result v6

    invoke-direct {v4, v6, v0}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    invoke-virtual {v4, v1}, Landroid/app/job/JobInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->isRequireCharging()Z

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->isRequireDeviceIdle()Z

    move-result p1

    invoke-virtual {v0, p1}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1, v5}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const-wide/16 v0, 0x0

    cmp-long v4, v2, v0

    if-lez v4, :cond_0

    move-wide v0, v2

    :cond_0
    invoke-virtual {p1, v0, v1}, Landroid/app/job/JobInfo$Builder;->setMinimumLatency(J)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskService;->scheduleJob(Landroid/content/Context;Landroid/app/job/JobInfo;)V

    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public cancel(ILjava/lang/String;)V
    .locals 5

    const-string v0, "PendingTaskManager"

    const-string v1, "cancel task. type: %s tag: %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-string v1, "%s=%s and %s=\'%s\'"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "taskType"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    const/4 p1, 0x2

    const-string v3, "taskTag"

    aput-object v3, v2, p1

    const/4 p1, 0x3

    aput-object p2, v2, p1

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-class p2, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, p1, v1}, Lcom/miui/gallery/dao/base/EntityManager;->find(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Lcom/miui/gallery/dao/base/Entity;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide p1

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancelJob(J)V

    :cond_1
    return-void
.end method

.method public cancelAll(I)V
    .locals 5

    const-string v0, "PendingTaskManager"

    const-string v1, "cancel all. type: %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-string v1, "%s=%s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "taskType"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-class v1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Lcom/miui/gallery/dao/base/EntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide v3

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancelJob(J)V

    goto :goto_0

    :cond_1
    const-class v1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {v0, v1, p1, v2}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Z

    return-void

    :cond_2
    :goto_1
    return-void
.end method

.method public checkTaskList()V
    .locals 9

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordExpireCount()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/32 v2, 0x240c8400

    sub-long/2addr v0, v2

    const-string v2, "%s > %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "createTime"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const/4 v1, 0x1

    aput-object v0, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v4}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_6

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_2

    :cond_0
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/pendingtask/base/PendingTaskService;->getAllPendingJob(Landroid/content/Context;)Ljava/util/List;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v3, 0x0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {v4}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getId()J

    move-result-wide v6

    invoke-direct {p0, v6, v7}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->generateJobId(J)I

    move-result v6

    if-nez v2, :cond_2

    invoke-direct {p0, v4}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->scheduleTask(Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;)V

    goto :goto_0

    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/app/job/JobInfo;

    invoke-virtual {v8}, Landroid/app/job/JobInfo;->getId()I

    move-result v8

    if-ne v8, v6, :cond_3

    const/4 v6, 0x1

    goto :goto_1

    :cond_4
    const/4 v6, 0x0

    :goto_1
    if-nez v6, :cond_1

    add-int/lit8 v3, v3, 0x1

    invoke-direct {p0, v4}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->scheduleTask(Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;)V

    goto :goto_0

    :cond_5
    invoke-static {v3}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordRescheduleCount(I)V

    return-void

    :cond_6
    :goto_2
    return-void
.end method

.method public executeTask(JLcom/miui/gallery/pendingtask/base/PendingTask$Callback;)V
    .locals 10

    const-string v0, "PendingTaskManager"

    const-string v1, "executeTask taskId: %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-virtual {v0, v1, p1, p2}, Lcom/miui/gallery/dao/base/EntityManager;->find(Ljava/lang/Class;J)Lcom/miui/gallery/dao/base/Entity;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    if-nez v1, :cond_0

    const-string p3, "PendingTaskManager"

    const-string v0, "can\'t find taskInfo %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p3, v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getTaskType()I

    move-result v2

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getExpireTime()J

    move-result-wide v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v9, v3, v7

    if-lez v9, :cond_1

    cmp-long v7, v3, v5

    if-gez v7, :cond_1

    const-string p1, "PendingTaskManager"

    const-string p2, "task %s is out of date"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    const-string p1, "out_date"

    invoke-static {v2, p1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordDropReason(ILjava/lang/String;)V

    return-void

    :cond_1
    invoke-static {v2}, Lcom/miui/gallery/pendingtask/PendingTaskFactory;->create(I)Lcom/miui/gallery/pendingtask/base/PendingTask;

    move-result-object v3

    if-nez v3, :cond_2

    const-string p1, "PendingTaskManager"

    const-string p2, "can\'t find PendingTask of this type %s"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    const-string p1, "create_task"

    invoke-static {v2, p1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordDropReason(ILjava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {v3, p3}, Lcom/miui/gallery/pendingtask/base/PendingTask;->setCallback(Lcom/miui/gallery/pendingtask/base/PendingTask$Callback;)V

    const/4 p3, 0x0

    :try_start_0
    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getData()[B

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/miui/gallery/pendingtask/base/PendingTask;->parseData([B)Ljava/lang/Object;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object p3, v4

    goto :goto_0

    :catch_0
    move-exception v4

    const-string v5, "PendingTaskManager"

    const-string v6, "task %s parseData error.\n"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v5, v6, v7, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    if-nez p3, :cond_3

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    const-string p1, "data_parse"

    invoke-static {v2, p1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordDropReason(ILjava/lang/String;)V

    return-void

    :cond_3
    const/4 v4, 0x0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    :try_start_1
    const-string v7, "PendingTaskManager"

    const-string v8, "task %s begin process.\n"

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getTaskType()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-static {v7, v8, v9}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v3, p3}, Lcom/miui/gallery/pendingtask/base/PendingTask;->process(Ljava/lang/Object;)Z

    move-result p3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p3

    const-string v3, "PendingTaskManager"

    const-string v7, "task %s process error.\n"

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getTaskType()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v3, v7, v8, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const/4 p3, 0x0

    :goto_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v5

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordProcessDuration(IJ)V

    if-eqz p3, :cond_5

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->increaseRetryTime()V

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getRetryTime()I

    move-result v5

    const/4 v6, 0x3

    if-lt v5, v6, :cond_4

    const-string v5, "PendingTaskManager"

    const-string v6, "task %s retry %s times, drop it!"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getRetryTime()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-static {v5, v6, v7, v8}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    const-string v0, "over_time"

    invoke-static {v2, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordDropReason(ILjava/lang/String;)V

    goto :goto_2

    :cond_4
    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->update(Lcom/miui/gallery/dao/base/Entity;)Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->scheduleTask(Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;)V

    goto :goto_2

    :cond_5
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-virtual {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->getCreateTime()J

    move-result-wide v7

    sub-long/2addr v5, v7

    invoke-static {v5, v6}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->recordFinishDuration(J)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/dao/base/EntityManager;->delete(Lcom/miui/gallery/dao/base/Entity;)Z

    :goto_2
    const-string v0, "PendingTaskManager"

    const-string v1, "execute taskId %s done, cost %s ms, need retry %s"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-static {v0, v1, p1, p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public executeTask(Landroid/app/job/JobParameters;Lcom/miui/gallery/pendingtask/base/PendingTask$Callback;)V
    .locals 5

    const-string v0, "PendingTaskManager"

    const-string v1, "executeTask jobId: %s"

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getJobId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/app/job/JobParameters;->getExtras()Landroid/os/PersistableBundle;

    move-result-object p1

    if-nez p1, :cond_0

    return-void

    :cond_0
    const-string v0, "taskId"

    const-wide/16 v1, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/PersistableBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    cmp-long p1, v3, v1

    if-nez p1, :cond_1

    return-void

    :cond_1
    invoke-virtual {p0, v3, v4, p2}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->executeTask(JLcom/miui/gallery/pendingtask/base/PendingTask$Callback;)V

    return-void
.end method

.method public postTask(ILjava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method public postTask(ILjava/lang/Object;Ljava/lang/String;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    const-wide/16 v4, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;J)V

    return-void
.end method

.method public postTask(ILjava/lang/Object;Ljava/lang/String;J)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(ITT;",
            "Ljava/lang/String;",
            "J)V"
        }
    .end annotation

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0, p1, p3}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->cancel(ILjava/lang/String;)V

    :cond_0
    const-string v0, "PendingTaskManager"

    const-string v1, "postTask type: %s tag: %s"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1}, Lcom/miui/gallery/pendingtask/PendingTaskFactory;->create(I)Lcom/miui/gallery/pendingtask/base/PendingTask;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;

    invoke-direct {v1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setTaskType(I)V

    invoke-virtual {v1, p3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setTaskTag(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setCreateTime(J)V

    invoke-virtual {v1, p4, p5}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setExpireTime(J)V

    invoke-virtual {v0}, Lcom/miui/gallery/pendingtask/base/PendingTask;->getNetworkType()I

    move-result p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setNetType(I)V

    invoke-virtual {v0}, Lcom/miui/gallery/pendingtask/base/PendingTask;->requireCharging()Z

    move-result p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setRequireCharging(Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/pendingtask/base/PendingTask;->requireDeviceIdle()Z

    move-result p3

    invoke-virtual {v1, p3}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setRequireDeviceIdle(Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/pendingtask/base/PendingTask;->getMinLatency()J

    move-result-wide p3

    invoke-virtual {v1, p3, p4}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setMinLatencyMillis(J)V

    :try_start_0
    invoke-virtual {v0, p2}, Lcom/miui/gallery/pendingtask/base/PendingTask;->wrapData(Ljava/lang/Object;)[B

    move-result-object p2

    invoke-virtual {v1, p2}, Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;->setData([B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    invoke-direct {p0, v1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->scheduleTask(Lcom/miui/gallery/pendingtask/base/PendingTaskInfo;)V

    return-void

    :catch_0
    move-exception p2

    const-string p3, "PendingTaskManager"

    const-string p4, "postTask %s wrapData error.\n"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p3, p4, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Can\'t find PendingTask of this type"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
