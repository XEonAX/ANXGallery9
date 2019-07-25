.class Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;
.super Ljava/lang/Object;
.source "MediaScanner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/MediaScanner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ScannerFileClient"
.end annotation


# instance fields
.field private final mBatchOperator:Lcom/miui/gallery/provider/ContentProviderBatchOperator;

.field private final mBulkNotify:Z

.field private final mInserter:Lcom/miui/gallery/scanner/MediaBulkInserter;

.field private final mIsInternalScanRequest:Z

.field private mNonBulkInsertCount:I

.field private final mTriggerSync:Z


# direct methods
.method constructor <init>(ZLcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mBulkNotify:Z

    iput-boolean p4, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mTriggerSync:Z

    iput-object p3, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mBatchOperator:Lcom/miui/gallery/provider/ContentProviderBatchOperator;

    iput-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mInserter:Lcom/miui/gallery/scanner/MediaBulkInserter;

    iput-boolean p5, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mIsInternalScanRequest:Z

    return-void
.end method


# virtual methods
.method public scanFile(Landroid/content/Context;Ljava/io/File;Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;)J
    .locals 11

    iget-boolean v0, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isOnlyLinkFolder:Z

    if-eqz v0, :cond_0

    const-wide/16 p1, 0x0

    return-wide p1

    :cond_0
    iget-boolean v0, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isShareAlbum:Z

    if-eqz v0, :cond_1

    iget-wide v0, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->getUniformAlbumId(J)J

    move-result-wide v0

    :goto_0
    move-wide v4, v0

    goto :goto_1

    :cond_1
    iget-wide v0, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mID:J

    goto :goto_0

    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mInserter:Lcom/miui/gallery/scanner/MediaBulkInserter;

    const/4 v1, 0x1

    const/4 v10, 0x0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    iget-boolean v2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mTriggerSync:Z

    if-eqz v2, :cond_2

    iget p3, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    invoke-static {p3}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isSyncable(I)Z

    move-result p3

    if-eqz p3, :cond_2

    const/4 v6, 0x1

    goto :goto_2

    :cond_2
    const/4 v6, 0x0

    :goto_2
    const/4 v7, 0x7

    iget-boolean v8, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mBulkNotify:Z

    iget-boolean v9, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mIsInternalScanRequest:Z

    move-object v2, v0

    move-object v3, p2

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JZIZZ)V

    iget-object p2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mInserter:Lcom/miui/gallery/scanner/MediaBulkInserter;

    iget-object p3, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mBatchOperator:Lcom/miui/gallery/provider/ContentProviderBatchOperator;

    invoke-static {p1, v0, p2, p3}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;Lcom/miui/gallery/scanner/MediaBulkInserter;Lcom/miui/gallery/provider/ContentProviderBatchOperator;)J

    move-result-wide p2

    const-wide/16 v2, -0x4

    cmp-long v0, v2, p2

    if-eqz v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mNonBulkInsertCount:I

    add-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mNonBulkInsertCount:I

    const/16 v1, 0x14

    if-le v0, v1, :cond_3

    iput v10, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mNonBulkInsertCount:I

    iget-object v0, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mInserter:Lcom/miui/gallery/scanner/MediaBulkInserter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/scanner/MediaBulkInserter;->flush(Landroid/content/Context;)V

    :cond_3
    return-wide p2

    :cond_4
    new-instance v0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    iget-boolean v2, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mTriggerSync:Z

    if-eqz v2, :cond_5

    iget p3, p3, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->mAttributes:I

    invoke-static {p3}, Lcom/miui/gallery/scanner/MediaScanner$AlbumEntry;->isSyncable(I)Z

    move-result p3

    if-eqz p3, :cond_5

    const/4 v6, 0x1

    goto :goto_3

    :cond_5
    const/4 v6, 0x0

    :goto_3
    const/4 v7, 0x7

    iget-boolean v8, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mBulkNotify:Z

    iget-boolean v9, p0, Lcom/miui/gallery/scanner/MediaScanner$ScannerFileClient;->mIsInternalScanRequest:Z

    move-object v2, v0

    move-object v3, p2

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JZIZZ)V

    invoke-static {p1, v0}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p1

    return-wide p1
.end method
