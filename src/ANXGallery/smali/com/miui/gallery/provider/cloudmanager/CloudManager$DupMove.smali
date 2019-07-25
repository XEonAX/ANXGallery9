.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DupMove"
.end annotation


# instance fields
.field protected mAlbumId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;JJI)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JJI)V"
        }
    .end annotation

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-wide v3, p5

    move v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mAlbumId:J

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 21

    move-object/from16 v0, p0

    const/4 v1, 0x0

    const-wide/16 v2, -0x65

    move-wide v3, v2

    const/4 v2, 0x0

    :cond_0
    iget-object v5, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const/4 v5, 0x1

    if-nez v2, :cond_5

    new-instance v3, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;

    iget-object v7, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v8

    iget-wide v11, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mAlbumId:J

    move-object v6, v3

    move-wide v9, v13

    invoke-direct/range {v6 .. v12}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Move;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    move-object/from16 v6, p1

    move-object/from16 v7, p2

    invoke-virtual {v3, v6, v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v3

    const-wide/16 v8, 0x0

    cmp-long v10, v3, v8

    if-lez v10, :cond_1

    const-string v2, "CloudManager"

    const-string v8, "move success, delete items left."

    invoke-static {v2, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_1
    const-wide/16 v8, -0x67

    cmp-long v10, v3, v8

    if-nez v10, :cond_2

    const-string v2, "CloudManager"

    const-string v8, "item exist, skip this, delete items left"

    invoke-static {v2, v8}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-wide/16 v8, -0x68

    cmp-long v10, v3, v8

    if-nez v10, :cond_3

    const-string v8, "CloudManager"

    const-string v9, "sha1 conflict, just delete"

    invoke-static {v8, v9}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v15, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v18

    new-array v5, v5, [J

    aput-wide v13, v5, v1

    const/16 v20, 0x29

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v19, v5

    invoke-static/range {v15 .. v20}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J

    goto :goto_0

    :cond_3
    const-wide/16 v8, -0x69

    cmp-long v5, v3, v8

    if-nez v5, :cond_4

    const-string v1, "CloudManager"

    const-string v2, "file name conflict, return"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_4
    const-string v5, "CloudManager"

    const-string v8, "unknown err"

    invoke-static {v5, v8}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    move v5, v2

    :goto_1
    move v2, v5

    goto :goto_2

    :cond_5
    move-object/from16 v6, p1

    move-object/from16 v7, p2

    iget-object v15, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mContext:Landroid/content/Context;

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v18

    new-array v5, v5, [J

    aput-wide v13, v5, v1

    const/16 v20, 0x2a

    move-object/from16 v16, p1

    move-object/from16 v17, p2

    move-object/from16 v19, v5

    invoke-static/range {v15 .. v20}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J

    :goto_2
    iget-object v5, v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mCursor:Landroid/database/Cursor;

    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v5

    if-nez v5, :cond_0

    :goto_3
    return-wide v3
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "DupMove{%d, %d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mMediaId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMove;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
