.class public abstract Lcom/miui/gallery/adapter/CursorRecyclerAdapter;
.super Lcom/miui/gallery/adapter/BaseRecyclerAdapter;
.source "CursorRecyclerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">",
        "Lcom/miui/gallery/adapter/BaseRecyclerAdapter<",
        "Landroid/database/Cursor;",
        "TVH;>;"
    }
.end annotation


# instance fields
.field protected mCursor:Landroid/database/Cursor;

.field protected mDataValid:Z

.field private mRowIDColumn:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/BaseRecyclerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getCursor()Landroid/database/Cursor;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    return-object v0
.end method

.method public getItem(I)Landroid/database/Cursor;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mDataValid:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mDataValid:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItemId(I)J
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mDataValid:Z

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    iget v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mRowIDColumn:I

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    return-wide v1

    :cond_1
    return-wide v1
.end method

.method protected isValidPosition(I)Z
    .locals 1

    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected moveCursorToPosition(I)Landroid/database/Cursor;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->isValidPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    return-object p1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v2, v3

    const/4 p1, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->getItemCount()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, p1

    const-string p1, "Wrong cursor position %d, total count %d"

    invoke-static {v1, p1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    iput-object p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mCursor:Landroid/database/Cursor;

    if-eqz p1, :cond_1

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mDataValid:Z

    const-string v1, "_id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mRowIDColumn:I

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->notifyDataSetChanged()V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mDataValid:Z

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->mRowIDColumn:I

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/CursorRecyclerAdapter;->notifyDataSetChanged()V

    :goto_0
    return-object v0
.end method
