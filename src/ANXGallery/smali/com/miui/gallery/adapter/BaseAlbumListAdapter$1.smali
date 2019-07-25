.class Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;
.super Landroid/support/v7/widget/util/SortedListAdapterCallback;
.source "BaseAlbumListAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/adapter/BaseAlbumListAdapter;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/util/SortedListAdapterCallback<",
        "Lcom/miui/gallery/model/Album;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/adapter/BaseAlbumListAdapter;


# direct methods
.method constructor <init>(Lcom/miui/gallery/adapter/BaseAlbumListAdapter;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;->this$0:Lcom/miui/gallery/adapter/BaseAlbumListAdapter;

    invoke-direct {p0, p2}, Landroid/support/v7/widget/util/SortedListAdapterCallback;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method


# virtual methods
.method public areContentsTheSame(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)Z
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAttributes()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverSize()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getCoverSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getCoverPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getCoverPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getBabyInfo()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getBabyInfo()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic areContentsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/Album;

    check-cast p2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;->areContentsTheSame(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public areItemsTheSame(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)Z
    .locals 5

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getServerId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public bridge synthetic areItemsTheSame(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/Album;

    check-cast p2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;->areItemsTheSame(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)Z

    move-result p1

    return p1
.end method

.method public compare(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)I
    .locals 3

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result v1

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result p1

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumClassification()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v1

    if-eq v0, v1, :cond_3

    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/model/Album$AlbumType;->OTHERS_SHARE:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne v0, v1, :cond_1

    sget-object v0, Lcom/miui/gallery/model/Album$AlbumType;->NORMAL:Lcom/miui/gallery/model/Album$AlbumType;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album$AlbumType;->ordinal()I

    move-result v0

    goto :goto_0

    :cond_1
    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album$AlbumType;->ordinal()I

    move-result v0

    :goto_0
    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/model/Album$AlbumType;->OTHERS_SHARE:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne v1, v2, :cond_2

    sget-object v1, Lcom/miui/gallery/model/Album$AlbumType;->NORMAL:Lcom/miui/gallery/model/Album$AlbumType;

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album$AlbumType;->ordinal()I

    move-result v1

    goto :goto_1

    :cond_2
    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/model/Album$AlbumType;->ordinal()I

    move-result v1

    :goto_1
    if-eq v0, v1, :cond_3

    invoke-static {v0, v1}, Ljava/lang/Integer;->compare(II)I

    move-result p1

    return p1

    :cond_3
    invoke-virtual {p1}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide v0

    invoke-virtual {p2}, Lcom/miui/gallery/model/Album;->getSortBy()J

    move-result-wide p1

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Long;->compare(JJ)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/Album;

    check-cast p2, Lcom/miui/gallery/model/Album;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter$1;->compare(Lcom/miui/gallery/model/Album;Lcom/miui/gallery/model/Album;)I

    move-result p1

    return p1
.end method
