.class Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory$TimestampComparator;
.super Ljava/lang/Object;
.source "SearchHistoryItem.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "TimestampComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/provider/cache/SearchHistoryItem;",
        ">;"
    }
.end annotation


# instance fields
.field private mDescent:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory$TimestampComparator;->mDescent:Z

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/SearchHistoryItem;Lcom/miui/gallery/provider/cache/SearchHistoryItem;)I
    .locals 5

    iget-object v0, p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object v2, p2, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    iget-object p2, p2, Lcom/miui/gallery/provider/cache/SearchHistoryItem;->timestamp:Ljava/lang/Long;

    if-ne p1, p2, :cond_1

    const/4 p1, 0x0

    goto :goto_0

    :cond_1
    const/4 p1, 0x1

    :goto_0
    iget-boolean p2, p0, Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory$TimestampComparator;->mDescent:Z

    if-eqz p2, :cond_2

    neg-int p1, p1

    :cond_2
    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/SearchHistoryItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/SearchHistoryItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/SearchHistoryItem$QueryFactory$TimestampComparator;->compare(Lcom/miui/gallery/provider/cache/SearchHistoryItem;Lcom/miui/gallery/provider/cache/SearchHistoryItem;)I

    move-result p1

    return p1
.end method
