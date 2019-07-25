.class Lcom/miui/gallery/provider/cache/MemoryCursor;
.super Landroid/database/AbstractWindowedCursor;
.source "MemoryCursor.java"


# instance fields
.field private mColumnMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mColumns:[Ljava/lang/String;

.field private mCount:I

.field private mName:Ljava/lang/String;

.field private mQuery:Lcom/miui/gallery/provider/cache/ResultSet;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/ResultSet;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Landroid/database/AbstractWindowedCursor;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    invoke-interface {p1}, Lcom/miui/gallery/provider/cache/ResultSet;->getCount()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    invoke-interface {p1}, Lcom/miui/gallery/provider/cache/ResultSet;->getColumnNames()[Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumns:[Ljava/lang/String;

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mName:Ljava/lang/String;

    return-void
.end method

.method private doClearOrCreateWindow(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    if-nez v0, :cond_0

    new-instance v0, Landroid/database/CursorWindow;

    invoke-direct {v0, p1}, Landroid/database/CursorWindow;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {p1}, Landroid/database/CursorWindow;->clear()V

    :goto_0
    return-void
.end method

.method private fillWindow(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mName:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/cache/MemoryCursor;->doClearOrCreateWindow(Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {v0}, Landroid/database/CursorWindow;->acquireReference()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    invoke-interface {v1}, Lcom/miui/gallery/provider/cache/ResultSet;->getColumnNames()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    invoke-virtual {v0, v1}, Landroid/database/CursorWindow;->setNumColumns(I)Z

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {v0, p1}, Landroid/database/CursorWindow;->setStartPosition(I)V

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-interface {p1, v0}, Lcom/miui/gallery/provider/cache/ResultSet;->fillWindow(Landroid/database/CursorWindow;)I

    iget p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    invoke-interface {p1}, Lcom/miui/gallery/provider/cache/ResultSet;->getCount()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {p1}, Landroid/database/CursorWindow;->releaseReference()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {v0}, Landroid/database/CursorWindow;->releaseReference()V

    throw p1
.end method


# virtual methods
.method public close()V
    .locals 1

    invoke-super {p0}, Landroid/database/AbstractWindowedCursor;->close()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mQuery:Lcom/miui/gallery/provider/cache/ResultSet;

    invoke-interface {v0}, Lcom/miui/gallery/provider/cache/ResultSet;->close()V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected finalize()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MemoryCursor;->close()V

    const-string v0, ".provider.cache.MemoryCursor"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Finalizing cursor "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ", which has not been deactived or closed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_0
    invoke-super {p0}, Landroid/database/AbstractWindowedCursor;->finalize()V

    return-void

    :catchall_0
    move-exception v0

    invoke-super {p0}, Landroid/database/AbstractWindowedCursor;->finalize()V

    throw v0
.end method

.method public getColumnIndex(Ljava/lang/String;)I
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumnMap:Ljava/util/Map;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumns:[Ljava/lang/String;

    array-length v1, v0

    new-instance v2, Ljava/util/HashMap;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {v2, v1, v3}, Ljava/util/HashMap;-><init>(IF)V

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_0

    aget-object v4, v0, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_0
    iput-object v2, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumnMap:Ljava/util/Map;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumnMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_1

    :cond_2
    const/4 p1, -0x1

    :goto_1
    return p1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/provider/cache/MemoryCursor;->fillWindow(I)V

    :cond_0
    iget v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    return v0
.end method

.method public onMove(II)Z
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {p1}, Landroid/database/CursorWindow;->getStartPosition()I

    move-result p1

    if-lt p2, p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {p1}, Landroid/database/CursorWindow;->getStartPosition()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {v0}, Landroid/database/CursorWindow;->getNumRows()I

    move-result v0

    add-int/2addr p1, v0

    if-lt p2, p1, :cond_1

    :cond_0
    invoke-direct {p0, p2}, Lcom/miui/gallery/provider/cache/MemoryCursor;->fillWindow(I)V

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public requery()Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/MemoryCursor;->isClosed()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mWindow:Landroid/database/CursorWindow;

    invoke-virtual {v0}, Landroid/database/CursorWindow;->clear()V

    :cond_1
    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mPos:I

    iput v0, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    invoke-super {p0}, Landroid/database/AbstractWindowedCursor;->requery()Z

    move-result v0
    :try_end_1
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_1} :catch_0

    return v0

    :catch_0
    move-exception v0

    const-string v2, ".provider.cache.MemoryCursor"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "requery() failed "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/IllegalStateException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :catchall_0
    move-exception v0

    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0
.end method

.method public setWindow(Landroid/database/CursorWindow;)V
    .locals 0

    invoke-super {p0, p1}, Landroid/database/AbstractWindowedCursor;->setWindow(Landroid/database/CursorWindow;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/provider/cache/MemoryCursor;->mCount:I

    return-void
.end method
