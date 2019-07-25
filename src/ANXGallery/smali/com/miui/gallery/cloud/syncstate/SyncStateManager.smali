.class public Lcom/miui/gallery/cloud/syncstate/SyncStateManager;
.super Ljava/lang/Object;
.source "SyncStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/syncstate/SyncStateManager$Singleton;
    }
.end annotation


# instance fields
.field private mReasonLock:Ljava/lang/Object;

.field private mSyncReason:J

.field private mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

.field private mSyncStateObserver:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;


# direct methods
.method private constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    new-instance v0, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateObserver:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mReasonLock:Ljava/lang/Object;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/cloud/syncstate/SyncStateManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager$Singleton;->access$100()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public containsReason(J)Z
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mReasonLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    or-long/2addr p1, v1

    iget-wide v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    cmp-long v3, p1, v1

    if-nez v3, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getSyncReason()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    return-wide v0
.end method

.method public getSyncState()Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    return-object v0
.end method

.method public getSyncType()Lcom/miui/gallery/cloud/base/SyncType;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v1

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public mergeReason(J)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mReasonLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    or-long/2addr p1, v1

    iput-wide p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method onSyncCommandDispatched()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->onSyncCommandDispatched()V

    return-void
.end method

.method public registerSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->registerObserver(Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    iget-object p2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateObserver:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->register(Landroid/content/Context;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->updateSyncStatus()V

    return-void
.end method

.method setIsBatteryLow(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->setIsBatteryLow(Z)V

    return-void
.end method

.method setIsLocalSpaceFull(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->setIsLocalSpaceFull(Z)V

    return-void
.end method

.method public setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V
    .locals 3

    const-string v0, "SyncStateManager"

    const-string v1, "setSyncType old: %s, new: %s"

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v2

    invoke-static {v0, v1, v2, p1}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-nez p2, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getSyncType()Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/base/SyncType;->isForce()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x4

    invoke-static {p2, p1}, Lcom/miui/gallery/cloud/SyncConditionManager;->checkIgnoreCancel(ILcom/miui/gallery/cloud/base/SyncType;)I

    move-result p2

    if-nez p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)V

    goto :goto_1

    :cond_1
    invoke-static {p1, p2}, Lcom/miui/gallery/cloud/base/SyncType;->compare(Lcom/miui/gallery/cloud/base/SyncType;Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result p2

    if-lez p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)V

    :cond_3
    :goto_1
    return-void
.end method

.method triggerMediaChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->triggerMediaChanged()V

    return-void
.end method

.method public unmergeReason(J)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mReasonLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    const-wide/16 v3, -0x1

    xor-long/2addr p1, v3

    xor-long/2addr p1, v1

    iput-wide p1, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncReason:J

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public unregisterSyncStateObserver(Landroid/content/Context;Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->unregisterObserver(Lcom/miui/gallery/cloud/syncstate/OnSyncStateChangeObserver;)V

    iget-object p2, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateObserver:Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/syncstate/SyncStateObserver;->unregister(Landroid/content/Context;)V

    return-void
.end method

.method updateSyncStatus()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->mSyncStateInfo:Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateInfo;->invalidate()V

    return-void
.end method
