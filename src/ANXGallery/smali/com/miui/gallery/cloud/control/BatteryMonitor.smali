.class public Lcom/miui/gallery/cloud/control/BatteryMonitor;
.super Ljava/lang/Object;
.source "BatteryMonitor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/control/BatteryMonitor$Holder;
    }
.end annotation


# instance fields
.field private mCount:I

.field private mPowerIntentReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/cloud/control/BatteryMonitor$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloud/control/BatteryMonitor$1;-><init>(Lcom/miui/gallery/cloud/control/BatteryMonitor;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mPowerIntentReceiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor$Holder;->access$000()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object v0

    return-object v0
.end method

.method public static isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z
    .locals 6

    const-string v0, "status"

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eq v0, v3, :cond_1

    const/4 v3, 0x5

    if-ne v0, v3, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    const-string v3, "BatteryMonitor"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ACTION_BATTERY_CHANGED, plugged:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p0, :cond_3

    if-eqz v0, :cond_2

    invoke-static {v2}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setIsPlugged(Z)V

    const-string p0, "BatteryMonitor"

    const-string v3, "power is connected"

    invoke-static {p0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    invoke-static {v1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setIsPlugged(Z)V

    const-string p0, "BatteryMonitor"

    const-string v3, "power disconnected"

    invoke-static {p0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_2
    if-nez v0, :cond_5

    const-string p0, "level"

    invoke-virtual {p1, p0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p0

    const-string v0, "scale"

    const/16 v3, 0x64

    invoke-virtual {p1, v0, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    mul-int/lit8 p0, p0, 0x64

    div-int/2addr p0, p1

    const-string p1, "BatteryMonitor"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ACTION_BATTERY_CHANGED, power remaining:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/16 p1, 0x14

    if-le p0, p1, :cond_4

    const/4 v1, 0x1

    :cond_4
    return v1

    :cond_5
    return v2
.end method


# virtual methods
.method public declared-synchronized end()V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I

    iget v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mPowerIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ReceiverUtils;->safeUnregisterReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized start()V
    .locals 4

    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mPowerIntentReceiver:Landroid/content/BroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_0
    iget v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/cloud/control/BatteryMonitor;->mCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
