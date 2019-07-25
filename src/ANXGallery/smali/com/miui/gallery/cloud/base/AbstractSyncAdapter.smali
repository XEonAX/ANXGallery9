.class public abstract Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
.super Ljava/lang/Object;
.source "AbstractSyncAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private final mContext:Landroid/content/Context;

.field private mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method private acquireLock()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->TAG:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->newSyncLock(Ljava/lang/String;)Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;->acquire()V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private releaseLock()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method


# virtual methods
.method protected finalize()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->releaseLock()V

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "not call #cleanup"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    sget-boolean v1, Lcom/miui/os/Rom;->IS_ALPHA:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    :cond_0
    throw v0

    :cond_1
    :goto_0
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    return-void
.end method

.method public abstract getBindingReason()J
.end method

.method public getContext()Landroid/content/Context;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->mContext:Landroid/content/Context;

    return-object v0
.end method

.method public abstract isAsynchronous()Z
.end method

.method protected abstract onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Landroid/os/Bundle;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final startSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/accounts/Account;",
            "Landroid/os/Bundle;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->acquireLock()V

    :try_start_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->onPerformSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->releaseLock()V

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :try_start_1
    iget-object p2, p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->TAG:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    new-instance p2, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->UNKNOWN:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setException(Ljava/lang/Exception;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->releaseLock()V

    return-object p1

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->releaseLock()V

    throw p1
.end method
