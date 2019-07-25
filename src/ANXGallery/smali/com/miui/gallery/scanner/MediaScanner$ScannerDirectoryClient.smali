.class Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScannerDirectoryClient"
.end annotation


# instance fields
.field private final PRINTER:Landroid/util/Printer;

.field private mFileClient:Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

.field private mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;


# direct methods
.method constructor <init>(Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$ScannerDirectoryClient$SeufySwo2nkd2wX1pY1dy_4L_L8;->INSTANCE:Lcom/miui/gallery/scanner/-$$Lambda$MediaScanner$ScannerDirectoryClient$SeufySwo2nkd2wX1pY1dy_4L_L8;

    iput-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mFileClient:Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    return-void
.end method

.method private doScan(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;[Ljava/io/File;J)Ljava/util/ArrayList;
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;",
            "[",
            "Ljava/io/File;",
            "J)",
            "Ljava/util/ArrayList<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-object/from16 v1, p4

    const/4 v4, 0x0

    if-nez p3, :cond_0

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/scanner/MediaScanner;->access$300(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v0

    move-object v6, v0

    goto :goto_0

    :cond_0
    move-object/from16 v6, p3

    :goto_0
    if-eqz v6, :cond_1

    iget-boolean v0, v6, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isOnlyLinkFolder:Z

    if-eqz v0, :cond_1

    return-object v4

    :cond_1
    const/4 v5, 0x1

    const/4 v0, 0x0

    if-eqz v6, :cond_2

    iget-boolean v7, v6, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isModified:Z

    if-eqz v7, :cond_2

    invoke-static {v6}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->shouldScan(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)Z

    move-result v7

    if-eqz v7, :cond_2

    const/4 v7, 0x1

    goto :goto_1

    :cond_2
    const/4 v7, 0x0

    :goto_1
    if-eqz v7, :cond_3

    const-string v8, "MediaScanner"

    const-string v9, "do scan folder %s"

    invoke-static {v8, v9, v3}, Lcom/miui/gallery/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_3
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    array-length v9, v1

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_2
    if-ge v10, v9, :cond_8

    aget-object v12, v1, v10

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_4

    return-object v4

    :cond_4
    invoke-virtual {v12}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_6

    if-eqz v7, :cond_5

    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const-wide/16 v13, -0x1

    move-object/from16 v15, p0

    :try_start_1
    iget-object v0, v15, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mFileClient:Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;

    invoke-virtual {v0, v2, v12, v6}, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->scanFile(Landroid/content/Context;Ljava/io/File;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)J

    move-result-wide v16

    cmp-long v0, v13, v16

    if-nez v0, :cond_7

    const-string v0, "MediaScanner"

    const-string v13, "scan %s fail"

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-static {v0, v13, v14}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    const/4 v11, 0x1

    goto :goto_4

    :catch_0
    move-exception v0

    goto :goto_3

    :catch_1
    move-exception v0

    move-object/from16 v15, p0

    :goto_3
    const-string v13, "MediaScanner"

    const-string v14, "scan file %s exception %s"

    invoke-virtual {v12}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v12

    invoke-static {v13, v14, v12, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_4

    :cond_5
    move-object/from16 v15, p0

    goto :goto_4

    :cond_6
    move-object/from16 v15, p0

    invoke-virtual {v8, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    :goto_4
    add-int/lit8 v10, v10, 0x1

    goto :goto_2

    :cond_8
    move-object/from16 v15, p0

    if-eqz v7, :cond_9

    invoke-direct/range {p0 .. p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result v0

    if-nez v0, :cond_9

    if-nez v11, :cond_9

    invoke-static {v2, v6}, Lcom/miui/gallery/scanner/MediaScanner;->access$200(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V

    sget-boolean v0, Lcom/miui/os/Rom;->IS_DEV:Z

    if-eqz v0, :cond_9

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p2

    move-wide/from16 v4, p5

    invoke-direct/range {v1 .. v6}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->recordScanCost(Landroid/content/Context;Ljava/lang/String;JLcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V

    :cond_9
    return-object v8
.end method

.method private isCancelled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    invoke-interface {v0}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method static synthetic lambda$new$37(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method private recordScanCost(Landroid/content/Context;Ljava/lang/String;JLcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V
    .locals 6

    :try_start_0
    iget-object v0, p5, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mServerID:Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    const-wide/16 v3, 0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/16 v2, 0x2

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    :cond_0
    invoke-static {p1, p2}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    const-string v0, "wait_for_scan_cost(s)"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p5, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mDateModified:J

    sub-long/2addr v1, v3

    const-wide/16 v3, 0x3e8

    div-long/2addr v1, v3

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p5

    invoke-virtual {p2, v0, p5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p5, "scan_cost(ms)"

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    sub-long/2addr v0, p3

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p5, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p3, "media_scanner"

    const-string p4, "scan_directory_%s"

    const/4 p5, 0x1

    new-array p5, p5, [Ljava/lang/Object;

    const/4 v0, 0x0

    aput-object p1, p5, v0

    invoke-static {p4, p5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p3, p1, p2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-void
.end method


# virtual methods
.method public scanFolder(Landroid/content/Context;Ljava/io/File;Z)V
    .locals 10

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v5

    if-eqz p2, :cond_d

    invoke-virtual {p2}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_d

    invoke-virtual {p2}, Ljava/io/File;->isHidden()Z

    move-result v0

    if-nez v0, :cond_d

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, v2}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->isOnlyLinkFileFolder(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ScannerDirectoryClient-"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    const-string v0, "scanFolder"

    invoke-static {v7, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-static {p1, v2, v0}, Lcom/miui/gallery/scanner/MediaScanner;->access$100(Landroid/content/Context;Ljava/lang/String;Landroid/content/ContentValues;)Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;

    move-result-object v3

    const-string v1, "queryAndUpdateAlbum"

    invoke-static {v7, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v8, 0x1

    if-eqz v3, :cond_2

    iget-boolean v4, v3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isModified:Z

    if-eqz v4, :cond_1

    invoke-static {v3}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->shouldScan(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_1

    goto :goto_0

    :cond_1
    const/4 v4, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v4, 0x1

    :goto_1
    if-nez v4, :cond_3

    if-nez p3, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-void

    :cond_3
    :try_start_1
    iget-object v4, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    if-eqz p3, :cond_4

    goto :goto_2

    :cond_4
    move-object v0, v3

    :goto_2
    xor-int/lit8 v9, p3, 0x1

    invoke-static {v4, v0, v9}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->newFileFilter(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Z)Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;

    move-result-object v0

    const-string v4, "newFileFilter"

    invoke-static {v7, v4}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p2, v0}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    move-result-object v4

    const-string p2, "listFiles"

    invoke-static {v7, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v4, :cond_c

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result p2

    if-nez p2, :cond_c

    invoke-virtual {v0}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->hasMediaFile()Z

    move-result p2

    if-eqz p2, :cond_8

    invoke-static {}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;->getFileComparator()Ljava/util/Comparator;

    move-result-object p2

    invoke-static {v4, p2}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    const-string p2, "sortFiles"

    invoke-static {v7, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-void

    :cond_5
    move-object v0, p0

    move-object v1, p1

    :try_start_2
    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->doScan(Landroid/content/Context;Ljava/lang/String;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;[Ljava/io/File;J)Ljava/util/ArrayList;

    move-result-object p2

    const-string v0, "doScan"

    invoke-static {v7, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_c

    if-eqz p2, :cond_c

    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_3
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_7

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/io/File;

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-void

    :cond_6
    :try_start_3
    invoke-virtual {p0, p1, p3, v8}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->scanFolder(Landroid/content/Context;Ljava/io/File;Z)V

    goto :goto_3

    :cond_7
    const-string p1, "scanChildFolders"

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_5

    :cond_8
    if-eqz v3, :cond_9

    invoke-static {p1, v3}, Lcom/miui/gallery/scanner/MediaScanner;->access$200(Landroid/content/Context;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V

    const-string p2, "updateAlbumDateModified"

    invoke-static {v7, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    if-eqz p3, :cond_c

    array-length p2, v4

    :goto_4
    if-ge v1, p2, :cond_b

    aget-object p3, v4, v1

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->isCancelled()Z

    move-result v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v0, :cond_a

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-void

    :cond_a
    :try_start_4
    invoke-virtual {p0, p1, p3, v8}, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->scanFolder(Landroid/content/Context;Ljava/io/File;Z)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    :cond_b
    const-string p1, "scanChildFolders"

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :cond_c
    :goto_5
    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    goto :goto_6

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerDirectoryClient;->PRINTER:Landroid/util/Printer;

    invoke-static {v7, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    throw p1

    :cond_d
    :goto_6
    return-void
.end method
