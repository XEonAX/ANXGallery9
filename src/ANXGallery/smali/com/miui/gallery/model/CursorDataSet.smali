.class public abstract Lcom/miui/gallery/model/CursorDataSet;
.super Lcom/miui/gallery/model/BaseDataSet;
.source "CursorDataSet.java"


# instance fields
.field protected mCursor:Landroid/database/Cursor;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataSet;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/CursorDataSet;->foldBurst()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/model/CursorDataSet;->getBurstCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;I)V
    .locals 0

    invoke-direct {p0, p2}, Lcom/miui/gallery/model/BaseDataSet;-><init>(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/CursorDataSet;->foldBurst()Z

    move-result p2

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/model/CursorDataSet;->getBurstCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    :goto_0
    return-void
.end method

.method private getBurstCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v0, "burst_group_id"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-direct {v0, p1}, Lcom/miui/gallery/util/BurstFilterCursor;-><init>(Landroid/database/Cursor;)V

    return-object v0

    :cond_1
    new-instance v0, Lcom/miui/gallery/model/CursorDataSet$1;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/model/CursorDataSet$1;-><init>(Lcom/miui/gallery/model/CursorDataSet;Landroid/database/Cursor;)V

    return-object v0
.end method


# virtual methods
.method protected burstKeyIndex()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected createItem(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/model/CursorDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/model/CloudItem;

    invoke-direct {v0}, Lcom/miui/gallery/model/CloudItem;-><init>()V

    invoke-virtual {p0, v0, p1}, Lcom/miui/gallery/model/CursorDataSet;->bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCount()I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CursorDataSet;->isValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isValidate()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isValidate(I)Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CursorDataSet;->isValidate()Z

    move-result v0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method protected moveToPosition(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/model/CursorDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onRelease()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CursorDataSet;->mCursor:Landroid/database/Cursor;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->closeSilently(Ljava/io/Closeable;)V

    return-void
.end method
