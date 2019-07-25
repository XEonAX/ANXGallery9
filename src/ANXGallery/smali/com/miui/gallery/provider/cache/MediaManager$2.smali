.class Lcom/miui/gallery/provider/cache/MediaManager$2;
.super Ljava/lang/Object;
.source "MediaManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/cache/MediaManager;->generateMonthItems(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
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
.field final synthetic this$0:Lcom/miui/gallery/provider/cache/MediaManager;


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/cache/MediaManager;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager$2;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortDate()I

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortDate()I

    move-result v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/GalleryDateUtils;->isSameMonth(II)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide v0

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortTime()J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaManager$2;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result p1

    return p1
.end method
