.class public Lcom/miui/gallery/card/model/MediaInfoScoreComparator;
.super Ljava/lang/Object;
.source "MediaInfoScoreComparator.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lcom/miui/gallery/card/model/MediaInfo;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/miui/gallery/card/model/MediaInfo;Lcom/miui/gallery/card/model/MediaInfo;)I
    .locals 2

    invoke-virtual {p1}, Lcom/miui/gallery/card/model/MediaInfo;->getScore()D

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/card/model/MediaInfo;->getScore()D

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Double;->compare(DD)I

    move-result p1

    neg-int p1, p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/card/model/MediaInfo;

    check-cast p2, Lcom/miui/gallery/card/model/MediaInfo;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/card/model/MediaInfoScoreComparator;->compare(Lcom/miui/gallery/card/model/MediaInfo;Lcom/miui/gallery/card/model/MediaInfo;)I

    move-result p1

    return p1
.end method
