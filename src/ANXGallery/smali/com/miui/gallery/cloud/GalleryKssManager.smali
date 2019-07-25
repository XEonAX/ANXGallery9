.class public Lcom/miui/gallery/cloud/GalleryKssManager;
.super Ljava/lang/Object;
.source "GalleryKssManager.java"


# static fields
.field private static sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    sput-object v0, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    return-void
.end method

.method private static declared-synchronized createRequestor(ZZ)Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)",
            "Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;"
        }
    .end annotation

    const-class v0, Lcom/miui/gallery/cloud/GalleryKssManager;

    monitor-enter v0

    xor-int/lit8 v1, p0, 0x1

    if-eqz p1, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    :goto_0
    add-int/2addr v1, v2

    :try_start_0
    sget-object v2, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    aget-object v2, v2, v1

    if-nez v2, :cond_3

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_1

    const/4 p0, 0x0

    monitor-exit v0

    return-object p0

    :cond_1
    :try_start_1
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/CloudUrlProvider;->getUrlProvider(ZZ)Lcom/miui/gallery/cloud/CloudUrlProvider;

    move-result-object p1

    if-eqz p0, :cond_2

    new-instance p0, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;

    iget-object v2, v2, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    invoke-direct {p0, v2, p1}, Lcom/miui/gallery/cloud/CloudGallerySharerRequestor;-><init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/CloudUrlProvider;)V

    goto :goto_1

    :cond_2
    new-instance p0, Lcom/miui/gallery/cloud/CloudGalleryOwnerRequestor;

    iget-object v2, v2, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    invoke-direct {p0, v2, p1}, Lcom/miui/gallery/cloud/CloudGalleryOwnerRequestor;-><init>(Landroid/accounts/Account;Lcom/miui/gallery/cloud/CloudUrlProvider;)V

    :goto_1
    sget-object p1, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    new-instance v2, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    invoke-direct {v2, v3, p0}, Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;-><init>(Landroid/content/Context;Lcom/xiaomi/micloudsdk/file/MiCloudFileRequestor;)V

    aput-object v2, p1, v1

    :cond_3
    sget-object p0, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    aget-object p0, p0, v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method private static doDownload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            "Ljava/lang/String;",
            "Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    if-nez p0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->getMiCloudProvider()Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;

    move-result-object p2

    invoke-interface {p2, p0, p1, v0, p3}, Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;->doFileSDKDownload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    return-void
.end method

.method public static doOwnerDownload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->createRequestor(ZZ)Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    move-result-object v0

    invoke-static {v0, p0, p1, p2}, Lcom/miui/gallery/cloud/GalleryKssManager;->doDownload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    return-void
.end method

.method public static doOwnerUpload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v0

    const/4 v1, 0x0

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->createRequestor(ZZ)Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->getMiCloudProvider()Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/UploadTransferLisener;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/UploadTransferLisener;-><init>(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    invoke-interface {v1, v0, p0, p1, v2}, Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;->doFileSDKUpload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    :cond_0
    return-void
.end method

.method public static doSharerDownload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->createRequestor(ZZ)Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    move-result-object v0

    invoke-static {v0, p0, p1, p2}, Lcom/miui/gallery/cloud/GalleryKssManager;->doDownload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/lang/String;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    return-void
.end method

.method public static doSharerUpload(Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/xiaomi/opensdk/exception/RetriableException;,
            Lcom/xiaomi/opensdk/exception/UnretriableException;,
            Lcom/xiaomi/opensdk/exception/AuthenticationException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/GalleryKssManager;->createRequestor(ZZ)Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->getMiCloudProvider()Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/cloud/UploadTransferLisener;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/UploadTransferLisener;-><init>(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    invoke-interface {v1, v0, p0, p1, v2}, Lcom/miui/gallery/util/deviceprovider/MiCloudProviderInterface;->doFileSDKUpload(Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;Lcom/miui/gallery/cloud/RequestCloudItem;Ljava/io/File;Lcom/xiaomi/opensdk/file/model/MiCloudFileListener;)V

    :cond_0
    return-void
.end method

.method public static declared-synchronized reset()V
    .locals 4

    const-class v0, Lcom/miui/gallery/cloud/GalleryKssManager;

    monitor-enter v0

    const/4 v1, 0x0

    :goto_0
    :try_start_0
    sget-object v2, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    sget-object v2, Lcom/miui/gallery/cloud/GalleryKssManager;->sMaster:[Lcom/xiaomi/micloudsdk/file/MiCloudFileMaster;

    const/4 v3, 0x0

    aput-object v3, v2, v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
