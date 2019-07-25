.class public Lcom/xiaomi/mipush/sdk/OcVersionCheckJob;
.super Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;
.source "OcVersionCheckJob.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/OcVersionCheckJob;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getJobId()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/OcVersionCheckJob;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;

    invoke-direct {v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;-><init>()V

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigListType;->MISC_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-static {v0, v2}, Lcom/xiaomi/push/service/OnlineConfigHelper;->getVersion(Lcom/xiaomi/push/service/OnlineConfig;Lcom/xiaomi/xmpush/thrift/ConfigListType;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;->setMiscConfigVersion(I)Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ConfigListType;->PLUGIN_CONFIG:Lcom/xiaomi/xmpush/thrift/ConfigListType;

    invoke-static {v0, v2}, Lcom/xiaomi/push/service/OnlineConfigHelper;->getVersion(Lcom/xiaomi/push/service/OnlineConfig;Lcom/xiaomi/xmpush/thrift/ConfigListType;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;->setPluginConfigVersion(I)Lcom/xiaomi/xmpush/thrift/XmPushActionCheckClientInfo;

    new-instance v0, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    const-string v2, "-1"

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;-><init>(Ljava/lang/String;Z)V

    sget-object v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->DailyCheckClientConfig:Lcom/xiaomi/xmpush/thrift/NotificationType;

    iget-object v2, v2, Lcom/xiaomi/xmpush/thrift/NotificationType;->value:Ljava/lang/String;

    invoke-virtual {v0, v2}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setType(Ljava/lang/String;)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    invoke-static {v1}, Lcom/xiaomi/xmpush/thrift/XmPushThriftSerializeUtils;->convertThriftObjectToBytes(Lorg/apache/thrift/TBase;)[B

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;->setBinaryExtra([B)Lcom/xiaomi/xmpush/thrift/XmPushActionNotification;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/OcVersionCheckJob;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/PushServiceClient;

    move-result-object v1

    sget-object v2, Lcom/xiaomi/xmpush/thrift/ActionType;->Notification:Lcom/xiaomi/xmpush/thrift/ActionType;

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->sendMessage(Lorg/apache/thrift/TBase;Lcom/xiaomi/xmpush/thrift/ActionType;Lcom/xiaomi/xmpush/thrift/PushMetaInfo;)V

    return-void
.end method
