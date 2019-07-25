.class public abstract Lcom/miui/gallery/assistant/process/BaseImageTask;
.super Lcom/miui/gallery/pendingtask/base/PendingTask;
.source "BaseImageTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/pendingtask/base/PendingTask<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTask;-><init>(I)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask;->TAG:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/assistant/process/BaseImageTask;->downloadImage(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private calculateAllImageFeature(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)V
    .locals 8

    if-eqz p1, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    sget-object v0, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    array-length v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v3, v2, :cond_2

    aget v5, v0, v3

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v6

    invoke-virtual {v6, v5}, Lcom/miui/gallery/assistant/model/ImageFeature;->isFeatureDone(I)Z

    move-result v6

    if-nez v6, :cond_0

    invoke-static {v4, v5}, Lcom/miui/gallery/util/assistant/FlagUtil;->setFlag(II)I

    move-result v4

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    sget v4, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL:I

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->PRIORITY_NORMAL:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    invoke-virtual {v0, v2, p1, v1, v4}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->handleImageWithAlgorithmSync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZI)Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;->getResultCode()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4

    :cond_3
    new-instance v0, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v3

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getSha1()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v6

    move-object v2, v0

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/assistant/model/ImageFeature;-><init>(JLjava/lang/String;J)V

    const/4 p1, -0x1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->setImageType(I)V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/dao/GalleryEntityManager;->insert(Lcom/miui/gallery/dao/base/Entity;)Z

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask;->TAG:Ljava/lang/String;

    const-string v1, "insert image %d feature, image path is null"

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->getImageId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_4
    return-void
.end method

