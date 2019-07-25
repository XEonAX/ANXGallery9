.class public Lcom/miui/gallery/cleaner/slim/SlimScanner;
.super Lcom/miui/gallery/cleaner/BaseScanner;
.source "SlimScanner.java"

# interfaces
.implements Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;
    }
.end annotation


# static fields
.field public static final SLIM_SCAN_ORDER:Ljava/lang/String;

.field public static final SLIM_SCAN_PROJECTION:[Ljava/lang/String;

.field private static final SLIM_SCAN_SELECTION:Ljava/lang/String;

.field public static final SYNCED_SLIM_SCAN_SELECTION:Ljava/lang/String;


# instance fields
.field private mMediaItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-string v0, "_id"

    const-string v1, "localFile"

    const-string v2, "size"

    const-string v3, "exifImageWidth"

    const-string v4, "exifImageLength"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_PROJECTION:[Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "serverType = 1 AND mimeType != \'image/gif\' AND localFile NOT NULL AND localFile != \'\' AND localGroupId != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v1, 0x3e8

    invoke-static {v1, v2}, Lcom/miui/gallery/cloud/CloudTableUtils;->getCloudIdForGroupWithoutRecord(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "localGroupId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v1, 0x3e9

    invoke-static {v1, v2}, Lcom/miui/gallery/cloud/CloudTableUtils;->getCloudIdForGroupWithoutRecord(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_SELECTION:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "alias_sync_state = 0 AND "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_SELECTION:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SYNCED_SLIM_SCAN_SELECTION:Ljava/lang/String;

    const-string v0, "%s DESC"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "alias_sort_time"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_ORDER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cleaner/BaseScanner;-><init>(I)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/cleaner/slim/SlimScanner$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimScanner$2;-><init>(Lcom/miui/gallery/cleaner/slim/SlimScanner;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/cleaner/slim/SlimScanner;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mType:I

    return p0
.end method

.method private buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 10

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;

    iget-wide v7, v6, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mSlimSize:J

    const/4 v9, 0x0

    add-long/2addr v4, v7

    array-length v7, v0

    if-ge v3, v7, :cond_0

    new-instance v7, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-wide v8, v6, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mId:J

    iget-object v6, v6, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mFilePath:Ljava/lang/String;

    invoke-direct {v7, v8, v9, v6}, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;-><init>(JLjava/lang/String;)V

    aput-object v7, v0, v3

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance v1, Lcom/miui/gallery/cleaner/ScanResult$Builder;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;-><init>(Landroid/content/Context;)V

    iget v2, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mType:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setType(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f10028b

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setTitle(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setSize(J)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f100289

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setDescription(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setImages([Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f100288

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setAction(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCount(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f0e0035

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCountText(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setOnScanResultClickListener(Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->build()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    return-object v0

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method private removeMediaItem(J)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;

    iget-wide v2, v2, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mId:J

    cmp-long v4, v2, p1

    if-nez v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    :cond_2
    return-void

    :catchall_0
    move-exception p1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method


# virtual methods
.method public getScanResultIds()[J
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v2, v1, [J

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;

    iget-wide v4, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mId:J

    aput-wide v4, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onMediaItemDeleted(J)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->removeMediaItem(J)V

    return-void
.end method

.method protected onReset()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->unregisterObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V

    return-void
.end method

.method public onSlimPaused()V
    .locals 0

    return-void
.end method

.method public onSlimProgress(JJI)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->removeMediaItem(J)V

    return-void
.end method

.method public onSlimResumed()V
    .locals 0

    return-void
.end method

.method public scan()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 14

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_PROJECTION:[Ljava/lang/String;

    sget-object v3, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SYNCED_SLIM_SCAN_SELECTION:Ljava/lang/String;

    sget-object v5, Lcom/miui/gallery/cleaner/slim/SlimScanner;->SLIM_SCAN_ORDER:Ljava/lang/String;

    new-instance v6, Lcom/miui/gallery/cleaner/slim/SlimScanner$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/slim/SlimScanner$1;-><init>(Lcom/miui/gallery/cleaner/slim/SlimScanner;)V

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return-object v2

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v1

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenHeight()I

    move-result v3

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;

    iget v5, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mWidth:I

    iget v6, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mHeight:I

    invoke-static {v5, v6}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-le v5, v1, :cond_1

    iget-object v5, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mFilePath:Ljava/lang/String;

    invoke-static {v5}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    iget v5, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mWidth:I

    iget v6, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mHeight:I

    invoke-static {v5, v6, v1, v3}, Lcom/miui/gallery/util/BitmapUtils;->computeThumbNailScaleSize(IIII)F

    move-result v5

    iget-wide v6, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mSize:J

    iget-wide v8, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mSize:J

    long-to-double v8, v8

    float-to-double v10, v5

    const-wide/high16 v12, 0x4000000000000000L    # 2.0

    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v10

    invoke-static {v8, v9}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v8, v8, v10

    const-wide v10, 0x3fd99999a0000000L    # 0.4000000059604645

    mul-double v8, v8, v10

    double-to-long v8, v8

    sub-long/2addr v6, v8

    const-wide/16 v8, 0x0

    cmp-long v5, v6, v8

    if-lez v5, :cond_1

    iput-wide v6, v4, Lcom/miui/gallery/cleaner/slim/SlimScanner$MediaItem;->mSlimSize:J

    iget-object v5, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/cleaner/slim/SlimScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    return-object v2

    :cond_3
    invoke-static {}, Lcom/miui/gallery/cleaner/slim/SlimController;->getInstance()Lcom/miui/gallery/cleaner/slim/SlimController;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cleaner/slim/SlimController;->registerObserver(Lcom/miui/gallery/cleaner/slim/SlimController$SpaceSlimObserver;)V

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/slim/SlimScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    return-object v0
.end method
