.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;
.super Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;
.source "MediaItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DateModifiedComparator"
.end annotation


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;-><init>(Z)V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 4

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v0

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result v0

    goto :goto_0

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;->mDescent:Z

    if-eqz p1, :cond_1

    neg-int v0, v0

    :cond_1
    :goto_0
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$DateModifiedComparator;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result p1

    return p1
.end method
