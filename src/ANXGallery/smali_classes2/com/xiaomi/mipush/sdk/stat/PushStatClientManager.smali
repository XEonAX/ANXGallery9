.class public Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;
.super Ljava/lang/Object;
.source "PushStatClientManager.java"


# static fields
.field private static volatile sInstance:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;


# instance fields
.field private mAppId:Ljava/lang/String;

.field private mCheckDbSizeJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

.field private mContext:Landroid/content/Context;

.field private mDataSender:Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;

.field private mDeleteJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

.field private mPackageName:Ljava/lang/String;

.field private final mSPCheckKey:Ljava/lang/String;

.field private final mSPDeleteKey:Ljava/lang/String;

.field private final mSPName:Ljava/lang/String;

.field private final mSPUploadKey:Ljava/lang/String;

.field private mScheduleJob:Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;

.field private mUploadJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "push_stat_sp"

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mSPName:Ljava/lang/String;

    const-string v0, "upload_time"

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mSPUploadKey:Ljava/lang/String;

    const-string v0, "delete_time"

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mSPDeleteKey:Ljava/lang/String;

    const-string v0, "check_time"

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mSPCheckKey:Ljava/lang/String;

    new-instance v0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;

    invoke-direct {v0, p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;-><init>(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mUploadJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

    new-instance v0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;

    invoke-direct {v0, p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;-><init>(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mCheckDbSizeJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

    new-instance v0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$3;

    invoke-direct {v0, p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$3;-><init>(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)V

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mDeleteJob:Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    return-void
.end method

.method private OCSwitch()Z
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigKey;->StatDataSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    return v0
.end method

.method static synthetic access$000(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mScheduleJob:Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->updateTime(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$300(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getDbPath()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private getDbPath()Ljava/lang/String;
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    sget-object v1, Lcom/xiaomi/mipush/sdk/stat/db/DataBaseConfig;->DATABASE_NAME:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;
    .locals 2

    sget-object v0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->sInstance:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->sInstance:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    if-nez v1, :cond_0

    new-instance v1, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->sInstance:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

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
    sget-object p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->sInstance:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    return-object p0
.end method

.method private updateTime(Ljava/lang/String;)V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    const-string v1, "push_stat_sp"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-interface {v0, p1, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/android/SharedPrefsCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method


# virtual methods
.method public exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    return-void
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mAppId:Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mPackageName:Ljava/lang/String;

    return-object v0
.end method

.method public onResult(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mDataSender:Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;

    if-eqz v0, :cond_1

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    if-eqz p3, :cond_0

    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mDataSender:Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-interface {p3, v0, p2, p1}, Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;->onSuccess(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p3, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mDataSender:Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-interface {p3, v0, p2, p1}, Lcom/xiaomi/mipush/sdk/stat/upload/IDataSender;->onFailed(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public record(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V
    .locals 2

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->OCSwitch()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getPkgName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/TinyDataHelper;->shouldUpload(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->getDbPath()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-static {v1, v0, p1}, Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;->buildInsertJob(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)Lcom/xiaomi/mipush/sdk/stat/db/MessageInsertJob;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->exec(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    return-void
.end method

.method public record(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->OCSwitch()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->mContext:Landroid/content/Context;

    invoke-static {v0, p1}, Lcom/xiaomi/mipush/sdk/stat/upload/UploadDataHelper;->wrapperData(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->record(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V

    return-void
.end method
