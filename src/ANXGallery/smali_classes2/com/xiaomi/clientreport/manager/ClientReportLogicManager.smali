.class public Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;
.super Ljava/lang/Object;
.source "ClientReportLogicManager.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;


# instance fields
.field private mConfig:Lcom/xiaomi/clientreport/data/Config;

.field private mContext:Landroid/content/Context;

.field private mEventMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/xiaomi/clientreport/data/BaseClientReport;",
            ">;>;"
        }
    .end annotation
.end field

.field private mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

.field private mExecutor:Ljava/util/concurrent/ExecutorService;

.field private mPerfMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/clientreport/data/BaseClientReport;",
            ">;>;"
        }
    .end annotation
.end field

.field private mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfMap:Ljava/util/HashMap;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventMap:Ljava/util/HashMap;

    iput-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)Lcom/xiaomi/clientreport/processor/IEventProcessor;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method static synthetic access$300(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)Lcom/xiaomi/clientreport/processor/IPerfProcessor;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    return-object p0
.end method

.method private delayRunJob(Ljava/lang/Runnable;I)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;I)V

    return-void
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->sInstance:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->sInstance:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->sInstance:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    sget-object p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->sInstance:Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    return-object p0
.end method

.method private startEventUploadJob()V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/xiaomi/clientreport/job/EventUploadJob;

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/xiaomi/clientreport/job/EventUploadJob;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide v1

    long-to-int v1, v1

    const/16 v2, 0x708

    if-ge v1, v2, :cond_1

    const/16 v1, 0x708

    :cond_1
    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/clientreport/util/SPManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/util/SPManager;

    move-result-object v2

    const-string v3, "sp_client_report_status"

    const-string v4, "event_last_upload_time"

    const-wide/16 v5, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/xiaomi/clientreport/util/SPManager;->getLongValue(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    mul-int/lit16 v2, v1, 0x3e8

    int-to-long v2, v2

    cmp-long v6, v4, v2

    if-lez v6, :cond_2

    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v2

    new-instance v3, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;

    invoke-direct {v3, p0, v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$3;-><init>(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;Lcom/xiaomi/clientreport/job/EventUploadJob;)V

    const/16 v4, 0xa

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;I)V

    :cond_2
    const-class v2, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addRepeatJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    const v4, 0x18a16

    invoke-virtual {v3, v4}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->cancelJob(I)Z

    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addRepeatJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z

    :cond_3
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private startPerfUploadJob()V
    .locals 7

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Lcom/xiaomi/clientreport/job/PerfUploadJob;

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/xiaomi/clientreport/job/PerfUploadJob;-><init>(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide v1

    long-to-int v1, v1

    const/16 v2, 0x708

    if-ge v1, v2, :cond_1

    const/16 v1, 0x708

    :cond_1
    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/clientreport/util/SPManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/util/SPManager;

    move-result-object v2

    const-string v3, "sp_client_report_status"

    const-string v4, "perf_last_upload_time"

    const-wide/16 v5, 0x0

    invoke-virtual {v2, v3, v4, v5, v6}, Lcom/xiaomi/clientreport/util/SPManager;->getLongValue(Ljava/lang/String;Ljava/lang/String;J)J

    move-result-wide v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    sub-long/2addr v4, v2

    mul-int/lit16 v2, v1, 0x3e8

    int-to-long v2, v2

    cmp-long v6, v4, v2

    if-lez v6, :cond_2

    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v2

    new-instance v3, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$4;

    invoke-direct {v3, p0, v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$4;-><init>(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;Lcom/xiaomi/clientreport/job/PerfUploadJob;)V

    const/16 v4, 0xf

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;I)V

    :cond_2
    const-class v2, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    monitor-enter v2

    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addRepeatJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z

    move-result v3

    if-nez v3, :cond_3

    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    const v4, 0x18a17

    invoke-virtual {v3, v4}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->cancelJob(I)Z

    iget-object v3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addRepeatJob(Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;I)Z

    :cond_3
    monitor-exit v2

    return-void

    :catchall_0
    move-exception v0

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method public declared-synchronized getConfig()Lcom/xiaomi/clientreport/data/Config;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/data/Config;->defaultConfig(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public init(Lcom/xiaomi/clientreport/data/Config;Lcom/xiaomi/clientreport/processor/IEventProcessor;Lcom/xiaomi/clientreport/processor/IPerfProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    iput-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

    iput-object p3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    iget-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventMap:Ljava/util/HashMap;

    invoke-interface {p1, p2}, Lcom/xiaomi/clientreport/processor/IEventProcessor;->setEventMap(Ljava/util/HashMap;)V

    iget-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfMap:Ljava/util/HashMap;

    invoke-interface {p1, p2}, Lcom/xiaomi/clientreport/processor/IPerfProcessor;->setPerfMap(Ljava/util/HashMap;)V

    return-void
.end method

.method public sendEvent()V
    .locals 2

    invoke-virtual {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;

    invoke-direct {v0}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->setContext(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

    invoke-virtual {v0, v1}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->setReadAndSender(Lcom/xiaomi/clientreport/processor/IDataSend;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public sendPerf()V
    .locals 2

    invoke-virtual {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/xiaomi/clientreport/job/ReadAndSendJob;

    invoke-direct {v0}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;-><init>()V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    invoke-virtual {v0, v1}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->setReadAndSender(Lcom/xiaomi/clientreport/processor/IDataSend;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/xiaomi/clientreport/job/ReadAndSendJob;->setContext(Landroid/content/Context;)V

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public startScheduleJob()V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-direct {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startEventUploadJob()V

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;

    move-result-object v0

    invoke-direct {v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startPerfUploadJob()V

    return-void
.end method

.method public updateConfig(ZZJJ)V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result v0

    if-ne p1, v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result v0

    if-ne p2, v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide v0

    cmp-long v2, p3, v0

    if-nez v2, :cond_0

    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide v0

    cmp-long v2, p5, v0

    if-eqz v2, :cond_4

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide v0

    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v2}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide v2

    invoke-static {}, Lcom/xiaomi/clientreport/data/Config;->getBuilder()Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {v5}, Lcom/xiaomi/clientreport/util/ClientReportUtil;->getEventKeyWithDefault(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/xiaomi/clientreport/data/Config$Builder;->setAESKey(Ljava/lang/String;)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v4

    iget-object v5, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {v5}, Lcom/xiaomi/clientreport/data/Config;->isEventEncrypted()Z

    move-result v5

    invoke-virtual {v4, v5}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventEncrypted(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, p3, p4}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    invoke-virtual {p1, p5, p6}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object p1

    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2}, Lcom/xiaomi/clientreport/data/Config$Builder;->build(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {p2}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result p2

    if-nez p2, :cond_1

    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object p2

    const p3, 0x18a16

    invoke-virtual {p2, p3}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->cancelJob(I)Z

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide p2

    cmp-long p4, v0, p2

    if-eqz p4, :cond_2

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "reset event job "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getEventUploadFrequency()J

    move-result-wide p3

    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startEventUploadJob()V

    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mConfig:Lcom/xiaomi/clientreport/data/Config;

    invoke-virtual {p2}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result p2

    if-nez p2, :cond_3

    iget-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object p1

    const p2, 0x18a17

    invoke-virtual {p1, p2}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->cancelJob(I)Z

    goto :goto_1

    :cond_3
    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide p2

    cmp-long p4, v2, p2

    if-eqz p4, :cond_4

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    invoke-virtual {p3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, "reset perf job "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/xiaomi/clientreport/data/Config;->getPerfUploadFrequency()J

    move-result-wide p3

    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->startPerfUploadJob()V

    :cond_4
    :goto_1
    return-void
.end method

.method public writeEvent(Lcom/xiaomi/clientreport/data/EventClientReport;)V
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isEventUploadSwitchOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/xiaomi/clientreport/job/DataPreProcessJob;

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mEventProcessor:Lcom/xiaomi/clientreport/processor/IEventProcessor;

    invoke-direct {v0, v1, p1, v2}, Lcom/xiaomi/clientreport/job/DataPreProcessJob;-><init>(Landroid/content/Context;Lcom/xiaomi/clientreport/data/BaseClientReport;Lcom/xiaomi/clientreport/processor/IWrite;)V

    iget-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    new-instance p1, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$1;

    invoke-direct {p1, p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$1;-><init>(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)V

    const/16 v0, 0x1e

    invoke-direct {p0, p1, v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->delayRunJob(Ljava/lang/Runnable;I)V

    :cond_0
    return-void
.end method

.method public writePerf(Lcom/xiaomi/clientreport/data/PerfClientReport;)V
    .locals 3

    invoke-virtual {p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->getConfig()Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/clientreport/data/Config;->isPerfUploadSwitchOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/xiaomi/clientreport/job/DataPreProcessJob;

    iget-object v1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mPerfProcessor:Lcom/xiaomi/clientreport/processor/IPerfProcessor;

    invoke-direct {v0, v1, p1, v2}, Lcom/xiaomi/clientreport/job/DataPreProcessJob;-><init>(Landroid/content/Context;Lcom/xiaomi/clientreport/data/BaseClientReport;Lcom/xiaomi/clientreport/processor/IWrite;)V

    iget-object p1, p0, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->mExecutor:Ljava/util/concurrent/ExecutorService;

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    new-instance p1, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$2;

    invoke-direct {p1, p0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager$2;-><init>(Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;)V

    const/16 v0, 0x1e

    invoke-direct {p0, p1, v0}, Lcom/xiaomi/clientreport/manager/ClientReportLogicManager;->delayRunJob(Ljava/lang/Runnable;I)V

    :cond_0
    return-void
.end method
