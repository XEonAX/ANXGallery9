.class public Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;
.super Ljava/lang/Object;
.source "PushClientReportHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;
    }
.end annotation


# static fields
.field private static mUploader:Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;

.field private static notificationTypeMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/xiaomi/xmpush/thrift/NotificationType;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public static changeOrdinalToCode(Ljava/lang/Enum;)I
    .locals 1

    if-eqz p0, :cond_2

    instance-of v0, p0, Lcom/xiaomi/xmpush/thrift/ActionType;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    add-int/lit16 p0, p0, 0x3e9

    goto :goto_0

    :cond_0
    instance-of v0, p0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    add-int/lit16 p0, p0, 0x7d1

    goto :goto_0

    :cond_1
    instance-of v0, p0, Lcom/xiaomi/push/service/xmpush/Command;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    add-int/lit16 p0, p0, 0xbb9

    goto :goto_0

    :cond_2
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static changeValueToCode(I)I
    .locals 0

    if-lez p0, :cond_0

    add-int/lit16 p0, p0, 0x3e8

    goto :goto_0

    :cond_0
    const/4 p0, -0x1

    :goto_0
    return p0
.end method

.method public static changeValueToNotificationType(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/NotificationType;
    .locals 7

    sget-object v0, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->notificationTypeMap:Ljava/util/Map;

    if-nez v0, :cond_1

    const-class v0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->notificationTypeMap:Ljava/util/Map;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->notificationTypeMap:Ljava/util/Map;

    invoke-static {}, Lcom/xiaomi/xmpush/thrift/NotificationType;->values()[Lcom/xiaomi/xmpush/thrift/NotificationType;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v4, v1, v3

    sget-object v5, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->notificationTypeMap:Ljava/util/Map;

    iget-object v6, v4, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    invoke-virtual {v6}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    monitor-exit v0

    goto :goto_1

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_1
    sget-object v0, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->notificationTypeMap:Ljava/util/Map;

    invoke-virtual {p0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/xiaomi/xmpush/thrift/NotificationType;

    if-eqz p0, :cond_2

    goto :goto_2

    :cond_2
    sget-object p0, Lcom/xiaomi/xmpush/thrift/NotificationType;->Invalid:Lcom/xiaomi/xmpush/thrift/NotificationType;

    :goto_2
    return-object p0
.end method

.method public static checkConfigChange(Landroid/content/Context;)V
    .locals 1

    invoke-static {p0}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->getConfig(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/xiaomi/clientreport/manager/ClientReportClient;->updateConfig(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;)V

    return-void
.end method

.method public static getConfig(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;
    .locals 6

    invoke-static {p0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigKey;->PerfUploadSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    invoke-static {p0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v1

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigKey;->EventUploadSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v3

    invoke-virtual {v1, v3, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v1

    invoke-static {p0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v2

    sget-object v3, Lcom/xiaomi/xmpush/thrift/ConfigKey;->PerfUploadFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v3}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v3

    const v4, 0x15180

    invoke-virtual {v2, v3, v4}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v2

    invoke-static {p0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v3

    sget-object v5, Lcom/xiaomi/xmpush/thrift/ConfigKey;->EventUploadFrequency:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v5}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v5

    invoke-virtual {v3, v5, v4}, Lcom/xiaomi/push/service/OnlineConfig;->getIntValue(II)I

    move-result v3

    invoke-static {}, Lcom/xiaomi/clientreport/data/Config;->getBuilder()Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v1

    int-to-long v3, v3

    invoke-virtual {v1, v3, v4}, Lcom/xiaomi/clientreport/data/Config$Builder;->setEventUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadSwitchOpen(Z)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v0

    int-to-long v1, v2

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/clientreport/data/Config$Builder;->setPerfUploadFrequency(J)Lcom/xiaomi/clientreport/data/Config$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/xiaomi/clientreport/data/Config$Builder;->build(Landroid/content/Context;)Lcom/xiaomi/clientreport/data/Config;

    move-result-object p0

    return-object p0
.end method

.method public static getInterfaceIdByType(I)Ljava/lang/String;
    .locals 1

    const/16 v0, 0x3e8

    if-ne p0, v0, :cond_0

    const-string p0, "E100000"

    return-object p0

    :cond_0
    const/16 v0, 0xbb8

    if-ne p0, v0, :cond_1

    const-string p0, "E100002"

    return-object p0

    :cond_1
    const/16 v0, 0x7d0

    if-ne p0, v0, :cond_2

    const-string p0, "E100001"

    return-object p0

    :cond_2
    const/16 v0, 0x1770

    if-ne p0, v0, :cond_3

    const-string p0, "E100003"

    return-object p0

    :cond_3
    const-string p0, ""

    return-object p0
.end method

.method public static initEventPerfLogic(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;)V
    .locals 2

    new-instance v0, Lcom/xiaomi/push/service/clientReport/MIPushEventDataProcessor;

    invoke-direct {v0, p0}, Lcom/xiaomi/push/service/clientReport/MIPushEventDataProcessor;-><init>(Landroid/content/Context;)V

    new-instance v1, Lcom/xiaomi/push/service/clientReport/MIPushPerfDataProcessor;

    invoke-direct {v1, p0}, Lcom/xiaomi/push/service/clientReport/MIPushPerfDataProcessor;-><init>(Landroid/content/Context;)V

    invoke-static {p0, p1, v0, v1}, Lcom/xiaomi/clientreport/manager/ClientReportClient;->init(Landroid/content/Context;Lcom/xiaomi/clientreport/data/Config;Lcom/xiaomi/clientreport/processor/IEventProcessor;Lcom/xiaomi/clientreport/processor/IPerfProcessor;)V

    return-void
.end method

.method public static isInXmsf(Landroid/content/Context;)Z
    .locals 1

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "com.xiaomi.xmsf"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static newEvent(Ljava/lang/String;)Lcom/xiaomi/clientreport/data/EventClientReport;
    .locals 2

    new-instance v0, Lcom/xiaomi/clientreport/data/EventClientReport;

    invoke-direct {v0}, Lcom/xiaomi/clientreport/data/EventClientReport;-><init>()V

    const/16 v1, 0x3e8

    iput v1, v0, Lcom/xiaomi/clientreport/data/EventClientReport;->production:I

    const/16 v1, 0x3e9

    iput v1, v0, Lcom/xiaomi/clientreport/data/EventClientReport;->reportType:I

    iput-object p0, v0, Lcom/xiaomi/clientreport/data/EventClientReport;->clientInterfaceId:Ljava/lang/String;

    return-object v0
.end method

.method public static newPerf()Lcom/xiaomi/clientreport/data/PerfClientReport;
    .locals 2

    new-instance v0, Lcom/xiaomi/clientreport/data/PerfClientReport;

    invoke-direct {v0}, Lcom/xiaomi/clientreport/data/PerfClientReport;-><init>()V

    const/16 v1, 0x3e8

    iput v1, v0, Lcom/xiaomi/clientreport/data/PerfClientReport;->production:I

    iput v1, v0, Lcom/xiaomi/clientreport/data/PerfClientReport;->reportType:I

    const-string v1, "P100000"

    iput-object v1, v0, Lcom/xiaomi/clientreport/data/PerfClientReport;->clientInterfaceId:Ljava/lang/String;

    return-object v0
.end method

.method public static reportEvent2Object(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;IJLjava/lang/String;)Lcom/xiaomi/clientreport/data/EventClientReport;
    .locals 0

    invoke-static {p1}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->newEvent(Ljava/lang/String;)Lcom/xiaomi/clientreport/data/EventClientReport;

    move-result-object p0

    iput-object p2, p0, Lcom/xiaomi/clientreport/data/EventClientReport;->eventId:Ljava/lang/String;

    iput p3, p0, Lcom/xiaomi/clientreport/data/EventClientReport;->eventType:I

    iput-wide p4, p0, Lcom/xiaomi/clientreport/data/EventClientReport;->eventTime:J

    iput-object p6, p0, Lcom/xiaomi/clientreport/data/EventClientReport;->eventContent:Ljava/lang/String;

    return-object p0
.end method

.method public static reportPerf2Object(Landroid/content/Context;IJJ)Lcom/xiaomi/clientreport/data/PerfClientReport;
    .locals 0

    invoke-static {}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->newPerf()Lcom/xiaomi/clientreport/data/PerfClientReport;

    move-result-object p0

    iput p1, p0, Lcom/xiaomi/clientreport/data/PerfClientReport;->code:I

    iput-wide p2, p0, Lcom/xiaomi/clientreport/data/PerfClientReport;->perfCounts:J

    iput-wide p4, p0, Lcom/xiaomi/clientreport/data/PerfClientReport;->perfLatencies:J

    return-object p0
.end method

.method private static sendByTinyData(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V
    .locals 1

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->isInXmsf(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/xiaomi/push/service/TinyDataStorage;->cacheTinyData(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->mUploader:Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->mUploader:Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;

    invoke-interface {v0, p0, p1}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;->uploader(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public static sendData(Landroid/content/Context;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->wrapperData(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/xiaomi/push/service/TinyDataHelper;->verify(Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "is not valid..."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "send event/perf data item id:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    invoke-static {p0, v0}, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->sendByTinyData(Landroid/content/Context;Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/String;)V

    :cond_2
    return-void
.end method

.method public static setUploader(Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;)V
    .locals 0

    sput-object p0, Lcom/xiaomi/push/service/clientReport/PushClientReportHelper;->mUploader:Lcom/xiaomi/push/service/clientReport/PushClientReportHelper$Uploader;

    return-void
.end method

.method public static wrapperData(Landroid/content/Context;Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;
    .locals 3

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance v0, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-direct {v0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;-><init>()V

    const-string v1, "category_client_report_data"

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCategory(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string v1, "push_sdk_channel"

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setChannel(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setCounter(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setData(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setFromSdk(Z)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setTimestamp(J)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setPkgName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p0, "com.xiaomi.xmsf"

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setSourcePackage(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    invoke-static {}, Lcom/xiaomi/push/service/TinyDataHelper;->nextTinyDataItemId()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setId(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    const-string p0, "quality_support"

    invoke-virtual {v0, p0}, Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;->setName(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/ClientUploadDataItem;

    return-object v0
.end method
