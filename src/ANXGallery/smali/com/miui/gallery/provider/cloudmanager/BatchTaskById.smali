.class abstract Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;
.super Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask;
.source "BatchTaskById.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# instance fields
.field protected mIds:[J


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

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    invoke-static {p3}, Lcom/miui/gallery/util/Numbers;->ensurePositive([J)V

    iput-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->mIds:[J

    return-void
.end method


# virtual methods
.method protected bindBatchCursorIndexes(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    goto :goto_2

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    iget-object v5, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v5, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-nez v3, :cond_1

    goto :goto_1

    :cond_1
    iput v2, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-virtual {p0, v0}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->verifyBatchItem(Landroid/database/Cursor;)J

    move-result-wide v4

    iput-wide v4, v3, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-void

    :cond_3
    :goto_2
    return-void
.end method

.method protected describeBundle(Landroid/os/Bundle;)Ljava/lang/String;
    .locals 5

    if-eqz p1, :cond_0

    const-string v0, "ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "%s:[%s]"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "ids"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-string v3, ","

    const-string v4, "ids"

    invoke-virtual {p1, v4}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    invoke-static {v3, p1}, Lcom/miui/gallery/util/StringUtils;->join(Ljava/lang/String;[J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected getBatchBundle(IILandroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2

    const-string v0, "ids"

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->mIds:[J

    add-int/2addr p2, p1

    invoke-static {v1, p1, p2}, Ljava/util/Arrays;->copyOfRange([JII)[J

    move-result-object p1

    invoke-virtual {p3, v0, p1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    return-object p3
.end method

.method protected getBatchExecuteKeys(Landroid/os/Bundle;)[Ljava/lang/Long;
    .locals 4

    const-string v0, "ids"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object p1

    array-length v0, p1

    new-array v0, v0, [Ljava/lang/Long;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_0

    aget-wide v2, p1, v1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method protected bridge synthetic getBatchExecuteKeys(Landroid/os/Bundle;)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->getBatchExecuteKeys(Landroid/os/Bundle;)[Ljava/lang/Long;

    move-result-object p1

    return-object p1
.end method

.method protected getTotalCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->mIds:[J

    array-length v0, v0

    return v0
.end method

.method protected verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    .locals 0
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

    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask;->verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    invoke-virtual {p4}, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->isAllInvalid()Z

    move-result p1

    if-nez p1, :cond_0

    const-wide/16 p1, -0x66

    invoke-virtual {p4, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->fillResult(J)V

    invoke-virtual {p0, p4}, Lcom/miui/gallery/provider/cloudmanager/BatchTaskById;->bindBatchCursorIndexes(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    :cond_0
    return-void
.end method

.method protected verifyBatchItem(Landroid/database/Cursor;)J
    .locals 2

    const-wide/16 v0, -0x1

    return-wide v0
.end method
