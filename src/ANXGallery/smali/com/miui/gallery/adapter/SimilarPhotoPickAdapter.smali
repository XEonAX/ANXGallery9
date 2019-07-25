.class public Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;
.super Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;
.source "SimilarPhotoPickAdapter.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# instance fields
.field private mGroupIds:[J

.field private mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartPos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mMicroImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06046b

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v1, 0x7f06046a

    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance v1, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v1, v0, p1}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    iput-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mMicroImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-void
.end method


# virtual methods
.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p3, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setIsSimilarBestImage(Z)V

    return-void
.end method

.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

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

.method public getGroupIds()[J
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupIds:[J

    return-object v0
.end method

.method public getHeaderPositions()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b015c

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-static {p3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result p3

    if-eqz p3, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->getSortTime(I)J

    move-result-wide v0

    move-object p1, p2

    check-cast p1, Lcom/miui/gallery/ui/SimilarPhotoPickGridHeaderItem;

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/ui/SimilarPhotoPickGridHeaderItem;->bindData(J)V

    return-object p2
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getSortTime(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x11

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b000c

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    iget-object p2, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mMicroImageSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-object p1
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 5

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_item_count_in_group"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "extra_timeline_group_start_pos"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "extra_timeline_group_ids"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    :goto_0
    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    if-eqz v1, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, [J->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [J

    iput-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupIds:[J

    goto :goto_1

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupIds:[J

    if-eqz v1, :cond_4

    iput-object v0, p0, Lcom/miui/gallery/adapter/SimilarPhotoPickAdapter;->mGroupIds:[J

    :cond_4
    :goto_1
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
