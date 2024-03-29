.class public Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;
.super Lcom/miui/gallery/sdk/download/downloader/MicroThumbnailDownloader;
.source "MicroBatchDownloader.java"


# static fields
.field private static final mScheduler:Lmiui/util/SoftReferenceSingleton;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lmiui/util/SoftReferenceSingleton<",
            "Lio/reactivex/Scheduler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader$1;

    invoke-direct {v0}, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;->mScheduler:Lmiui/util/SoftReferenceSingleton;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/sdk/download/downloader/MicroThumbnailDownloader;-><init>()V

    return-void
.end method

.method public static synthetic lambda$doFileDownload$42(Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;Lorg/json/JSONObject;Lcom/miui/gallery/sdk/download/assist/RequestItem;)Ljava/lang/Boolean;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    iget-object v0, p2, Lcom/miui/gallery/sdk/download/assist/RequestItem;->mDBItem:Lcom/miui/gallery/data/DBImage;

    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getRequestId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;->downloadFileItem(Lcom/miui/gallery/sdk/download/assist/RequestItem;Lorg/json/JSONObject;)Z

    move-result p1

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method protected doFileDownload(Ljava/util/List;Lorg/json/JSONObject;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/download/assist/RequestItem;",
            ">;",
            "Lorg/json/JSONObject;",
            ")V"
        }
    .end annotation

    invoke-static {p1}, Lio/reactivex/Flowable;->fromIterable(Ljava/lang/Iterable;)Lio/reactivex/Flowable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Flowable;->parallel()Lio/reactivex/parallel/ParallelFlowable;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;->mScheduler:Lmiui/util/SoftReferenceSingleton;

    invoke-virtual {v0}, Lmiui/util/SoftReferenceSingleton;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lio/reactivex/Scheduler;

    invoke-virtual {p1, v0}, Lio/reactivex/parallel/ParallelFlowable;->runOn(Lio/reactivex/Scheduler;)Lio/reactivex/parallel/ParallelFlowable;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/sdk/download/downloader/-$$Lambda$MicroBatchDownloader$lizWHcnvq5Eiyv0lbX2LSs7FaCg;

    invoke-direct {v0, p0, p2}, Lcom/miui/gallery/sdk/download/downloader/-$$Lambda$MicroBatchDownloader$lizWHcnvq5Eiyv0lbX2LSs7FaCg;-><init>(Lcom/miui/gallery/sdk/download/downloader/MicroBatchDownloader;Lorg/json/JSONObject;)V

    invoke-virtual {p1, v0}, Lio/reactivex/parallel/ParallelFlowable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/parallel/ParallelFlowable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/parallel/ParallelFlowable;->sequential()Lio/reactivex/Flowable;

    move-result-object p1

    invoke-virtual {p1}, Lio/reactivex/Flowable;->blockingSubscribe()V

    return-void
.end method

.method protected getTag()Ljava/lang/String;
    .locals 1

    const-string v0, "MicroBatchDownloader"

    return-object v0
.end method

.method protected shouldWaitUriLock()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
