.class public Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;
.super Ljava/lang/Object;
.source "MiCloudExceptionHandler.java"


# direct methods
.method public static handleException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Lcom/xiaomi/micloudsdk/exception/CloudServerException;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 12

    move-object v7, p0

    move-object v8, p2

    move-object v3, p3

    move-object/from16 v9, p4

    iget v0, v9, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->statusCode:I

    const/16 v1, -0x2711

    const/4 v10, 0x1

    const/4 v11, 0x0

    if-eq v0, v1, :cond_4

    const/16 v1, 0x193

    if-eq v0, v1, :cond_3

    const/16 v1, 0x196

    if-eq v0, v1, :cond_2

    packed-switch v0, :pswitch_data_0

    invoke-virtual/range {p4 .. p4}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->is5xxServerException()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "server_5xx_error"

    invoke-virtual/range {p4 .. p4}, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->get5xxServerExceptionRetryTime()J

    move-result-wide v1

    const-wide/32 v4, 0x7fffffff

    cmp-long v6, v1, v4

    if-nez v6, :cond_0

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    :cond_0
    const-string v4, "MiCloudExceptionHandler"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Http 5xx error. retryTime: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setRequestError(Landroid/content/SyncResult;)V

    invoke-static {p0, p2, p3, v1, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto/16 :goto_1

    :cond_1
    const-string v0, "MiCloudExceptionHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unrecognized server error "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v9, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->statusCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-string v0, "code_sync_unknown"

    :goto_0
    const/4 v10, 0x0

    goto/16 :goto_1

    :pswitch_0
    const-string v0, "MiCloudExceptionHandler"

    const-string v1, "Http unauthorized error."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-string v11, "sever_error_unauthorized"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    invoke-static/range {v0 .. v6}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleUnauthorizedException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    move-object v0, v11

    goto/16 :goto_1

    :pswitch_1
    const-string v0, "MiCloudExceptionHandler"

    const-string v1, "Http bad request error. Suspending sync."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setRequestError(Landroid/content/SyncResult;)V

    const-string v0, "sever_error_bad_request"

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, p2, p3, v1, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto/16 :goto_1

    :cond_2
    const-string v0, "MiCloudExceptionHandler"

    const-string v1, "Http not-acceptable error. Suspend sync."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setRequestError(Landroid/content/SyncResult;)V

    const-string v0, "sever_error_not-acceptable"

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, p2, p3, v1, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto/16 :goto_1

    :cond_3
    const-string v0, "MiCloudExceptionHandler"

    const-string v1, "Http forbidden error. Suspend sync."

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setRequestError(Landroid/content/SyncResult;)V

    const-string v0, "sever_error_forbidden"

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, p2, p3, v1, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto :goto_1

    :cond_4
    const-string v0, "MiCloudExceptionHandler"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Non-server error. code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, v9, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->code:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, v9, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->code:I

    sparse-switch v0, :sswitch_data_0

    const-string v0, "code_sync_unknown"

    goto :goto_0

    :sswitch_0
    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setSimActivatedError(Landroid/content/SyncResult;)V

    const-string v0, "activated_fail"

    goto/16 :goto_0

    :sswitch_1
    invoke-static {p3}, Lcom/xiaomi/micloudsdk/sync/SyncAdapterBase;->setPermissionError(Landroid/content/SyncResult;)V

    const-string v0, "network_disallowed"

    goto/16 :goto_0

    :sswitch_2
    const-string v0, "time_unavailable"

    goto/16 :goto_0

    :sswitch_3
    const-string v10, "auth_token_error"

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p6

    move-object/from16 v6, p7

    invoke-static/range {v0 .. v6}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleUnauthorizedException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    move-object v0, v10

    goto/16 :goto_0

    :sswitch_4
    const-string v0, "sync_hard_error"

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    int-to-long v1, v1

    invoke-static {p0, p2, p3, v1, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto :goto_1

    :sswitch_5
    const-string v0, "sync_soft_error"

    goto :goto_1

    :sswitch_6
    const-string v0, "code_sync_success"

    goto/16 :goto_0

    :goto_1
    invoke-static {p0, p2, v9}, Lcom/xiaomi/micloudsdk/sync/utils/SyncRecordUtils;->recordSyncResult(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/micloudsdk/exception/CloudServerException;)V

    move-object/from16 v1, p7

    invoke-static {v1, p2, v0, v10}, Lmiui/cloud/stat/MiCloudStatUtil;->wrapErrorBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;Z)V

    return-void

    :pswitch_data_0
    .packed-switch 0x190
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_6
        0x1 -> :sswitch_5
        0x2 -> :sswitch_4
        0x64 -> :sswitch_3
        0x65 -> :sswitch_2
        0x3e8 -> :sswitch_1
        0x3e9 -> :sswitch_0
    .end sparse-switch
.end method

.method public static handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V
    .locals 0

    invoke-static {p0, p1, p3, p4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->suspendSync(Landroid/content/Context;Ljava/lang/String;J)V

    invoke-static {p2, p3, p4}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->setSyncRetry(Landroid/content/SyncResult;J)V

    return-void
.end method

.method private static handleUnauthorizedException(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Landroid/content/SyncResult;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 7

    const-string v0, "TokenExpiredDay_%s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/xiaomi/micloudsdk/utils/PrefUtils;->getLong(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Long;)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    const-wide/32 v5, 0x5265c00

    div-long/2addr v3, v5

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    const-string p1, "MiCloudExceptionHandler"

    const-string p4, "Http unauthorized error. Suspend sync."

    invoke-static {p1, p4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p4, p1, Landroid/content/SyncStats;->numAuthExceptions:J

    const-wide/16 v0, 0x1

    add-long/2addr p4, v0

    iput-wide p4, p1, Landroid/content/SyncStats;->numAuthExceptions:J

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncTimeUtils;->getSyncSuspendTime(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    int-to-long p4, p1

    invoke-static {p0, p2, p3, p4, p5}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->handleException(Landroid/content/Context;Ljava/lang/String;Landroid/content/SyncResult;J)V

    goto :goto_0

    :cond_0
    const-string p3, "MiCloudExceptionHandler"

    const-string v1, "Http unauthorized error. Invalid and retry"

    invoke-static {p3, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1, p4, p5}, Lcom/xiaomi/micloudsdk/sync/MiCloudExceptionHandler;->invalidAuthToken(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p1, p2, p6}, Landroid/content/ContentResolver;->requestSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {p0, v0, p1}, Lcom/xiaomi/micloudsdk/utils/PrefUtils;->putLong(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Long;)V

    :goto_0
    return-void
.end method

.method private static invalidAuthToken(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    invoke-static {p0}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object p0

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-virtual/range {v0 .. v5}, Landroid/accounts/AccountManager;->getAuthToken(Landroid/accounts/Account;Ljava/lang/String;ZLandroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;

    iget-object p1, p1, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {p0, p1, p3}, Landroid/accounts/AccountManager;->invalidateAuthToken(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static setSyncRetry(Landroid/content/SyncResult;J)V
    .locals 5

    iget-object v0, p0, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide v1, v0, Landroid/content/SyncStats;->numIoExceptions:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    iput-wide v1, v0, Landroid/content/SyncStats;->numIoExceptions:J

    iput-wide p1, p0, Landroid/content/SyncResult;->delayUntil:J

    return-void
.end method
