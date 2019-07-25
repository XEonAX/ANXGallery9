.class public Lcom/miui/gallery/util/SyncUtil;
.super Ljava/lang/Object;
.source "SyncUtil.java"


# direct methods
.method static synthetic access$000(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->doRequestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    return-void
.end method

.method private static doRequestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    .locals 9

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->isSyncPause(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p0, "SyncUtil"

    const-string p1, "sync has pause"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SyncUtil;->wrapSyncType(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->cloneFrom(Lcom/miui/gallery/cloud/base/SyncRequest;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    const-string v1, "SyncUtil"

    const-string v2, "requestSync: request[%s] %s"

    const-string v3, "\n\t"

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, p1, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-nez v1, :cond_2

    const-string p0, "SyncUtil"

    const-string p1, "account is null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncReason()J

    move-result-wide v2

    const-string v4, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v4}, Landroid/content/ContentResolver;->isSyncActive(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->containsReason(J)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p0

    invoke-virtual {p0, v0, v5}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V

    const-string p0, "SyncUtil"

    const-string v0, "sync active, reason contain, no need request. active reason[%s], request reason[%s]"

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, v0, v1, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :cond_3
    const-string v4, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v4}, Landroid/content/ContentResolver;->isSyncPending(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v4

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v6

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v7

    invoke-virtual {v6, v7, v8}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->containsReason(J)Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-static {v4, v0}, Lcom/miui/gallery/cloud/base/SyncType;->compare(Lcom/miui/gallery/cloud/base/SyncType;Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result v6

    if-ltz v6, :cond_4

    const-string p0, "SyncUtil"

    const-string v1, "sync pending, reason contain, no need request, active type[%s], active reason[%s], request type[%s], request reason[%s]"

    const/4 v6, 0x4

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v5

    const/4 v4, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v6, v4

    const/4 v2, 0x2

    aput-object v0, v6, v2

    const/4 v0, 0x3

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v0

    invoke-static {p0, v1, v6}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    :cond_4
    const-string v6, "SyncUtil"

    const-string v7, "sync pending, reason contain, type upgrade, cancel type[%s], request type[%s]"

    invoke-static {v6, v7, v4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v4, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v4}, Landroid/content/ContentResolver;->cancelSync(Landroid/accounts/Account;Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    invoke-static {v4, v0}, Lcom/miui/gallery/cloud/base/SyncType;->compare(Lcom/miui/gallery/cloud/base/SyncType;Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result v1

    if-lez v1, :cond_7

    new-instance v1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->cloneFrom(Lcom/miui/gallery/cloud/base/SyncRequest;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1, v4}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    const-string v1, "SyncUtil"

    const-string v6, "sync pending, reason no contain, type downgrade, keep type[%s], request type[%s]"

    invoke-static {v1, v6, v4, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_0

    :cond_6
    const-wide/16 v6, 0x0

    cmp-long v1, v2, v6

    if-eqz v1, :cond_7

    const-string v1, "SyncUtil"

    const-string v4, "Has reason but no request, clear reason[%s]"

    invoke-static {v2, v3}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v4, v6}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v1

    const-wide v6, 0x7fffffffffffffffL

    invoke-virtual {v1, v6, v7}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->unmergeReason(J)V

    :cond_7
    :goto_0
    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v6

    invoke-virtual {v1, v6, v7}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mergeReason(J)V

    const-string v1, "SyncUtil"

    const-string v4, "request sync, old reason[%s], merged reason[%s]"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncReason()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v4, v2, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->packSyncParams(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)Landroid/content/SyncRequest;

    move-result-object p1

    if-eqz p1, :cond_8

    invoke-static {p1}, Landroid/content/ContentResolver;->requestSync(Landroid/content/SyncRequest;)V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p1

    invoke-virtual {p1, v0, v5}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V

    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p0

    new-instance p1, Landroid/content/Intent;

    const-string v0, "com.miui.gallery.SYNC_COMMAND_DISPATCHED"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    goto :goto_1

    :cond_8
    const-string p0, "SyncUtil"

    const-string p1, "sync request null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return-void
.end method

.method public static existXiaomiAccount(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v1, "existXiaomiAccount context null"

    invoke-static {p0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0
.end method

.method public static getResumeTime(Landroid/content/Context;)J
    .locals 2

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v0, "getResumeTime context null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, -0x1

    return-wide v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p0, v0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->getResumeTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static isGalleryCloudSyncable(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v1, "isGalleryCloudSyncable context null"

    invoke-static {p0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p0

    if-nez p0, :cond_1

    return v0

    :cond_1
    invoke-static {}, Landroid/content/ContentResolver;->getMasterSyncAutomatically()Z

    move-result v1

    if-eqz v1, :cond_2

    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-static {p0, v1}, Landroid/content/ContentResolver;->getSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 v0, 0x1

    :cond_2
    return v0
.end method

.method private static isMetaDataRequest()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static isSyncPause(Landroid/content/Context;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v1, "isSyncPause context null"

    invoke-static {p0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v1

    if-nez v1, :cond_1

    const-string p0, "SyncUtil"

    const-string v1, "isSyncPause account null"

    invoke-static {p0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_1
    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p0, v1, v0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->isSyncPausing(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method public static packSyncParams(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)Landroid/content/SyncRequest;
    .locals 8

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string p1, "packSyncParams context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p0

    if-nez p0, :cond_1

    return-object v0

    :cond_1
    new-instance v0, Landroid/content/SyncRequest$Builder;

    invoke-direct {v0}, Landroid/content/SyncRequest$Builder;-><init>()V

    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-virtual {v0, p0, v1}, Landroid/content/SyncRequest$Builder;->setSyncAdapter(Landroid/accounts/Account;Ljava/lang/String;)Landroid/content/SyncRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/SyncRequest$Builder;->syncOnce()Landroid/content/SyncRequest$Builder;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getInstance()Lcom/miui/gallery/cloud/policy/SyncPolicyManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getPolicy(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/policy/IPolicy;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-interface {v0}, Lcom/miui/gallery/cloud/policy/IPolicy;->isEnable()Z

    move-result v1

    if-nez v1, :cond_3

    :cond_2
    const-string v0, "SyncUtil"

    const-string v1, "no policy for %s"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getInstance()Lcom/miui/gallery/cloud/policy/SyncPolicyManager;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/policy/SyncPolicyManager;->getPolicy(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/policy/IPolicy;

    move-result-object v0

    :cond_3
    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    invoke-interface {v0}, Lcom/miui/gallery/cloud/policy/IPolicy;->isEnable()Z

    move-result v3

    if-eqz v3, :cond_4

    const/4 v3, 0x1

    goto :goto_0

    :cond_4
    const/4 v3, 0x0

    :goto_0
    if-nez v3, :cond_5

    const-string v4, "SyncUtil"

    const-string v5, "policy not valid %s"

    invoke-static {v4, v5, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_5
    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->isManual()Z

    move-result v4

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result v5

    if-nez v5, :cond_7

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->isManual()Z

    move-result v5

    if-eqz v5, :cond_6

    goto :goto_1

    :cond_6
    const/4 v5, 0x0

    goto :goto_2

    :cond_7
    :goto_1
    const/4 v5, 0x1

    :goto_2
    invoke-static {}, Lcom/miui/gallery/util/SyncUtil;->isMetaDataRequest()Z

    move-result v6

    if-eqz v6, :cond_8

    const/4 v0, 0x1

    :goto_3
    const/4 v3, 0x0

    goto :goto_4

    :cond_8
    if-eqz v3, :cond_9

    invoke-interface {v0}, Lcom/miui/gallery/cloud/policy/IPolicy;->isDisallowMetered()Z

    move-result v1

    invoke-interface {v0}, Lcom/miui/gallery/cloud/policy/IPolicy;->isRequireCharging()Z

    move-result v3

    invoke-interface {v0}, Lcom/miui/gallery/cloud/policy/IPolicy;->isIgnoreBatteryLow()Z

    move-result v0

    goto :goto_4

    :cond_9
    const/4 v0, 0x0

    const/4 v1, 0x1

    goto :goto_3

    :goto_4
    invoke-virtual {p0, v1}, Landroid/content/SyncRequest$Builder;->setDisallowMetered(Z)Landroid/content/SyncRequest$Builder;

    move-result-object v6

    invoke-virtual {v6, v5}, Landroid/content/SyncRequest$Builder;->setExpedited(Z)Landroid/content/SyncRequest$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Landroid/content/SyncRequest$Builder;->setManual(Z)Landroid/content/SyncRequest$Builder;

    if-eqz v3, :cond_a

    invoke-static {p0, v3}, Lmiui/gallery/support/SyncCompat;->setRequiresCharging(Landroid/content/SyncRequest$Builder;Z)V

    :cond_a
    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    const-string v5, "sync_no_delay"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->isDelayUpload()Z

    move-result v6

    xor-int/2addr v6, v2

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string v5, "sync_type"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v6

    invoke-virtual {v6}, Lcom/miui/gallery/cloud/base/SyncType;->getIdentifier()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "sync_reason"

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest;->getSyncReason()J

    move-result-wide v6

    invoke-virtual {v3, v5, v6, v7}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    if-nez v1, :cond_b

    const-string p1, "micloud_ignore_wifi_settings"

    invoke-virtual {v3, p1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_b
    if-eqz v0, :cond_c

    const-string p1, "micloud_ignore_battery_low"

    invoke-virtual {v3, p1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_c
    if-eqz v4, :cond_d

    const-string p1, "micloud_force"

    invoke-virtual {v3, p1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    const-string p1, "force"

    invoke-virtual {v3, p1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_d
    invoke-virtual {p0, v3}, Landroid/content/SyncRequest$Builder;->setExtras(Landroid/os/Bundle;)Landroid/content/SyncRequest$Builder;

    invoke-virtual {p0}, Landroid/content/SyncRequest$Builder;->build()Landroid/content/SyncRequest;

    move-result-object p0

    return-object p0
.end method

.method public static pauseSync(Landroid/content/Context;J)V
    .locals 3

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string p1, "pauseSync context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "SyncUtil"

    const-string p1, "pauseSync account null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v0, v2, p1, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->pauseSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;J)V

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->stopSync(Landroid/content/Context;)V

    return-void
.end method

.method public static requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    .locals 2

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string p1, "requestSync context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/agreement/AgreementsUtils;->isNetworkingAgreementAccepted()Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "SyncUtil"

    const-string p1, "networking agreement hasn\'t accepted"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_2

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSyncInWorkThread(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    goto :goto_0

    :cond_2
    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->doRequestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :goto_0
    return-void
.end method

.method private static requestSyncInWorkThread(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V
    .locals 2

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/SyncUtil$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/util/SyncUtil$1;-><init>(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public static resumeSync(Landroid/content/Context;)V
    .locals 3

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v0, "resumeSync context null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-nez v0, :cond_1

    const-string p0, "SyncUtil"

    const-string v0, "pauseSync account null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "com.miui.gallery.cloud.provider"

    invoke-static {v1, v0, v2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->resumeSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V

    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.SYNC_COMMAND_DISPATCHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    return-void
.end method

.method public static setBackupOnlyWifi(Landroid/content/Context;Z)V
    .locals 5

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string p1, "setBackupOnlyWifi context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setBackupOnlyInWifi(Z)V

    if-nez p1, :cond_2

    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object p1

    if-eqz p1, :cond_2

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->isSyncActive(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "com.miui.gallery.cloud.provider"

    invoke-static {p1, v0}, Landroid/content/ContentResolver;->isSyncPending(Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->wrapSyncType(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p1

    const/4 v0, 0x5

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkIgnoreCancel(ILcom/miui/gallery/cloud/base/SyncType;)I

    move-result v0

    if-nez v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncReason()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    const-wide/16 v0, 0x21

    :cond_1
    const-string v2, "SyncUtil"

    const-string v3, "not back only wifi, sync pending, but condition ok, request reason[%s]"

    invoke-static {v0, v1}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    invoke-virtual {v2, p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_2
    return-void
.end method

.method public static setSyncAutomatically(Landroid/content/Context;Z)Z
    .locals 3

    const/4 v0, 0x0

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string p1, "switchBackup context null"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_0
    invoke-static {p0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v1

    if-eqz p1, :cond_2

    invoke-static {p0}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/util/IntentUtil;->startCloudMainPage(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    return v0

    :cond_1
    if-nez v1, :cond_3

    sget-object p1, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->AUTOBACKUP:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/IntentUtil;->guideToLoginXiaomiAccount(Landroid/content/Context;Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;)V

    return v0

    :cond_2
    invoke-static {p0}, Lcom/miui/gallery/util/SyncUtil;->stopSync(Landroid/content/Context;)V

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->statSyncEnabledEvent(Z)V

    const-string p0, "com.miui.gallery.cloud.provider"

    invoke-static {v1, p0, p1}, Landroid/content/ContentResolver;->setSyncAutomatically(Landroid/accounts/Account;Ljava/lang/String;Z)V

    const/4 p0, 0x1

    return p0
.end method

.method public static statSyncEnabledEvent(Z)V
    .locals 2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "state"

    invoke-static {p0}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p0, "micloud_sync"

    const-string v1, "sync_enabled"

    invoke-static {p0, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static stopSync(Landroid/content/Context;)V
    .locals 3

    if-nez p0, :cond_0

    const-string p0, "SyncUtil"

    const-string v0, "stopSync context null"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->setCancelledForAllBackground(Z)V

    invoke-static {v0, v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->cancelAllBackgroundPriority(ZZ)V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v1, v2, v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V

    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object p0

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.miui.gallery.SYNC_COMMAND_DISPATCHED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    return-void
.end method

.method public static unpackSyncType(Landroid/os/Bundle;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 2

    if-eqz p0, :cond_2

    const-string v0, "sync_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "sync_type"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/base/SyncType;->fromIdentifier(Ljava/lang/String;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v0, "micloud_ignore_wifi_settings"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->GPRS_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0

    :cond_1
    const-string v0, "micloud_ignore_battery_low"

    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->POWER_FORCE:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0

    :cond_2
    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    return-object p0
.end method

.method private static wrapSyncType(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    if-eq p1, v0, :cond_1

    sget-object v0, Lcom/miui/gallery/cloud/base/SyncType;->BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    return-object p1

    :cond_1
    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isAppProcessInForeground(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_2

    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    goto :goto_1

    :cond_2
    sget-object p0, Lcom/miui/gallery/cloud/base/SyncType;->BACKGROUND:Lcom/miui/gallery/cloud/base/SyncType;

    :goto_1
    return-object p0
.end method
