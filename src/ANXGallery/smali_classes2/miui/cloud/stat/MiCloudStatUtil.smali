.class public Lmiui/cloud/stat/MiCloudStatUtil;
.super Ljava/lang/Object;
.source "MiCloudStatUtil.java"


# direct methods
.method public static performSyncErrorStat(Landroid/content/Context;JLandroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncTimeConsumeStat(Landroid/content/Context;JZ)V

    invoke-static {p0, p3}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncResultStat(Landroid/content/Context;Landroid/os/Bundle;)V

    invoke-static {p0, p3}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncPhoneStateStat(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method public static performSyncPhoneStateStat(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 3

    const-string v0, "MiCloudStatUtil"

    const-string v1, "performSyncPhoneState: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lmiui/cloud/util/SyncStateChangedHelper;->SYNC_SETTINGS_PROVIDER_INSTALLED:Lcom/miui/app/ProviderInstalled;

    invoke-virtual {v0, p0}, Lcom/miui/app/ProviderInstalled;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "MiCloudStatUtil"

    const-string p1, "provider not available, skip"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "micloud_force"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "stat_key_sync_start"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    const-string v2, "micloud_force"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "stat_key_sync_start"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    sget-object p1, Lmiui/cloud/util/SyncStateChangedHelper;->OPEN_SYNC_PHONE_STATE:Landroid/net/Uri;

    invoke-static {p0, p1, v0}, Lcom/miui/utils/SafeContentResolver;->insert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void
.end method

.method private static performSyncResultStat(Landroid/content/Context;Landroid/os/Bundle;)V
    .locals 9

    const-string v0, "MiCloudStatUtil"

    const-string v1, "performSyncResultStat: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lmiui/cloud/util/SyncStateChangedHelper;->SYNC_SETTINGS_PROVIDER_INSTALLED:Lcom/miui/app/ProviderInstalled;

    invoke-virtual {v0, p0}, Lcom/miui/app/ProviderInstalled;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "MiCloudStatUtil"

    const-string p1, "provider not available, skip"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const-string v0, "micloud_ignore_temperature"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    const-string v1, "micloud_ignore_wifi_settings"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "micloud_ignore_battery_low"

    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "micloud_force"

    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v3

    const-string v4, "stat_key_sync_retry"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    const-string v5, "stat_key_sync_reason"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "stat_key_sync_authority"

    invoke-virtual {p1, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v7, "stat_key_sync_successful"

    invoke-virtual {p1, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result p1

    new-instance v7, Landroid/content/ContentValues;

    invoke-direct {v7}, Landroid/content/ContentValues;-><init>()V

    const-string v8, "micloud_ignore_temperature"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v7, v8, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v0, "micloud_ignore_wifi_settings"

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v0, "micloud_ignore_battery_low"

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v0, "micloud_force"

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v0, "stat_key_sync_retry"

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v7, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v0, "stat_key_sync_reason"

    invoke-virtual {v7, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "stat_key_sync_successful"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    invoke-virtual {v7, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string p1, "stat_key_sync_authority"

    invoke-virtual {v7, p1, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p1, Lmiui/cloud/util/SyncStateChangedHelper;->OPEN_SYNC_RESULT_URI:Landroid/net/Uri;

    invoke-static {p0, p1, v7}, Lcom/miui/utils/SafeContentResolver;->insert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void
.end method

.method public static performSyncSuccessStat(Landroid/content/Context;Ljava/lang/String;JLandroid/os/Bundle;)V
    .locals 0

    invoke-static {p4, p1}, Lmiui/cloud/stat/MiCloudStatUtil;->wrapSuccessBundle(Landroid/os/Bundle;Ljava/lang/String;)V

    const/4 p1, 0x1

    invoke-static {p0, p2, p3, p1}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncTimeConsumeStat(Landroid/content/Context;JZ)V

    invoke-static {p0, p4}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncResultStat(Landroid/content/Context;Landroid/os/Bundle;)V

    invoke-static {p0, p4}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncPhoneStateStat(Landroid/content/Context;Landroid/os/Bundle;)V

    return-void
.end method

.method private static performSyncTimeConsumeStat(Landroid/content/Context;JZ)V
    .locals 2

    const-string v0, "MiCloudStatUtil"

    const-string v1, "performSyncTimeConsumeStat: "

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lmiui/cloud/util/SyncStateChangedHelper;->SYNC_SETTINGS_PROVIDER_INSTALLED:Lcom/miui/app/ProviderInstalled;

    invoke-virtual {v0, p0}, Lcom/miui/app/ProviderInstalled;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p0, "MiCloudStatUtil"

    const-string p1, "provider not available, skip"

    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p1

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-string p2, "stat_key_sync_time_consume"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    if-eqz p3, :cond_1

    const-string p2, "stat_key_sync_successful"

    const/4 p3, 0x1

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    goto :goto_0

    :cond_1
    const-string p2, "stat_key_sync_successful"

    const/4 p3, 0x0

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    invoke-virtual {p1, p2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    :goto_0
    sget-object p2, Lmiui/cloud/util/SyncStateChangedHelper;->OPEN_SYNC_TIME_CONSUME:Landroid/net/Uri;

    invoke-static {p0, p2, p1}, Lcom/miui/utils/SafeContentResolver;->insert(Landroid/content/Context;Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    return-void
.end method

.method public static wrapErrorBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2

    const-string v0, "stat_key_sync_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "stat_key_sync_authority"

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "stat_key_sync_successful"

    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "stat_key_sync_reason"

    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "stat_key_sync_retry"

    invoke-virtual {p0, p1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method private static wrapSuccessBundle(Landroid/os/Bundle;Ljava/lang/String;)V
    .locals 2

    const-string v0, "stat_key_sync_start"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v0, "stat_key_sync_authority"

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "stat_key_sync_successful"

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "stat_key_sync_retry"

    invoke-virtual {p0, p1, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "stat_key_sync_reason"

    const-string v0, "no_error"

    invoke-virtual {p0, p1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
