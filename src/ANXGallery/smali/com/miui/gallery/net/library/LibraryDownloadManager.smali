.class public Lcom/miui/gallery/net/library/LibraryDownloadManager;
.super Ljava/lang/Object;
.source "LibraryDownloadManager.java"


# instance fields
.field private mDownloadListenerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;",
            ">;>;"
        }
    .end annotation
.end field

.field private mDownloadingItems:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mRequestMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Long;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/net/download/Request;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadingItems:Ljava/util/Set;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/net/library/LibraryDownloadManager;JI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->downloadProgress(JI)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/net/library/LibraryDownloadManager;)Ljava/util/Set;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadingItems:Ljava/util/Set;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/net/library/LibraryDownloadManager;Ljava/util/Set;)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->isDownloadItemsExists(Ljava/util/Set;)Z

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/net/library/LibraryDownloadManager;JI)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->downloadResult(JI)V

    return-void
.end method

.method private declared-synchronized addListener(JLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V
    .locals 2

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public static checkCondition(Z)Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string p0, "LibraryDownloadManager"

    const-string v0, "CTA not confirmed"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_1

    const-string p0, "LibraryDownloadManager"

    const-string v0, "No network"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    if-nez p0, :cond_2

    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object p0

    invoke-virtual {p0}, Lmiui/net/ConnectivityHelper;->isUnmeteredNetworkConnected()Z

    move-result p0

    if-nez p0, :cond_2

    const-string p0, "LibraryDownloadManager"

    const-string v0, "No unmetered network connected"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    invoke-static {}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->haveEnoughSpace()Z

    move-result p0

    if-nez p0, :cond_3

    const-string p0, "LibraryDownloadManager"

    const-string v0, "No enough space"

    invoke-static {p0, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_3
    const/4 p0, 0x1

    return p0
.end method

.method private download(Lcom/miui/gallery/assistant/library/LibraryItem;ZLcom/miui/gallery/net/download/Request$Listener;)Lcom/miui/gallery/net/download/Request;
    .locals 4

    new-instance v0, Ljava/io/File;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getTargetPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/miui/gallery/net/resource/DownloadRequest;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/net/resource/DownloadRequest;-><init>(J)V

    :try_start_0
    invoke-virtual {v1}, Lcom/miui/gallery/net/resource/DownloadRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    const/4 v2, 0x0

    aget-object v1, v1, v2

    check-cast v1, Lcom/miui/gallery/net/resource/DownloadInfo;

    new-instance v2, Lcom/miui/gallery/net/download/Request;

    iget-object v1, v1, Lcom/miui/gallery/net/resource/DownloadInfo;->url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-direct {v2, v1, v0}, Lcom/miui/gallery/net/download/Request;-><init>(Landroid/net/Uri;Ljava/io/File;)V

    new-instance v0, Lcom/miui/gallery/net/download/Verifier$Sha1;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/LibraryItem;->getSha1()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/miui/gallery/net/download/Verifier$Sha1;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lcom/miui/gallery/net/download/Request;->setVerifier(Lcom/miui/gallery/net/download/Verifier;)V

    invoke-virtual {v2, p2}, Lcom/miui/gallery/net/download/Request;->setAllowedOverMetered(Z)V

    invoke-virtual {v2, p3}, Lcom/miui/gallery/net/download/Request;->setListener(Lcom/miui/gallery/net/download/Request$Listener;)V

    sget-object p1, Lcom/miui/gallery/net/download/GalleryDownloadManager;->INSTANCE:Lcom/miui/gallery/net/download/GalleryDownloadManager;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/net/download/GalleryDownloadManager;->enqueue(Lcom/miui/gallery/net/download/Request;)Z
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    return-object v2

    :catch_0
    move-exception p1

    const-string p2, "LibraryDownloadManager"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "fetch library item info error:"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/miui/gallery/net/base/RequestError;->printStackTrace()V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private downloadProgress(JI)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    invoke-interface {v1, p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadProgress(JI)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private downloadResult(JI)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    if-eqz v0, :cond_1

    if-eqz p3, :cond_0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/net/download/Request;

    sget-object v3, Lcom/miui/gallery/net/download/GalleryDownloadManager;->INSTANCE:Lcom/miui/gallery/net/download/GalleryDownloadManager;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/net/download/GalleryDownloadManager;->cancel(Lcom/miui/gallery/net/download/Request;)V

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;

    invoke-interface {v2, p1, p2, p3}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadResult(JI)V

    goto :goto_1

    :cond_2
    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_3
    iget-object p3, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p3, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadListenerMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private static haveEnoughSpace()Z
    .locals 6

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "libs"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object v0

    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->getFreeSpace()J

    move-result-wide v0

    const-wide/32 v3, 0x6400000

    cmp-long v5, v0, v3

    if-gtz v5, :cond_0

    const-string v0, "LibraryDownloadManager"

    const-string v1, "Sd card has less than 100M space left"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return v2

    :cond_0
    const/4 v0, 0x1

    return v0

    :catch_0
    move-exception v0

    const-string v1, "LibraryDownloadManager"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v2
.end method

.method private isDownloadItemsExists(Ljava/util/Set;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/assistant/library/LibraryItem;",
            ">;)Z"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/assistant/library/LibraryItem;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/library/LibraryItem;->isExist()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method


# virtual methods
.method public cancel(J)V
    .locals 1

    const/4 v0, 0x2

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->downloadResult(JI)V

    return-void
.end method

.method public declared-synchronized download(JZLjava/util/Set;Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JZ",
            "Ljava/util/Set<",
            "Lcom/miui/gallery/assistant/library/LibraryItem;",
            ">;",
            "Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;",
            ")V"
        }
    .end annotation

    monitor-enter p0

    :try_start_0
    invoke-static {p3}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->checkCondition(Z)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    if-eqz p5, :cond_0

    invoke-interface {p5, p1, p2, v1}, Lcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;->onDownloadResult(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    monitor-exit p0

    return-void

    :cond_1
    :try_start_1
    invoke-direct {p0, p1, p2, p5}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->addListener(JLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)V

    iget-object p5, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-interface {p5, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p5, :cond_2

    monitor-exit p0

    return-void

    :cond_2
    :try_start_2
    new-instance p5, Ljava/util/ArrayList;

    invoke-interface {p4}, Ljava/util/Set;->size()I

    move-result v0

    invoke-direct {p5, v0}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v0, v2, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0, p4}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-interface {p4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_3
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/assistant/library/LibraryItem;

    iget-object v3, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadingItems:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    new-instance v9, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;

    move-object v3, v9

    move-object v4, p0

    move-wide v5, p1

    move-object v7, v2

    move-object v8, v0

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/net/library/LibraryDownloadManager$1;-><init>(Lcom/miui/gallery/net/library/LibraryDownloadManager;JLcom/miui/gallery/assistant/library/LibraryItem;Ljava/util/Set;)V

    invoke-direct {p0, v2, p3, v9}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->download(Lcom/miui/gallery/assistant/library/LibraryItem;ZLcom/miui/gallery/net/download/Request$Listener;)Lcom/miui/gallery/net/download/Request;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-interface {p5, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v3, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mDownloadingItems:Ljava/util/Set;

    invoke-virtual {v2}, Lcom/miui/gallery/assistant/library/LibraryItem;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-interface {v3, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_4
    invoke-direct {p0, p1, p2, v1}, Lcom/miui/gallery/net/library/LibraryDownloadManager;->downloadResult(JI)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_5
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public isLibraryDownloading(J)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/net/library/LibraryDownloadManager;->mRequestMap:Ljava/util/Map;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
