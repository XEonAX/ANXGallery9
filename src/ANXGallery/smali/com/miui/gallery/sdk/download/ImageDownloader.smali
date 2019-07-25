.class public Lcom/miui/gallery/sdk/download/ImageDownloader;
.super Ljava/lang/Object;
.source "ImageDownloader.java"


# static fields
.field private static volatile sInstance:Lcom/miui/gallery/sdk/download/ImageDownloader;


# instance fields
.field private mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadEngine;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;
    .locals 2

    sget-object v0, Lcom/miui/gallery/sdk/download/ImageDownloader;->sInstance:Lcom/miui/gallery/sdk/download/ImageDownloader;

    if-nez v0, :cond_1

    const-class v0, Lcom/miui/gallery/sdk/download/ImageDownloader;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/sdk/download/ImageDownloader;->sInstance:Lcom/miui/gallery/sdk/download/ImageDownloader;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/sdk/download/ImageDownloader;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/ImageDownloader;-><init>()V

    sput-object v1, Lcom/miui/gallery/sdk/download/ImageDownloader;->sInstance:Lcom/miui/gallery/sdk/download/ImageDownloader;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    sget-object v0, Lcom/miui/gallery/sdk/download/ImageDownloader;->sInstance:Lcom/miui/gallery/sdk/download/ImageDownloader;

    return-object v0
.end method