.method private static downloadImage(JLcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    if-ne p2, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-nez v0, :cond_3

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-static {p0, p1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object p0

    new-instance p1, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    invoke-static {p2}, Lcom/miui/gallery/Config$ImageDownload;->requireWLAN(Lcom/miui/gallery/sdk/download/DownloadType;)Z

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireWLAN(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequireCharging(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setRequirePower(Z)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object p1

    invoke-static {}, Lcom/miui/gallery/sdk/download/ImageDownloader;->getInstance()Lcom/miui/gallery/sdk/download/ImageDownloader;

    move-result-object v0

    invoke-virtual {v0, p0, p2, p1}, Lcom/miui/gallery/sdk/download/ImageDownloader;->loadSync(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;Lcom/miui/gallery/sdk/download/DownloadOptions;)Lcom/miui/gallery/sdk/download/assist/DownloadedItem;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/sdk/download/assist/DownloadedItem;->getFilePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    :goto_0
    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "no account."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_3
    new-instance p0, Ljava/lang/RuntimeException;

    const-string p1, "network invalid."

    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static getImageFilePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;Z)Lcom/miui/gallery/threadpool/Future;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            "Z)",
            "Lcom/miui/gallery/threadpool/Future<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/assistant/process/BaseImageTask$ImageGuaranteeJob;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;Z)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;)Lcom/miui/gallery/threadpool/Future;

    move-result-object p0

    return-object p0
.end method

.method protected static getSelectedImages(Ljava/util/List;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->hasClusterFeature()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->isDocumentImage()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/ImageFeature;->isPoorImage()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object p0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0, v0, v2, v3}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->calculateClusterGroupSync(Ljava/util/List;ZZ)Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;

    move-result-object p0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;->getResultCode()I

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;->getClusters()Ljava/util/List;

    move-result-object p0

    new-instance v2, Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;

    invoke-direct {v2, v0, p0}, Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;-><init>(Ljava/util/List;Ljava/util/List;)V

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p0

    if-eqz p0, :cond_2

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/ImageFeatureGroupSet;->getSelectedImages()Ljava/util/List;

    move-result-object v1

    :cond_2
    return-object v1

    :cond_3
    return-object v1
.end method

.method public static queryMediaItem(Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->PROJECTION:[Ljava/lang/String;

    const-string v5, "mixedDateTime ASC"

    new-instance v6, Lcom/miui/gallery/assistant/process/BaseImageTask$1;

    invoke-direct {v6}, Lcom/miui/gallery/assistant/process/BaseImageTask$1;-><init>()V

    const/4 v4, 0x0

    move-object v3, p0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method protected static queryMediaItemByIds(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/miui/gallery/card/scenario/ScenarioConstants;->CAMERA_BASE_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "_id"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " IN (\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\',\'"

    invoke-static {v1, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\')"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, " AND "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/assistant/process/BaseImageTask;->queryMediaItem(Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method getAllProcessedSuccessImages()Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v1

    const-string v2, "imageId"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/miui/gallery/assistant/model/ImageFeature;->ALL_PROCESSED_SELECTION:Ljava/lang/String;

    const-class v2, Lcom/miui/gallery/assistant/model/ImageFeature;

    const-string v8, "imageId ASC"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v9, 0x0

    invoke-virtual/range {v1 .. v9}, Lcom/miui/gallery/dao/base/EntityManager;->rawQuery(Ljava/lang/Class;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_1

    :goto_0
    :try_start_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "imageId"

    invoke-static {v1, v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->getLong(Landroid/database/Cursor;Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    throw v0

    :cond_1
    :goto_1
    return-object v0
.end method

.method public abstract onGetImageDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
.end method

.method public bridge synthetic parseData([B)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->parseData([B)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method public final parseData([B)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    new-instance p1, Lorg/json/JSONObject;

    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    goto :goto_0

    :cond_0
    new-instance v0, Lorg/json/JSONObject;

    new-instance v1, Ljava/lang/String;

    const-string v2, "utf-8"

    invoke-direct {v1, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    move-object p1, v0

    :goto_0
    return-object p1
.end method

.method protected processImages(Lorg/json/JSONObject;Ljava/util/List;ZZ)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;ZZ)Z"
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p4

    const/4 v0, 0x1

    if-eqz p4, :cond_4

    invoke-static {p2}, Lcom/miui/gallery/card/CardUtil;->bindImageFeatures(Ljava/util/List;)V

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object p4

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageProcessLibraries:[Ljava/lang/Long;

    invoke-virtual {p4, v1}, Lcom/miui/gallery/assistant/library/LibraryManager;->loadLibrary([Ljava/lang/Long;)Z

    move-result p4

    const/4 v1, 0x0

    if-eqz p4, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/BaseImageTask;->TAG:Ljava/lang/String;

    const-string p4, "processing %d images"

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, p4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/process/BaseImageTask;->onGetImageDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object p1

    if-eqz p1, :cond_2

    const/4 p1, 0x1

    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p4

    if-ge p1, p4, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    add-int/lit8 p4, p1, -0x1

    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {p0, v4}, Lcom/miui/gallery/assistant/process/BaseImageTask;->calculateAllImageFeature(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)V

    iget-object v4, p0, Lcom/miui/gallery/assistant/process/BaseImageTask;->TAG:Ljava/lang/String;

    const-string v5, "Image %d ImageFeature Algorithm time: %d"

    invoke-interface {p2, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v4, v5, p4, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p1

    sub-int/2addr p1, v0

    invoke-interface {p2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->calculateAllImageFeature(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)V

    if-eqz p3, :cond_1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object p1

    invoke-virtual {p1, p2, v0, v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->calculateClusterGroupSync(Ljava/util/List;ZZ)Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;->getResultCode()I

    move-result p1

    if-eqz p1, :cond_1

    return v1

    :cond_1
    return v0

    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "onGetImageDownloadType in Sub class return null!"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    iget-object p2, p0, Lcom/miui/gallery/assistant/process/BaseImageTask;->TAG:Ljava/lang/String;

    const-string p3, "loadLibrary fail, schedule download task!"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Lorg/json/JSONObject;

    invoke-direct {p2}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string p3, "originalType"

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/process/BaseImageTask;->getType()I

    move-result p4

    invoke-virtual {p2, p3, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string p3, "originalData"

    invoke-virtual {p2, p3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string p1, "libraryIds"

    sget-object p3, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageProcessLibraries:[Ljava/lang/Long;

    invoke-static {p3}, Lcom/miui/gallery/util/GsonUtils;->toString(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :goto_1
    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/4 p3, 0x7

    const-class p4, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;

    invoke-virtual {p4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p4

    invoke-virtual {p1, p3, p2, p4}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    return v1

    :cond_4
    return v0
.end method

.method public bridge synthetic wrapData(Ljava/lang/Object;)[B
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;->wrapData(Lorg/json/JSONObject;)[B

    move-result-object p1

    return-object p1
.end method

.method public final wrapData(Lorg/json/JSONObject;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "utf-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    :goto_0
    return-object p1
.end method
