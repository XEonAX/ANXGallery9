.class Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;
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
    name = "TitleComparator"
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
.field private mDescent:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;->mDescent:Z

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I
    .locals 1

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    goto :goto_0

    :cond_1
    invoke-static {p2}, Lcom/miui/gallery/provider/cache/MediaItem;->access$500(Lcom/miui/gallery/provider/cache/MediaItem;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_3

    const/4 p1, -0x1

    :goto_0
    iget-boolean p2, p0, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;->mDescent:Z

    if-eqz p2, :cond_2

    neg-int p1, p1

    :cond_2
    return p1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/provider/cache/MediaItem;

    check-cast p2, Lcom/miui/gallery/provider/cache/MediaItem;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/provider/cache/MediaItem$QueryFactory$TitleComparator;->compare(Lcom/miui/gallery/provider/cache/MediaItem;Lcom/miui/gallery/provider/cache/MediaItem;)I

    move-result p1

    return p1
.end method
