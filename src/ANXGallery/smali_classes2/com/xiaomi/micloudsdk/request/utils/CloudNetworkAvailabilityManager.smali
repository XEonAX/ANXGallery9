.class public Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;
.super Ljava/lang/Object;
.source "CloudNetworkAvailabilityManager.java"


# direct methods
.method public static declared-synchronized getAvailability(Landroid/content/Context;)Z
    .locals 3

    const-class v0, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;

    monitor-enter v0

    if-eqz p0, :cond_1

    :try_start_0
    const-string v1, "micloud_network_availability"

    const/4 v2, 0x0

    invoke-static {p0, v1, v2}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->getInt(Landroid/content/Context;Ljava/lang/String;I)I

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p0, :cond_0

    const/4 v2, 0x1

    :cond_0
    monitor-exit v0

    return v2

    :cond_1
    :try_start_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v1, "context cannot be null"

    invoke-direct {p0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static sendNetworkAvailabilityChangedBroadcast(Landroid/content/Context;Z)V
    .locals 3

    const-string v0, "NetworkAvailability"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sendNetworkAvailabilityChangedBroadcast active: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Landroid/content/Intent;

    const-string v1, "miui.intent.action.MICLOUD_NETWORK_AVAILABILITY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "active"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-virtual {p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method

.method public static declared-synchronized setRequestResult(Landroid/content/Context;Z)V
    .locals 4

    const-class v0, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;

    monitor-enter v0

    if-nez p0, :cond_0

    :try_start_0
    const-string p0, "NetworkAvailability"

    const-string p1, "context is null, ignore"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_0
    :try_start_1
    invoke-static {p0}, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;->getAvailability(Landroid/content/Context;)Z

    move-result v1

    if-eq v1, p1, :cond_1

    const-string v2, "micloud_network_availability"

    invoke-static {p0, v2, p1}, Lcom/xiaomi/micloudsdk/provider/MiCloudSettings;->putInt(Landroid/content/Context;Ljava/lang/String;I)Z

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/request/utils/CloudNetworkAvailabilityManager;->sendNetworkAvailabilityChangedBroadcast(Landroid/content/Context;Z)V

    const-string p0, "NetworkAvailability"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "micloud network state changed from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, " to "

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_1
    monitor-exit v0

    return-void

    :goto_0
    monitor-exit v0

    throw p0
.end method
