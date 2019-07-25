.class public Lcom/miui/gallery/cloud/thread/BackUploadTask;
.super Lcom/miui/gallery/cloud/thread/BaseSyncLockTask;
.source "BackUploadTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/cloud/thread/BaseSyncLockTask<",
        "Lcom/miui/gallery/data/DBImage;",
        ">;"
    }
.end annotation


# instance fields
.field private mStartTime:J

.field private mUploadCount:I


# direct methods
.method public constructor <init>(IIIILcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V
    .locals 0

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/cloud/thread/BaseSyncLockTask;-><init>(IIIILcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V

    return-void
.end method

.method private statUpload()V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mStartTime:J

    sub-long/2addr v0, v2

    long-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    int-to-long v0, v0

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "cost"

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "count"

    iget v1, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mUploadCount:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "Sync"

    const-string v1, "sync_upload_time_total"

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method protected handle(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;)",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lcom/miui/gallery/data/DBImage;",
            ">;"
        }
    .end annotation

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance p1, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mUploadCount:I

    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mUploadCount:I

    const/4 v0, 0x0

    invoke-interface {p4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget-object v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isShareItem()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/cloud/CreateShareImage;

    invoke-direct {v0, p1}, Lcom/miui/gallery/cloud/CreateShareImage;-><init>(Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    new-instance v0, Lcom/miui/gallery/cloud/CreateOwnerImage;

    invoke-direct {v0, p1}, Lcom/miui/gallery/cloud/CreateOwnerImage;-><init>(Landroid/content/Context;)V

    :goto_0
    invoke-static {p1, p2, p3, p4, v0}, Lcom/miui/gallery/cloud/RetryOperation;->doOperation(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;Lcom/miui/gallery/cloud/Operation;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1
.end method

.method protected onPerformSync()Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "Lcom/miui/gallery/data/DBImage;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    :try_start_0
    invoke-super {p0}, Lcom/miui/gallery/cloud/thread/BaseSyncLockTask;->onPerformSync()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0
    :try_end_0
    .catch Lcom/miui/gallery/cloud/GalleryMiCloudServerException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getCloudServerException()Ljava/lang/Exception;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/cloud/ServerErrorCode$MiCloudServerExceptionHandler;->handleMiCloudException(Ljava/lang/Exception;)Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->TAG:Ljava/lang/String;

    const-string v2, "throw Cloud server exception status code %d"

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getStatusCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->TAG:Ljava/lang/String;

    const-string v1, "no retry"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    new-instance v0, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->setCode(Lcom/miui/gallery/cloud/base/GallerySyncCode;)Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/GallerySyncResult$Builder;->build()Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v0

    return-object v0
.end method

.method protected onPostExecute()V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->endUpload()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/thread/BackUploadTask;->releaseLock()V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/thread/BackUploadTask;->statUpload()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onSyncEnd()V

    return-void
.end method

.method protected onPreExecute()V
    .locals 2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mStartTime:J

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/cloud/thread/BackUploadTask;->mUploadCount:I

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->startUpload()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->start()V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/thread/BackUploadTask;->acquireLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onSyncStart()V

    return-void
.end method
