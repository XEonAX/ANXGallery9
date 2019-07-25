.class Lcom/miui/gallery/provider/cloudmanager/Delete;
.super Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;
.source "Delete.java"


# instance fields
.field private final TRACE_TAG:Ljava/lang/String;

.field private mDeleteReason:I


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

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    iput p4, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->mDeleteReason:I

    const-string p1, "CloudManager.Delete{%s}"

    const/4 p2, 0x1

    new-array p2, p2, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->getId()J

    move-result-wide p3

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    const/4 p4, 0x0

    aput-object p3, p2, p4

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
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

    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p2, "executeBatch"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "executeBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method

.method protected bridge synthetic executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0

    check-cast p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/Delete;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    return-void
.end method

.method protected executeOwner(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation

    new-instance p3, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/Delete;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/Delete;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->mDeleteReason:I

    invoke-direct {p3, v0, v1, p4, v2}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    return-object p1
.end method

.method protected executeSharer(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation

    new-instance p3, Lcom/miui/gallery/provider/cloudmanager/DeleteShare;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/Delete;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/Delete;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->mDeleteReason:I

    invoke-direct {p3, v0, v1, p4, v2}, Lcom/miui/gallery/provider/cloudmanager/DeleteShare;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DeleteShare;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    return-object p1
.end method

.method protected prepareBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Lcom/miui/gallery/provider/cache/MediaManager;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    :try_start_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;->prepareBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "prepareBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "prepareBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method

.method public run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "count{%s}, reason{%s}"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/Delete;->getTotalCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->mDeleteReason:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    invoke-static {p2, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    throw p1
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

    :try_start_0
    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;->verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p2, "verifyBatch"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/Delete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "verifyBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method
