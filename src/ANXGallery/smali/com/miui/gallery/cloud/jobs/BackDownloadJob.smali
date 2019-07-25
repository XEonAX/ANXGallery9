.class public Lcom/miui/gallery/cloud/jobs/BackDownloadJob;
.super Lcom/miui/gallery/cloud/jobs/AbsSyncJob;
.source "BackDownloadJob.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/cloud/jobs/AbsSyncJob<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloud/jobs/AbsSyncJob;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic execute()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/jobs/BackDownloadJob;->execute()Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method public execute()Ljava/lang/Void;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getJobInfo(Landroid/content/Context;Landroid/content/ComponentName;)Landroid/app/job/JobInfo;
    .locals 1

    new-instance p1, Landroid/app/job/JobInfo$Builder;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/jobs/BackDownloadJob;->getJobId()I

    move-result v0

    invoke-direct {p1, v0, p2}, Landroid/app/job/JobInfo$Builder;-><init>(ILandroid/content/ComponentName;)V

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiredNetworkType(I)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlStrategyHelper;->getSyncStrategy()Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloudcontrol/strategies/SyncStrategy;->isAutoDownloadRequireDeviceIdle()Z

    move-result p2

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiresDeviceIdle(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/app/job/JobInfo$Builder;->setRequiresCharging(Z)Landroid/app/job/JobInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/app/job/JobInfo$Builder;->build()Landroid/app/job/JobInfo;

    move-result-object p1

    return-object p1
.end method
