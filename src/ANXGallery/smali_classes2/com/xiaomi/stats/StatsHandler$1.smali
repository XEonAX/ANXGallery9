.class Lcom/xiaomi/stats/StatsHandler$1;
.super Lcom/xiaomi/push/service/ServiceConfig$Listener;
.source "StatsHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/stats/StatsHandler;->init(Lcom/xiaomi/push/service/XMPushService;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/stats/StatsHandler;


# direct methods
.method constructor <init>(Lcom/xiaomi/stats/StatsHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/stats/StatsHandler$1;->this$0:Lcom/xiaomi/stats/StatsHandler;

    invoke-direct {p0}, Lcom/xiaomi/push/service/ServiceConfig$Listener;-><init>()V

    return-void
.end method


# virtual methods
.method public onConfigMsgReceive(Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;)V
    .locals 1

    invoke-virtual {p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->hasDots()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/xiaomi/stats/StatsHandler;->getInstance()Lcom/xiaomi/stats/StatsHandler;

    move-result-object v0

    invoke-virtual {p1}, Lcom/xiaomi/push/protobuf/ChannelMessage$PushServiceConfigMsg;->getDots()I

    move-result p1

    invoke-virtual {v0, p1}, Lcom/xiaomi/stats/StatsHandler;->setDuration(I)V

    :cond_0
    return-void
.end method
