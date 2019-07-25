.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteFile"
.end annotation


# instance fields
.field private final TRACE_TAG:Ljava/lang/String;

.field private mDeleteReason:I

.field private mId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JI)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mId:J

    iput p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mDeleteReason:I

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    return-void
.end method

.method private deleteAlbumFile(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;I)I
    .locals 16

    const/4 v1, 0x0

    :try_start_0
    const-string v3, "cloud"

    sget-object v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v5, "localGroupId=?"

    const/4 v0, 0x1

    new-array v6, v0, [Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    move-object/from16 v14, p0

    :try_start_1
    iget-wide v7, v14, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mId:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    const/4 v15, 0x0

    aput-object v0, v6, v15

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v2, p1

    invoke-virtual/range {v2 .. v9}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    if-eqz v2, :cond_1

    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    :cond_0
    invoke-interface {v2, v15}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v11

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object v10, v2

    move/from16 v13, p3

    invoke-direct/range {v7 .. v13}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->deleteMediaFile(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/database/Cursor;JI)I

    move-result v1

    add-int/2addr v0, v1

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-nez v1, :cond_0

    move v15, v0

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object v1, v2

    goto :goto_1

    :cond_1
    :goto_0
    invoke-static {v2}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return v15

    :catchall_1
    move-exception v0

    goto :goto_1

    :catchall_2
    move-exception v0

    move-object/from16 v14, p0

    :goto_1
    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    throw v0
.end method

.method private deleteMediaFile(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/database/Cursor;JI)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    invoke-static {v0, p3, p4, p5, p6}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->from(Landroid/content/ContentResolver;Landroid/database/Cursor;JI)Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;

    move-result-object p6

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-virtual {p6, v0, v1, v1}, Lcom/miui/gallery/provider/cloudmanager/MediaFileHandleJob;->doDelete(Landroid/content/Context;ZZ)V

    new-instance p6, Landroid/content/ContentValues;

    invoke-direct {p6}, Landroid/content/ContentValues;-><init>()V

    const/4 v0, 0x4

    invoke-interface {p3, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result p3

    const/4 v0, 0x1

    if-eqz p3, :cond_0

    const-string p3, "localFlag"

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p6, p3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string p3, "_id=?"

    new-array v2, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, p3, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string p3, "thumbnailFile"

    const-string v2, ""

    invoke-virtual {p6, p3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "localFile"

    const-string v2, ""

    invoke-virtual {p6, p3, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string p3, "_id=?"

    new-array v2, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, p3, v2, p6}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    :goto_0
    const-string p2, "cloud"

    const-string p3, "_id = ? "

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p4

    aput-object p4, v0, v1

    invoke-virtual {p1, p2, p6, p3, v0}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    const-string p2, "CloudManager"

    const-string p3, "clear thumb and origin path"

    invoke-static {p2, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return p1
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x5

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_0

    const-string v0, "CloudManager"

    const-string v3, "DELETING ALBUM FILE:"

    invoke-static {v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mDeleteReason:I

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->deleteAlbumFile(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;I)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v0, "deleteAlbum{%s}"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    const-string v0, "CloudManager"

    const-string v3, "DELETING MEDIA FILE"

    invoke-static {v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mCursor:Landroid/database/Cursor;

    iget-wide v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mId:J

    iget v10, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mDeleteReason:I

    move-object v4, p0

    move-object v5, p1

    move-object v6, p2

    invoke-direct/range {v4 .. v10}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->deleteMediaFile(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Landroid/database/Cursor;JI)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v0, "deleteFile{%s}"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    new-instance v1, Landroid/util/StringBuilderPrinter;

    invoke-direct {v1, p2}, Landroid/util/StringBuilderPrinter;-><init>(Ljava/lang/StringBuilder;)V

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    move-result-wide v0

    if-lez p1, :cond_1

    const-wide/16 v2, 0x12c

    int-to-long v4, p1

    mul-long v2, v2, v4

    cmp-long v6, v0, v2

    if-lez v6, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "delete slowly: %s"

    invoke-static {v2, v3, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    const-string v3, "cost"

    div-long/2addr v0, v4

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "detail"

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v2, v0, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p2, "delete_performance"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0, v2}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    int-to-long p1, p1

    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 14

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v1, "reason{%s}"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mDeleteReason:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    const-string v7, "cloud"

    sget-object v8, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v9, "_id = ?"

    new-array v10, v2, [Ljava/lang/String;

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mId:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v10, v5

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v6, p1

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v1, "prepare"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "DeleteFile{%d}"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    return-wide v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$000(J)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "CloudManager"

    const-string v0, "system album can\'t be deleted"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, -0x66

    return-wide v0

    :cond_1
    return-wide v2
.end method
