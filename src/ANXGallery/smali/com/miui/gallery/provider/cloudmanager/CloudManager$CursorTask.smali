.class abstract Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;
.super Ljava/lang/Object;
.source "CloudManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cloudmanager/CloudManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "CursorTask"
.end annotation


# instance fields
.field protected mContext:Landroid/content/Context;

.field protected mCursor:Landroid/database/Cursor;

.field private mDirtyBulk:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mDirtyBulk:Ljava/util/ArrayList;

    return-void
.end method

.method private release()V
    .locals 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mContext:Landroid/content/Context;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    invoke-interface {v1}, Landroid/database/Cursor;->close()V

    :cond_0
    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    return-void
.end method


# virtual methods
.method protected abstract execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
.end method

.method public getDirtyBulk()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mDirtyBulk:Ljava/util/ArrayList;

    return-object v0
.end method

.method protected final markAsDirty(J)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mDirtyBulk:Ljava/util/ArrayList;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected abstract prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;
.end method

.method public final run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J
    .locals 5

    const-string v0, "CloudManager"

    const-string v1, "%s is running"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->prepare(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/Cursor;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    :try_start_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->verify(Landroid/database/sqlite/SQLiteDatabase;)J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    const-string p1, "CloudManager"

    const-string p2, "%s finish"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p1, p2, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->release()V

    return-wide v0

    :cond_0
    :try_start_1
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->execute(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)J

    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v0, "CloudManager"

    const-string v1, "%s finish"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->release()V

    return-wide p1

    :catchall_0
    move-exception p1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object p2

    const-string v0, "CloudManager"

    const-string v1, "%s finish"

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->release()V

    throw p1
.end method

.method public abstract toString()Ljava/lang/String;
.end method

.method protected verify(Landroid/database/sqlite/SQLiteDatabase;)J
    .locals 2

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    if-nez p1, :cond_0

    const-string p1, "CloudManager"

    const-string v0, "cursor for %s is null, abort"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, -0x65

    return-wide v0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->mCursor:Landroid/database/Cursor;

    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "CloudManager"

    const-string v0, "cursor for %s has nothing, abort"

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/CloudManager$CursorTask;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const-wide/16 v0, -0x66

    return-wide v0

    :cond_1
    const-wide/16 v0, -0x1

    return-wide v0
.end method
