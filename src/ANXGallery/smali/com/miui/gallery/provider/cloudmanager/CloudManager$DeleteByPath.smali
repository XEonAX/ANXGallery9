.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteByPath"
.end annotation


# instance fields
.field private mDeleteIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private mDeleteOptions:I

.field private mDeleteReason:I

.field private mPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;ILjava/util/ArrayList;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    iput p4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteOptions:I

    iput-object p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteIds:Ljava/util/ArrayList;

    iput p6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteReason:I

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mCursor:Landroid/database/Cursor;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-lez v0, :cond_1

    iget-object v5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v8

    new-array v9, v1, [J

    aput-wide v3, v9, v2

    iget v10, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteOptions:I

    iget-object v11, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteIds:Ljava/util/ArrayList;

    iget v12, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteReason:I

    move-object v6, p1

    move-object v7, p2

    invoke-static/range {v5 .. v12}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$600(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JILjava/util/ArrayList;I)[J

    move-result-object p1

    array-length p2, p1

    if-lez p2, :cond_0

    aget-wide v0, p1, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x65

    :goto_0
    return-wide v0

    :cond_1
    sget-object p1, Lcom/miui/gallery/util/MediaFileUtils$FileType;->NORMAL:Lcom/miui/gallery/util/MediaFileUtils$FileType;

    new-array p2, v1, [Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    aput-object v0, p2, v2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/MediaFileUtils;->deleteFileType(Lcom/miui/gallery/util/MediaFileUtils$FileType;[Ljava/lang/String;)I

    move-result p1

    new-instance p2, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;

    iget v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mDeleteReason:I

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    const-string v2, "DeleteByPath"

    invoke-direct {p2, v0, v1, v2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecord;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-static {p2}, Lcom/miui/gallery/util/deleterecorder/DeleteRecorder;->record(Lcom/miui/gallery/util/deleterecorder/DeleteRecord;)V

    int-to-long p1, p1

    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->queryCloudItemByFilePath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "%s{%s}"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const-string v2, "DeleteByPath"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteByPath;->mPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-wide/16 v0, -0x64

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x1

    :goto_0
    return-wide v0
.end method
