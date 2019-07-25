.class abstract Lcom/miui/gallery/cloud/SyncConditionManager$Checker;
.super Ljava/lang/Object;
.source "SyncConditionManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/cloud/SyncConditionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Checker"
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private volatile mCanceled:Z


# direct methods
.method constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->mCanceled:Z

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    return-void
.end method

.method private isCanceled()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->mCanceled:Z

    return v0
.end method


# virtual methods
.method public check(Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->isCanceled()Z

    move-result v0

    const/4 v1, 0x2

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    const-string v0, "isCanceled"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    const-string v0, "network not connected"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result v0

    if-eqz v0, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    const-string v2, "check result %d, sync type %s"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    return v0
.end method

.method public checkIgnoreCancel(Lcom/miui/gallery/cloud/base/SyncType;)I
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    const-string v0, "network not connected"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x2

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I

    move-result p1

    return p1
.end method

.method protected abstract checkInternal(Lcom/miui/gallery/cloud/base/SyncType;)I
.end method

.method protected setCanceled(Z)V
    .locals 4

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/Throwable;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setCanceled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/cloud/SyncConditionManager$Checker;->mCanceled:Z

    return-void
.end method
