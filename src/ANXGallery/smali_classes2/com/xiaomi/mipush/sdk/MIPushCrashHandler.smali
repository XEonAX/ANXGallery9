.class Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;
.super Ljava/lang/Object;
.source "MIPushCrashHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# static fields
.field private static final crashFilterByPkgName:[Ljava/lang/String;

.field private static final mObject:Ljava/lang/Object;


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDefaultCrashHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private mSharedPreference:Landroid/content/SharedPreferences;


# direct methods
.method static constructor <clinit>()V
    .locals 14

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mObject:Ljava/lang/Object;

    const-string v1, "com.xiaomi.channel.commonutils"

    const-string v2, "com.xiaomi.common.logger"

    const-string v3, "com.xiaomi.measite.smack"

    const-string v4, "com.xiaomi.metoknlp"

    const-string v5, "com.xiaomi.mipush.sdk"

    const-string v6, "com.xiaomi.network"

    const-string v7, "com.xiaomi.push"

    const-string v8, "com.xiaomi.slim"

    const-string v9, "com.xiaomi.smack"

    const-string v10, "com.xiaomi.stats"

    const-string v11, "com.xiaomi.tinyData"

    const-string v12, "com.xiaomi.xmpush.thrift"

    const-string v13, "com.xiaomi.clientreport"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->crashFilterByPkgName:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;-><init>(Landroid/content/Context;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mDefaultCrashHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    return-void
.end method

.method static synthetic access$000(Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;)Landroid/content/Context;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    return-object p0
.end method

.method static synthetic access$100(Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->updateUploadTimeStamp()V

    return-void
.end method

.method static synthetic access$200()Ljava/lang/Object;
    .locals 1

    sget-object v0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mObject:Ljava/lang/Object;

    return-object v0
.end method

.method private canUploadCrash()Z
    .locals 9

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mSharedPreference:Landroid/content/SharedPreferences;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->isUsingMobileDataConnection(Landroid/content/Context;)Z

    move-result v0

    const-wide/16 v1, 0x0

    const-wide/16 v3, 0x3e8

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v7, Lcom/xiaomi/xmpush/thrift/ConfigKey;->Crash4GUploadSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v7}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v7

    invoke-virtual {v0, v7, v6}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    if-nez v0, :cond_0

    return v5

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v7, Lcom/xiaomi/xmpush/thrift/ConfigKey;->Crash4GUploadFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v7}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v7

    const/16 v8, 0xe10

    invoke-virtual {v0, v7, v8}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v0

    invoke-static {v8, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    div-long/2addr v7, v3

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mSharedPreference:Landroid/content/SharedPreferences;

    const-string v4, "last_crash_upload_time_stamp"

    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    sub-long/2addr v7, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    long-to-float v1, v1

    int-to-float v0, v0

    const v2, 0x3f666666    # 0.9f

    mul-float v0, v0, v2

    cmpl-float v0, v1, v0

    if-ltz v0, :cond_1

    const/4 v5, 0x1

    :cond_1
    return v5

    :cond_2
    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->isWIFIConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v7, Lcom/xiaomi/xmpush/thrift/ConfigKey;->CrashWIFIUploadFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v7}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v7

    const/16 v8, 0x708

    invoke-virtual {v0, v7, v8}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v0

    const/16 v7, 0x3c

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    div-long/2addr v7, v3

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mSharedPreference:Landroid/content/SharedPreferences;

    const-string v4, "last_crash_upload_time_stamp"

    invoke-interface {v3, v4, v1, v2}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v1

    sub-long/2addr v7, v1

    invoke-static {v7, v8}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    int-to-long v3, v0

    cmp-long v0, v1, v3

    if-ltz v0, :cond_3

    const/4 v5, 0x1

    :cond_3
    return v5

    :cond_4
    return v6
.end method

.method private filterCrashByPkgName(ZLjava/lang/String;)Z
    .locals 4

    sget-object v0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->crashFilterByPkgName:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    invoke-virtual {p2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return p1
.end method

.method private getCrashContent(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p1, "\r\n"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 p1, 0x0

    const/4 v2, 0x0

    :goto_0
    array-length v3, v0

    if-ge p1, v3, :cond_0

    aget-object v3, v0, p1

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, v3}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->filterCrashByPkgName(ZLjava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\r\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_1

    :cond_1
    const-string p1, ""

    :goto_1
    return-object p1
.end method

.method private getCrashSummary(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 4

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    array-length v3, p1

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    if-ge v1, v2, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    aget-object v3, p1, v1

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\r\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, ""

    return-object p1

    :cond_1
    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/string/XMStringUtils;->getMd5Digest(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private handleCrash(Ljava/lang/Throwable;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->getCrashContent(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->getCrashSummary(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    return-void

    :cond_1
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/CrashStorage;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/CrashStorage;

    move-result-object v1

    invoke-virtual {v1, v0, p1}, Lcom/xiaomi/mipush/sdk/CrashStorage;->writeCrash2File(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->canUploadCrash()Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->uploadCrash()V

    :cond_2
    return-void
.end method

.method private updateUploadTimeStamp()V
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mSharedPreference:Landroid/content/SharedPreferences;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mSharedPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_crash_upload_time_stamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/android/SharedPrefsCompat;->apply(Landroid/content/SharedPreferences$Editor;)V

    return-void
.end method

.method private uploadCrash()V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler$1;

    invoke-direct {v1, p0}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler$1;-><init>(Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;)V

    invoke-virtual {v0, v1}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager;->addOneShootJob(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 4

    invoke-direct {p0, p2}, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->handleCrash(Ljava/lang/Throwable;)V

    sget-object v0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mObject:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mObject:Ljava/lang/Object;

    const-wide/16 v2, 0xbb8

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_2

    :catch_0
    move-exception v1

    :try_start_1
    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mDefaultCrashHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/MIPushCrashHandler;->mDefaultCrashHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    goto :goto_1

    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    invoke-static {p1}, Landroid/os/Process;->killProcess(I)V

    const/4 p1, 0x1

    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    :goto_1
    return-void

    :goto_2
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
