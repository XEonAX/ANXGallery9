.class public Lcom/miui/gallery/cleaner/ScreenshotScanner;
.super Lcom/miui/gallery/cleaner/BaseScanner;
.source "ScreenshotScanner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;
    }
.end annotation


# static fields
.field public static final SCREEN_SHOT_SCAN_ORDER:Ljava/lang/String;

.field public static final SCREEN_SHOT_SCAN_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mMediaItems:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;",
            ">;"
        }
    .end annotation
.end field

.field private mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

.field private mScreenshotLocalId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const-string v0, "_id"

    const-string v1, "size"

    const-string v2, "localFile"

    const-string v3, "thumbnailFile"

    const-string v4, "microthumbfile"

    const-string v5, "sha1"

    filled-new-array/range {v0 .. v5}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->SCREEN_SHOT_SCAN_PROJECTION:[Ljava/lang/String;

    const-string v0, "%s DESC"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "alias_create_time"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->SCREEN_SHOT_SCAN_ORDER:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/cleaner/BaseScanner;-><init>(I)V

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mScreenshotLocalId:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/cleaner/ScreenshotScanner$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner$3;-><init>(Lcom/miui/gallery/cleaner/ScreenshotScanner;)V

    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

    return-void
.end method

.method private buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 10

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v1

    :try_start_0
    iget-object v2, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

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

    check-cast v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;

    iget-wide v7, v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;->mSize:J

    const/4 v9, 0x0

    add-long/2addr v4, v7

    array-length v7, v0

    if-ge v3, v7, :cond_0

    new-instance v7, Lcom/miui/gallery/cleaner/ScanResult$ResultImage;

    iget-wide v8, v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;->mId:J

    iget-object v6, v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;->mPath:Ljava/lang/String;

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

    iget v2, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mType:I

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setType(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f100284

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setTitle(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    const v2, 0x7f100283

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setDescription(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v4, v5}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setSize(J)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setImages([Lcom/miui/gallery/cleaner/ScanResult$ResultImage;)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f100282

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setAction(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCount(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    const v1, 0x7f0e0035

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cleaner/ScanResult$Builder;->setCountText(I)Lcom/miui/gallery/cleaner/ScanResult$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mOnScanResultClickListener:Lcom/miui/gallery/cleaner/ScanResult$OnScanResultClickListener;

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

.method private queryScreenshotAlbumId(Landroid/content/Context;)I
    .locals 7

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v2

    const-string v3, "serverId = 2 AND (serverType=0)"

    new-instance v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$2;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner$2;-><init>(Lcom/miui/gallery/cleaner/ScreenshotScanner;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method private removeItem(J)Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;

    iget-wide v2, v2, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;->mId:J

    cmp-long v4, v2, p1

    if-nez v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method


# virtual methods
.method public getScanResultIds()[J
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    new-array v2, v1, [J

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;

    iget-wide v4, v4, Lcom/miui/gallery/cleaner/ScreenshotScanner$MediaItem;->mId:J

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

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->removeItem(J)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->updateScanResult(Lcom/miui/gallery/cleaner/ScanResult;)V

    :cond_0
    return-void
.end method

.method protected onReset()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public removeItems([J)V
    .locals 6

    if-nez p1, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    monitor-enter v0

    :try_start_0
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-wide v3, p1, v2

    invoke-direct {p0, v3, v4}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->removeItem(J)Z

    move-result v5

    if-eqz v5, :cond_1

    long-to-int v3, v3

    int-to-long v3, v3

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->updateScanResult(JLcom/miui/gallery/cleaner/ScanResult;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public scan()Lcom/miui/gallery/cleaner/ScanResult;
    .locals 8

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mScreenshotLocalId:I

    const/4 v7, 0x0

    const/4 v2, -0x1

    if-ne v1, v2, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->queryScreenshotAlbumId(Landroid/content/Context;)I

    move-result v1

    iput v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mScreenshotLocalId:I

    iget v1, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mScreenshotLocalId:I

    if-ne v1, v2, :cond_0

    return-object v7

    :cond_0
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "localGroupId = %d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mScreenshotLocalId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/cleaner/ScreenshotScanner;->SCREEN_SHOT_SCAN_PROJECTION:[Ljava/lang/String;

    const/4 v4, 0x0

    sget-object v5, Lcom/miui/gallery/cleaner/ScreenshotScanner;->SCREEN_SHOT_SCAN_ORDER:Ljava/lang/String;

    new-instance v6, Lcom/miui/gallery/cleaner/ScreenshotScanner$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner$1;-><init>(Lcom/miui/gallery/cleaner/ScreenshotScanner;)V

    invoke-static/range {v0 .. v6}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v7

    :cond_1
    iput-object v0, p0, Lcom/miui/gallery/cleaner/ScreenshotScanner;->mMediaItems:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/cleaner/ScreenshotScanner;->buildScanResult()Lcom/miui/gallery/cleaner/ScanResult;

    move-result-object v0

    return-object v0
.end method
