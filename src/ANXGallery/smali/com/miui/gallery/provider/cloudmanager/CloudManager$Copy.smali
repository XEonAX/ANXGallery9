.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Copy"
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

    const-string p2, "Copy albumId %d mediaId %d"

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p5

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p5, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 11

    const-string v0, "CloudManager"

    const-string v1, "%s execute"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$200()[Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x2

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const-wide/16 v3, -0x65

    const/4 v5, 0x6

    const/16 v6, 0x9

    if-eqz v1, :cond_0

    const/4 v7, 0x5

    if-eq v1, v7, :cond_0

    if-eq v1, v5, :cond_0

    if-eq v1, v6, :cond_0

    const-string v1, "CloudManager"

    const-string v2, "no server id, just insert as manual create"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localFlag"

    const/4 v2, -0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_0

    :cond_0
    const-string v7, "CloudManager"

    const-string v8, "has server id, just insert as copy"

    invoke-static {v7, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    if-nez v1, :cond_2

    iget-wide v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string v1, "localFlag"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_1
    const-string v1, "localFlag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_2
    iget-object v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    const/16 v8, 0x1a

    invoke-interface {v7, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    const-string p1, "CloudManager"

    const-string p2, "not synced but localImageId is null"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v3

    :cond_3
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    iput-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    if-ne v1, v6, :cond_4

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v7, v8}, Lcom/miui/gallery/provider/ShareMediaManager;->convertToMediaId(J)J

    move-result-wide v7

    iput-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v7

    const-wide/16 v9, -0x1

    cmp-long v1, v7, v9

    if-eqz v1, :cond_5

    return-wide v7

    :cond_5
    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    if-eqz v1, :cond_6

    const-string p1, "CloudManager"

    const-string p2, "backtrack not synced"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-wide v3

    :cond_6
    iget-wide v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v1

    if-eqz v1, :cond_7

    const-string v1, "localFlag"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_7
    const-string v1, "localFlag"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$400()[Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mCursor:Landroid/database/Cursor;

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$300([Ljava/lang/String;Landroid/database/Cursor;)Landroid/content/ContentValues;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ContentValues;->putAll(Landroid/content/ContentValues;)V

    iget-wide v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v1, v2}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_9

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide v5

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v7, v8}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v1

    if-eqz v1, :cond_8

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v7, v8}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v7

    const-string p2, "localGroupId"

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "localImageId"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "shareImage"

    invoke-virtual {p1, p2, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    const-string v1, "CloudManager"

    const-string v2, "Copy other share to other share id %d"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_2

    :cond_8
    const-string v1, "localGroupId"

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v0, v1, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "localImageId"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "cloud"

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    invoke-virtual {p2, v1, v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string p1, "CloudManager"

    const-string p2, "Copy other share to owner id %d"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {p1, p2, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_9
    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v1

    if-eqz v1, :cond_a

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v5, v6}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v5

    const-string p2, "localGroupId"

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "localImageId"

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string p2, "shareImage"

    invoke-virtual {p1, p2, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    const-string v1, "CloudManager"

    const-string v2, "Copy owner to other share id %d"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v1, v2, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_2

    :cond_a
    const-string v1, "localGroupId"

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "localImageId"

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v0, v1, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    const-string v1, "cloud"

    invoke-virtual {p1, v1, v2, v0}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v1

    invoke-virtual {p2, v1, v2, v0}, Lcom/miui/gallery/provider/cache/MediaManager;->insert(JLandroid/content/ContentValues;)J

    const-string p1, "CloudManager"

    const-string p2, "Copy owner to owner id %d"

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {p1, p2, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    move-wide p1, v1

    :goto_2
    const-string v1, "CloudManager"

    const-string v2, "inserts: %s COPY RESULT: %d"

    invoke-static {v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$100(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-static {v1, v2, v0, v5}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-lez v2, :cond_c

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/ShareMediaManager;->convertToMediaId(J)J

    move-result-wide p1

    :cond_b
    move-wide v3, p1

    invoke-virtual {p0, v3, v4}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->markAsDirty(J)V

    :cond_c
    return-wide v3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "Copy{%d, %d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mMediaId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
