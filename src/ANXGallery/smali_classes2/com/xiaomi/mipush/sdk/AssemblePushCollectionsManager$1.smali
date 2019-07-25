.class Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;
.super Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;
.source "AssemblePushCollectionsManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->setConfiguration(Lcom/xiaomi/mipush/sdk/PushConfiguration;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;ILjava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;->this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-direct {p0, p2, p3}, Lcom/xiaomi/push/service/OnlineConfig$OCUpdateCallback;-><init>(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected onCallback()V
    .locals 3

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;->this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->access$000(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/OnlineConfig;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/OnlineConfig;

    move-result-object v0

    sget-object v1, Lcom/xiaomi/xmpush/thrift/ConfigKey;->AggregatePushSwitch:Lcom/xiaomi/xmpush/thrift/ConfigKey;

    invoke-virtual {v1}, Lcom/xiaomi/xmpush/thrift/ConfigKey;->getValue()I

    move-result v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/xiaomi/push/service/OnlineConfig;->getBooleanValue(IZ)Z

    move-result v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;->this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->access$100(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;->this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-static {v1, v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->access$102(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;Z)Z

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager$1;->this$0:Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;->access$000(Lcom/xiaomi/mipush/sdk/AssemblePushCollectionsManager;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->registerAssemblePush(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
