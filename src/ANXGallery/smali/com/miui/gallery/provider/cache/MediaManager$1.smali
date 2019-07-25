.class Lcom/miui/gallery/provider/cache/MediaManager$1;
.super Ljava/lang/Object;
.source "MediaManager.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/provider/cache/MediaManager;->onCreateCursor([Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/database/Cursor;
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

.field final synthetic val$transformedColumn:I


# direct methods
.method constructor <init>(Lcom/miui/gallery/provider/cache/MediaManager;I)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/cache/MediaManager$1;->this$0:Lcom/miui/gallery/provider/cache/MediaManager;

    iput p2, p0, Lcom/miui/gallery/provider/cache/MediaManager$1;->val$transformedColumn:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/provider/cache/MediaManager$1;->val$transformedColumn:I

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/provider/cache/MediaItem;->columnEquals(Lcom/miui/gallery/provider/cache/CacheItem;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortDate()I

    move-result p2

    invoke-virtual {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->getAliasSortDate()I

    move-result p1

    sub-int/2addr p2, p1

    return p2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaManager$1;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result p1

    return p1
.end method
