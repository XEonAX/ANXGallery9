.class Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;
.super Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DupDeleteFile"
.end annotation


# instance fields
.field private final TRACE_TAG:Ljava/lang/String;

.field private mDeleteReason:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;JII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;JII)V"
        }
    .end annotation

    invoke-direct/range {p0 .. p5}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    iput p6, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mDeleteReason:I

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->TRACE_TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v6

    new-instance v2, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;

    iget-object v4, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mContext:Landroid/content/Context;

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->getDirtyBulk()Ljava/util/ArrayList;

    move-result-object v5

    iget v8, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mDeleteReason:I

    move-object v3, v2

    invoke-direct/range {v3 .. v8}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DeleteFile;-><init>(Landroid/content/Context;Ljava/util/ArrayList;JI)V

    invoke-virtual {v2, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_1

    add-int/lit8 v1, v1, 0x1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mCursor:Landroid/database/Cursor;

    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string p2, "execute{%s}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    invoke-static {p2, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->TRACE_TAG:Ljava/lang/String;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/util/logger/TimingTracing;->stopTracing(Ljava/lang/String;Landroid/util/Printer;)J

    const-string p1, "CloudManager"

    const-string p2, "DUPLICATED DELETE FILE FINISH: %d items"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    int-to-long p1, v1

    return-wide p1
.end method

.method protected prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v1, "reason{%s}"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    iget v3, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mDeleteReason:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->beginTracing(Ljava/lang/String;Ljava/lang/String;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupMedia;->prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->TRACE_TAG:Ljava/lang/String;

    const-string v1, "prepare"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/logger/TimingTracing;->addSplit(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    const-string v0, "DupDeleteFile{%d}"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-wide v2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$DupDeleteFile;->mMediaId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
