.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;
.super Ljava/lang/Object;
.source "MediaItem.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimeComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/provider/cache/MediaItem;",
        ">;"
    }
.end annotation


# instance fields
.field protected mDescent:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;->mDescent:Z

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 6

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v0

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$300(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v1

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v3

    cmp-long v5, v1, v3

    if-eqz v5, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v0

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$100(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    goto :goto_0

    :cond_0
    if-nez v0, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$400(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide v0

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$400(Lcom/miui/gallery/provider/cache/MediaItem;)J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result v0

    :cond_1
    :goto_0
    iget-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;->mDescent:Z

    if-eqz p1, :cond_2

    neg-int v0, v0

    :cond_2
    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TimeComparator;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result p1

    return p1
.end method
