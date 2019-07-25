.class public Lcom/miui/gallery/provider/cache/RawCursor;
.super Landroid/database/AbstractCursor;
.source "RawCursor.java"


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
.method public constructor <init>(Ljava/util/List;[Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/provider/cache/CacheItem;",
            ">;[",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/database/AbstractCursor;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iput-object p2, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mColumns:[Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mColumns:[Ljava/lang/String;

    invoke-static {p1, p3}, Lcom/miui/gallery/provider/cache/RawCursor;->buildIndex([Ljava/lang/String;Lcom/miui/gallery/provider/cache/CacheItem$ColumnMapper;)[I

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

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
.method public getBlob(I)[B
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    instance-of v0, p1, [B

    if-eqz v0, :cond_1

    check-cast p1, [B

    return-object p1

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "not a blob"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getColumnName(I)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mColumns:[Ljava/lang/String;

    aget-object p1, v0, p1

    return-object p1
.end method

.method public getColumnNames()[Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mColumns:[Ljava/lang/String;

    invoke-virtual {v0}, [Ljava/lang/String;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/String;

    return-object v0
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getDouble(I)D
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->doubleValue()D

    move-result-wide v0

    return-wide v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v0

    return-wide v0
.end method

.method public getFloat(I)F
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p1

    return p1
.end method

.method public getInt(I)I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return v1

    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    return p1
.end method

.method public getLong(I)J
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    return-wide v0

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getShort(I)S
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    return v1

    :cond_0
    instance-of v0, p1, Ljava/lang/Number;

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->shortValue()S

    move-result p1

    return p1

    :cond_1
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Short;->parseShort(Ljava/lang/String;)S

    move-result p1

    return p1
.end method

.method public getString(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getType(I)I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/provider/cache/CacheItem;->getType(I)I

    move-result p1

    return p1
.end method

.method public isNull(I)Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cache/RawCursor;->checkPosition()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mContents:Ljava/util/List;

    iget v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/provider/cache/CacheItem;

    iget-object v1, p0, Lcom/miui/gallery/provider/cache/RawCursor;->mIndexes:[I

    aget p1, v1, p1

    const/4 v1, 0x0

    invoke-interface {v0, p1, v1}, Lcom/miui/gallery/provider/cache/CacheItem;->get(IZ)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method
