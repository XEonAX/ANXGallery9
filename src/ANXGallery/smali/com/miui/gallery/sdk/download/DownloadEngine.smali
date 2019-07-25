.class Lcom/miui/gallery/sdk/download/DownloadEngine;
.super Ljava/lang/Object;
.source "DownloadEngine.java"


# static fields
.field private static final sDownloaderMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

.field private static final sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

.field private static final sExecutorsMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/miui/gallery/sdk/download/DownloadType;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final mDefaultDownloadOptions:Lcom/miui/gallery/sdk/download/DownloadOptions;

.field private final mUriLocks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/concurrent/locks/ReentrantLock;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v0, 0x5

    new-array v0, v0, [Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    const/4 v0, 0x4

    new-array v1, v0, [Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    sput-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    sput-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v3, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v1, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v5, 0x2

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v1, v2, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    const/4 v6, 0x3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v1, v2, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    sget-object v2, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_FORCE:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->ORIGIN_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO_BATCH:Lcom/miui/gallery/sdk/download/DownloadType;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;-><init>()V

    new-instance v1, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;

    invoke-direct {v1}, Lcom/miui/gallery/sdk/download/adapter/BaseUriAdapter;-><init>()V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->setUriAdapter(Lcom/miui/gallery/sdk/download/adapter/IUriAdapter;)Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/download/DownloadOptions$Builder;->build()Lcom/miui/gallery/sdk/download/DownloadOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/DownloadEngine;->mDefaultDownloadOptions:Lcom/miui/gallery/sdk/download/DownloadOptions;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/sdk/download/DownloadEngine;->mUriLocks:Ljava/util/Map;

    return-void
.end method

.method private static createDownloader(I)Lcom/miui/gallery/sdk/download/downloader/IDownloader;
    .locals 3

    packed-switch p0, :pswitch_data_0

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unsupported type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance p0, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;-><init>()V

    return-object p0

    :pswitch_1
    new-instance p0, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/OriginDownloader;-><init>()V

    return-object p0

    :pswitch_2
    new-instance p0, Lcom/miui/gallery/sdk/download/downloader/ThumbnailDownloader;

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/ThumbnailDownloader;-><init>()V

    return-object p0

    :pswitch_3
    new-instance p0, Lcom/miui/gallery/sdk/download/downloader/MicroThumbnailDownloader;

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/MicroThumbnailDownloader;-><init>()V

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static createExecutor(I)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;
    .locals 3

    const/4 v0, 0x1

    const/16 v1, 0x64

    const/4 v2, -0x1

    packed-switch p0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalidate executor type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;

    const/16 v0, 0x19

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;-><init>(II)V

    return-object p0

    :pswitch_1
    new-instance p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    const/16 v0, 0xa

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;-><init>(II)V

    return-object p0

    :pswitch_2
    new-instance p0, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;

    invoke-direct {p0, v0, v2}, Lcom/miui/gallery/sdk/download/executor/SingleThreadExecutor;-><init>(II)V

    return-object p0

    :pswitch_3
    new-instance p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;-><init>(II)V

    return-object p0

    :pswitch_4
    new-instance p0, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;

    const/16 v0, 0x8

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/sdk/download/executor/ThreadPoolExecutor;-><init>(II)V

    return-object p0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private generateLockKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;
    .locals 2

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine$1;->$SwitchMap$com$miui$gallery$sdk$download$DownloadType:[I

    invoke-virtual {p2}, Lcom/miui/gallery/sdk/download/DownloadType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    invoke-static {p1, p2}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->generateKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_0
    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const-string p2, "type"

    const-string v0, "micro"

    invoke-virtual {p1, p2, v0}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_1
    invoke-virtual {p1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private static getExecutor(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;
    .locals 3

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutorsMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    aget-object v1, v1, p0

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    invoke-static {p0}, Lcom/miui/gallery/sdk/download/DownloadEngine;->createExecutor(I)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    move-result-object v2

    aput-object v2, v1, p0

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    aget-object p0, v1, p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method


# virtual methods
.method public cancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getExecutor(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->cancel(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result p1

    return p1
.end method

.method public cancelAll()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    array-length v1, v1

    if-ge v0, v1, :cond_1

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    aget-object v1, v1, v0

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sExecutors:[Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->cancelAll()V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public cancelAll(Lcom/miui/gallery/sdk/download/DownloadType;)V
    .locals 0

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getExecutor(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->cancelAll()V

    return-void
.end method

.method public contains(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getExecutor(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->contains(Lcom/miui/gallery/sdk/download/assist/DownloadItem;)Z

    move-result p1

    return p1
.end method

.method public download(Lcom/miui/gallery/sdk/download/assist/DownloadItem;ZZ)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getKey()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/download/assist/DownloadItem;->getType()Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/sdk/download/DownloadEngine;->getExecutor(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/sdk/download/executor/AbsDownloadExecutor;->download(Lcom/miui/gallery/sdk/download/assist/DownloadItem;ZZ)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Invalid download item"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getDownloader(Lcom/miui/gallery/sdk/download/DownloadType;)Lcom/miui/gallery/sdk/download/downloader/IDownloader;
    .locals 3

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaderMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    aget-object v1, v1, p1

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    invoke-static {p1}, Lcom/miui/gallery/sdk/download/DownloadEngine;->createDownloader(I)Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    move-result-object v2

    aput-object v2, v1, p1

    :cond_0
    sget-object v1, Lcom/miui/gallery/sdk/download/DownloadEngine;->sDownloaders:[Lcom/miui/gallery/sdk/download/downloader/IDownloader;

    aget-object p1, v1, p1

    monitor-exit v0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getLockForUri(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/util/concurrent/locks/ReentrantLock;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/sdk/download/DownloadEngine;->mUriLocks:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/sdk/download/DownloadEngine;->generateLockKey(Landroid/net/Uri;Lcom/miui/gallery/sdk/download/DownloadType;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/sdk/download/DownloadEngine;->mUriLocks:Ljava/util/Map;

    invoke-interface {p2, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/util/concurrent/locks/ReentrantLock;

    if-nez p2, :cond_0

    new-instance p2, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {p2}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/sdk/download/DownloadEngine;->mUriLocks:Ljava/util/Map;

    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    monitor-exit v0

    return-object p2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
