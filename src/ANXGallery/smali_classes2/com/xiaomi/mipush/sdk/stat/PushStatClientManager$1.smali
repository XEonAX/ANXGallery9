.class Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;
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

    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-direct {p0}, Lcom/xiaomi/channel/commonutils/misc/ScheduledJobManager$Job;-><init>()V

    return-void
.end method


# virtual methods
.method public getJobId()I
    .locals 1

    const/16 v0, 0x2744

    return v0
.end method

.method public run()V
    .locals 2

    const-string v0, "exec== mUploadJob"

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->v(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$000(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v0}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$000(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$100(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;)Landroid/content/Context;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/xiaomi/mipush/sdk/stat/upload/IScheduleWorker;->onUpload(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager$1;->this$0:Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;

    const-string v1, "upload_time"

    invoke-static {v0, v1}, Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;->access$200(Lcom/xiaomi/mipush/sdk/stat/PushStatClientManager;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
