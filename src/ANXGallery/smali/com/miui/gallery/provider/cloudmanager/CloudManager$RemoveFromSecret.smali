.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RemoveFromSecret"
.end annotation


# instance fields
.field private mAlbumId:J

.field private mMediaId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJ)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    iput-wide p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mAlbumId:J

    return-void
.end method

.method private addFilePath(Landroid/content/ContentValues;Z)V
    .locals 9

    const-string v0, "localFile"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x7

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "thumbnailFile"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0x8

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "microthumbfile"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/16 v4, 0xc

    invoke-interface {v1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x6

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/cloud/DownloadPathHelper;->addPostfixToFileName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    :goto_0
    const-string v0, "fileName"

    invoke-virtual {p1, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0xb

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v0

    const/16 v1, 0x12

    const/4 v5, 0x5

    const/4 v6, 0x4

    if-eqz v0, :cond_1

    new-instance v7, Lcom/miui/gallery/data/DBCloud;

    iget-object v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {v8, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Lcom/miui/gallery/data/DBCloud;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setFileName(Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/miui/gallery/data/DBCloud;->setSecretKey([B)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/16 v0, 0x9

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setSha1(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setLocalFile(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setThumbnailFile(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setMicroThumbFile(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setServerType(I)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v7, p2}, Lcom/miui/gallery/data/DBCloud;->setTitle(Ljava/lang/String;)V

    invoke-static {v7, p1}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decryptFiles(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V

    goto :goto_1

    :cond_1
    new-instance v0, Lcom/miui/gallery/data/DBCloud;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {v4, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v4}, Lcom/miui/gallery/data/DBCloud;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/DBCloud;->setFileName(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/DBCloud;->setLocalFile(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/DBCloud;->setThumbnailFile(Ljava/lang/String;)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v5}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/DBCloud;->setServerType(I)V

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/data/DBCloud;->setTitle(Ljava/lang/String;)V

    invoke-static {v0, p1}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->decodeFileNames(Lcom/miui/gallery/data/DBImage;Landroid/content/ContentValues;)V

    :goto_1
    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 13

    invoke-static {}, Lcom/miui/gallery/cloud/SpaceFullHandler;->isOwnerSpaceFull()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide/16 p1, -0x6a

    return-wide p1

    :cond_0
    new-instance v8, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mContext:Landroid/content/Context;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x6

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mAlbumId:J

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/16 v7, 0x9

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    move-object v0, v8

    invoke-direct/range {v0 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;-><init>(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;)V

    const/4 v0, 0x0

    invoke-virtual {v8, p1, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v1

    const-wide/16 v3, -0x68

    cmp-long v5, v1, v3

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v5, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v9

    new-array v10, v4, [J

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    aput-wide v0, v10, v3

    const/16 v11, 0x25

    move-object v7, p1

    move-object v8, p2

    invoke-static/range {v6 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J

    const-wide/16 p1, -0x67

    return-wide p1

    :cond_1
    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/4 v6, 0x2

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const-wide/16 v6, -0x65

    const-wide/16 v8, -0x69

    if-eqz v5, :cond_6

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v10, "localGroupId"

    iget-wide v11, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mAlbumId:J

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v11

    invoke-virtual {v0, v10, v11}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    iget-object v10, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/4 v11, 0x4

    invoke-interface {v10, v11}, Landroid/database/Cursor;->isNull(I)Z

    move-result v10

    if-eqz v10, :cond_2

    const/4 v10, 0x7

    if-ne v5, v10, :cond_2

    const-string v5, "localFlag"

    const/16 v10, 0x8

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v0, v5, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :cond_2
    cmp-long v5, v1, v8

    if-nez v5, :cond_3

    const/4 v1, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x0

    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->addFilePath(Landroid/content/ContentValues;Z)V

    const-string v1, "cloud"

    const-string v2, "_id=?"

    new-array v5, v4, [Ljava/lang/String;

    iget-wide v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v5, v3

    invoke-virtual {p1, v1, v0, v2, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_5

    if-eqz p2, :cond_4

    const-string p1, "_id=?"

    new-array v1, v4, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-virtual {p2, p1, v1, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    :cond_4
    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-virtual {p0, v6, v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->markAsDirty(J)V

    :cond_5
    move-wide v0, v6

    goto/16 :goto_2

    :cond_6
    new-instance v5, Landroid/content/ContentValues;

    invoke-direct {v5}, Landroid/content/ContentValues;-><init>()V

    const-string v6, "localFlag"

    const/16 v7, 0xb

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v5, v6, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    new-instance v6, Landroid/content/ContentValues;

    invoke-direct {v6}, Landroid/content/ContentValues;-><init>()V

    const-string v7, "localFlag"

    const/4 v10, 0x5

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v6, v7, v10}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$200()[Ljava/lang/String;

    move-result-object v7

    iget-object v10, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    invoke-static {v7, v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    cmp-long v7, v1, v8

    if-nez v7, :cond_7

    const/4 v1, 0x1

    goto :goto_1

    :cond_7
    const/4 v1, 0x0

    :goto_1
    invoke-direct {p0, v6, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->addFilePath(Landroid/content/ContentValues;Z)V

    const-string v1, "fromLocalGroupId"

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mCursor:Landroid/database/Cursor;

    const/4 v7, 0x3

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "localGroupId"

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mAlbumId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "localImageId"

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v6, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "cloud"

    invoke-virtual {p1, v1, v0, v6}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    const-wide/16 v7, 0x0

    cmp-long v2, v0, v7

    if-lez v2, :cond_9

    invoke-virtual {p2, v0, v1, v6}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string v2, "cloud"

    const-string v6, "_id=?"

    new-array v7, v4, [Ljava/lang/String;

    iget-wide v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-virtual {p1, v2, v5, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_8

    const-string p1, "_id=?"

    new-array v2, v4, [Ljava/lang/String;

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p2, p1, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    :cond_8
    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->markAsDirty(J)V

    :cond_9
    :goto_2
    return-wide v0
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 8

    const-string v1, "cloud"

    sget-object v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v3, "_id=?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "RemoveFromSecret{%d}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$RemoveFromSecret;->mMediaId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
