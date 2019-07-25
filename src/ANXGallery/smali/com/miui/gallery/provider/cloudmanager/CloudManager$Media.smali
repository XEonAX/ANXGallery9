.class abstract Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "Media"
.end annotation


# instance fields
.field protected mAlbumId:J

.field protected mMediaId:J


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

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mMediaId:J

    iput-wide p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mAlbumId:J

    return-void
.end method


# virtual methods
.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 13

    const-string v0, "CloudManager"

    const-string v1, "%s prepare"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mMediaId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    iget-wide v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mMediaId:J

    invoke-static {v3, v4}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide v3

    const-string v6, "shareImage"

    sget-object v7, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v8, "_id=?"

    new-array v9, v2, [Ljava/lang/String;

    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v9, v1

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    move-object v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v3, "cloud"

    sget-object v4, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->PROJECTION:[Ljava/lang/String;

    const-string v5, "_id=?"

    new-array v6, v2, [Ljava/lang/String;

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mMediaId:J

    invoke-static {v7, v8}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v0, p1

    move-object v1, v3

    move-object v2, v4

    move-object v3, v5

    move-object v4, v6

    move-object v5, v7

    move-object v6, v8

    move-object v7, v9

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 14

    const-string v0, "CloudManager"

    const-string v1, "%s verify"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->isNull(I)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mCursor:Landroid/database/Cursor;

    const/4 v6, 0x7

    invoke-interface {v5, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v0, v4, v5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CheckPostProcessing;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v4

    const-wide/16 v6, -0x6f

    cmp-long v0, v4, v6

    if-nez v0, :cond_1

    return-wide v4

    :cond_1
    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;

    iget-object v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mCursor:Landroid/database/Cursor;

    const/4 v5, 0x6

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    iget-wide v9, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mAlbumId:J

    iget-wide v11, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mMediaId:J

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Media;->mCursor:Landroid/database/Cursor;

    const/16 v5, 0x9

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    move-object v6, v0

    invoke-direct/range {v6 .. v13}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;-><init>(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;)V

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0

    const-wide/16 v4, -0x66

    cmp-long p1, v0, v4

    if-nez p1, :cond_2

    return-wide v2

    :cond_2
    return-wide v0
.end method
