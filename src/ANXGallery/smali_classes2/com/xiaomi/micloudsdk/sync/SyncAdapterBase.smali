.class public abstract Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;
.super Landroid/content/AbstractThreadedSyncAdapter;
.source "SyncAdapterBase.java"


# instance fields
.field protected isForceSync:Z

.field protected isIgnoreBackoff:Z

.field protected isIgnoreBatteryLow:Z

.field protected isIgnoreTemperature:Z

.field protected isIgnoreWifiSettings:Z

.field protected isManualSync:Z

.field protected mAccount:Landroid/accounts/Account;

.field protected final mAuthType:Ljava/lang/String;

.field protected mAuthority:Ljava/lang/String;

.field protected mContext:Landroid/content/Context;

.field protected mExtToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

.field protected mExtTokenStr:Ljava/lang/String;

.field protected mNumbers:[Ljava/lang/String;

.field protected mResolver:Landroid/content/ContentResolver;

.field protected mSyncResult:Landroid/content/SyncResult;

.field protected mTickets:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZLjava/lang/String;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/content/AbstractThreadedSyncAdapter;-><init>(Landroid/content/Context;Z)V

    const/4 p2, 0x2

    new-array v0, p2, [Ljava/lang/String;

    iput-object v0, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mTickets:[Ljava/lang/String;

    new-array p2, p2, [Ljava/lang/String;

    iput-object p2, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mNumbers:[Ljava/lang/String;

    iput-object p1, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iput-object p1, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mResolver:Landroid/content/ContentResolver;

    iput-object p3, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    return-void
.end method

.method private static setMiSyncResultMessage(Landroid/content/SyncResult;Ljava/lang/String;)V
    .locals 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "miSyncResult"

    invoke-static {v0, v1}, Lcom/xiaomi/micloudsdk/utils/ReflectUtils;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-virtual {v0, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "resultMessage"

    invoke-static {v0, v1}, Lcom/xiaomi/micloudsdk/utils/ReflectUtils;->getField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "Please file a bug to CloudService!!"

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method protected static setPermissionError(Landroid/content/SyncResult;)V
    .locals 1

    const-string v0, "permission_error"

    invoke-static {p0, v0}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setMiSyncResultMessage(Landroid/content/SyncResult;Ljava/lang/String;)V

    return-void
.end method

.method protected static setRequestError(Landroid/content/SyncResult;)V
    .locals 1

    const-string v0, "request_error"

    invoke-static {p0, v0}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setMiSyncResultMessage(Landroid/content/SyncResult;Ljava/lang/String;)V

    return-void
.end method

.method protected static setSimActivatedError(Landroid/content/SyncResult;)V
    .locals 1

    const-string v0, "sim_activated_error"

    invoke-static {p0, v0}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setMiSyncResultMessage(Landroid/content/SyncResult;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method getExtTokenStr(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;
    .locals 8

    const/4 v0, 0x0

    :try_start_0
    const-string v1, "MiCloudSyncAdapterBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onPerformSync: getting auth token. authority: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v1, p3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v2

    iget-object v4, p0, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, p2

    invoke-virtual/range {v2 .. v7}, Landroid/accounts/AccountManager;->getAuthToken(Landroid/accounts/Account;Ljava/lang/String;ZLandroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    move-result-object p1

    if-nez p1, :cond_0

    const-string p1, "MiCloudSyncAdapterBase"

    const-string p2, "onPerformSync: Null future."

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_0
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object p2

    if-nez p2, :cond_1

    const-string p1, "MiCloudSyncAdapterBase"

    const-string p2, "onPerformSync: Null future result."

    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0

    :cond_1
    invoke-interface {p1}, Landroid/accounts/AccountManagerFuture;->getResult()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    const-string p2, "authtoken"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Landroid/accounts/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/accounts/AuthenticatorException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string p2, "MiCloudSyncAdapterBase"

    const-string p3, "onPerformSync"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_1
    move-exception p1

    const-string p2, "MiCloudSyncAdapterBase"

    const-string p3, "onPerformSync"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0

    :catch_2
    move-exception p1

    const-string p2, "MiCloudSyncAdapterBase"

    const-string p3, "onPerformSync"

    invoke-static {p2, p3, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-object v0
.end method

.method protected abstract onPerformMiCloudSync(Landroid/os/Bundle;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/micloudsdk/exception/CloudServerException;
        }
    .end annotation
.end method

.method public onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Ljava/lang/String;Landroid/content/ContentProviderClient;Landroid/content/SyncResult;)V
    .locals 13

    move-object v1, p0

    move-object v3, p1

    move-object v10, p2

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/provider/GdprUtils;->isPermissionGranted(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, v5, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v2, v0, Landroid/content/SyncStats;->numAuthExceptions:J

    const-wide/16 v5, 0x1

    add-long/2addr v2, v5

    iput-wide v2, v0, Landroid/content/SyncStats;->numAuthExceptions:J

    const-string v0, "MiCloudSyncAdapterBase"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Gdpr Permission deny: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    iput-object v3, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAccount:Landroid/accounts/Account;

    iput-object v4, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthority:Ljava/lang/String;

    iput-object v5, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mSyncResult:Landroid/content/SyncResult;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v11

    const-string v0, "stat_key_sync_start"

    const/4 v2, 0x1

    invoke-virtual {p2, v0, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, p2}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncPhoneStateStat(Landroid/content/Context;Landroid/os/Bundle;)V

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v6, "onPerformSync: ---sync start---"

    invoke-static {v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "MiCloudSyncAdapterBase"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "authority: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, ", "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "extras: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: master sync automatically is off. do not sync!!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_1
    invoke-static {p1, v4}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: sync automatically is off. do not sync!!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_2
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v6, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAccount:Landroid/accounts/Account;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthority:Ljava/lang/String;

    invoke-static {v0, v6, v7}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->isSyncPausing(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: sync is set to pause. do not sync!!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_3
    const-string v0, "micloud_ignore_temperature"

    const/4 v6, 0x0

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreTemperature:Z

    const-string v0, "micloud_ignore_wifi_settings"

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreWifiSettings:Z

    const-string v0, "micloud_ignore_battery_low"

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreBatteryLow:Z

    const-string v0, "micloud_force"

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isForceSync:Z

    const-string v0, "force"

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isManualSync:Z

    const-string v0, "ignore_backoff"

    invoke-virtual {p2, v0, v6}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    iput-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreBackoff:Z

    iget-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isForceSync:Z

    const/16 v6, -0x2711

    if-nez v0, :cond_4

    iget-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isManualSync:Z

    if-nez v0, :cond_4

    iget-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreBackoff:Z

    if-nez v0, :cond_4

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->isSyncTimeAvailable(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: sync time is not available. do not sync!!"

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    const/16 v2, 0x65

    invoke-direct {v0, v6, v2}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(II)V

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void

    :cond_4
    iget-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isManualSync:Z

    if-nez v0, :cond_5

    iget-boolean v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->isIgnoreBackoff:Z

    if-eqz v0, :cond_6

    :cond_5
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->resetBackoffStatus(Landroid/content/Context;Ljava/lang/String;)V

    :cond_6
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAccount:Landroid/accounts/Account;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthority:Ljava/lang/String;

    invoke-virtual {p0, v0, v7, v8}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->getExtTokenStr(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    const/16 v7, 0x64

    if-nez v0, :cond_7

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: No ext token string."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, v6, v7}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(II)V

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void

    :cond_7
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;->parse(Ljava/lang/String;)Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    move-result-object v0

    iput-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    invoke-virtual {p0, v0}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->onTransformExtAuthToken(Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;)V

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtToken:Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;

    if-nez v0, :cond_8

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: Cannot parse ext token."

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, v6, v7}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(II)V

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void

    :cond_8
    :try_start_0
    invoke-virtual {p0, p2}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->onPerformMiCloudSync(Landroid/os/Bundle;)V
    :try_end_0
    .catch Lcom/xiaomi/micloudsdk/exception/CloudServerException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mSyncResult:Landroid/content/SyncResult;

    invoke-virtual {v0}, Landroid/content/SyncResult;->hasError()Z

    move-result v0

    if-eqz v0, :cond_b

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v7, "onPerformSync: hasError"

    invoke-static {v0, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mSyncResult:Landroid/content/SyncResult;

    invoke-virtual {v0}, Landroid/content/SyncResult;->hasSoftError()Z

    move-result v0

    if-eqz v0, :cond_9

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v7, "onPerformSync: softError"

    invoke-static {v0, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    invoke-direct {v0, v6, v2}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(II)V

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    goto :goto_0

    :cond_9
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mSyncResult:Landroid/content/SyncResult;

    invoke-virtual {v0}, Landroid/content/SyncResult;->hasHardError()Z

    move-result v0

    if-eqz v0, :cond_a

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: hardError"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/xiaomi/micloudsdk/exception/CloudServerException;

    const/4 v2, 0x2

    invoke-direct {v0, v6, v2}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;-><init>(II)V

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v6, v0

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    :cond_a
    :goto_0
    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v11, v12, p2}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncErrorStat(Landroid/content/Context;JLandroid/os/Bundle;)V

    goto :goto_1

    :cond_b
    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync: NoError"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->resetBackoffStatus(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncRecordUtils;->recordSyncResultSuccess(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v4, v11, v12, p2}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncSuccessStat(Landroid/content/Context;Ljava/lang/String;JLandroid/os/Bundle;)V

    :goto_1
    return-void

    :catch_0
    move-exception v0

    move-object v6, v0

    const-string v0, "MiCloudSyncAdapterBase"

    const-string v2, "onPerformSync"

    invoke-static {v0, v2, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    iget-object v2, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    iget-object v7, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mAuthType:Ljava/lang/String;

    iget-object v8, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mExtTokenStr:Ljava/lang/String;

    move-object v3, p1

    move-object/from16 v4, p3

    move-object/from16 v5, p5

    move-object v9, p2

    invoke-static/range {v2 .. v9}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    iget-object v0, v1, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0, v11, v12, p2}, Lmiui/cloud/stat/MiCloudStatUtil;->performSyncErrorStat(Landroid/content/Context;JLandroid/os/Bundle;)V

    return-void
.end method

.method protected onTransformExtAuthToken(Lcom/xiaomi/micloudsdk/data/ExtendedAuthToken;)V
    .locals 0

    return-void
.end method
