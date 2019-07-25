.class public Lcom/miui/gallery/assistant/manager/ImageFeatureManager;
.super Ljava/lang/Object;
.source "ImageFeatureManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/assistant/manager/ImageFeatureManager$ImageFeatureMangerHolder;
    }
.end annotation


# static fields
.field private static sIsSupportImageFeatureSelection:Z

.field private static final sWhiteList:[Ljava/lang/String;


# instance fields
.field private volatile mHasMoreImageToProcess:Z

.field private final mImageDeleteRunnable:Ljava/lang/Runnable;

.field private final mImageFeatureReusedBitCache:Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;

.field private volatile mIsCaculating:Z

.field private final mThreadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 27

    const-string v0, "dipper"

    const-string v1, "ursa"

    const-string v2, "jason"

    const-string v3, "wayne"

    const-string v4, "platina"

    const-string v5, "chiron"

    const-string v6, "sagit"

    const-string v7, "polaris"

    const-string v8, "perseus"

    const-string v9, "equuleus"

    const-string v10, "sirius"

    const-string v11, "comet"

    const-string v12, "lavender"

    const-string v13, "capricorn"

    const-string v14, "lithium"

    const-string v15, "natrium"

    const-string v16, "scorpio"

    const-string v17, "gemini"

    const-string v18, "cepheus"

    const-string v19, "davinci"

    const-string v20, "davinciin"

    const-string v21, "grus"

    const-string v22, "raphael"

    const-string v23, "raphaelin"

    const-string v24, "pyxis"

    const-string v25, "vela"

    const-string v26, "crux"

    filled-new-array/range {v0 .. v26}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->sWhiteList:[Ljava/lang/String;

    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->sIsSupportImageFeatureSelection:Z

    sget-object v1, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->sWhiteList:[Ljava/lang/String;

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_1

    aget-object v3, v1, v0

    sget-object v4, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    sput-boolean v3, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->sIsSupportImageFeatureSelection:Z

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private constructor <init>()V
    .locals 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mHasMoreImageToProcess:Z

    new-instance v1, Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;

    invoke-direct {v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageFeatureReusedBitCache:Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;

    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v7, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v8, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v8}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    const/4 v3, 0x1

    const/4 v4, 0x2

    const-wide/16 v5, 0x1e

    move-object v2, v1

    invoke-direct/range {v2 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mThreadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    iget-object v1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mThreadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mIsCaculating:Z

    new-instance v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$1;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    iput-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageDeleteRunnable:Ljava/lang/Runnable;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;-><init>()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->deleteImageFromCard()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->deleteImagesFromCard()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->scheduleNewImages()V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;Z)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->markCaculateState(Z)Z

    move-result p0

    return p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mHasMoreImageToProcess:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mHasMoreImageToProcess:Z

    return p1
.end method

.method private createImagesDeleteRunnable()Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$2;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    return-object v0
.end method

.method private createNewImageCalculateRunnable()Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$3;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    return-object v0
.end method

.method private deleteImageFromCard()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mThreadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->createImagesDeleteRunnable()Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private declared-synchronized deleteImagesFromCard()V
    .locals 6

    monitor-enter p0

    :try_start_0
    const-string v2, "imageId>0 AND version=2 AND imageType=2"

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/assistant/model/ImageFeature;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/dao/GalleryEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    const-string v1, "ImageFeatureManager"

    const-string v2, "Delete %d images,search them in cards"

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/ImageFeature;->getSha1()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/CardManager;->onDeleteImages(Ljava/util/List;)V

    :cond_2
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "imageType"

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "%s IN (\'%s\')"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    const-string v5, "sha1"

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-string v5, "\',\'"

    invoke-static {v5, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {}, Lcom/miui/gallery/dao/GalleryEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryEntityManager;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/assistant/model/ImageFeature;

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, v1, v4}, Lcom/miui/gallery/dao/GalleryEntityManager;->update(Ljava/lang/Class;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private ensureImagePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)Z
    .locals 7

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImagePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sget-object v3, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {p1, v3, v2}, Lcom/miui/gallery/assistant/process/BaseImageTask;->getImageFilePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Lcom/miui/gallery/sdk/download/DownloadType;Z)Lcom/miui/gallery/threadpool/Future;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/Future;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    const-string v3, "ImageFeatureManager"

    const-string v4, "get micro thumb image using time:%d ms"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    sub-long/2addr v5, v0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    move-object p1, v0

    :goto_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    xor-int/2addr p1, v2

    return p1
.end method

.method public static filterNearByImages(Ljava/util/List;)Ljava/util/List;
    .locals 9
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

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v1, 0x0

    move-wide v3, v1

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v6

    if-nez v6, :cond_0

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    invoke-virtual {v6}, Lcom/miui/gallery/assistant/model/ImageFeature;->getClusterGroupId()J

    move-result-wide v6

    cmp-long v8, v6, v1

    if-nez v8, :cond_1

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    cmp-long v8, v3, v1

    if-nez v8, :cond_2

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-wide v3, v6

    goto :goto_0

    :cond_2
    cmp-long v8, v3, v6

    if-nez v8, :cond_3

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method public static getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$ImageFeatureMangerHolder;->access$100()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    return-object v0
.end method

.method private getUnProcessedImages(Ljava/util/List;I)Ljava/util/List;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;I)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_4

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_4

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v3

    if-eqz v3, :cond_0

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v3

    if-nez v3, :cond_0

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_0
    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->isSelectionFeatureDone()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v3}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v4

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v6

    const-wide/32 v8, 0x36ee80

    invoke-static/range {v4 .. v9}, Lcom/miui/gallery/card/scenario/DateUtils;->withinTime(JJJ)Z

    move-result v3

    if-eqz v3, :cond_2

    :cond_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lt v2, p2, :cond_3

    goto :goto_2

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {p0, p2}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->ensureImagePath(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)Z

    move-result p2

    if-nez p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_3

    :cond_6
    return-object v0
