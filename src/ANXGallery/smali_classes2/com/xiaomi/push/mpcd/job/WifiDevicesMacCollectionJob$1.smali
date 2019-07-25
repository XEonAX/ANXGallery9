.class Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;
.super Ljava/lang/Object;
.source "WifiDevicesMacCollectionJob.java"

# interfaces
.implements Lcom/xiaomi/metoknlp/devicediscover/DataListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;


# direct methods
.method constructor <init>(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;)V
    .locals 0

    iput-object p1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;->this$0:Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDataCollect(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;->this$0:Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;

    invoke-static {p1}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->access$100(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->access$002(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;Ljava/lang/String;)Ljava/lang/String;

    iget-object p1, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;->this$0:Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;

    invoke-static {p1}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->access$200(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;)Ljava/lang/Object;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    iget-object v0, p0, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob$1;->this$0:Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;

    invoke-static {v0}, Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;->access$200(Lcom/xiaomi/push/mpcd/job/WifiDevicesMacCollectionJob;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_1
    invoke-static {v0}, Lcom/xiaomi/channel/commonutils/logger/MyLog;->e(Ljava/lang/Throwable;)V

    :goto_0
    monitor-exit p1

    return-void

    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method
