.class Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;
.super Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;
.source "SharerFileHandleTask.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[J)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    return-void
.end method


# virtual methods
.method protected executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Landroid/os/Bundle;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p1

    iget-object p2, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keys:[Ljava/lang/Object;

    check-cast p2, [Ljava/lang/Long;

    array-length p3, p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p3, :cond_3

    aget-object v1, p2, v0

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v1

    iget-object v3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-eqz v3, :cond_2

    iget-wide v4, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-wide/16 v6, -0x1

    cmp-long v8, v4, v6

    if-nez v8, :cond_2

    iget v4, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    if-gez v4, :cond_0

    goto :goto_2

    :cond_0
    iget-object v4, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    iget v5, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-interface {v4, v5}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v4, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/ShareMediaManager;->convertToMediaId(J)J

    move-result-wide v5

    const/16 v7, 0x28

    invoke-static {p1, v4, v5, v6, v7}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->from(Landroid/content/ContentResolver;Landroid/database/Cursor;JI)Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;

    move-result-object v4

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->run(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-wide/16 v4, 0x1

    goto :goto_1

    :cond_1
    const-wide/16 v4, 0x0

    :goto_1
    iput-wide v4, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-string v4, "CloudManager.SharerFileHandleTask"

    const-string v5, "MediaFileHandleJob result for %d is %s"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v4, v5, v1, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_2
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method protected bridge synthetic executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0

    check-cast p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    return-void
.end method

.method protected queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    sget-object v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string p1, "%s IN (%s)"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "_id"

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, ","

    invoke-static {v4, p2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    const/4 v4, 0x1

    aput-object p2, v3, v4

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method protected bridge synthetic queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Object;)Landroid/database/Cursor;
    .locals 0

    check-cast p2, [Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
