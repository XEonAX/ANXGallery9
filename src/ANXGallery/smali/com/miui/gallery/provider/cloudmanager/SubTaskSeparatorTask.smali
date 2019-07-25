.class abstract Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;
.super Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;
.source "SubTaskSeparatorTask.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;
    }
.end annotation


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

.method private applyResult(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[JLjava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    iget-object v1, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-eqz v1, :cond_0

    aget-wide v2, p2, v0

    iput-wide v2, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
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

    check-cast p3, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p3, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;->typeIdsArrays:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget-object v1, p3, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;->typeIdsArrays:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    if-eqz v2, :cond_1

    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-gtz v2, :cond_0

    goto :goto_1

    :cond_0
    const-string v2, "CloudManager.SubTaskSeparatorTask"

    const-string v3, "[%s] Start execute type %d for ids [%s]"

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    iget-object v5, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    const-string v6, ","

    iget-object v7, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v6, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v3, v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v2, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    iget-object v2, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    invoke-static {v2}, Lcom/miui/gallery/util/Numbers;->toArray(Ljava/util/List;)[J

    move-result-object v8

    move-object v3, p0

    move-object v5, p1

    move-object v6, p2

    move-object v7, p4

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;->executeType(ILandroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J

    move-result-object v2

    const-string v3, "CloudManager.SubTaskSeparatorTask"

    const-string v4, "[%s] Result [%s]"

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, ","

    invoke-static {v6, v2}, Lcom/miui/gallery/util/StringUtils;->join(Ljava/lang/String;[J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-direct {p0, p4, v2, v1}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;->applyResult(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[JLjava/util/ArrayList;)V

    :cond_1
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method protected bridge synthetic executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0

    check-cast p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    return-void
.end method

.method protected abstract executeType(ILandroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation
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

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;

    invoke-direct {v0, p1}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;-><init>([Ljava/lang/Long;)V

    return-object v0
.end method

.method protected bridge synthetic genBatchOperationData([Ljava/lang/Object;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;
    .locals 0

    check-cast p1, [Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;->genBatchOperationData([Ljava/lang/Long;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getItemTaskType(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;J)I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Landroid/os/Bundle;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;J)I"
        }
    .end annotation
.end method

.method protected verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    .locals 15
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

    move-object/from16 v7, p4

    invoke-super/range {p0 .. p4}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    move-object v8, v7

    check-cast v8, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;

    iget-object v0, v8, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;->keys:[Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, [Ljava/lang/Long;

    array-length v10, v9

    const/4 v0, 0x0

    const/4 v11, 0x0

    :goto_0
    if-ge v11, v10, :cond_2

    aget-object v0, v9, v11

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    iget-object v0, v7, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    move-object v14, v0

    check-cast v14, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-nez v14, :cond_0

    goto :goto_1

    :cond_0
    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-wide v5, v12

    invoke-virtual/range {v0 .. v6}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;->getItemTaskType(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;J)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {v8, v12, v13, v0}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask$OperationData;->putItemToType(JI)V

    const-wide/16 v0, -0x1

    iput-wide v0, v14, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    :cond_1
    :goto_1
    add-int/lit8 v11, v11, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method
