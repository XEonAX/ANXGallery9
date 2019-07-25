.class Lcom/xiaomi/mipush/sdk/PushServiceClient$1;
.super Landroid/os/Handler;
.source "PushServiceClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/PushServiceClient;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/PushServiceClient;Landroid/os/Looper;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 7

    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x13

    if-eq v0, v1, :cond_0

    goto/16 :goto_2

    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget p1, p1, Landroid/os/Message;->arg1:I

    const-class v1, Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->isMessageOperating(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getRetryCount(Ljava/lang/String;)I

    move-result v2

    const/16 v3, 0xa

    if-ge v2, v3, :cond_7

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v2, p1, :cond_1

    const-string v2, "syncing"

    iget-object v5, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v5}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v5

    sget-object v6, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v5, v6}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->DISABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-static {p1, v0, v2, v4, v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    goto/16 :goto_0

    :cond_1
    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    if-ne v2, p1, :cond_2

    const-string v2, "syncing"

    iget-object v5, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v5}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v5

    sget-object v6, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v5, v6}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->ENABLE_PUSH:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-static {p1, v0, v2, v4, v3}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    goto/16 :goto_0

    :cond_2
    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    if-ne v2, p1, :cond_3

    const-string v2, "syncing"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v4, v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_HUAWEI_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_HUAWEI:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v4, v5}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->getAssemblePushExtra(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {p1, v0, v2, v3, v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    goto/16 :goto_0

    :cond_3
    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    if-ne v2, p1, :cond_4

    const-string v2, "syncing"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v4, v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FCM_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FCM:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v4, v5}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->getAssemblePushExtra(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {p1, v0, v2, v3, v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    goto :goto_0

    :cond_4
    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    if-ne v2, p1, :cond_5

    const-string v2, "syncing"

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v4, v5}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_COS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_COS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v4, v5}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->getAssemblePushExtra(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {p1, v0, v2, v3, v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    goto :goto_0

    :cond_5
    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2}, Lcom/xiaomi/mipush/sdk/RetryType;->ordinal()I

    move-result v2

    if-ne v2, p1, :cond_6

    const-string p1, "syncing"

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object v2

    sget-object v4, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    invoke-virtual {v2, v4}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getSyncStatus(Lcom/xiaomi/mipush/sdk/RetryType;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_6

    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    sget-object v2, Lcom/xiaomi/mipush/sdk/RetryType;->UPLOAD_FTOS_TOKEN:Lcom/xiaomi/mipush/sdk/RetryType;

    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/xiaomi/mipush/sdk/AssemblePush;->ASSEMBLE_PUSH_FTOS:Lcom/xiaomi/mipush/sdk/AssemblePush;

    invoke-static {v4, v5}, Lcom/xiaomi/mipush/sdk/AssemblePushHelper;->getAssemblePushExtra(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/AssemblePush;)Ljava/util/HashMap;

    move-result-object v4

    invoke-static {p1, v0, v2, v3, v4}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$100(Lcom/xiaomi/mipush/sdk/PushServiceClient;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/RetryType;ZLjava/util/HashMap;)V

    :cond_6
    :goto_0
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->increaseRetryCount(Ljava/lang/String;)V

    goto :goto_1

    :cond_7
    iget-object p1, p0, Lcom/xiaomi/mipush/sdk/PushServiceClient$1;->this$0:Lcom/xiaomi/mipush/sdk/PushServiceClient;

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/PushServiceClient;->access$000(Lcom/xiaomi/mipush/sdk/PushServiceClient;)Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/OperatePushHelper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/xiaomi/mipush/sdk/OperatePushHelper;->removeOperateMessage(Ljava/lang/String;)V

    :cond_8
    :goto_1
    monitor-exit v1

    :goto_2
    return-void

    :catchall_0
    move-exception p1

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
