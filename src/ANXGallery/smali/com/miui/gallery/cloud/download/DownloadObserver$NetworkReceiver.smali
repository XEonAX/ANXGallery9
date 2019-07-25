.class Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/download/DownloadObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "NetworkReceiver"
.end annotation


# instance fields
.field private mIsNetConnected:Z

.field private mIsWifiConnected:Z

.field final synthetic this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/download/DownloadObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsNetConnected:Z

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsWifiConnected:Z

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6

    const-string v0, "noConnectivity"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result p2

    const/4 v0, 0x1

    xor-int/2addr p2, v0

    iget-boolean v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsNetConnected:Z

    if-eq v2, p2, :cond_0

    const-string v2, "DownloadObserver"

    const-string v3, "NetworkReceiver mLastConnect: %s, netConnect: %s"

    iget-boolean v4, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsNetConnected:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    invoke-static {v2, v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsNetConnected:Z

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    iget-boolean v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsNetConnected:Z

    if-eqz v2, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v1, 0x1

    :cond_1
    iget-boolean v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsWifiConnected:Z

    if-eq v2, v1, :cond_2

    const-string p2, "DownloadObserver"

    const-string v2, "NetworkReceiver mLastWifiConnect: %s, wifiConnect: %s"

    iget-boolean v3, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsWifiConnected:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-static {p2, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iput-boolean v1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->mIsWifiConnected:Z

    const/4 p2, 0x1

    :cond_2
    if-eqz p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$NetworkReceiver;->this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;

    invoke-static {p2, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->access$600(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V

    :cond_3
    return-void
.end method
