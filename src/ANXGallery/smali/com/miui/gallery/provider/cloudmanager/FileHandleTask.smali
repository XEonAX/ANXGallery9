.class Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;
.super Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;
.source "FileHandleTask.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;[J)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/provider/cloudmanager/OwnerShareSeparatorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    return-void
.end method


# virtual methods
.method protected executeOwner(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 2
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

    new-instance p3, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p3, v0, v1, p4}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    return-object p1
.end method

.method protected executeSharer(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 2
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

    new-instance p3, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v1

    invoke-direct {p3, v0, v1, p4}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    invoke-virtual {p3, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/SharerFileHandleTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    return-object p1
.end method
