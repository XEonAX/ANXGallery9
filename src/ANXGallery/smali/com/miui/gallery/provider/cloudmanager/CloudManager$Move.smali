.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Move"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJ)V"
        }
    .end annotation

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    const-string p1, "CloudManager"

    const-string p2, "Move mediaId %d albumId %d"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    const-string v1, "CloudManager"

    const-string v2, "current LOCAL_FLAG is %d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "localGroupId"

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mAlbumId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "cloud"

    const-string v4, "_id=?"

    new-array v5, v2, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {p1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    const-string v3, "CloudManager"

    const-string v4, "MOVE FINISH: local item, result(%d)"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-lez p1, :cond_0

    const-string p1, "_id=?"

    new-array v2, v2, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, p1, v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    iget-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->markAsDirty(J)V

    :cond_0
    iget-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    return-wide p1

    :cond_1
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    invoke-interface {v3, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    int-to-long v3, v3

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$000(J)Z

    move-result v3

    const/4 v4, 0x3

    const/4 v5, 0x5

    if-eqz v3, :cond_3

    const-string v3, "CloudManager"

    const-string v6, "system album:"

    invoke-static {v3, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "localFlag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "fromLocalGroupId"

    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v3, "localGroupId"

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mAlbumId:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v3, "groupId"

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v3, "localImageId"

    invoke-virtual {v0, v3}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    const-string v3, "CloudManager"

    const-string v4, "updates: %s"

    invoke-static {v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$100(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "cloud"

    const-string v4, "_id=?"

    new-array v5, v2, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-virtual {p1, v3, v0, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    const-string v3, "CloudManager"

    const-string v4, "MOVE FINISH: system album item, result(%d)"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-lez p1, :cond_2

    const-string p1, "_id=?"

    new-array v2, v2, [Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, p1, v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->update(Ljava/lang/String;[Ljava/lang/String;Landroid/content/ContentValues;)I

    iget-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->markAsDirty(J)V

    :cond_2
    iget-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    goto/16 :goto_1

    :cond_3
    const-string v3, "CloudManager"

    const-string v6, "cloud album:"

    invoke-static {v3, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v3, "localFlag"

    const/16 v6, 0xb

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v0, v3, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    const-string v6, "localFlag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v6, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$200()[Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$400()[Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v5

    invoke-virtual {v3, v5}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    const-string v5, "fromLocalGroupId"

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mCursor:Landroid/database/Cursor;

    invoke-interface {v6, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v3, v5, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    const-string v4, "localGroupId"

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mAlbumId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "localImageId"

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v4, "CloudManager"

    const-string v5, "inserts: %s"

    invoke-static {v3}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$100(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "cloud"

    const/4 v5, 0x0

    invoke-virtual {p1, v4, v5, v3}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v8, v4, v6

    if-lez v8, :cond_4

    invoke-virtual {p2, v4, v5, v3}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    invoke-virtual {p0, v4, v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->markAsDirty(J)V

    const-string v3, "CloudManager"

    const-string v6, "updates: %s"

    invoke-static {v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$100(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v7

    invoke-static {v3, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "cloud"

    const-string v6, "_id=?"

    new-array v7, v2, [Ljava/lang/String;

    iget-wide v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v8, v9}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v1

    invoke-virtual {p1, v3, v0, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result p1

    if-lez p1, :cond_5

    const-string v0, "_id=?"

    new-array v2, v2, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    invoke-virtual {p2, v0, v2}, Lcom/miui/gallery/provider/cache/MediaManager;->delete(Ljava/lang/String;[Ljava/lang/String;)I

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->markAsDirty(J)V

    goto :goto_0

    :cond_4
    const-wide/16 p1, -0x65

    move-wide v4, p1

    const/4 p1, 0x0

    :cond_5
    :goto_0
    const-string p2, "CloudManager"

    const-string v0, "MOVE FINISH: cloud album item, results(update:%d; insert:%d)"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p2, v0, p1, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    move-wide p1, v4

    :goto_1
    return-wide p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "Move{%d, %d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;->mMediaId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "CloudManager"

    const-string v0, "Illegal operate: move share media"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const-wide/16 v0, -0x72

    return-wide v0

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    return-wide v0
.end method
