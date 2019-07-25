.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "MediaConflict"
.end annotation


# instance fields
.field private mAlbumId:J

.field private mFileName:Ljava/lang/String;

.field private mMediaId:J

.field private mSha1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;JJLjava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mFileName:Ljava/lang/String;

    iput-wide p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mAlbumId:J

    iput-wide p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mMediaId:J

    iput-object p7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mSha1:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 3

    iget-wide p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mMediaId:J

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mMediaId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->isOtherShareMediaId(J)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p1, p2}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    cmp-long v2, v0, p1

    if-nez v2, :cond_1

    const-wide/16 p1, -0x67

    return-wide p1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mCursor:Landroid/database/Cursor;

    const/4 p2, 0x1

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mSha1:Ljava/lang/String;

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_2

    const-wide/16 p1, -0x68

    return-wide p1

    :cond_2
    const-wide/16 p1, -0x69

    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 14

    iget-wide v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mAlbumId:J

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareAlbumManager;->isOtherShareAlbumId(J)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x2

    if-eqz v0, :cond_0

    iget-wide v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mAlbumId:J

    invoke-static {v4, v5}, Lcom/miui/gallery/provider/ShareAlbumManager;->getOriginalAlbumId(J)J

    move-result-wide v4

    const-string v7, "shareImage"

    const-string v0, "_id"

    const-string v6, "sha1"

    filled-new-array {v0, v6}, [Ljava/lang/String;

    move-result-object v8

    const-string v9, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND fileName = ? AND localGroupId=?"

    new-array v10, v3, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mFileName:Ljava/lang/String;

    aput-object v0, v10, v2

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v10, v1

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    move-object v6, p1

    invoke-virtual/range {v6 .. v13}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v4, "cloud"

    const-string v0, "_id"

    const-string v5, "sha1"

    filled-new-array {v0, v5}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "(localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\')) AND fileName = ? AND localGroupId=?"

    new-array v7, v3, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mFileName:Ljava/lang/String;

    aput-object v0, v7, v2

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mAlbumId:J

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v7, v1

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    move-object v0, p1

    move-object v1, v4

    move-object v2, v5

    move-object v3, v6

    move-object v4, v7

    move-object v5, v8

    move-object v6, v9

    move-object v7, v10

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, ".Conflict{"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mFileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

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
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->mFileName:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "CloudManager"

    const-string v0, "%s\'s fileName is empty, so no conflict"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$MediaConflict;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, -0x66

    return-wide v0

    :cond_1
    return-wide v2
.end method
