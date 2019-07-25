.class Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;
.super Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;
.source "PushStatClientManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;


# direct methods
.method constructor <init>(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-direct {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;-><init>()V

    return-void
.end method


# virtual methods
.method public getJobId()I
    .locals 1

    const/16 v0, 0x2746

    return v0
.end method

.method public run()V
    .locals 4

    const-string v0, "exec== DbSizeControlJob"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    new-instance v0, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$300(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/ref/WeakReference;

    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, v2}, Lcom/xiaomi/mipush/sdk/stat/db/DbSizeControlJob;-><init>(Ljava/lang/String;Ljava/lang/ref/WeakReference;)V

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->getInstance(Landroid/content/Context;)Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/xiaomi/mipush/sdk/stat/db/base/DbManager;->execR(Ljava/lang/Runnable;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$2;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    const-string v1, "check_time"

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$200(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;Ljava/lang/String;)V

    return-void
.end method
