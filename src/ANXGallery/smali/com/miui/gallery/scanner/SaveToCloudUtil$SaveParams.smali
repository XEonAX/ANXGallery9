.class public Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;
.super Ljava/lang/Object;
.source "SaveToCloudUtil.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/scanner/SaveToCloudUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SaveParams"
.end annotation


# instance fields
.field private final mAlbumId:J

.field private final mAlbumSyncState:I

.field private final mBulkNotify:Z

.field private final mIsInternalScanRequest:Z

.field private final mLocalFlag:I

.field private final mSaveFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;JIZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mSaveFile:Ljava/io/File;

    iput-wide p2, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumId:J

    iput p4, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mLocalFlag:I

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumSyncState:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mBulkNotify:Z

    iput-boolean p5, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mIsInternalScanRequest:Z

    return-void
.end method

.method public constructor <init>(Ljava/io/File;JZIZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mSaveFile:Ljava/io/File;

    iput-wide p2, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumId:J

    xor-int/lit8 p1, p4, 0x1

    iput p1, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumSyncState:I

    iput p5, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mLocalFlag:I

    iput-boolean p6, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mBulkNotify:Z

    iput-boolean p7, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mIsInternalScanRequest:Z

    return-void
.end method


# virtual methods
.method public getAlbumId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumId:J

    return-wide v0
.end method

.method public getLocalFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mLocalFlag:I

    return v0
.end method

.method public getSaveFile()Ljava/io/File;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mSaveFile:Ljava/io/File;

    return-object v0
.end method

.method public isAlbumSyncable()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumSyncState:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isBulkNotify()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mBulkNotify:Z

    return v0
.end method

.method public isInternalScanRequest()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mIsInternalScanRequest:Z

    return v0
.end method

.method public isSaveToSecretAlbum()Z
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumId:J

    const-wide/16 v2, -0x3e8

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isValidSyncValue()Z
    .locals 2

    iget v0, p0, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;->mAlbumSyncState:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method
