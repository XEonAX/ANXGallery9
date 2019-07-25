.class public Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;
.super Lcom/miui/gallery/scanner/MediaBulkDeleter;
.source "CloudMediaBulkDeleter.java"


# instance fields
.field private mIsNormal:Z


# direct methods
.method public constructor <init>(Landroid/net/Uri;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/scanner/MediaBulkDeleter;-><init>(Landroid/net/Uri;Ljava/lang/String;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->mIsNormal:Z

    return-void
.end method

.method private recordMainSDCardUnwritable()V
    .locals 3

    const-string v0, "CloudMediaBulkDeleter"

    const-string v1, "Main SDCard is unwritable, skip cleanup"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "media_scanner"

    const-string v1, "main_sdcard_unwritable"

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private recordStorageUnmounted()V
    .locals 3

    const-string v0, "CloudMediaBulkDeleter"

    const-string v1, "No external storage mounted, skip cleanup"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "media_scanner"

    const-string v1, "no_external_storage_mounted"

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public deleteForResult(Landroid/content/Context;J)Z
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/scanner/MediaBulkDeleter;->delete(Landroid/content/Context;J)V

    iget-boolean p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->mIsNormal:Z

    return p1
.end method

.method public flush(Landroid/content/Context;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getMountedVolumePaths(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->isPrimaryStorageWritable(Landroid/content/Context;)Z

    move-result v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/scanner/MediaBulkDeleter;->flush(Landroid/content/Context;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->mIsNormal:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->recordStorageUnmounted()V

    :cond_1
    if-nez v1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->recordMainSDCardUnwritable()V

    :cond_2
    :goto_0
    return-void
.end method

.method public flushForResult(Landroid/content/Context;)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->flush(Landroid/content/Context;)V

    iget-boolean p1, p0, Lcom/miui/gallery/scanner/CloudMediaBulkDeleter;->mIsNormal:Z

    return p1
.end method
