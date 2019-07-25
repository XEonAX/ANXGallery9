.class Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;
.super Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;
.source "DbManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->sendExecCmd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-direct {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;-><init>()V

    return-void
.end method


# virtual methods
.method public getJobId()I
    .locals 1

    const v0, 0x18a5d

    return v0
.end method

.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v0

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->exec(Ljava/util/ArrayList;)V

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    iget-object v2, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;

    invoke-virtual {v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->execNow(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$BaseJob;)V

    :goto_0
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    invoke-static {}, Ljava/lang/System;->gc()V

    :cond_1
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
