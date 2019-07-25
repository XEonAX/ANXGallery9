.class Lcom/xiaomi/mipush/sdk/PushServiceClient$2;
.super Landroid/database/ContentObserver;
.source "PushServiceClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/PushServiceClient;->isProvisioned()Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/PushServiceClient;Landroid/os/Handler;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-direct {p0, p2}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    return-void
.end method


# virtual methods
.method public onChange(Z)V
    .locals 1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/PushProvision;->getInstance(Landroid/content/Context;)Lcom/xiaomi/push/service/PushProvision;

    move-result-object v0

    invoke-virtual {v0}, Lcom/xiaomi/push/service/PushProvision;->getProvisioned()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$202(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/Integer;)Ljava/lang/Integer;

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$200(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/channel/commonutils/network/Network;->hasNetwork(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$2;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-virtual {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->processRegisterTask()V

    :cond_0
    return-void
.end method
