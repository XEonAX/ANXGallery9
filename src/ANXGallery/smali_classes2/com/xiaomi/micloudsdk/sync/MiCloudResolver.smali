.class public Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;
.super Ljava/lang/Object;
.source "MiCloudResolver.java"


# direct methods
.method private static assertAccount(Landroid/accounts/Account;)V
    .locals 1

    if-eqz p0, :cond_0

    const-string v0, "com.xiaomi"

    iget-object p0, p0, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "illegal account"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static assertAuthority(Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->getAuthorityList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "illegal authority: not registered authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "illegal authority: empty"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static assertContext(Landroid/content/Context;)V
    .locals 1

    if-eqz p0, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "context is null"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static assertTime(J)V
    .locals 3

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-ltz v2, :cond_0

    return-void

    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "illegal time"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static cancelSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAccount(Landroid/accounts/Account;)V

    invoke-static {p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    const-string v0, "MiCloudResolver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "cancelSync: authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p1, p2}, Landroid/content/ContentResolver;->cancelSync(Landroid/accounts/Account;Ljava/lang/String;)V

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->sendCancelCommand(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public static getAuthorityList()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Landroid/content/ContentResolver;->getSyncAdapterTypes()[Landroid/content/SyncAdapterType;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    const-string v5, "com.xiaomi"

    iget-object v6, v4, Landroid/content/SyncAdapterType;->accountType:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    iget-object v4, v4, Landroid/content/SyncAdapterType;->authority:Ljava/lang/String;

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static getResumeTime(Landroid/content/Context;Ljava/lang/String;)J
    .locals 3

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    const-string v0, "MiCloudResolver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getResumeTime: authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->isPauseExceptAuthority(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->loadResumeTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide v1

    if-eqz v0, :cond_0

    return-wide v1

    :cond_0
    const-string p1, "_all"

    invoke-static {p0, p1}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->loadResumeTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide p0

    cmp-long v0, p0, v1

    if-gez v0, :cond_1

    move-wide p0, v1

    :cond_1
    return-wide p0
.end method

.method public static isSyncPausing(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Z
    .locals 2

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAccount(Landroid/accounts/Account;)V

    invoke-static {p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    const-string p1, "MiCloudResolver"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "isSyncPausing: authority: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->getResumeTime(Landroid/content/Context;Ljava/lang/String;)J

    move-result-wide p0

    cmp-long p2, v0, p0

    if-gtz p2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static pauseSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;J)V
    .locals 3

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAccount(Landroid/accounts/Account;)V

    invoke-static {p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    invoke-static {p3, p4}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertTime(J)V

    const-string v0, "MiCloudResolver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pauseSync: authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", time: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->cancelSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V

    invoke-static {p0, p2, p3, p4}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->savePauseTime(Landroid/content/Context;Ljava/lang/String;J)V

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->tryToStartResumeService(Landroid/content/Context;)V

    return-void
.end method

.method public static requestSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAccount(Landroid/accounts/Account;)V

    invoke-static {p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    const-string v0, "MiCloudResolver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "requestSync: authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->isSyncPausing(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const-string p0, "MiCloudResolver"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "requestSync: authority: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "is paused. request sync fail"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    invoke-static {p1, p2, p0}, Landroid/content/ContentResolver;->requestSync(Landroid/accounts/Account;Ljava/lang/String;Landroid/os/Bundle;)V

    return-void
.end method

.method public static resumeSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V
    .locals 3

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertContext(Landroid/content/Context;)V

    invoke-static {p1}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAccount(Landroid/accounts/Account;)V

    invoke-static {p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->assertAuthority(Ljava/lang/String;)V

    const-string v0, "MiCloudResolver"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resumeSync: authority: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {p0, p2}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->insertPauseExceptAuthority(Landroid/content/Context;Ljava/lang/String;)V

    const-wide/16 v0, 0x0

    invoke-static {p0, p2, v0, v1}, Lcom/xiaomi/micloudsdk/sync/utils/SyncContentUtils;->savePauseTime(Landroid/content/Context;Ljava/lang/String;J)V

    invoke-static {p0, p1, p2}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->requestSync(Landroid/content/Context;Landroid/accounts/Account;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/xiaomi/micloudsdk/sync/MiCloudResolver;->tryToStartResumeService(Landroid/content/Context;)V

    return-void
.end method

.method private static sendCancelCommand(Landroid/content/Context;Ljava/lang/String;)V
    .locals 1

    const-string v0, "value_command_cancel_sync"

    invoke-static {p0, p1, v0}, Lcom/xiaomi/micloudsdk/sync/SyncCommandServiceBase;->sendCommandService(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private static tryToStartResumeService(Landroid/content/Context;)V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.xiaomi.action.SYNC_RESUME"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v1, "com.miui.cloudservice"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "extra_operation"

    const-string v2, "alarm"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    const/16 v2, 0x20

    invoke-virtual {v1, v0, v2}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method
