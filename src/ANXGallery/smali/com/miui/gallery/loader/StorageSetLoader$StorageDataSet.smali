.class Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;
.super Lcom/miui/gallery/model/BaseDataSet;
.source "StorageSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/StorageSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "StorageDataSet"
.end annotation


# instance fields
.field private mFiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private mInitFilePath:Ljava/lang/String;

.field final synthetic this$0:Lcom/miui/gallery/loader/StorageSetLoader;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/loader/StorageSetLoader;Ljava/util/List;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataSet;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    iput-object p3, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mInitFilePath:Ljava/lang/String;

    return-void
.end method

.method private getIndexOfItem(Ljava/lang/String;)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    return v2

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return v1
.end method

.method private getItem(I)Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    if-le p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/io/File;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method public addNewFile(Ljava/lang/String;I)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-static {v0}, Lcom/miui/gallery/loader/StorageSetLoader;->access$300(Lcom/miui/gallery/loader/StorageSetLoader;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-static {v0}, Lcom/miui/gallery/loader/StorageSetLoader;->access$400(Lcom/miui/gallery/loader/StorageSetLoader;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-static {v0}, Lcom/miui/gallery/loader/StorageSetLoader;->access$400(Lcom/miui/gallery/loader/StorageSetLoader;)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/model/BaseDataSet;->addNewFile(Ljava/lang/String;I)Z

    move-result p1

    return p1
.end method

.method public addToAlbum(Landroid/app/Activity;IZZLcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;)Z
    .locals 6

    invoke-direct {p0, p2}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(I)Ljava/io/File;

    move-result-object p2

    const/4 p3, 0x1

    if-eqz p2, :cond_0

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, p3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {p2}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v5

    const/4 v3, 0x0

    move-object v0, p1

    move-object v1, p5

    move v4, p4

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToAlbum(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnAddAlbumListener;Ljava/util/ArrayList;ZZZ)V

    :cond_0
    return p3
.end method

.method public addToFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->addToFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    :cond_0
    return v0
.end method

.method protected bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 3

    invoke-direct {p0, p2}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(I)Ljava/io/File;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result p2

    int-to-long v1, p2

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p1

    invoke-static {v0}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/BaseDataItem;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :cond_0
    return-void
.end method

.method protected createItem(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    new-instance v0, Lcom/miui/gallery/model/StorageItem;

    invoke-direct {v0}, Lcom/miui/gallery/model/StorageItem;-><init>()V

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    return-object v0
.end method

.method protected doDelete(Lcom/miui/gallery/model/BaseDataItem;)I
    .locals 7

    const/4 v0, 0x0

    if-eqz p1, :cond_5

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "StorageSetLoader_delete"

    const-string v2, "delete"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v1, 0x1f4

    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-virtual {v3}, Lcom/miui/gallery/loader/StorageSetLoader;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/DocumentProviderUtils;->needRequestExternalSDCardPermission(Landroid/content/Context;)Z

    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_1

    const/16 p1, -0x70

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "StorageSetLoader_delete"

    new-instance v4, Landroid/util/StringBuilderPrinter;

    invoke-direct {v4, v0}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v3, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v3

    cmp-long v5, v3, v1

    if-lez v5, :cond_0

    const-string v1, "StorageSetLoader"

    const-string v2, "delete slowly: %s"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "detail"

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "delete_performance"

    const-string v2, "StorageSetLoader"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return p1

    :cond_1
    :try_start_1
    const-string v3, "StorageSetLoader_delete"

    const-string v4, "sdcard permission"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v3, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NONE:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    const/4 v4, 0x1

    new-array v5, v4, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    invoke-static {v3, v5}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result v3

    if-lez v3, :cond_3

    const-string v3, "StorageSetLoader_delete"

    const-string v5, "delete file"

    invoke-static {v3, v5}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    new-array v3, v4, [Ljava/io/File;

    new-instance v5, Ljava/io/File;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    aput-object v5, v3, v0

    invoke-static {v4, v3}, Lcom/miui/gallery/util/MediaFileUtils;->triggerMediaScan(Z[Ljava/io/File;)V

    const-string v3, "StorageSetLoader_delete"

    const-string v5, "trigger scan"

    invoke-static {v3, v5}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->this$0:Lcom/miui/gallery/loader/StorageSetLoader;

    invoke-virtual {v3}, Lcom/miui/gallery/loader/StorageSetLoader;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v5, 0x1f

    new-array v6, v4, [Ljava/lang/String;

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v6, v0

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->deleteInService(Landroid/content/Context;II[Ljava/lang/String;)V

    const-string p1, "StorageSetLoader_delete"

    const-string v0, "service delete"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "StorageSetLoader_delete"

    new-instance v3, Landroid/util/StringBuilderPrinter;

    invoke-direct {v3, p1}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v0, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v5

    cmp-long v0, v5, v1

    if-lez v0, :cond_2

    const-string v0, "StorageSetLoader"

    const-string v1, "delete slowly: %s"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "detail"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "delete_performance"

    const-string v1, "StorageSetLoader"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_2
    return v4

    :cond_3
    :try_start_2
    const-string v3, "StorageSetLoader"

    const-string v4, "Failed to delete file %s"

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, v4, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "StorageSetLoader_delete"

    new-instance v4, Landroid/util/StringBuilderPrinter;

    invoke-direct {v4, p1}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v3, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v3

    cmp-long v5, v3, v1

    if-lez v5, :cond_5

    const-string v1, "StorageSetLoader"

    const-string v2, "delete slowly: %s"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "detail"

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v2, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "delete_performance"

    const-string v2, "StorageSetLoader"

    invoke-static {p1, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "StorageSetLoader_delete"

    new-instance v4, Landroid/util/StringBuilderPrinter;

    invoke-direct {v4, v0}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v3, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v3

    cmp-long v5, v3, v1

    if-lez v5, :cond_4

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "StorageSetLoader"

    const-string v3, "delete slowly: %s"

    invoke-static {v2, v3, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "detail"

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "delete_performance"

    const-string v2, "StorageSetLoader"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_4
    throw p1

    :cond_5
    :goto_0
    return v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mFiles:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getInitPosition()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->mInitFilePath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getIndexOfItem(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(I)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    move-result p1

    int-to-long v0, p1

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method

.method protected getItemPath(I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(I)Ljava/io/File;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public onRelease()V
    .locals 0

    return-void
.end method

.method public removeFromFavorites(Landroid/app/Activity;ILcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Z
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p2}, Lcom/miui/gallery/loader/StorageSetLoader$StorageDataSet;->getItem(Lcom/miui/gallery/model/BaseDataItem;I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    const/4 v0, 0x1

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {p2}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v1, v2

    invoke-static {p1, p3, v1}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->removeFromFavoritesByPath(Landroid/app/Activity;Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;[Ljava/lang/String;)V

    :cond_0
    return v0
.end method
