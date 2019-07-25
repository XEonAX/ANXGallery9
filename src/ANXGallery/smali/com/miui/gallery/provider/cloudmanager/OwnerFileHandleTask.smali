.class Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;
.super Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;
.source "OwnerFileHandleTask.java"


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

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/provider/cloudmanager/SubTaskSeparatorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;[J)V

    return-void
.end method

.method private batchExecuteAlbumOperations(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation

    array-length v0, p2

    new-array v0, v0, [J

    const/4 v1, 0x0

    :goto_0
    array-length v2, p2

    if-ge v1, v2, :cond_3

    iget-object v2, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    aget-wide v3, p2, v1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-eqz v2, :cond_2

    iget-wide v3, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    if-nez v7, :cond_2

    iget v3, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    if-gez v3, :cond_0

    goto :goto_2

    :cond_0
    iget-object v3, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    iget v2, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-interface {v3, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v2, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-static {v2}, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->from(Landroid/database/Cursor;)Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/provider/cloudmanager/AlbumFileHandleJob;->run(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x1

    goto :goto_1

    :cond_1
    const-wide/16 v2, 0x0

    :goto_1
    aput-wide v2, v0, v1

    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private batchExecuteDeleteMedia(Landroid/content/ContentResolver;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    array-length v3, v2

    new-array v3, v3, [J

    new-instance v4, Landroid/util/LongSparseArray;

    invoke-direct {v4}, Landroid/util/LongSparseArray;-><init>()V

    array-length v5, v2

    array-length v6, v2

    const/4 v7, 0x2

    div-int/2addr v6, v7

    const/4 v8, 0x1

    add-int/2addr v6, v8

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, v5}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9, v5}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11, v5}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v12, 0x0

    :goto_0
    array-length v13, v2

    if-ge v12, v13, :cond_5

    iget-object v13, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    aget-wide v14, v2, v12

    invoke-static {v14, v15}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    invoke-virtual {v13, v14}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-eqz v13, :cond_4

    iget-wide v14, v13, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-wide/16 v16, -0x1

    cmp-long v18, v14, v16

    if-nez v18, :cond_4

    iget v14, v13, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    if-gez v14, :cond_0

    goto/16 :goto_1

    :cond_0
    iget-object v14, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    iget v13, v13, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-interface {v14, v13}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v13, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 v14, 0x3

    invoke-interface {v13, v14}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    move-object/from16 v15, p0

    invoke-direct {v15, v0, v13, v14, v4}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getAlbumDirectory(Landroid/content/ContentResolver;JLandroid/util/LongSparseArray;)Ljava/lang/String;

    move-result-object v13

    iget-object v14, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/16 v5, 0x8

    invoke-interface {v14, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-static {v14, v5, v13}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->shouldDeleteFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v14

    const/16 v8, 0x28

    if-eqz v14, :cond_1

    invoke-interface {v9, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v14, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v7, "CloudManager.OwnerFileHandleTask"

    invoke-direct {v14, v8, v5, v7}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v5, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 v7, 0x7

    invoke-interface {v5, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7, v5, v13}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->shouldDeleteFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v7, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    const-string v13, "CloudManager.OwnerFileHandleTask"

    invoke-direct {v7, v8, v5, v13}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v11, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-object v5, v1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 v7, 0x2

    invoke-interface {v5, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v5

    const/4 v8, -0x1

    if-ne v5, v8, :cond_3

    sget-object v5, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {v5}, Landroid/content/ContentProviderOperation;->newDelete(Landroid/net/Uri;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    const-string v8, "_id=?"

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/String;

    aget-wide v16, v2, v12

    invoke-static/range {v16 .. v17}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v16

    const/16 v17, 0x0

    aput-object v16, v14, v17

    invoke-virtual {v5, v8, v14}, Landroid/content/ContentProviderOperation$Builder;->withSelection(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/ContentProviderOperation$Builder;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/ContentProviderOperation$Builder;->build()Landroid/content/ContentProviderOperation;

    move-result-object v5

    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-wide/16 v18, 0x0

    aput-wide v18, v3, v12

    goto :goto_2

    :cond_3
    const/4 v13, 0x1

    const/16 v17, 0x0

    const-wide/16 v18, 0x1

    aput-wide v18, v3, v12

    goto :goto_2

    :cond_4
    :goto_1
    const/4 v13, 0x1

    const/16 v17, 0x0

    move-object/from16 v15, p0

    :goto_2
    add-int/lit8 v12, v12, 0x1

    const/4 v8, 0x1

    goto/16 :goto_0

    :cond_5
    move-object/from16 v15, p0

    invoke-static {v6}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-interface {v6}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->ORIGINAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    invoke-interface {v6, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_6
    invoke-static {v9}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v1

    new-array v1, v1, [Ljava/lang/String;

    sget-object v2, Lcom/miui/gallery/util/MediaFileUtils$FileType;->THUMBNAIL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    invoke-interface {v9, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    :cond_7
    invoke-static {v11}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-static {v11}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;)V

    :cond_8
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_9

    :try_start_0
    const-string v1, "com.miui.gallery.cloud.provider"

    invoke-virtual {v0, v1, v10}, Landroid/content/ContentResolver;->applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;

    const-string v0, "CloudManager.OwnerFileHandleTask"

    const-string v1, "Done operate %d delete operations"

    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    const-string v1, "CloudManager.OwnerFileHandleTask"

    invoke-static {v1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_3
    return-object v3
.end method

.method private batchExecuteOtherMediaOperations(Landroid/content/ContentResolver;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData<",
            "Ljava/lang/Long;",
            ">;[J)[J"
        }
    .end annotation

    array-length v0, p3

    new-array v0, v0, [J

    const/4 v1, 0x0

    :goto_0
    array-length v2, p3

    if-ge v1, v2, :cond_3

    iget-object v2, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    aget-wide v3, p3, v1

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    if-eqz v2, :cond_2

    iget-wide v3, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->result:J

    const-wide/16 v5, -0x1

    cmp-long v7, v3, v5

    if-nez v7, :cond_2

    iget v3, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    if-gez v3, :cond_0

    goto :goto_2

    :cond_0
    iget-object v3, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    iget v2, v2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-interface {v3, v2}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v2, p2, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    aget-wide v3, p3, v1

    const/16 v5, 0x28

    invoke-static {p1, v2, v3, v4, v5}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->from(Landroid/content/ContentResolver;Landroid/database/Cursor;JI)Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->run(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-wide/16 v2, 0x1

    goto :goto_1

    :cond_1
    const-wide/16 v2, 0x0

    :goto_1
    aput-wide v2, v0, v1

    :cond_2
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v0
.end method

.method private getAlbumDirectory(Landroid/content/ContentResolver;JLandroid/util/LongSparseArray;)Ljava/lang/String;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/ContentResolver;",
            "J",
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    if-eqz p4, :cond_0

    invoke-virtual {p4, p2, p3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p4, p2, p3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1

    :cond_0
    const-string v0, ""

    const-wide/16 v1, -0x3e8

    cmp-long v3, p2, v1

    const/4 v1, 0x0

    if-nez v3, :cond_1

    sget-object v1, Lcom/miui/gallery/util/StorageUtils;->DIRECTORY_SECRET_ALBUM_PATH:Ljava/lang/String;

    goto :goto_3

    :cond_1
    :try_start_0
    sget-object v3, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    sget-object v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v5, "_id=?"

    const/4 v2, 0x1

    new-array v6, v2, [Ljava/lang/String;

    invoke-static {p2, p3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    const/4 v8, 0x0

    aput-object v2, v6, v8

    const/4 v7, 0x0

    move-object v2, p1

    invoke-virtual/range {v2 .. v7}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p1, :cond_2

    :try_start_1
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->genRelativePath(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_0

    :catch_0
    move-exception v0

    goto :goto_1

    :cond_2
    :goto_0
    move-object v1, v0

    goto :goto_2

    :catchall_0
    move-exception p2

    move-object p1, v1

    goto :goto_4

    :catch_1
    move-exception v0

    move-object p1, v1

    :goto_1
    :try_start_2
    const-string v2, "CloudManager.OwnerFileHandleTask"

    invoke-static {v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :goto_2
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    :goto_3
    if-eqz v1, :cond_3

    invoke-virtual {p4, p2, p3, v1}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    :cond_3
    return-object v1

    :catchall_1
    move-exception p2

    :goto_4
    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw p2
.end method

.method private static shouldDeleteFile(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/StorageUtils;->getRelativePath(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_1

    invoke-virtual {p0, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method


# virtual methods
.method protected executeType(ILandroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J
    .locals 0
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

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p2

    packed-switch p1, :pswitch_data_0

    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Type "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is not supported!"

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    :pswitch_0
    invoke-direct {p0, p2, p4, p5}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->batchExecuteDeleteMedia(Landroid/content/ContentResolver;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J

    move-result-object p1

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p2, p4, p5}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->batchExecuteOtherMediaOperations(Landroid/content/ContentResolver;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J

    move-result-object p1

    goto :goto_0

    :pswitch_2
    invoke-direct {p0, p4, p5}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->batchExecuteAlbumOperations(Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;[J)[J

    move-result-object p1

    :goto_0
    return-object p1

    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected getItemTaskType(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/os/Bundle;Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;J)I
    .locals 0
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

    iget-object p1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->keyItemDataMap:Landroid/util/ArrayMap;

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;

    const/4 p2, -0x1

    if-eqz p1, :cond_4

    iget-object p3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    if-eqz p3, :cond_4

    iget p3, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    if-gez p3, :cond_0

    goto :goto_0

    :cond_0
    iget-object p3, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    iget p1, p1, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchItemData;->cursorIndex:I

    invoke-interface {p3, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 p3, 0x2

    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    if-nez p1, :cond_1

    return p2

    :cond_1
    iget-object p1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    const/4 p5, 0x5

    invoke-interface {p1, p5}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    if-eqz p1, :cond_3

    iget-object p1, p4, Lcom/miui/gallery/provider/cloudmanager/BatchCursorTask$BatchOperationData;->cursor:Landroid/database/Cursor;

    invoke-interface {p1, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    if-eq p1, p2, :cond_2

    if-eq p1, p3, :cond_2

    const/16 p1, 0xb

    return p1

    :cond_2
    const/16 p1, 0xc

    return p1

    :cond_3
    const/16 p1, 0xa

    return p1

    :cond_4
    :goto_0
    return p2
.end method

.method protected queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

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

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/OwnerFileHandleTask;->queryCursor(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/Long;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
