.class public Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;
.super Lcom/xiaomi/push/mpcd/job/CollectionJob;
.source "WifiDevicesMacCollectionJob.java"


# instance fields
.field private mDevicesMac:Ljava/lang/String;

.field private mMacDataListener:Lcom/xiaomi/metoknlp/devicediscover/DataListener;

.field private mSharedPreference:Landroid/content/SharedPreferences;

.field private final object:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/xiaomi/push/mpcd/job/CollectionJob;-><init>(Landroid/content/Context;I)V

    new-instance p2, Ljava/lang/Object;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->object:Ljava/lang/Object;

    new-instance p2, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;

    invoke-direct {p2, p0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;-><init>(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;)V

    iput-object p2, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mMacDataListener:Lcom/xiaomi/metoknlp/devicediscover/DataListener;

    invoke-direct {p0, p1}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->initMetokNLP(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$002(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mDevicesMac:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$100(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-static {p0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->getMacsFromJSON(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;)Ljava/lang/Object;
    .locals 0

    iget-object p0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->object:Ljava/lang/Object;

    return-object p0
.end method

.method private static getMacsFromJSON(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "devices"

    invoke-virtual {v0, p0}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object p0

    invoke-virtual {p0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/string/XMStringUtils;->toUpperCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    :cond_0
    const-string p0, ""

    return-object p0
.end method

.method private initMetokNLP(Landroid/content/Context;)V
    .locals 2

    invoke-static {p1}, Lcom/xiaomi/metoknlp/MetokApplication;->create(Landroid/content/Context;)Lcom/xiaomi/metoknlp/MetokApplication;

    move-result-object p1

    invoke-virtual {p1}, Lcom/xiaomi/metoknlp/MetokApplication;->init()V

    invoke-static {}, Lcom/xiaomi/metoknlp/MetokApplication;->get()Lcom/xiaomi/metoknlp/MetokApplication;

    move-result-object p1

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mMacDataListener:Lcom/xiaomi/metoknlp/devicediscover/DataListener;

    const/4 v1, 0x1

    invoke-virtual {p1, v0, v1}, Lcom/xiaomi/metoknlp/MetokApplication;->registerDataListener(Lcom/xiaomi/metoknlp/devicediscover/DataListener;I)V

    return-void
.end method


# virtual methods
.method protected checkPeriodAndRecord()Z
    .locals 8

    invoke-virtual {p0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->isWifiChanged()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->getJobId()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->period:I

    int-to-long v2, v2

    invoke-static {v0, v1, v2, v3}, Lcom/xiaomi/channel/commonutils/misc/JobMutualExclusor;->checkPeriodAndRecordWithFileLock(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigKey;->WifiDevicesMacWifiUnchangedCollectionFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v1

    const/16 v2, 0x1c20

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v0

    const/16 v1, 0xe10

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-object v3, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    const-string v4, "mipush_extra"

    const/4 v5, 0x4

    invoke-virtual {v3, v4, v5}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v3

    iput-object v3, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    iget-object v3, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    const-string v4, "last_mac_upload_timestamp"

    const-wide/16 v5, 0x0

    invoke-interface {v3, v4, v5, v6}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    sub-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->abs(J)J

    move-result-wide v1

    long-to-float v1, v1

    mul-int/lit16 v2, v0, 0x3e8

    int-to-float v2, v2

    const v3, 0x3f666666    # 0.9f

    mul-float v2, v2, v3

    cmpl-float v1, v1, v2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ltz v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    iget-object v4, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->getJobId()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    int-to-long v6, v0

    invoke-static {v4, v5, v6, v7}, Lcom/xiaomi/channel/commonutils/misc/JobMutualExclusor;->checkPeriodAndRecordWithFileLock(Landroid/content/Context;Ljava/lang/String;J)Z

    move-result v0

    if-eqz v1, :cond_2

    if-eqz v0, :cond_2

    const/4 v2, 0x1

    :cond_2
    return v2
.end method

.method public collectInfo()Ljava/lang/String;
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/network/Network;->isWIFIConnected(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/metoknlp/MetokApplication;->get()Lcom/xiaomi/metoknlp/MetokApplication;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/metoknlp/MetokApplication;->fecthDeviceImmediately()V

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->object:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->object:Ljava/lang/Object;

    const-wide/16 v2, 0x2710

    invoke-virtual {v1, v2, v3}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    :catch_0
    move-exception v1

    :try_start_1
    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    const-string v1, "mipush_extra"

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "last_mac_upload_timestamp"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_2

    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :goto_2
    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mDevicesMac:Ljava/lang/String;

    const-string v1, ""

    iput-object v1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mDevicesMac:Ljava/lang/String;

    return-object v0
.end method

.method public getCollectionType()Lcom/xiaomi/xmpush/thrift/ClientCollectionType;
    .locals 1

    sget-object v0, Lcom/xiaomi/xmpush/thrift/ClientCollectionType;->WifiDevicesMac:Lcom/xiaomi/xmpush/thrift/ClientCollectionType;

    return-object v0
.end method

.method public getJobId()I
    .locals 1

    const/16 v0, 0xe

    return v0
.end method

.method public isWifiChanged()Z
    .locals 6

    const/4 v0, 0x1

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    const-string v2, "mipush_extra"

    const/4 v3, 0x4

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    iput-object v1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    const-string v2, "last_wifi_ssid"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->context:Landroid/content/Context;

    const-string v3, "wifi"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/wifi/WifiManager;

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->mSharedPreference:Landroid/content/SharedPreferences;

    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v3

    const-string v4, "last_wifi_ssid"

    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v3}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    xor-int/2addr v0, v1

    return v0

    :catch_0
    :cond_1
    return v0
.end method
