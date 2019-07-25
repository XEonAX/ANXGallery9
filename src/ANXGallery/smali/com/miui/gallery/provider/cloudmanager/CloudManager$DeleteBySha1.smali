.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteBySha1"
.end annotation


# instance fields
.field private mDeleteReason:I

.field private mKeepDup:Z

.field private mSha1:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            "ZI)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mSha1:Ljava/lang/String;

    iput-boolean p4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mKeepDup:Z

    iput p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mDeleteReason:I

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    const/4 v2, 0x1

    if-eq v0, v2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-le v0, v2, :cond_2

    iget-boolean v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mKeepDup:Z

    if-nez v0, :cond_2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    new-array v6, v0, [J

    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, v0}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    aput-wide v2, v6, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v5

    iget v7, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mDeleteReason:I

    move-object v3, p1

    move-object v4, p2

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$500(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JI)[J

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->getValidCount([J)I

    move-result v1

    :cond_2
    int-to-long p1, v1

    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mSha1:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v3, "sha1=? AND (localFlag NOT IN (11, 0, -1, 2) OR (localFlag=0 AND serverStatus=\'custom\'))"

    const-string v1, "cloud"

    const-string v0, "_id"

    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v2

    const/4 v0, 0x1

    new-array v4, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mSha1:Ljava/lang/String;

    aput-object v5, v4, v0

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

    const-string v0, "DeleteBySha1{%s}"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteBySha1;->mSha1:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
