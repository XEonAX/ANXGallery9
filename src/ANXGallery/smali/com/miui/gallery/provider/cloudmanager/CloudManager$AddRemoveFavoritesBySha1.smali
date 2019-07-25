.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AddRemoveFavoritesBySha1"
.end annotation


# instance fields
.field protected mOperationType:I

.field protected mSha1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mOperationType:I

    iput-object p4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 13

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "dateFavorite"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v0, "isFavorite"

    iget v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mOperationType:I

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v1, v4, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const/4 v0, 0x0

    :try_start_0
    const-string v6, "favorites"

    const-string v1, "_id"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v7

    const-string v8, "sha1 = ?"

    new-array v9, v4, [Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    aput-object v1, v9, v3

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v1, :cond_1

    :try_start_1
    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v5

    if-lez v5, :cond_1

    const-string v0, "favorites"

    const-string v5, "sha1 = ?"

    new-array v6, v4, [Ljava/lang/String;

    iget-object v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    aput-object v7, v6, v3

    invoke-virtual {p1, v0, v2, v5, v6}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    int-to-long v5, v0

    goto :goto_1

    :catchall_0
    move-exception p1

    goto :goto_3

    :cond_1
    const-string v5, "sha1"

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v5, "source"

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v5, "favorites"

    invoke-virtual {p1, v5, v0, v2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v5

    :goto_1
    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-lez v0, :cond_3

    iget v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mOperationType:I

    if-ne v0, v4, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->insertToFavorites(Ljava/lang/String;)V

    goto :goto_2

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->removeFromFavorites(Ljava/lang/String;)V

    :goto_2
    const/4 p2, -0x1

    invoke-static {p2}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object p2

    const-string v0, "update %s set %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=\'%s\'"

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Object;

    const-string v7, "cloud"

    aput-object v7, v2, v3

    const-string v3, "editedColumns"

    aput-object v3, v2, v4

    const/4 v3, 0x2

    const-string v4, "editedColumns"

    aput-object v4, v2, v3

    const/4 v3, 0x3

    aput-object p2, v2, v3

    const/4 v3, 0x4

    aput-object p2, v2, v3

    const/4 v3, 0x5

    aput-object p2, v2, v3

    const/4 p2, 0x6

    const-string v3, "sha1"

    aput-object v3, v2, p2

    const/4 p2, 0x7

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    aput-object v3, v2, p2

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_3
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-wide v5

    :catchall_1
    move-exception p1

    move-object v1, v0

    :goto_3
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 8

    const-string v1, "cloud"

    sget-object v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v3, "sha1 = ? AND serverType IN (1,2) AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND (localGroupId!=-1000)"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

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
    .locals 6

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%s favorites by sha1: %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mOperationType:I

    const/4 v4, 0x1

    if-ne v3, v4, :cond_0

    const-string v3, "Add to"

    goto :goto_0

    :cond_0
    const-string v3, "Remove from"

    :goto_0
    const/4 v5, 0x0

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mSha1:Ljava/lang/String;

    aput-object v3, v2, v4

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$AddRemoveFavoritesBySha1;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x7

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v1, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0

    const-wide/16 v4, -0x6f

    cmp-long p1, v0, v4

    if-nez p1, :cond_1

    return-wide v4

    :cond_1
    return-wide v2
.end method
