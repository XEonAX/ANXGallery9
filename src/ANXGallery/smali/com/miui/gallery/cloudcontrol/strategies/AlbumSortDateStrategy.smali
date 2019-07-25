.class public Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;
.super Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;
.source "AlbumSortDateStrategy.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;,
        Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;
    }
.end annotation


# instance fields
.field private mAlbums:Ljava/util/List;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "albums"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;",
            ">;"
        }
    .end annotation
.end field

.field private transient mSortDateMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/cloudcontrol/strategies/BaseStrategy;-><init>()V

    return-void
.end method


# virtual methods
.method public doAdditionalProcessing()V
    .locals 4

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mSortDateMap:Ljava/util/Map;

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mAlbums:Ljava/util/List;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mAlbums:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;->isValid()Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mSortDateMap:Ljava/util/Map;

    invoke-virtual {v1}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;->getAlbumPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_1
    return-void
.end method

.method public getAlbumPathsBySortDate(Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mAlbums:Ljava/util/List;

    invoke-static {v1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy;->mAlbums:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;->getSortDate()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;->fromValue(Ljava/lang/String;)Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$SortDate;

    move-result-object v3

    if-ne p1, v3, :cond_0

    invoke-virtual {v2}, Lcom/miui/gallery/cloudcontrol/strategies/AlbumSortDateStrategy$AlbumSortDate;->getAlbumPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method
