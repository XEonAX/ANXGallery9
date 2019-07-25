.class public Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.source "AlbumDetailTimeLineAdapter.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method


# virtual methods
.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b000a

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const/4 p3, 0x0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/ui/AlbumDetailGridHeaderItem;

    const/16 v1, 0x11

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/ui/AlbumDetailGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
