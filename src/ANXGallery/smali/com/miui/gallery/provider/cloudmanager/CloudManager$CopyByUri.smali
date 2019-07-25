.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$BaseCopyOrMoveByUri;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CopyByUri"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Landroid/net/Uri;",
            "J)V"
        }
    .end annotation

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$BaseCopyOrMoveByUri;-><init>(Landroid/content/Context;Ljava/util/ArrayList;Landroid/net/Uri;J)V

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 12

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mCursor:Landroid/database/Cursor;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    move-wide v8, v3

    goto :goto_0

    :cond_0
    move-wide v8, v1

    :goto_0
    cmp-long v0, v8, v1

    if-lez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v7

    iget-wide v10, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mAlbumId:J

    move-object v5, v0

    invoke-direct/range {v5 .. v11}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JJ)V

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$Copy;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p1

    return-wide p1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;

    new-instance v4, Ljava/io/File;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mTarPath:Ljava/lang/String;

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-wide v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mAlbumId:J

    const/4 v7, -0x2

    const/4 v8, 0x1

    move-object v3, p2

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;-><init>(Ljava/io/File;JIZ)V

    invoke-static {p1, p2}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->saveToCloudDB(Landroid/content/Context;Lcom/miui/gallery/scanner/SaveToCloudUtil$SaveParams;)J

    move-result-wide p1

    cmp-long v0, p1, v1

    if-lez v0, :cond_2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->markAsDirty(J)V

    return-wide p1

    :cond_2
    const-wide/16 v0, -0x2

    cmp-long v2, p1, v0

    if-nez v2, :cond_3

    const-wide/16 p1, -0x67

    return-wide p1

    :cond_3
    const-wide/16 p1, -0x65

    return-wide p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "CopyByUri{%s, %d}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mUri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CopyByUri;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
