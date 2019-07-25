.class Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;
.super Ljava/lang/Thread;
.source "SerializedAsyncTaskProcessor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProcessPackageThread"
.end annotation


# instance fields
.field private final mTasks:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue<",
            "Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;


# direct methods
.method public constructor <init>(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    const-string p1, "PackageProcessor"

    invoke-direct {p0, p1}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    new-instance p1, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {p1}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object p1, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->mTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    return-void
.end method

.method private notifyUI(ILcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;)V
    .locals 2

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$100(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v1}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$100(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method


# virtual methods
.method public insertTask(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;)V
    .locals 1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->mTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method public run()V
    .locals 4

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$200(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$200(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)I

    move-result v0

    int-to-long v0, v0

    goto :goto_0

    :cond_0
    const-wide v0, 0x7fffffffffffffffL

    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$300(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)Z

    move-result v2

    if-nez v2, :cond_3

    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->mTasks:Ljava/util/concurrent/LinkedBlockingQueue;

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v0, v1, v3}, Ljava/util/concurrent/LinkedBlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;

    iget-object v3, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v3, v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$402(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;)Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;

    if-eqz v2, :cond_2

    const/4 v3, 0x0

    invoke-direct {p0, v3, v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->notifyUI(ILcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;)V

    invoke-virtual {v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;->process()V

    const/4 v3, 0x1

    invoke-direct {p0, v3, v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->notifyUI(ILcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$SerializedAsyncTask;)V

    goto :goto_0

    :cond_2
    iget-object v2, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$200(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor$ProcessPackageThread;->this$0:Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;->access$500(Lcom/xiaomi/channel/commonutils/misc/SerializedAsyncTaskProcessor;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v2

    invoke-static {v2}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_3
    return-void
.end method
