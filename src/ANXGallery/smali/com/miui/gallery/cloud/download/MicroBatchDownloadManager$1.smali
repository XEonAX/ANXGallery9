.class Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;
.super Landroid/content/BroadcastReceiver;
.source "MicroBatchDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method static synthetic lambda$onReceive$39(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;->access$200(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    invoke-static {p1}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;->access$100(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)Ljava/lang/Runnable;

    move-result-object p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    new-instance v0, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$1$m1Q8LdN-VFO937LcGIXO36xcHys;

    invoke-direct {v0, p2}, Lcom/miui/gallery/cloud/download/-$$Lambda$MicroBatchDownloadManager$1$m1Q8LdN-VFO937LcGIXO36xcHys;-><init>(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)V

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;->access$102(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager$1;->this$0:Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;

    invoke-static {p2}, Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;->access$100(Lcom/miui/gallery/cloud/download/MicroBatchDownloadManager;)Ljava/lang/Runnable;

    move-result-object p2

    const-wide/32 v0, 0xea60

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
