.class Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;
.super Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;
.source "AsyncUpDownloadService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/AsyncUpDownloadService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WakeLockRef"
.end annotation


# instance fields
.field private mAcquireTime:J

.field private mIsCharging:Z

.field private mIsScreenOn:Z

.field private final mPendingOwners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mWakeLock:Landroid/os/PowerManager$WakeLock;

.field final synthetic this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/cloud/AsyncUpDownloadService;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    invoke-direct {p0, p2}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/google/common/collect/Lists;->newArrayList()Ljava/util/ArrayList;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->isScreenOn()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsScreenOn:Z

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->isCharging()Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsCharging:Z

    return-void
.end method

.method private canBatteryAcquire()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$100()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsCharging:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private canScreenAcquire()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$000()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsScreenOn:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method private isCharging()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    return v0
.end method

.method private isScreenOn()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    return v0
.end method

.method private releaseTemp()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v1, "onRelease"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->onRelease()V

    return-void
.end method

.method private tryAcquireLock()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->acquire(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private tryReleaseLock()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    iget-object v1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mOwners:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->releaseTemp()V

    :cond_0
    return-void
.end method


# virtual methods
.method public acquire(Ljava/lang/String;)V
    .locals 6

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->canScreenAcquire()Z

    move-result v0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->canBatteryAcquire()Z

    move-result v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->acquire(Ljava/lang/String;)V

    return-void

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v3, "can\'t acquire wakelock, add pending %s, pendings %s, screen %s, charge %s"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    const/4 p1, 0x1

    iget-object v5, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    aput-object v5, v4, p1

    const/4 p1, 0x2

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v4, p1

    const/4 p1, 0x3

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    aput-object v0, v4, p1

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method protected onAcquire()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->isHeld()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AsyncUpDownloadService"

    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "wakelock acquire and release not balance"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->this$0:Lcom/miui/gallery/cloud/AsyncUpDownloadService;

    const-string v1, "power"

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/os/PowerManager;->newWakeLock(ILjava/lang/String;)Landroid/os/PowerManager$WakeLock;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/PowerManager$WakeLock;->setReferenceCounted(Z)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->acquire()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mAcquireTime:J

    return-void
.end method

.method public onChargeStateChanged(Z)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$100()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsCharging:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v0, "charging"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->tryAcquireLock()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v0, "not charging"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->tryReleaseLock()V

    :goto_0
    return-void
.end method

.method protected onRelease()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    invoke-virtual {v0}, Landroid/os/PowerManager$WakeLock;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mWakeLock:Landroid/os/PowerManager$WakeLock;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "wakelock_elapse_time"

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mAcquireTime:J

    sub-long/2addr v3, v5

    long-to-float v3, v3

    mul-float v3, v3, v2

    const/high16 v2, 0x447a0000    # 1000.0f

    div-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "Sync"

    const-string v2, "sync_wakelock_time"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method public onScreenOnOff(Z)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->access$000()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mIsScreenOn:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v0, "screen on"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->tryReleaseLock()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v0, "screen off"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->tryAcquireLock()V

    :goto_0
    return-void
.end method

.method public release(Ljava/lang/String;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v1, "remove owner from pending success: %s, left pending owners: %s"

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-static {v0, v1, p1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v0, "onRelease"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->onRelease()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mTag:Ljava/lang/String;

    const-string v1, "remove owner from pending fail, pending owners: %s, owners: %s, owner: %s"

    iget-object v2, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    iget-object v3, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mOwners:Ljava/util/List;

    invoke-static {v0, v1, v2, v3, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    invoke-super {p0, p1}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->release(Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-void
.end method

.method public releaseAll()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->mPendingOwners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$WakeLockRef;->onRelease()V

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$ResourceRef;->releaseAll()V

    return-void
.end method
