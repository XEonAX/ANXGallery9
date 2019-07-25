.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DupCopy"
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

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mAlbumId:J

    const-string p1, "CloudManager"

    const-string p2, "DupCopy albumId %d mediaId %d"

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p5, p6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p1, p2, p3, p4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 9

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;

    iget-object v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v4

    iget-wide v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mAlbumId:J

    move-object v2, v0

    invoke-direct/range {v2 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-gtz v4, :cond_2

    const-wide/16 v2, -0x67

    cmp-long v4, v0, v2

    if-eqz v4, :cond_2

    const-wide/16 v2, -0x68

    cmp-long v4, v0, v2

    if-nez v4, :cond_1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    :cond_2
    :goto_0
    const-string p1, "CloudManager"

    const-string p2, "DUPLICATED COPY FINISH: id(%d)"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "DupCopy{%d, %d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mMediaId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupCopy;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
