.class public Lcom/miui/gallery/assistant/library/LibraryDownloadTask;
.super Lcom/miui/gallery/pendingtask/base/PendingTask;
.source "LibraryDownloadTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/pendingtask/base/PendingTask<",
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field private final mDownloadFutures:Ljava/util/Map;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseSparseArrays"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Lcom/miui/gallery/threadpool/Future;",
            ">;"
        }
    .end annotation
.end field

.field private final mDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

.field private mOriginalData:Lorg/json/JSONObject;

.field private mOriginalType:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/pendingtask/base/PendingTask;-><init>(I)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    invoke-static {p1}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mDownloadFutures:Ljava/util/Map;

    new-instance p1, Lcom/miui/gallery/assistant/library/LibraryDownloadTask$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/assistant/library/LibraryDownloadTask$1;-><init>(Lcom/miui/gallery/assistant/library/LibraryDownloadTask;)V

    iput-object p1, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/assistant/library/LibraryDownloadTask;)Ljava/util/Map;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mDownloadFutures:Ljava/util/Map;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/assistant/library/LibraryDownloadTask;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mOriginalType:I

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/assistant/library/LibraryDownloadTask;)Lorg/json/JSONObject;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mOriginalData:Lorg/json/JSONObject;

    return-object p0
.end method


# virtual methods
.method public getNetworkType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic parseData([B)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->parseData([B)Lorg/json/JSONObject;

    move-result-object p1

    return-object p1
.end method

.method public parseData([B)Lorg/json/JSONObject;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lorg/json/JSONObject;

    new-instance v1, Ljava/lang/String;

    const-string v2, "utf-8"

    invoke-direct {v1, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public bridge synthetic process(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->process(Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method public process(Lorg/json/JSONObject;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    const-string v1, "originalType"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mOriginalType:I

    const-string v1, "originalData"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mOriginalData:Lorg/json/JSONObject;

    const-string v1, "libraryIds"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-class v1, [J

    invoke-static {p1, v1}, Lcom/miui/gallery/util/GsonUtils;->fromJson(Ljava/lang/String;Ljava/lang/reflect/Type;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [J

    if-eqz p1, :cond_1

    array-length v1, p1

    if-lez v1, :cond_1

    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-wide v3, p1, v2

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrarySync(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v5

    if-eqz v5, :cond_0

    invoke-virtual {v5}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_NOT_DOWNLOADED:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-ne v6, v7, :cond_0

    iget-object v6, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mDownloadFutures:Ljava/util/Map;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v4

    iget-object v7, p0, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->mDownloadListener:Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    invoke-virtual {v4, v5, v0, v7}, Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;

    move-result-object v4

    invoke-interface {v6, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    const-string v1, "LibraryDownloadTask"

    invoke-static {v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_1
    return v0
.end method

.method public requireCharging()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public requireDeviceIdle()Z
    .locals 1

    const/4 v0, 0x0

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/library/LibraryDownloadTask;->wrapData(Lorg/json/JSONObject;)[B

    move-result-object p1

    return-object p1
.end method

.method public wrapData(Lorg/json/JSONObject;)[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "utf-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    return-object p1
.end method