# virtual methods
.method public cancel(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->build()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/DownloadEngine;->cancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    return-void
.end method

.method public cancelAll()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadEngine;->cancelAll()V

    return-void
.end method

.method public cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/DownloadEngine;->cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V

    return-void
.end method

.method public contains(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->build()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/DownloadEngine;->contains(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result p1

    return p1
.end method

.method public ensureDownloadOptions(Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/DownloadOptions;
    .locals 2

    if-nez p1, :cond_0

    const-string p1, "ImageDownloader"

    const-string v0, "download options is null, use default"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p1, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    iget-object p1, p1, Lcom/miui/gallery/sdk/download/DownloadEngine;->mDefaultDownloadOptions:Lcom/miui/gallery/sdk/download/DownloadOptions;

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadOptions;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v0

    if-nez v0, :cond_1

    const-string v0, "ImageDownloader"

    const-string v1, "uri adapter is null, use default"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->cloneFrom(Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;-><init>()V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setUriAdapter(Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public getStatusSync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;
    .locals 3

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_NONE:Lcom/miui/gallery/sdk/SyncStatus;

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v1

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->contains(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_INIT:Lcom/miui/gallery/sdk/SyncStatus;

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p2}, Lcom/miui/gallery/sdk/download/ImageDownloader;->isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    if-eqz p1, :cond_4

    new-instance v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/DownloadType;->getPriority()I

    move-result p2

    invoke-direct {v0, p2, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getVerifiedDownloadFilePathForRead()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v1, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSecretKeyNoGenerate()[B

    move-result-object p1

    invoke-direct {v1, p2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    move-object v2, v1

    goto :goto_0

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->getDownloadFileStatusFromDB(Lcom/miui/gallery/data/DBImage;)I

    move-result p2

    const/4 v0, 0x2

    if-ne v0, p2, :cond_2

    const/4 p2, -0x1

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->persistDownloadStatus(Lcom/miui/gallery/data/DBImage;I)V

    :cond_2
    invoke-static {p2}, Lcom/miui/gallery/sdk/SyncStatus;->toSyncStatus(I)Lcom/miui/gallery/sdk/SyncStatus;

    move-result-object p1

    move-object v0, p1

    goto :goto_0

    :cond_3
    new-instance v1, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;-><init>()V

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;->getDBItemForUri(Landroid/net/Uri;)Lcom/miui/gallery/data/DBImage;

    move-result-object p1

    if-eqz p1, :cond_4

    new-instance v1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/DownloadType;->getPriority()I

    move-result p2

    invoke-direct {v1, p2, p1}, Lcom/miui/gallery/cloud/RequestCloudItem;-><init>(ILcom/miui/gallery/data/DBImage;)V

    invoke-virtual {v1}, Lcom/miui/gallery/cloud/RequestCloudItem;->getVerifiedDownloadFilePathForRead()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    sget-object v0, Lcom/miui/gallery/sdk/SyncStatus;->STATUS_SUCCESS:Lcom/miui/gallery/sdk/SyncStatus;

    new-instance v2, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    invoke-virtual {p1}, Lcom/miui/gallery/data/DBImage;->getSecretKeyNoGenerate()[B

    move-result-object p1

    invoke-direct {v2, p2, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;-><init>(Ljava/lang/String;[B)V

    :cond_4
    :goto_0
    new-instance p1, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;

    invoke-direct {p1, v0, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItemStatus;-><init>(Lcom/miui/gallery/sdk/SyncStatus;Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    return-object p1
.end method

.method public isOrigin(Lcom/miui/gallery/sdk/download/DownloadType;)Z
    .locals 1

    if-eqz p1, :cond_1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-eq p1, v0, :cond_0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p1, v0, :cond_1

    :cond_0
    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;)V

    return-void
.end method

.method public load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/sdk/download/ImageDownloader;->load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)V

    return-void
.end method

.method public load(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;Lcom/miui/gallery/sdk/download/listener/DownloadListener;Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)V
    .locals 4

    if-eqz p1, :cond_1

    if-nez p2, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p3}, Lcom/miui/gallery/sdk/download/ImageDownloader;->ensureDownloadOptions(Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v1, p1, p2}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getLockForUri(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v2, p2}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getDownloader(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    invoke-direct {v3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;-><init>()V

    invoke-virtual {v3, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUriAdapter(Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUriLock(Ljava/util/concurrent/locks/ReentrantLock;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p4}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setDownloadListener(Lcom/miui/gallery/sdk/download/listener/DownloadListener;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p5}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setProgressListener(Lcom/miui/gallery/sdk/download/listener/DownloadProgressListener;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setDownloader(Lcom/miui/gallery/sdk/download/downloader/IDownloader;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequirePower()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequirePower(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireCharging()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireCharging(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireWLAN()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireDeviceStorage()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireDeviceStorage(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isManual()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setManual(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->build()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isQueueFirst()Z

    move-result p4

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isInterruptExecuting()Z

    move-result p3

    invoke-virtual {p2, p1, p4, p3}, Lcom/miui/gallery/sdk/download/DownloadEngine;->download(Lcom/miui/gallery/sdk/download/assist/DownloadItem;ZZ)V

    return-void

    :cond_1
    :goto_0
    if-eqz p4, :cond_2

    new-instance p3, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;

    sget-object p5, Lcom/miui/gallery/error/core/ErrorCode;->PARAMS_ERROR:Lcom/miui/gallery/error/core/ErrorCode;

    const-string v0, ""

    const/4 v1, 0x0

    invoke-direct {p3, p5, v0, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;-><init>(Lcom/miui/gallery/error/core/ErrorCode;Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-interface {p4, p1, p2, p3}, Lcom/miui/gallery/sdk/download/listener/DownloadListener;->onDownloadFail(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/assist/DownloadFailReason;)V

    :cond_2
    return-void
.end method

.method public loadSync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;
    .locals 8

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-nez p2, :cond_0

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p0, p3}, Lcom/miui/gallery/sdk/download/ImageDownloader;->ensureDownloadOptions(Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->getUriAdapter()Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getLockForUri(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/sdk/download/ImageDownloader;->mEngine:Lcom/miui/gallery/sdk/download/DownloadEngine;

    invoke-virtual {v3, p2}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getDownloader(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    move-result-object v4

    if-nez v4, :cond_1

    return-object v0

    :cond_1
    const/4 v5, 0x1

    new-array v5, v5, [Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    new-instance v0, Lcom/miui/gallery/sdk/download/ImageDownloader$1;

    invoke-direct {v0, p0, v5}, Lcom/miui/gallery/sdk/download/ImageDownloader$1;-><init>(Lcom/miui/gallery/sdk/download/ImageDownloader;[Lcom/miui/gallery/sdk/download/assist/DownloadedItem;)V

    new-instance v7, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    invoke-direct {v7}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;-><init>()V

    invoke-virtual {v7, p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUri(Landroid/net/Uri;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setType(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUriAdapter(Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setUriLock(Ljava/util/concurrent/locks/ReentrantLock;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setDownloadListener(Lcom/miui/gallery/sdk/download/listener/DownloadListener;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1, v3}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setDownloader(Lcom/miui/gallery/sdk/download/downloader/IDownloader;)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequirePower()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequirePower(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireCharging()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireCharging(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireWLAN()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isRequireDeviceStorage()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setRequireDeviceStorage(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p3}, Lcom/miui/gallery/sdk/download/DownloadOptions;->isManual()Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->setManual(Z)Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem$Builder;->build()Lcom/miui/gallery/sdk/download/assist/DownloadItem;

    move-result-object p1

    new-instance p2, Ljava/util/LinkedList;

    invoke-direct {p2}, Ljava/util/LinkedList;-><init>()V

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object p1, v4, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    iget-object p3, v4, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    invoke-interface {v3, p1, p3, p2}, Lcom/miui/gallery/sdk/download/downloader/IDownloader;->download(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Ljava/util/List;)V

    aget-object p1, v5, v6

    return-object p1

    :cond_2
    :goto_0
    return-object v0
.end method
