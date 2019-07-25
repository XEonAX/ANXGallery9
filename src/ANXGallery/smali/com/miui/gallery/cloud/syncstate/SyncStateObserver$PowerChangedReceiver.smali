.class Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SyncStateObserver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PowerChangedReceiver"
.end annotation


# instance fields
.field private mIsBatteryLow:Z

.field final synthetic this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;->this$0:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 2

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    const/4 p2, 0x1

    xor-int/2addr p1, p2

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    if-eq p1, v0, :cond_1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver$PowerChangedReceiver;->mIsBatteryLow:Z

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-static {p2}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setPowerCanSync(Z)V

    const-string p2, "SyncStateObserver"

    const-string v0, "battery status changed: %s"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {p2, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setIsBatteryLow(Z)V

    :cond_2
    return-void
.end method
