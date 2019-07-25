.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddToSecretByUri"
.end annotation


# instance fields
.field private mTarPath:Ljava/lang/String;

.field private mUri:Landroid/net/Uri;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Landroid/net/Uri;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    return-void
.end method

.method private static canAddSecret(Landroid/content/Context;Ljava/lang/String;)I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 p0, -0x6a

    return p0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/cloud/CloudUtils;->canUpload(Ljava/lang/String;)I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    const/16 p0, -0x6c

    return p0

    :cond_1
    if-eqz v0, :cond_2

    const/16 p0, -0x6b

    return p0

    :cond_2
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0, p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p0

    const-wide/16 v0, -0x6f

    cmp-long v2, p0, v0

    if-nez v2, :cond_3

    const/16 p0, -0x6f

    return p0

    :cond_3
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0x23

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v0, v4, v6

    if-lez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;

    iget-object v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v9

    invoke-direct {v0, v8, v9, v4, v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;-><init>(Landroid/content/Context;Ljava/util/ArrayList;J)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecret;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p1

    cmp-long v0, p1, v6

    if-lez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v2, v2, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    const-string v3, "AddToSecretByUri"

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_0
    return-wide p1

    :cond_1
    return-wide v6

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mContext:Landroid/content/Context;

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->canAddSecret(Landroid/content/Context;Ljava/lang/String;)I

    move-result p1

    if-gez p1, :cond_3

    int-to-long p1, p1

    return-wide p1

    :cond_3
    sget-object p1, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getSafePathInPriorStorage(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {p2}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->addPostfixToFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    new-instance v0, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {v4}, Lcom/miui/gallery/util/FileUtils;->getParentFolderPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4, p2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance p2, Ljava/io/File;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-direct {p2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {p2, v0}, Lcom/miui/gallery/util/FileUtils;->move(Ljava/io/File;Ljava/io/File;)Z

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {p2, p1}, Lcom/miui/gallery/util/ExtraTextUtils;->startsWithIgnoreCase(Ljava/lang/String;Ljava/lang/String;)Z

    move-result p2

    if-nez p2, :cond_5

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {p2, p1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->moveImageToFolder(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v4

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mContext:Landroid/content/Context;

    new-instance p2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    new-instance v6, Ljava/io/File;

    invoke-direct {v6, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-wide/16 v7, -0x3e8

    const/16 v9, 0x8

    const/4 v10, 0x1

    move-object v5, p2

    invoke-direct/range {v5 .. v10}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JIZ)V

    invoke-static {p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p1

    const-wide/16 v4, -0x2

    cmp-long v0, p1, v4

    if-nez v0, :cond_7

    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p2, v2, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    aput-object v0, p2, v3

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_6

    new-instance p1, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    const-string v0, "AddToSecretByUri"

    invoke-direct {p1, v1, p2, v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {p1}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_6
    const-wide/16 p1, -0x67

    return-wide p1

    :cond_7
    const-wide/16 v4, -0x1

    cmp-long v0, p1, v4

    if-nez v0, :cond_8

    const-wide/16 p1, -0x65

    return-wide p1

    :cond_8
    sget-object v0, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array v2, v2, [Ljava/lang/String;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    aput-object v4, v2, v3

    invoke-static {v0, v2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_9

    new-instance v0, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    const-string v3, "AddToSecretByUri"

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    :cond_9
    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    if-eqz v0, :cond_2

    const-string v0, "content"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    const-string v0, "_data"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri$1;-><init>(Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;)V

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v0, "file"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    invoke-virtual {v1}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->queryCloudItemByFilePath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "%s{%s}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "AddToSecretByUri"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mUri:Landroid/net/Uri;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddToSecretByUri;->mTarPath:Ljava/lang/String;

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-wide/16 v0, -0x1

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x64

    :goto_0
    return-wide v0
.end method
