.class public Lcom/miui/gallery/picker/PickerHomePageAdapter;
.super Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;
.source "PickerHomePageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mGroupStartLocations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
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


# direct methods
.method static constructor <clinit>()V
    .locals 19

    const-string v0, "_id"

    const-string v1, "alias_micro_thumbnail"

    const-string v2, "alias_create_date"

    const-string v3, "alias_create_time"

    const-string v4, "location"

    const-string v5, "sha1"

    const-string v6, "serverType"

    const-string v7, "duration"

    const-string v8, "mimeType"

    const-string v9, "alias_sync_state"

    const-string v10, "thumbnailFile"

    const-string v11, "localFile"

    const-string v12, "alias_clear_thumbnail"

    const-string v13, "alias_is_favorite"

    const-string v14, "specialTypeFlags"

    const-string v15, "alias_sort_time"

    const-string v16, "size"

    const-string v17, "title"

    const-string v18, "burst_group_id"

    filled-new-array/range {v0 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method private getSyncState(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getSyncStateInternal(I)I

    move-result p1

    return p1
.end method


# virtual methods
.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v2, p3

    move-object/from16 v1, p1

    check-cast v1, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    invoke-virtual {v0, v9}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v9}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v9}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lcom/miui/gallery/ui/HomePageGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    const/16 v10, 0x8

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x7

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/16 v3, 0xe

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    instance-of v3, v2, Lcom/miui/gallery/util/BurstFilterCursor;

    const/4 v11, 0x0

    if-eqz v3, :cond_0

    move-object v3, v2

    check-cast v3, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v3, v9}, Lcom/miui/gallery/util/BurstFilterCursor;->isBurstPosition(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    const/4 v12, 0x1

    goto :goto_0

    :cond_0
    const/4 v12, 0x0

    :goto_0
    if-eqz v12, :cond_1

    const-wide/16 v13, 0x40

    or-long/2addr v7, v13

    :cond_1
    move-object v3, v1

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/ui/HomePageGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    invoke-virtual {v0, v9}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->isFavorite(I)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/HomePageGridItem;->bindFavoriteIndicator(Z)V

    invoke-direct {v0, v2}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result v3

    invoke-interface {v2, v11}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v14

    iget-object v4, v0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-virtual {v1, v14, v15, v3, v4}, Lcom/miui/gallery/ui/HomePageGridItem;->bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v5, 0x4

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v6, p2

    invoke-static {v6, v3, v4, v5, v2}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/HomePageGridItem;->setContentDescription(Ljava/lang/CharSequence;)V

    if-eqz v12, :cond_2

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v13

    const/16 v16, 0x0

    const/16 v17, 0x0

    invoke-virtual {v0, v9}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v18

    invoke-virtual/range {v13 .. v18}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZLjava/util/List;)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/HomePageGridItem;->setIsSimilarBestImage(Z)V

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v2

    invoke-virtual {v2, v14, v15, v11, v11}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZ)Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/HomePageGridItem;->setIsSimilarBestImage(Z)V

    :goto_1
    return-void
.end method

.method protected getBurstItemKeys(I)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/BurstFilterCursor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/util/BurstFilterCursor;->getBurstIdsInGroup(II)Ljava/util/ArrayList;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/HomePageGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p1

    return-object p1
.end method

.method public getClearThumbFilePath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x9

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b008e

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    iget-object p3, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/ui/HomePageGridHeaderItem;

    const/16 v1, 0xf

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/ui/HomePageGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/picker/PickerHomePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b008f

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    new-instance v0, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-direct {v0, p1}, Lcom/miui/gallery/util/BurstFilterCursor;-><init>(Landroid/database/Cursor;)V

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "extra_timeline_item_count_in_group"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    const-string v3, "extra_timeline_group_start_pos"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v3

    const-string v4, "extra_timeline_group_start_locations"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    if-eqz v3, :cond_1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {v1}, Lcom/miui/gallery/util/BurstFilterCursor;->getResultPos()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0, p1, v2, v3}, Lcom/miui/gallery/util/BurstFilterCursor;->wrapGroupInfos(Ljava/util/List;ILjava/util/List;Ljava/util/List;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/picker/PickerHomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_4
    :goto_1
    invoke-super {p0, v1}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
