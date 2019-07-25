.class Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;
.super Lcom/miui/gallery/model/CursorDataSet;
.source "MediaSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/MediaSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaDataSet"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/loader/MediaSetLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/loader/MediaSetLoader;Landroid/database/Cursor;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-direct {p0, p2}, Lcom/miui/gallery/model/CursorDataSet;-><init>(Landroid/database/Cursor;)V

    return-void
.end method

.method private isFromCamera()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-static {v0}, Lcom/miui/gallery/loader/MediaSetLoader;->access$100(Lcom/miui/gallery/loader/MediaSetLoader;)Z

    move-result v0

    return v0
.end method

.method private isFromScreenshot()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-static {v0}, Lcom/miui/gallery/loader/MediaSetLoader;->access$200(Lcom/miui/gallery/loader/MediaSetLoader;)Z

    move-result v0

    return v0
.end method

.method public static synthetic lambda$markDelete$38(Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;[Ljava/lang/String;[Ljava/lang/Long;Z)V
    .locals 5

    const-string v0, "MediaSetLoader_delete"

    const-string v1, "delete"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NONE:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    invoke-static {v0, p1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result v0

    const-string v1, "MediaSetLoader_delete"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "file delete "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "_id in (%s)"

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const-string v3, ","

    invoke-static {v3, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-virtual {v2}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-virtual {v3}, Lcom/miui/gallery/loader/MediaSetLoader;->getUri()Landroid/net/Uri;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v0, v4}, Lcom/miui/gallery/util/SafeDBUtil;->safeDelete(Landroid/content/Context;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    const-string v2, "MediaSetLoader_delete"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "provider delete "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    xor-int/2addr p3, v1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-virtual {v0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    const/16 v1, 0x1e

    invoke-static {v0, p3, v1, p1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->deleteInService(Landroid/content/Context;II[Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/loader/MediaSetLoader;->access$300()Ljava/util/List;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/loader/MediaSetLoader;->access$300()Ljava/util/List;

    move-result-object p3

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p3, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string p2, "MediaSetLoader_delete"

    new-instance p3, Landroid/util/StringBuilderPrinter;

    invoke-direct {p3, p1}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide p2

    const-string v0, "MediaSetLoader"

    const-string v1, "delete : %s"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, 0x1f4

    cmp-long v2, p2, v0

    if-lez v2, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "detail"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "delete_performance"

    const-string p2, "MediaSetLoader"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void

    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method

.method private markDelete(Ljava/util/List;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/BaseDataItem;",
            ">;Z)V"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/Long;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getKey()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v0, v2

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/loader/MediaSetLoader;->access$300()Ljava/util/List;

    move-result-object p1

    monitor-enter p1

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/loader/MediaSetLoader;->access$300()Ljava/util/List;

    move-result-object v2

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getWorkHandler()Lcom/android/internal/CompatHandler;

    move-result-object p1

    new-instance v2, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;

    invoke-direct {v2, p0, v1, v0, p2}, Lcom/miui/gallery/loader/-$$Lambda$MediaSetLoader$MediaDataSet$LYgsNgiEJUsPd9PvcOlfezAcb0U;-><init>(Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;[Ljava/lang/String;[Ljava/lang/Long;Z)V

    invoke-virtual {p1, v2}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void

    :catchall_0
    move-exception p2

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p2
.end method

.method private wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V
    .locals 3

    const/4 v0, 0x1

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setTitle(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x2

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setSize(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x3

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x4

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setLatitude(D)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x5

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getFloat(I)F

    move-result v0

    float-to-double v0, v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setLongitude(D)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x6

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setCreateTime(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/4 v0, 0x7

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    div-int/lit16 v0, v0, 0x3e8

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setDuration(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/16 v0, 0x8

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setWidth(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/16 v0, 0x9

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setHeight(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    const/16 v0, 0xa

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/BaseDataItem;->setOrientation(I)Lcom/miui/gallery/model/BaseDataItem;

    return-void
.end method


# virtual methods
.method public addToAlbum(Landroid/app/Activity;IZZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)Z
    .locals 7

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p2}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 p3, 0x1

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, p3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    new-instance v2, Ljava/io/File;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v4}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isFromCamera()Z

    move-result v4

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isVideo()Z

    move-result v6

    move-object v1, p1

    move-object v2, p5

    move v5, p4

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;ZZZ)V

    :cond_2
    return p3
.end method

.method public addToFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-array v1, v0, [Ljava/lang/String;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    :cond_2
    :goto_1
    return v0
.end method

.method protected bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 6

    invoke-virtual {p0, p2}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->foldBurst()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    check-cast v0, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->isBurstPosition(I)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->getContentCursorPosition(I)I

    move-result v2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/util/BurstFilterCursor;->getBurstCount(I)I

    move-result p2

    add-int/2addr p2, v2

    const/4 v3, 0x1

    sub-int/2addr p2, v3

    :goto_0
    if-gt v2, p2, :cond_0

    invoke-virtual {v0, v2}, Lcom/miui/gallery/util/BurstFilterCursor;->getContentCursorAtPosition(I)Landroid/database/Cursor;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {v5}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    invoke-direct {p0, v5, v4}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->wrapItemByCursor(Lcom/miui/gallery/model/BaseDataItem;Landroid/database/Cursor;)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v3}, Lcom/miui/gallery/model/BaseDataItem;->setBurstItem(Z)Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/BaseDataItem;->setBurstGroup(Ljava/util/List;)Lcom/miui/gallery/model/BaseDataItem;

    const-wide/16 v0, 0x40

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/BaseDataItem;->setSpecialTypeFlags(J)V

    :cond_1
    return-void
.end method

.method protected burstKeyIndex()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected createItem(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/MediaItem;

    invoke-direct {v0}, Lcom/miui/gallery/model/MediaItem;-><init>()V

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    return-object v0
.end method

.method protected doDelete(Lcom/miui/gallery/model/BaseDataItem;)I
    .locals 3

    const/4 v0, 0x0

    if-eqz p1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-virtual {v1}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 p1, -0x70

    return p1

    :cond_0
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result p1

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isFromCamera()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isFromScreenshot()Z

    move-result v2

    if-eqz v2, :cond_3

    :cond_2
    const/4 v0, 0x1

    :cond_3
    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->markDelete(Ljava/util/List;Z)V

    goto :goto_1

    :cond_4
    const/4 p1, 0x0

    :goto_1
    return p1
.end method

.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected getDeleteDialogMessage(Lcom/miui/gallery/model/BaseDataItem;Landroid/content/Context;)Ljava/lang/String;
    .locals 4

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isFromCamera()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isFromScreenshot()Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->this$0:Lcom/miui/gallery/loader/MediaSetLoader;

    invoke-virtual {v0}, Lcom/miui/gallery/loader/MediaSetLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    :goto_0
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0e001a

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, v0, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getMimeType()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3

    const p1, 0x7f0e0024

    goto :goto_1

    :cond_3
    const p1, 0x7f0e0020

    :goto_1
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    new-array v0, v2, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v1

    invoke-virtual {p2, p1, v2, v0}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_4
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/model/CursorDataSet;->getDeleteDialogMessage(Lcom/miui/gallery/model/BaseDataItem;Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected getItemPath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public removeFromFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 4

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/loader/MediaSetLoader$MediaDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->isBurstItem()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getBurstGroup()Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v3}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    new-array v1, v0, [Ljava/lang/String;

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    :cond_2
    :goto_1
    return v0
.end method
