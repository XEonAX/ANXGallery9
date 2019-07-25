.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "SizeFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mSize:J


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    return-void
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    cmp-long v4, v0, v2

    if-lez v4, :cond_1

    return-object p1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_2

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_2

    return-object p1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_3

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    cmp-long v4, v0, v2

    if-gez v4, :cond_3

    return-object p1

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->LESS_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_4

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$600(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$SizeFilter;->mSize:J

    cmp-long v4, v0, v2

    if-gtz v4, :cond_4

    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method
