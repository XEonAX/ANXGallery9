.class public Lcom/xiaomi/tinyData/TinyDataCacheProcessor;
.super Ljava/lang/Object;
.source "TinyDataCacheProcessor.java"

# interfaces
.implements Lcom/xiaomi/push/service/XMPushService$PingCallBack;


# static fields
.field private static mIsTinyDataExtracting:Z = false


# instance fields
.field private mContext:Landroid/content/Context;

.field private mPeriod:I

.field private mUploadSwitch:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    return-void
.end method

.method private canUpload(Lcom/xiaomi/tinyData/TinyDataUploader;)Z
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    if-nez p1, :cond_1

    return v1

    :cond_1
    iget-object p1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->getAppId(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v1

    :cond_2
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v2, "tiny_data.data"

    invoke-direct {p1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_3

    return v1

    :cond_3
    sget-boolean p1, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mIsTinyDataExtracting:Z

    if-eqz p1, :cond_4

    return v1

    :cond_4
    const/4 p1, 0x1

    return p1
.end method

.method private getAppId(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "1000271"

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    const-string v1, "pref_registered_pkg_names"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1
.end method

.method private readOnlineConfig(Landroid/content/Context;)V
    .locals 3

    invoke-static {p1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigKey;->TinyDataUploadSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mUploadSwitch:Z

    invoke-static {p1}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object p1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ConfigKey;->TinyDataUploadFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v0

    const/16 v1, 0x1c20

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mPeriod:I

    iget p1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mPeriod:I

    const/16 v0, 0x3c

    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mPeriod:I

    return-void
.end method

.method public static setIsTinyDataExtracting(Z)V
    .locals 0

    sput-boolean p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mIsTinyDataExtracting:Z

    return-void
.end method

.method private verifyUploadPeriod()Z
    .locals 6

    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v1, "last_tiny_data_upload_timestamp"

    const-wide/16 v2, -0x1

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    iget v2, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mPeriod:I

    int-to-long v2, v2

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public pingFollowUpAction()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->readOnlineConfig(Landroid/content/Context;)V

    iget-boolean v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mUploadSwitch:Z

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->verifyUploadPeriod()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TinyData TinyDataCacheProcessor.pingFollowUpAction ts:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/tinyData/TinyDataManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/tinyData/TinyDataManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/tinyData/TinyDataManager;->getUploader()Lcom/xiaomi/tinyData/TinyDataUploader;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->canUpload(Lcom/xiaomi/tinyData/TinyDataUploader;)Z

    move-result v1

    if-nez v1, :cond_1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "TinyData TinyDataCacheProcessor.pingFollowUpAction !canUpload(uploader) ts:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    return-void

    :cond_1
    const/4 v1, 0x1

    sput-boolean v1, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mIsTinyDataExtracting:Z

    iget-object v1, p0, Lcom/xiaomi/tinyData/TinyDataCacheProcessor;->mContext:Landroid/content/Context;

    invoke-static {v1, v0}, Lcom/xiaomi/tinyData/TinyDataCacheReader;->addTinyDataCacheReadJob(Landroid/content/Context;Lcom/xiaomi/tinyData/TinyDataUploader;)V

    return-void

    :cond_2
    :goto_0
    return-void
.end method
