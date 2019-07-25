.class Lcom/miui/gallery/provider/cloudmanager/DupDelete;
.super Lcom/miui/gallery/provider/cloudmanager/DupMedia;
.source "DupDelete.java"


# instance fields
.field private final TRACE_TAG:Ljava/lang/String;

.field private mDeleteReason:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;[JII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;[JII)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V

    iput p5, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->mDeleteReason:I

    const-string p1, "CloudManager.DupDelete{%s}"

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

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

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
    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p2, "executeBatch"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "executeBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method

.method protected bridge synthetic executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Ljava/lang/Object;)V
    .locals 0

    check-cast p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->executeBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V

    return-void
.end method

.method protected executeDupItems(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;[J)[J
    .locals 4

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v2

    iget v3, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->mDeleteReason:I

    invoke-direct {v0, v1, v2, p3, v3}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[JI)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DeleteOwner;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

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
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->prepareBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;)Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "prepareBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "prepareBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method

.method public run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "count{%s}, reason{%s}"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    iget v4, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->mDeleteReason:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, 0x64

    :try_start_0
    invoke-super {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    new-instance v3, Landroid/util/StringBuilderPrinter;

    invoke-direct {v3, p2}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v2, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    if-lez v4, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    int-to-long v4, v4

    mul-long v4, v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_0

    const-string v0, "CloudManager.DupDelete"

    const-string v1, "delete slowly: %s"

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v1, v4}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "cost"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    int-to-long v4, v4

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "detail"

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "delete_performance"

    const-string v1, "CloudManager.DupDelete"

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-object p1

    :catchall_0
    move-exception p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    new-instance v3, Landroid/util/StringBuilderPrinter;

    invoke-direct {v3, p2}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v2, v3}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    if-lez v4, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v4

    int-to-long v4, v4

    mul-long v4, v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CloudManager.DupDelete"

    const-string v4, "delete slowly: %s"

    invoke-static {v1, v4, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->getTotalCount()I

    move-result v1

    int-to-long v4, v1

    div-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const-string v2, "cost"

    invoke-virtual {v0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v1, "detail"

    invoke-virtual {v0, v1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "delete_performance"

    const-string v1, "CloudManager.DupDelete"

    invoke-static {p2, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
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
    invoke-super {p0, p1, p2, p3, p4}, Lcom/miui/gallery/provider/cloudmanager/DupMedia;->verifyBatch(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p2, "verifyBatch"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :catchall_0
    move-exception p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/DupDelete;->TRACE_TAG:Ljava/lang/String;

    const-string p3, "verifyBatch"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    throw p1
.end method

.method protected verifyBatchItem(Landroid/database/Cursor;)J
    .locals 5

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const-wide/16 v1, -0x64

    if-nez v0, :cond_0

    const-string p1, "CloudManager.DupDelete"

    const-string v0, "Album can\'t be deleted here, use DeleteAlbum instead"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v1

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "CloudManager.DupDelete"

    const-string v0, "Share medias can\'t be deleted here, use DeleteSharer instead"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v1

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method
