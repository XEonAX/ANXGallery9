.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteAlbum"
.end annotation


# instance fields
.field private mAlbumId:J

.field private mDeleteReason:I


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

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    iput p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mDeleteReason:I

    return-void
.end method

.method private deleteItem(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;JLandroid/database/Cursor;)I
    .locals 5

    const/4 p1, 0x4

    invoke-interface {p6, p1}, Landroid/database/Cursor;->isNull(I)Z

    move-result p1

    const/4 p6, 0x0

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    const-string p1, "DeleteAlbum"

    const-string v1, "DELETE ITEM: no server id found, update to invalid record: %d"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "localFlag"

    const/4 v2, -0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "cloud"

    const-string v2, "_id = ? "

    new-array v3, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, p6

    invoke-virtual {p2, v1, p1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    const-string p1, "DeleteAlbum"

    const-string v1, "DELETE ITEM: server id found, mark delete %d"

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p1, Landroid/content/ContentValues;

    invoke-direct {p1}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "localFlag"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p1, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v1, "cloud"

    const-string v2, "_id = ? "

    new-array v3, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, p6

    invoke-virtual {p2, v1, p1, v2, v3}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    :goto_0
    const-string p2, "_id = ? "

    new-array v0, v0, [Ljava/lang/String;

    invoke-static {p4, p5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, p6

    invoke-virtual {p3, p2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    const-string p2, "DeleteAlbum"

    const-string p3, "DELETE ITEM FINISH: deleted %d item"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p6

    invoke-static {p2, p3, p6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-lez p1, :cond_1

    invoke-virtual {p0, p4, p5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->markAsDirty(J)V

    :cond_1
    return p1
.end method

.method private deleteMediaInAlbum(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;J)I
    .locals 14

    move-object v0, p0

    move-object v9, p1

    const-string v1, "DeleteAlbum"

    const-string v2, "deleting media in album(%d)"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "cloud"

    sget-object v3, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v4, "localGroupId=? AND serverId IS NULL"

    const/4 v11, 0x1

    new-array v5, v11, [Ljava/lang/String;

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    const/4 v12, 0x0

    aput-object v1, v5, v12

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_2

    :cond_0
    :goto_0
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->markAsDirty(J)V

    iget v2, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mDeleteReason:I

    const-string v3, "DeleteAlbum"

    invoke-static {v2, v1, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->createDeleteRecord(ILandroid/database/Cursor;Ljava/lang/String;)Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    move-result-object v2

    if-eqz v2, :cond_0

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "localFlag"

    const/4 v3, -0x1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "cloud"

    const-string v3, "localGroupId=? AND serverId IS NULL"

    new-array v4, v11, [Ljava/lang/String;

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v12

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    add-int/2addr v1, v12

    const-string v2, "DeleteAlbum"

    const-string v3, "marked local media in album(%d)"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    move v13, v1

    goto :goto_1

    :cond_2
    const-string v1, "DeleteAlbum"

    const-string v2, "delete local media in album(%d) returns a null cursor"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v13, 0x0

    :goto_1
    const-string v2, "cloud"

    sget-object v3, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v4, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId = ? "

    new-array v5, v11, [Ljava/lang/String;

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v5, v12

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v8}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    if-eqz v1, :cond_5

    :cond_3
    :goto_2
    invoke-interface {v1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->markAsDirty(J)V

    iget v2, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mDeleteReason:I

    const-string v3, "DeleteAlbum"

    invoke-static {v2, v1, v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->createDeleteRecord(ILandroid/database/Cursor;Ljava/lang/String;)Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_4
    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    const-string v2, "localFlag"

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v2, "cloud"

    const-string v3, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND localGroupId = ? "

    new-array v4, v11, [Ljava/lang/String;

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v12

    invoke-virtual {p1, v2, v1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    add-int/2addr v13, v1

    const-string v1, "DeleteAlbum"

    const-string v2, "marked cloud media in album(%d)"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_5
    const-string v1, "DeleteAlbum"

    const-string v2, "delete synced media in album(%d) returns a null cursor"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_3
    const-string v1, "localGroupId = ? "

    new-array v2, v11, [Ljava/lang/String;

    invoke-static/range {p3 .. p4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v12

    move-object/from16 v3, p2

    invoke-virtual {v3, v1, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    const-string v1, "DeleteAlbum"

    const-string v2, "DELETING items from album(%d), count: %d"

    invoke-static/range {p3 .. p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v1, v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {v10}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_6

    invoke-static {v10}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Ljava/util/Collection;)V

    :cond_6
    return v13
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 9

    const-string v0, "DeleteAlbum"

    const-string v1, "DELETING ALBUM:"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    invoke-direct {p0, p1, p2, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->deleteMediaInAlbum(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;J)I

    move-result v0

    int-to-long v0, v0

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mContext:Landroid/content/Context;

    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    iget-object v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mCursor:Landroid/database/Cursor;

    move-object v2, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->deleteItem(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;JLandroid/database/Cursor;)I

    move-result p1

    int-to-long v2, p1

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    invoke-virtual {p2, v4, v5}, Lcom/miui/gallery/provider/cache/MediaManager;->deleteAttributes(J)V

    const-wide/16 p1, 0x0

    cmp-long v4, v2, p1

    if-gez v4, :cond_0

    move-wide v0, v2

    :cond_0
    return-wide v0
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 8

    const-string v1, "cloud"

    sget-object v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v3, "_id = ?"

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    invoke-static {v5, v6}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

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
    .locals 4

    const-string v0, "%s{%d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "DeleteAlbum"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long p1, v0, v2

    if-eqz p1, :cond_0

    return-wide v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    const-wide/16 v0, -0x64

    if-eqz p1, :cond_1

    const-string p1, "DeleteAlbum"

    const-string v2, "Image or video can\'t be deleted here"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteAlbum;->mCursor:Landroid/database/Cursor;

    const/4 v4, 0x4

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$000(J)Z

    move-result p1

    if-eqz p1, :cond_2

    const-string p1, "DeleteAlbum"

    const-string v2, "system album can\'t be deleted"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v0

    :cond_2
    return-wide v2
.end method
