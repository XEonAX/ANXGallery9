.class public Lcom/xiaomi/micloudsdk/sync/utils/SyncRecordUtils;
.super Ljava/lang/Object;
.source "SyncRecordUtils.java"


# direct methods
.method public static recordSyncResult(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/micloudsdk/exception/CloudServerException;)V
    .locals 2

    const-string v0, "SyncRecordUtils"

    const-string v1, "recordSyncResult"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget v0, p2, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->statusCode:I

    const/16 v1, -0x2711

    if-eq v0, v1, :cond_0

    iget p2, p2, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->statusCode:I

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->recordSyncResult(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_1

    :cond_0
    iget p2, p2, Lcom/xiaomi/micloudsdk/exception/CloudServerException;->code:I

    const v0, 0xcb23

    if-eq p2, v0, :cond_1

    packed-switch p2, :pswitch_data_0

    packed-switch p2, :pswitch_data_1

    packed-switch p2, :pswitch_data_2

    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->UNKNOWN:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_0
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SECURE_SPACE_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_1
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PERMISSION_LIMIT:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_2
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->ACTIVATED_FAIL:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_3
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->NETWORK_DISALLOWED:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_4
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->TIME_UNAVAILABLE:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_5
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->AUTH_TOKEN_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_6
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_HARD_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_7
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SYNC_SOFT_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :pswitch_8
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SUCCESS:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :cond_1
    invoke-static {p0}, Lcom/xiaomi/micloudsdk/provider/GdprUtils;->isGdprAvailable(Landroid/content/Context;)Z

    move-result p2

    if-eqz p2, :cond_2

    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->PRIVACY_ERROR:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    goto :goto_0

    :cond_2
    sget-object p2, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->UNKNOWN:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    :goto_0
    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->recordSyncResult(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;)V

    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x64
        :pswitch_5
        :pswitch_4
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x3e8
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static recordSyncResultSuccess(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    const-string v0, "SyncRecordUtils"

    const-string v1, "recordSyncResultSuccess"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    sget-object v0, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;->SUCCESS:Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;

    invoke-static {p0, p1, v0}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->recordSyncResult(Landroid/content/Context;Ljava/lang/String;Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils$Reason;)V

    return-void
.end method