.end method

.method public static isDeviceSupportImageFeatureSelection()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->sIsSupportImageFeatureSelection:Z

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isPad()Z

    move-result v0

    if-nez v0, :cond_0

    sget-boolean v0, Lcom/miui/os/Rom;->IS_MIUI:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isDeviceSupportStoryFunction()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isInternational()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/BuildUtil;->isPad()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isImageFeatureCalculationEnable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportImageFeatureSelection()Z

    move-result v0

    return v0
.end method

.method public static isImageFeatureSelectionVisiable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->isImageSelectionFunctionOn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static isStoryGenerateEnable()Z
    .locals 1

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isDeviceSupportStoryFunction()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->isStoryFunctionOn()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private markCaculateState(Z)Z
    .locals 3

    const-string v0, "ImageFeatureManager"

    const-string v1, "New image Caculating : %b"

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput-boolean p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mIsCaculating:Z

    iget-boolean p1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mIsCaculating:Z

    return p1
.end method

.method public static queryNearByMediaItems(J)Ljava/util/List;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    const-string v0, "%s < %s AND %s > %s"

    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "mixedDateTime"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    const-string v2, "mixedDateTime"

    const/4 v3, 0x2

    aput-object v2, v1, v3

    const-wide/32 v2, 0x36ee80

    sub-long/2addr p0, v2

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    const/4 p1, 0x3

    aput-object p0, v1, p1

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->PROJECTION:[Ljava/lang/String;

    const-string v7, "mixedDateTime DESC"

    new-instance v8, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$6;

    invoke-direct {v8}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$6;-><init>()V

    const/4 v6, 0x0

    invoke-static/range {v2 .. v8}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    return-object p0
.end method

.method private scheduleNewImages()V
    .locals 13

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isAppProcessInForeground(Landroid/content/Context;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "ImageFeatureManager"

    const-string v2, "Status meet,trigger new image feature calculation"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$4;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    const-string v2, "ImageFeatureManager"

    const-string v3, "Start process recent %d images for image selection"

    const/16 v4, 0xc8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2, v3, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v6

    sget-object v2, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v2, v4}, Lcom/miui/gallery/util/UriUtil;->appendLimit(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v7

    sget-object v8, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->PROJECTION:[Ljava/lang/String;

    sget-object v9, Lcom/miui/gallery/card/scenario/ScenarioConstants;->ALL_IMAGE_BASE_SELECTION:Ljava/lang/String;

    const/4 v10, 0x0

    const-string v11, "mixedDateTime DESC"

    new-instance v12, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$5;

    invoke-direct {v12, p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager$5;-><init>(Lcom/miui/gallery/assistant/manager/ImageFeatureManager;)V

    invoke-static/range {v6 .. v12}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {v2}, Lcom/miui/gallery/card/CardUtil;->bindImageFeatures(Ljava/util/List;)V

    const/16 v3, 0x1e

    invoke-direct {p0, v2, v3}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getUnProcessedImages(Ljava/util/List;I)Ljava/util/List;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-lt v4, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mHasMoreImageToProcess:Z

    sget-object v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->PRIORITY_NORMAL:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    sget v3, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL:I

    invoke-virtual {p0, v1, v2, v3, v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->calculateImageFeatureAndGroupAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Ljava/util/List;ILcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    return-void

    :cond_1
    invoke-direct {p0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->markCaculateState(Z)Z

    return-void
.end method


# virtual methods
.method public calculateClusterGroupAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Ljava/util/List;ZZLcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;ZZ",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener<",
            "Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;",
            ">;)V"
        }
    .end annotation

    invoke-static {p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ImageFeatureManager"

    const-string v1, "calculateClusterGroupAsync,image count:%d"

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;

    new-instance v1, Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;

    invoke-direct {v1, p2, p3}, Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;-><init>(Ljava/util/List;Z)V

    invoke-direct {v0, p1, v1, p4}, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;Z)V

    invoke-virtual {v0, p5}, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;->setMainThreadListener(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;->execute()V

    :cond_0
    return-void
.end method

.method public calculateClusterGroupSync(Ljava/util/List;ZZ)Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;ZZ)",
            "Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ImageFeatureManager"

    const-string v1, "calculateClusterGroupSync,image count:%d"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;

    sget-object v1, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;->PRIORITY_NORMAL:Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;

    new-instance v2, Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;

    invoke-direct {v2, p1, p2}, Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;-><init>(Ljava/util/List;Z)V

    invoke-direct {v0, v1, v2, p3}, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ClusteGroupRequestParams;Z)V

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/request/ClusterGroupRequest;->executeSync()Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;

    return-object p1

    :cond_0
    new-instance p1, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;

    const/4 p2, 0x3

    invoke-direct {p1, p2}, Lcom/miui/gallery/assistant/manager/result/ClusteGroupResult;-><init>(I)V

    return-object p1
.end method

.method public calculateImageFeatureAndGroupAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Ljava/util/List;ILcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;I",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;",
            ")V"
        }
    .end annotation

    invoke-static/range {p2 .. p2}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "ImageFeatureManager"

    const-string v1, "Calculate imageGroup with algorithm async,image count:%d"

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v1

    if-nez v1, :cond_1

    move/from16 v6, p3

    move v8, v6

    goto :goto_2

    :cond_1
    sget-object v1, Lcom/miui/gallery/assistant/algorithm/Algorithm;->FLAG_FEATURE_ALL_ARRAY:[I

    array-length v2, v1

    const/4 v3, 0x0

    const/4 v5, 0x0

    :goto_1
    if-ge v3, v2, :cond_3

    aget v6, v1, v3

    move/from16 v8, p3

    invoke-static {v8, v6}, Lcom/miui/gallery/util/assistant/FlagUtil;->hasFlag(II)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/miui/gallery/assistant/model/ImageFeature;->isFeatureDone(I)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-static {v5, v6}, Lcom/miui/gallery/util/assistant/FlagUtil;->setFlag(II)I

    move-result v5

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_3
    move/from16 v8, p3

    move v6, v5

    :goto_2
    if-eqz v6, :cond_0

    const/4 v5, 0x1

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->handleImageWithAlgorithmAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZILcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    goto :goto_0

    :cond_4
    const/4 v11, 0x1

    const/4 v12, 0x1

    move-object v8, p0

    move-object v9, p1

    move-object/from16 v10, p2

    move-object/from16 v13, p4

    invoke-virtual/range {v8 .. v13}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->calculateClusterGroupAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Ljava/util/List;ZZLcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    goto :goto_3

    :cond_5
    if-eqz p4, :cond_6

    invoke-interface/range {p4 .. p4}, Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;->onCancel()V

    :cond_6
    :goto_3
    return-void
.end method

.method public getReusedBitMap(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageFeatureReusedBitCache:Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;->get(Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1

    const-string v0, "ImageFeatureManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "get reused bitmap :"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public handleImageWithAlgorithmAsync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZILcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            "ZI",
            "Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener<",
            "Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;",
            ">;)V"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;

    new-instance v1, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-direct {v1, p2, p3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Z)V

    invoke-direct {v0, p1, v1, p4}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;I)V

    invoke-virtual {v0, p5}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->setMainThreadListener(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Listener;)V

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->execute()V

    return-void
.end method

.method public handleImageWithAlgorithmSync(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/model/MediaFeatureItem;ZI)Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;
    .locals 2

    new-instance v0, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;

    new-instance v1, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;

    invoke-direct {v1, p2, p3}, Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;-><init>(Lcom/miui/gallery/assistant/model/MediaFeatureItem;Z)V

    invoke-direct {v0, p1, v1, p4}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;-><init>(Lcom/miui/gallery/assistant/manager/AlgorithmRequest$Priority;Lcom/miui/gallery/assistant/manager/request/param/ImageFeatureBitmapRequestParams;I)V

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/request/BatchImageAlgorithmRequest;->executeSync()Lcom/miui/gallery/assistant/manager/result/AlgorithmResult;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/manager/result/BatchAlgorithmResult;

    return-object p1
.end method

.method public isNewImageCalculationEnable()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/assistant/library/LibraryConstants;->sImageFeatureSelectionLibraries:[Ljava/lang/Long;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/assistant/library/LibraryManager;->isLibrarysExist([Ljava/lang/Long;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public onImageBatchDelete(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->onImageDeleteBatch(Ljava/util/List;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ImageFeatureManager"

    const-string v1, "%d Images delete or add to secret batch, delete them in cards"

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageDeleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageDeleteRunnable:Ljava/lang/Runnable;

    const-wide/16 v1, 0xbb8

    invoke-virtual {p1, v0, v1, v2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public onImageDelete(J)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->onImageDelete(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "ImageFeatureManager"

    const-string v1, "Image %s delete or add to secret, delete them in cards"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageDeleteRunnable:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Lcom/android/internal/CompatHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageDeleteRunnable:Ljava/lang/Runnable;

    const-wide/16 v0, 0xbb8

    invoke-virtual {p1, p2, v0, v1}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public onImageDelete(Ljava/lang/String;)V
    .locals 2

    :try_start_0
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->onImageDelete(J)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v0, "ImageFeatureManager"

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method

.method public recycleBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mImageFeatureReusedBitCache:Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/assistant/manager/ImageFeatureReusedBitCache;->put(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method public triggerNewImageCalculation()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isNewImageCalculationEnable()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "ImageFeatureManager"

    const-string v1, "ImageFeature Selection Disable or Libraries not exist"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mIsCaculating:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mIsCaculating:Z

    iget-object v0, p0, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->mThreadPoolExecutor:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-direct {p0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->createNewImageCalculateRunnable()Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
