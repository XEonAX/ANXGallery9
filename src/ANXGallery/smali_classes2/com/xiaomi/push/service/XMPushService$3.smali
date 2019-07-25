.class Lcom/xiaomi/push/service/XMPushService$3;
.super Lcom/xiaomi/smack/ConnectionConfiguration;
.source "XMPushService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/push/service/XMPushService;->onCreate()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/service/XMPushService;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/service/XMPushService;Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/service/XMPushService$3;->this$0:Lcom/xiaomi/push/service/XMPushService;

    invoke-direct {p0, p2, p3, p4, p5}, Lcom/xiaomi/smack/ConnectionConfiguration;-><init>(Ljava/util/Map;ILjava/lang/String;Lcom/xiaomi/smack/HttpRequestProxy;)V

    return-void
.end method


# virtual methods
.method public getConnectionBlob()[B
    .locals 3

    :try_start_0
    new-instance v0, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    invoke-direct {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;-><init>()V

    invoke-static {}, Lcom/xiaomi/push/service/ServiceConfig;->getInstance()Lcom/xiaomi/push/service/ServiceConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/xiaomi/push/service/ServiceConfig;->getConfigVersion()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->setClientVersion(I)Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;

    invoke-virtual {v0}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->toByteArray()[B

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getOBBString err: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->w(Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method
