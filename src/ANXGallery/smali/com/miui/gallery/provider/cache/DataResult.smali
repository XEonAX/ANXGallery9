.class Lcom/miui/gallery/provider/cache/DataResult;
.super Ljava/lang/Object;
.source "DataResult.java"

# interfaces
.implements Lcom/miui/gallery/provider/cache/ResultSet;


# instance fields
.field private mColumns:[Ljava/lang/String;

.field private mContents:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/provider/cache/CacheItem;",
            ">;"
        }
    .end annotation
.end field

.field private mIndexes:[I


# direct methods
.method public constructor <init>([Ljava/lang/String;Ljava/util/List;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/provider/cache/CacheItem;",
            ">;",
            "Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    invoke-static {p1, p3}, Lcom/miui/gallery/provider/cache/DataResult;->buildIndex([Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)[I

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/DataResult;->mIndexes:[I

    return-void
.end method

.method private static buildIndex([Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)[I
    .locals 3

    array-length v0, p0

    new-array v0, v0, [I

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    aget-object v2, p0, v1

    invoke-interface {p1, v2}, Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;->getIndex(Ljava/lang/String;)I

    move-result v2

    aput v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/cache/DataResult;->mIndexes:[I

    return-void
.end method

.method public fillWindow(Landroid/database/CursorWindow;)I
    .locals 8

    invoke-virtual {p1}, Landroid/database/CursorWindow;->getStartPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v0, v3, :cond_3

    invoke-virtual {p1}, Landroid/database/CursorWindow;->allocRow()Z

    move-result v3

    if-nez v3, :cond_0

    const-string v0, ".provider.cache.DataResult"

    const-string v1, "window can not allocate a new row, break."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_0
    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    array-length v4, v4

    if-ge v3, v4, :cond_2

    iget-object v4, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v5, p0, Lcom/miui/gallery/provider/cache/DataResult;->mIndexes:[I

    aget v5, v5, v3

    invoke-interface {v4, p1, v0, v3, v5}, Lcom/miui/gallery/provider/cache/CacheItem;->fillWindow(Landroid/database/CursorWindow;III)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, ".provider.cache.DataResult"

    const-string v5, "fill window[%s] failed: %s, %s"

    iget-object v6, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    aget-object v7, v7, v3

    invoke-static {v4, v5, p1, v6, v7}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_2
    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    :goto_2
    const-string v0, ".provider.cache.DataResult"

    const-string v1, "window[%s] filled: %s"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v1, p1, v3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return v2
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/DataResult;->mColumns:[Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/DataResult;->mContents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
