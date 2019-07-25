.class public Lcom/miui/gallery/cloud/UpDownloadManager;
.super Ljava/lang/Object;
.source "UpDownloadManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;,
        Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;
    }
.end annotation


# static fields
.field private static final DOWNLOAD_FILE_PRIORITY:[I

.field private static final PRIORITY_ELEMENTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private static final THREAD_ELEMENTS:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;",
            ">;"
        }
    .end annotation
.end field

.field private static final sFactory:Lcom/miui/gallery/cloud/thread/TaskFactory;

.field private static final sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;


# instance fields
.field private final mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

.field private final mItemChangedListener:Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;


# direct methods
.method static constructor <clinit>()V
    .locals 13

    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    new-instance v3, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    const/16 v4, 0xa

    const/4 v5, -0x1

    invoke-direct {v3, v1, v4, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v6, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    const/4 v7, 0x2

    invoke-direct {v6, v2, v7, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v6, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    invoke-direct {v6, v7, v4, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v3, 0x3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    new-instance v8, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    const/16 v9, 0x1e

    invoke-direct {v8, v3, v2, v9}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v6, 0x4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    new-instance v9, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    const/16 v10, 0x64

    invoke-direct {v9, v6, v4, v10}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v8, 0x5

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    new-instance v10, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    invoke-direct {v10, v8, v2, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v9, 0x6

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    new-instance v11, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    invoke-direct {v11, v9, v2, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v10, 0x7

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    new-instance v12, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    invoke-direct {v12, v10, v2, v5}, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;-><init>(III)V

    invoke-interface {v0, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->THREAD_ELEMENTS:Ljava/util/Map;

    invoke-static {}, Lcom/google/common/collect/Maps;->newHashMap()Ljava/util/HashMap;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    invoke-interface {v0, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v11, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-interface {v0, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v5, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v1, 0x8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0x9

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v0, v2, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xb

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xc

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v2, 0xd

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v0, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->PRIORITY_ELEMENTS:Ljava/util/Map;

    new-array v0, v3, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->DOWNLOAD_FILE_PRIORITY:[I

    new-array v0, v1, [Lcom/miui/gallery/cloud/UpDownloadManager;

    sput-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    new-instance v0, Lcom/miui/gallery/cloud/UpDownloadManager$1;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/UpDownloadManager$1;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->sFactory:Lcom/miui/gallery/cloud/thread/TaskFactory;

    return-void

    :array_0
    .array-data 4
        0x9
        0xa
        0xb
    .end array-data
.end method

.method private constructor <init>(I)V
    .locals 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;-><init>(Lcom/miui/gallery/cloud/UpDownloadManager;Lcom/miui/gallery/cloud/UpDownloadManager$1;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mItemChangedListener:Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;

    new-instance v0, Lcom/miui/gallery/cloud/RequestItemExecutor;

    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sFactory:Lcom/miui/gallery/cloud/thread/TaskFactory;

    sget-object v2, Lcom/miui/gallery/cloud/UpDownloadManager;->PRIORITY_ELEMENTS:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v3

    invoke-static {p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->getBatchLimit(I)I

    move-result v4

    invoke-static {p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->getCommandMaxSize(I)I

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mItemChangedListener:Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;

    move v2, p1

    invoke-interface/range {v1 .. v6}, Lcom/miui/gallery/cloud/thread/TaskFactory;->createTask(IIIILcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)Lcom/miui/gallery/cloud/thread/BaseTask;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/miui/gallery/cloud/RequestItemExecutor;-><init>(Lcom/miui/gallery/cloud/thread/BaseTask;)V

    iput-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->endDownload(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->startDownload(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    return-void
.end method

.method public static cancel(IZZ)V
    .locals 2

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->getThreadType(I)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const-string p1, "UpDownloadManager"

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "invalid thread type, priority="

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->dumpStack()V

    return-void

    :cond_0
    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    aget-object v1, v1, v0

    if-eqz v1, :cond_1

    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    aget-object v0, v1, v0

    invoke-virtual {v0, p0, p1, p2}, Lcom/miui/gallery/cloud/UpDownloadManager;->cancelAll(IZZ)V

    :cond_1
    return-void
.end method

.method public static cancelAllBackgroundPriority(ZZ)V
    .locals 5

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->PRIORITY_ELEMENTS:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v3}, Lcom/miui/gallery/cloud/RequestItemBase;->isBackgroundPriority(I)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    sget-object v3, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    if-eqz v3, :cond_0

    invoke-virtual {v3, p0, p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->cancelAll(ZZ)V

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-void
.end method

.method private static deleteTempFile(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getDownloadTempFilePath()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".kinfo"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/String;

    const/4 v4, 0x0

    aput-object p0, v3, v4

    invoke-static {v1, v3}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    sget-object p0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->TEMP:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v1, v2, [Ljava/lang/String;

    aput-object v0, v1, v4

    invoke-static {p0, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    return-void
.end method

.method public static dispatchList(Ljava/util/List;)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;)I"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->dispatchList(Ljava/util/List;Z)I

    move-result p0

    return p0
.end method

.method public static dispatchList(Ljava/util/List;Z)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;Z)I"
        }
    .end annotation

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/cloud/RequestCloudItem;

    iget v0, v0, Lcom/miui/gallery/cloud/RequestCloudItem;->priority:I

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->instance(I)Lcom/miui/gallery/cloud/UpDownloadManager;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/cloud/UpDownloadManager;->invokeList(Ljava/util/List;Z)I

    move-result p0

    return p0
.end method

.method private static endDownload(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 4

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->needPersisit(Lcom/miui/gallery/cloud/RequestCloudItem;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UpDownloadManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getIdentity()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " end download, status="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getStatus()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getStatus()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    const/4 v0, 0x0

    invoke-static {v1, v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->toDatabase(Lcom/miui/gallery/data/DBImage;I)V

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->deleteTempFile(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    goto :goto_0

    :pswitch_1
    const/4 p0, 0x3

    invoke-static {v1, p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->toDatabase(Lcom/miui/gallery/data/DBImage;I)V

    goto :goto_0

    :pswitch_2
    const/4 p0, 0x2

    invoke-static {v1, p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->toDatabase(Lcom/miui/gallery/data/DBImage;I)V

    goto :goto_0

    :pswitch_3
    const-string v1, "UpDownloadManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bad status: status="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ", file name="

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getFileName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static getBatchLimit(I)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->THREAD_ELEMENTS:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    iget p0, p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;->batchSize:I

    return p0
.end method

.method private static getCommandMaxSize(I)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->THREAD_ELEMENTS:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;

    iget p0, p0, Lcom/miui/gallery/cloud/UpDownloadManager$ThreadElement;->commandMaxSize:I

    return p0
.end method

.method public static getThreadType(I)I
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->PRIORITY_ELEMENTS:Ljava/util/Map;

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0
.end method

.method public static instance(I)Lcom/miui/gallery/cloud/UpDownloadManager;
    .locals 0

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->getThreadType(I)I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->instanceInternel(I)Lcom/miui/gallery/cloud/UpDownloadManager;

    move-result-object p0

    return-object p0
.end method

.method private static declared-synchronized instanceInternel(I)Lcom/miui/gallery/cloud/UpDownloadManager;
    .locals 3

    const-class v0, Lcom/miui/gallery/cloud/UpDownloadManager;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    aget-object v1, v1, p0

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    new-instance v2, Lcom/miui/gallery/cloud/UpDownloadManager;

    invoke-direct {v2, p0}, Lcom/miui/gallery/cloud/UpDownloadManager;-><init>(I)V

    aput-object v2, v1, p0

    :cond_0
    sget-object v1, Lcom/miui/gallery/cloud/UpDownloadManager;->sInstances:[Lcom/miui/gallery/cloud/UpDownloadManager;

    aget-object p0, v1, p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static mapStatusToRequestItem(I)I
    .locals 1

    const/4 v0, -0x1

    packed-switch p0, :pswitch_data_0

    return v0

    :pswitch_0
    const/4 p0, 0x2

    return p0

    :pswitch_1
    const/4 p0, 0x1

    return p0

    :pswitch_2
    const/4 p0, 0x0

    return p0

    :pswitch_3
    return v0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private static needPersisit(Lcom/miui/gallery/cloud/RequestCloudItem;)Z
    .locals 5

    iget p0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->priority:I

    sget-object v0, Lcom/miui/gallery/cloud/UpDownloadManager;->DOWNLOAD_FILE_PRIORITY:[I

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget v4, v0, v3

    if-ne v4, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method private static startDownload(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 3

    invoke-static {p0}, Lcom/miui/gallery/cloud/UpDownloadManager;->needPersisit(Lcom/miui/gallery/cloud/RequestCloudItem;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    const-string v0, "UpDownloadManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/cloud/RequestCloudItem;->getIdentity()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " start download"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p0, p0, Lcom/miui/gallery/cloud/RequestCloudItem;->dbCloud:Lcom/miui/gallery/data/DBImage;

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->toDatabase(Lcom/miui/gallery/data/DBImage;I)V

    return-void
.end method

.method private static toDatabase(Lcom/miui/gallery/data/DBImage;I)V
    .locals 10

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne p1, v2, :cond_0

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "downloadFileTime"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "(%s) AND (%s is null OR %s=%d)"

    const/4 v7, 0x4

    new-array v7, v7, [Ljava/lang/Object;

    const-string v8, "_id=?"

    aput-object v8, v7, v1

    const-string v8, "downloadFileStatus"

    aput-object v8, v7, v2

    const/4 v8, 0x2

    const-string v9, "downloadFileStatus"

    aput-object v9, v7, v8

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v0

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    new-array v6, v2, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {v4, v3, v5, v6}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :cond_0
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v4, "downloadFileStatus"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    if-eq p1, v0, :cond_1

    const-string p1, "localFile"

    const-string v0, ""

    invoke-virtual {v3, p1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "_id=?"

    new-array v2, v2, [Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v2, v1

    invoke-static {p1, v3, v0, v2}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public addOnItemChangedListener(Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mItemChangedListener:Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/cloud/UpDownloadManager$OnItemChangedDecorator;->addOnItemChangedListener(Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V

    return-void
.end method

.method public cancelAll(IZZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

    invoke-virtual {v0, p1, p2, p3}, Lcom/miui/gallery/cloud/RequestItemExecutor;->cancelAll(IZZ)V

    return-void
.end method

.method public cancelAll(ZZ)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0xe

    if-ge v0, v1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->check(I)I

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->getThreadType(I)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

    invoke-virtual {v1, v0, p1, p2}, Lcom/miui/gallery/cloud/RequestItemExecutor;->cancelAll(IZZ)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public hasDelayedItem()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/RequestItemExecutor;->hasDelayedItem()Z

    move-result v0

    return v0
.end method

.method public invokeList(Ljava/util/List;Z)I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/RequestCloudItem;",
            ">;Z)I"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/cloud/UpDownloadManager;->mExecutor:Lcom/miui/gallery/cloud/RequestItemExecutor;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/cloud/RequestItemExecutor;->invoke(Ljava/util/List;Z)I

    move-result p1

    return p1
.end method
