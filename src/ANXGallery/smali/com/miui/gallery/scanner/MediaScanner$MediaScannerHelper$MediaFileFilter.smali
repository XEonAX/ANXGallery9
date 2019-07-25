.class public Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;
.super Ljava/lang/Object;
.source "MediaScanner.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MediaFileFilter"
.end annotation


# static fields
.field private static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mExcludeDirectory:Z

.field private mExistingFilesMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;",
            ">;"
        }
    .end annotation
.end field

.field private mHasMediaFile:Z

.field private mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "localFile"

    const-string v1, "thumbnailFile"

    const-string v2, "size"

    const-string v3, "dateModified"

    filled-new-array {v0, v1, v2, v3}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    iput-boolean p3, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExcludeDirectory:Z

    invoke-direct {p0, p2}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->loadFileEntries(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V

    return-void
.end method

.method private isCancelled()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mJobContext:Lcom/miui/gallery/threadpool/ThreadPool$JobContext;

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

.method private loadFileEntries(Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)V
    .locals 9

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/provider/cache/MediaManager;->getInstance()Lcom/miui/gallery/provider/cache/MediaManager;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->PROJECTION:[Ljava/lang/String;

    const-string v2, "localGroupId = ?"

    const/4 v7, 0x1

    new-array v3, v7, [Ljava/lang/String;

    iget-wide v4, p1, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 v8, 0x0

    aput-object p1, v3, v8

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/provider/cache/MediaManager;->query([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_3

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExistingFilesMap:Ljava/util/Map;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-interface {p1, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_2

    :cond_1
    move-object v1, v0

    const/4 v0, 0x1

    goto :goto_1

    :cond_2
    move-object v1, v0

    const/4 v0, 0x0

    :goto_1
    new-instance v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;-><init>(Lcom/miui/gallery/scanner/MediaScanner$1;)V

    iput-boolean v0, v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;->mIsThumbnail:Z

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;->mFileSize:J

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iput-wide v3, v2, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;->mDateModified:J

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExistingFilesMap:Ljava/util/Map;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_3
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 7

    invoke-direct {p0}, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->isCancelled()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isHidden()Z

    move-result p1

    if-eqz p1, :cond_0

    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_2

    iget-boolean p1, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExcludeDirectory:Z

    if-nez p1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/scanner/MediaScanner;->isScannableDirectory(Ljava/io/File;)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    :goto_0
    return p2

    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p1

    if-eqz p1, :cond_8

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExistingFilesMap:Ljava/util/Map;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mExistingFilesMap:Ljava/util/Map;

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;

    if-eqz p1, :cond_4

    iget-wide v2, p1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;->mFileSize:J

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v4

    cmp-long v6, v2, v4

    if-eqz v6, :cond_3

    iget-wide v2, p1, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$FileEntry;->mDateModified:J

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    cmp-long p1, v2, v4

    if-nez p1, :cond_4

    :cond_3
    return v1

    :cond_4
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getSupportUploadMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_6

    :cond_5
    const/4 v1, 0x1

    :cond_6
    iget-boolean p1, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mHasMediaFile:Z

    if-nez p1, :cond_7

    if-eqz v1, :cond_7

    iput-boolean p2, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mHasMediaFile:Z

    :cond_7
    return v1

    :cond_8
    return v1
.end method

.method public hasMediaFile()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/scanner/MediaScanner$MediaScannerHelper$MediaFileFilter;->mHasMediaFile:Z

    return v0
.end method
