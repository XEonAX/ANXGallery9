.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;
.super Lcom/miui/gallery/provider/cache/Filter$CompareFilter;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LocalFlagFilter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/provider/cache/Filter$CompareFilter<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mLocalFlag:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0, p1, p2}, Lcom/miui/gallery/provider/cache/Filter$CompareFilter;-><init>(ILcom/miui/gallery/provider/cache/Filter$Comparator;Ljava/lang/String;)V

    invoke-static {p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->mLocalFlag:I

    return-void
.end method


# virtual methods
.method public bridge synthetic filter(Lcom/miui/gallery/provider/cache/CacheItem;)Lcom/miui/gallery/provider/cache/CacheItem;
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;

    move-result-object p1

    return-object p1
.end method

.method public filter(Lcom/miui/gallery/provider/cache/MediaItem;)Lcom/miui/gallery/provider/cache/MediaItem;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1100(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->mLocalFlag:I

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->mComparator:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    sget-object v1, Lcom/miui/gallery/provider/cache/Filter$Comparator;->NOT_EQUALS:Lcom/miui/gallery/provider/cache/Filter$Comparator;

    if-ne v0, v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$1100(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/Long;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$LocalFlagFilter;->mLocalFlag:I

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;I)Z

    move-result v0

    if-nez v0, :cond_1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
