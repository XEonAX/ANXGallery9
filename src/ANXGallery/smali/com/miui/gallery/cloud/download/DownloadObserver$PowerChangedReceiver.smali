.class Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "DownloadObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/download/DownloadObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PowerChangedReceiver"
.end annotation


# instance fields
.field private mIsBatteryLow:Z

.field final synthetic this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/download/DownloadObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p2

    const/4 v1, 0x1

    xor-int/2addr p2, v1

    iget-boolean v2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    if-eq p2, v2, :cond_1

    iput-boolean p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setPowerCanSync(Z)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->access$600(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V

    const-string p1, "DownloadObserver"

    const-string v0, "battery status changed: %s"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result p2

    if-eq v0, p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/cloud/download/DownloadObserver$PowerChangedReceiver;->this$0:Lcom/miui/gallery/cloud/download/DownloadObserver;

    invoke-static {p2, p1}, Lcom/miui/gallery/cloud/download/DownloadObserver;->access$600(Lcom/miui/gallery/cloud/download/DownloadObserver;Landroid/content/Context;)V

    const-string p1, "DownloadObserver"

    const-string p2, "charging state changed: %s"

    xor-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    :goto_1
    return-void
.end method
