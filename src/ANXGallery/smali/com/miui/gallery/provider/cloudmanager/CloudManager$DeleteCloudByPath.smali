.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DeleteCloudByPath"
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

.field private mDeleteReason:I

.field private mPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;Ljava/lang/String;Ljava/util/ArrayList;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;I)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;-><init>(Landroid/content/Context;Ljava/util/ArrayList;)V

    iput-object p3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mPath:Ljava/lang/String;

    iput-object p4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mDeleteIds:Ljava/util/ArrayList;

    iput p5, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mDeleteReason:I

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mCursor:Landroid/database/Cursor;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x0

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    cmp-long v0, v4, v1

    if-lez v0, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v9

    const/4 v0, 0x1

    new-array v10, v0, [J

    aput-wide v4, v10, v3

    iget-object v11, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mDeleteIds:Ljava/util/ArrayList;

    iget v12, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mDeleteReason:I

    move-object v7, p1

    move-object v8, p2

    invoke-static/range {v6 .. v12}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->access$700(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;Ljava/util/ArrayList;[JLjava/util/ArrayList;I)[J

    move-result-object p1

    array-length p2, p1

    if-lez p2, :cond_0

    aget-wide v0, p1, v3

    goto :goto_0

    :cond_0
    const-wide/16 v0, -0x65

    :goto_0
    return-wide v0

    :cond_1
    return-wide v1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mPath:Ljava/lang/String;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager;->queryCloudItemByFilePath(Landroid/content/Context;Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "DeleteCloudByPath{%s}"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mPath:Ljava/lang/String;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteCloudByPath;->mPath:Ljava/lang/String;

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
