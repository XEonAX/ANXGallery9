.class public Lcom/miui/gallery/util/ProcessingMediaHelper;
.super Ljava/lang/Object;
.source "ProcessingMediaHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/ProcessingMediaHelper$SingletonHolder;
    }
.end annotation


# static fields
.field private static final EXTERNAL_FILES_PREFIX:Ljava/lang/String;

.field private static final EXTERNAL_IMAGES_PREFIX:Ljava/lang/String;

.field private static final EXTERNAL_VIDEO_PREFIX:Ljava/lang/String;

.field private static final sLock:Ljava/lang/Object;


# instance fields
.field private mProcessingItems:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Files;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_FILES_PREFIX:Ljava/lang/String;

    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Images$Media;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_IMAGES_PREFIX:Ljava/lang/String;

    const-string v0, "external"

    invoke-static {v0}, Landroid/provider/MediaStore$Video$Media;->getContentUri(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_VIDEO_PREFIX:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/util/ProcessingMediaHelper$1;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/ProcessingMediaHelper;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/util/ProcessingMediaHelper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper$SingletonHolder;->INSTANCE:Lcom/miui/gallery/util/ProcessingMediaHelper;

    return-object v0
.end method


# virtual methods
.method public addProcessingItem(JLjava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {v1, p1, p2, p3}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public calibrateCache(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;)V"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->clear()V

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/ProcessingMedia;

    iget-object v2, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Lcom/miui/gallery/provider/ProcessingMedia;->getMediaStoreId()J

    move-result-wide v3

    invoke-virtual {v1}, Lcom/miui/gallery/provider/ProcessingMedia;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v3, v4, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public isMediaInProcessing(Ljava/lang/String;)Z
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_FILES_PREFIX:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    if-nez v0, :cond_4

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_IMAGES_PREFIX:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->EXTERNAL_VIDEO_PREFIX:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_1

    :cond_1
    const-string v0, "file://"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "file://"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v3, 0x0

    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {v4}, Landroid/util/LongSparseArray;->size()I

    move-result v4

    if-ge v3, v4, :cond_3

    iget-object v4, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {v4, v3}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/CharSequence;

    invoke-static {p1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    monitor-exit v0

    return v2

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    monitor-exit v0

    goto :goto_2

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_4
    :goto_1
    :try_start_1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-static {v0}, Landroid/content/ContentUris;->parseId(Landroid/net/Uri;)J

    move-result-wide v3
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_2
    iget-object p1, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {p1, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_5

    monitor-exit v0

    return v2

    :cond_5
    monitor-exit v0

    :cond_6
    :goto_2
    return v1

    :catchall_1
    move-exception p1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw p1

    :catch_0
    move-exception v0

    const-string v2, "ProcessingMediaHelper"

    const-string v3, "Illegal Uri format: %s"

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string p1, "ProcessingMediaHelper"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v1
.end method

.method public removeProcessingItem(JLjava/lang/String;)V
    .locals 4

    sget-object v0, Lcom/miui/gallery/util/ProcessingMediaHelper;->sLock:Ljava/lang/Object;

    monitor-enter v0

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-lez v3, :cond_0

    :try_start_0
    iget-object p3, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {p3, p1, p2}, Landroid/util/LongSparseArray;->remove(J)V

    const-string p1, "ProcessingMediaHelper"

    const-string p2, "remove by media id"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_2

    :cond_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const/4 p1, 0x0

    :goto_0
    iget-object p2, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {p2}, Landroid/util/LongSparseArray;->size()I

    move-result p2

    if-ge p1, p2, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {p2, p1}, Landroid/util/LongSparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-static {p3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/util/ProcessingMediaHelper;->mProcessingItems:Landroid/util/LongSparseArray;

    invoke-virtual {p2, p1}, Landroid/util/LongSparseArray;->removeAt(I)V

    const-string p1, "ProcessingMediaHelper"

    const-string p2, "remove by file path"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    const-string v1, "ProcessingMediaHelper"

    const-string v2, "illegal arguments id[%s], path[%s]"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v1, v2, p1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3
    :goto_1
    monitor-exit v0

    return-void

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
