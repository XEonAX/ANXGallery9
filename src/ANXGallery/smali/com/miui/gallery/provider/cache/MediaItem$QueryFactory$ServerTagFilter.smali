.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ServerTagFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mServerTag:J


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;->mServerTag:J

    return-void
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->GREATER_OR_EQUAL:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    iget-wide v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$ServerTagFilter;->mServerTag:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Numbers;->compare(Ljava/lang/Number;Ljava/lang/Number;)I

    move-result v0

    if-gtz v0, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method
