.class abstract Lcom/miui/gallery/provider/cloudmanager/DupMedia;
.super Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;
.source "DupMedia.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;
    }
.end annotation


# instance fields
.field private mDupType:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JI)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    iput p4, p0, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->mDupType:I

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

    move-object p3, p4

    check-cast p3, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;

    new-instance v0, Landroid/util/LongSparseArray;

    iget-object v1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/LongSparseArray;-><init>(I)V

    iget-object v1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToFirst()Z

    :goto_0
    iget-object v1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->isAfterLast()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    iget-object v1, p3, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;->sha1ToKeyMap:Ljava/util/Map;

    iget-object v3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/16 v4, 0x9

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Long;

    if-eqz v1, :cond_0

    iget-object v3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {v0, v2, v3, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    :cond_0
    iget-object v1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result p3

    if-lez p3, :cond_5

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result p3

    new-array p3, p3, [J

    const/4 v1, 0x0

    :goto_1
    array-length v3, p3

    if-ge v1, v3, :cond_2

    invoke-virtual {v0, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v3

    aput-wide v3, p3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->executeDupItems(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)[J

    move-result-object p1

    :goto_2
    array-length p2, p3

    if-ge v2, p2, :cond_5

    iget-object p2, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    aget-wide v3, p3, v2

    invoke-virtual {v0, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p2, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    iget-wide v3, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-wide/16 v5, 0x0

    cmp-long v1, v3, v5

    if-gez v1, :cond_3

    iput-wide v5, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    :cond_3
    iget-wide v3, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    aget-wide v7, p1, v2

    cmp-long v1, v7, v5

    if-lez v1, :cond_4

    const-wide/16 v5, 0x1

    :cond_4
    const/4 v1, 0x0

    add-long/2addr v3, v5

    iput-wide v3, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_5
    return-void
.end method

.method protected bridge synthetic executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0

    check-cast p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    return-void
.end method

.method protected abstract executeDupItems(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)[J
.end method

.method protected genBatchOperationData([Ljava/lang/Long;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Long;",
            ")",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;

    invoke-direct {v0, p1}, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;-><init>([Ljava/lang/Long;)V

    return-object v0
.end method

.method protected bridge synthetic genBatchOperationData([Ljava/lang/Object;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;
    .locals 0

    check-cast p1, [Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->genBatchOperationData([Ljava/lang/Long;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    move-result-object p1

    return-object p1
.end method

.method protected queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    iget v2, v1, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->mDupType:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    packed-switch v2, :pswitch_data_0

    move-object v2, v5

    goto/16 :goto_5

    :pswitch_0
    const-string v2, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL"

    goto/16 :goto_5

    :pswitch_1
    const/4 v9, 0x1

    :try_start_0
    const-string v10, "cloud"

    const-string v2, "localGroupId"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v11

    const-string v2, "%s IN (%s)"

    new-array v8, v4, [Ljava/lang/Object;

    const-string v12, "_id"

    aput-object v12, v8, v7

    const-string v12, ","

    invoke-static {v12, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    aput-object v12, v8, v6

    invoke-static {v2, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v17}, Landroid/database/sqlite/SQLiteDatabase;->query(ZLjava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v2, :cond_1

    :try_start_1
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v8

    if-le v8, v6, :cond_0

    const-string v3, "CloudManager.DupMedia"

    const-string v4, "Cannot handle dup in album with multiple albums!"

    invoke-static {v3, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v8

    if-eqz v8, :cond_1

    const-string v8, "(%s) AND %s IN (%s)"

    new-array v3, v3, [Ljava/lang/Object;

    const-string v9, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL"

    aput-object v9, v3, v7

    const-string v9, "localGroupId"

    aput-object v9, v3, v6

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v9

    aput-object v9, v3, v4

    invoke-static {v8, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :cond_1
    :goto_0
    move-object v3, v5

    :goto_1
    if-eqz v2, :cond_2

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_2
    move-object v2, v3

    goto :goto_5

    :catchall_1
    move-exception v0

    move-object v2, v5

    :goto_2
    if-eqz v2, :cond_3

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_3
    throw v0

    :pswitch_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    :try_start_2
    const-string v9, "cloud"

    const-string v8, "_id"

    filled-new-array {v8}, [Ljava/lang/String;

    move-result-object v10

    const-string v11, "attributes & 4 != 0"

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    if-eqz v8, :cond_5

    :goto_3
    :try_start_3
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v8}, Landroid/database/Cursor;->isFirst()Z

    move-result v9

    if-nez v9, :cond_4

    const/16 v9, 0x2c

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_4
    invoke-interface {v8, v7}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    invoke-virtual {v2, v9, v10}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v0

    move-object v5, v8

    goto :goto_4

    :cond_5
    if-eqz v8, :cond_6

    invoke-interface {v8}, Landroid/database/Cursor;->close()V

    :cond_6
    const-string v8, "(%s) AND %s IN (%s)"

    new-array v3, v3, [Ljava/lang/Object;

    const-string v9, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND sha1 IN (SELECT sha1 FROM cloud WHERE _id IN (%s)) AND sha1 NOT NULL"

    aput-object v9, v3, v7

    const-string v9, "localGroupId"

    aput-object v9, v3, v6

    aput-object v2, v3, v4

    invoke-static {v8, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_5

    :catchall_3
    move-exception v0

    :goto_4
    if-eqz v5, :cond_7

    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    :cond_7
    throw v0

    :goto_5
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_8

    return-object v5

    :cond_8
    const-string v9, "cloud"

    sget-object v10, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    new-array v3, v6, [Ljava/lang/Object;

    const-string v4, ","

    invoke-static {v4, v0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const-string v15, "sha1 DESC,serverId DESC "

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v15}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected bridge synthetic queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Object;)Landroid/database/Cursor;
    .locals 0

    check-cast p2, [Ljava/lang/Long;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method protected verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    .locals 6
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

    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    invoke-virtual {p4}, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->isAllInvalid()Z

    move-result p1

    if-nez p1, :cond_1

    move-object p1, p4

    check-cast p1, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;

    const-wide/16 p2, -0x66

    invoke-virtual {p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;->fillResult(J)V

    iget-object p2, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_0
    invoke-interface {p2}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    invoke-interface {p2, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {p2, p3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iget-object v3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    iget-object v4, p1, Lcom/miui/gallery/provider/cloudmanager/DupMedia$DupOperationData;->sha1ToKeyMap:Ljava/util/Map;

    const/16 v5, 0x9

    invoke-interface {p2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-interface {v4, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iput v0, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-virtual {p0, p2}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->verifyBatchItem(Landroid/database/Cursor;)J

    move-result-wide v1

    iput-wide v1, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method
