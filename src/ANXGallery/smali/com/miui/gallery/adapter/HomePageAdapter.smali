.class public Lcom/miui/gallery/adapter/HomePageAdapter;
.super Lcom/miui/gallery/adapter/PreloadMediaAdapter;
.source "HomePageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;
.implements Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/PreloadMediaAdapter;",
        "Lcom/miui/gallery/adapter/CheckableAdapter;",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">;"
    }
.end annotation


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

    sput-object v0, Lcom/miui/gallery/adapter/HomePageAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_IN_CHECK_MODE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/HomePageAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    return-void
.end method

.method private bindContentDescription(Landroid/view/View;I)V
    .locals 5

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x3

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/4 v3, 0x4

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0x8

    invoke-interface {p2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v1, v2, v3, p2}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method private getSyncState(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x9

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getSyncStateInternal(I)I

    move-result p1

    return p1
.end method


# virtual methods
.method public doBindData(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 18

    move-object/from16 v0, p0

    move/from16 v1, p2

    const-string v2, "HomePageAdapter"

    const-string v3, "doBindViewHolder %d"

    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v2, p1

    iget-object v2, v2, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    check-cast v2, Lcom/miui/gallery/ui/HomePageGridItem;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemId(I)J

    move-result-wide v4

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v8

    move-object v3, v2

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/ui/HomePageGridItem;->bindImage(JLjava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v9

    const/16 v3, 0x8

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v3, 0x7

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/16 v3, 0xe

    invoke-interface {v9, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    instance-of v3, v9, Lcom/miui/gallery/util/BurstFilterCursor;

    const/4 v10, 0x0

    if-eqz v3, :cond_0

    move-object v3, v9

    check-cast v3, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v3, v1}, Lcom/miui/gallery/util/BurstFilterCursor;->isBurstPosition(I)Z

    move-result v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    const/4 v11, 0x1

    goto :goto_0

    :cond_0
    const/4 v11, 0x0

    :goto_0
    if-eqz v11, :cond_1

    const-wide/16 v12, 0x40

    or-long/2addr v7, v12

    :cond_1
    move-object v3, v2

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/ui/HomePageGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    invoke-interface {v9}, Landroid/database/Cursor;->getPosition()I

    move-result v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->isFavorite(I)Z

    move-result v3

    invoke-virtual {v2, v3}, Lcom/miui/gallery/ui/HomePageGridItem;->bindFavoriteIndicator(Z)V

    invoke-direct {v0, v9}, Lcom/miui/gallery/adapter/HomePageAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result v3

    invoke-interface {v9, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    iget-object v4, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-virtual {v2, v13, v14, v3, v4}, Lcom/miui/gallery/ui/HomePageGridItem;->bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    iget v3, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mViewScrollState:I

    if-nez v3, :cond_2

    invoke-direct {v0, v2, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->bindContentDescription(Landroid/view/View;I)V

    :cond_2
    if-eqz v11, :cond_3

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v12

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v17

    invoke-virtual/range {v12 .. v17}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZLjava/util/List;)Z

    move-result v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/HomePageGridItem;->setIsSimilarBestImage(Z)V

    goto :goto_1

    :cond_3
    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v1

    invoke-virtual {v1, v13, v14, v10, v10}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZ)Z

    move-result v1

    invoke-virtual {v2, v1}, Lcom/miui/gallery/ui/HomePageGridItem;->setIsSimilarBestImage(Z)V

    :goto_1
    return-void
.end method

.method public findFuzzyMatchItem(Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 19

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    const/4 v2, 0x0

    if-eqz v1, :cond_7

    iget-object v3, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mCursor:Landroid/database/Cursor;

    if-nez v3, :cond_0

    goto/16 :goto_5

    :cond_0
    const-wide/16 v3, -0x1

    const-wide/16 v5, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x1

    :goto_0
    iget-object v9, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, -0x1

    if-ge v8, v9, :cond_2

    iget-object v9, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    iget-wide v11, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemSortTime(I)J

    move-result-wide v13

    cmp-long v9, v11, v13

    if-lez v9, :cond_1

    sub-int/2addr v8, v7

    goto :goto_1

    :cond_1
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    :cond_2
    const/4 v8, -0x1

    :goto_1
    if-ne v8, v10, :cond_3

    iget-object v8, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v7

    :cond_3
    if-eq v8, v10, :cond_6

    iget-object v7, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v8, v7, :cond_6

    iget-object v7, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v7

    iget-object v9, v0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v9, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/Integer;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    add-int/2addr v9, v7

    :goto_2
    if-ge v7, v9, :cond_6

    invoke-virtual {v0, v7}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v10

    iget-wide v12, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mId:J

    cmp-long v14, v10, v12

    if-eqz v14, :cond_5

    iget-wide v12, v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;->mDate:J

    invoke-virtual {v0, v7}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemSortTime(I)J

    move-result-wide v14

    cmp-long v16, v12, v14

    if-gtz v16, :cond_5

    add-int/lit8 v12, v9, -0x1

    if-ne v7, v12, :cond_4

    goto :goto_3

    :cond_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_5
    :goto_3
    invoke-virtual {v0, v7}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v1

    const/4 v2, 0x4

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v7}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemSortTime(I)J

    move-result-wide v5

    move-object/from16 v16, v2

    move-wide/from16 v17, v5

    move v13, v7

    move-wide v14, v10

    goto :goto_4

    :cond_6
    move-object/from16 v16, v2

    move-wide v14, v3

    move-wide/from16 v17, v5

    move v13, v8

    :goto_4
    new-instance v1, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    move-object v12, v1

    invoke-direct/range {v12 .. v18}, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;-><init>(IJLjava/lang/String;J)V

    return-object v1

    :cond_7
    :goto_5
    return-object v2
.end method

.method public getBurstItemKeys(I)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getCursor()Landroid/database/Cursor;

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

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x9

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getHeaderId(I)J
    .locals 2

    int-to-long v0, p1

    return-wide v0
.end method

.method public getHeaderIndex(I)I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ge p1, v1, :cond_0

    add-int/lit8 v0, v0, -0x1

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    return p1

    :cond_2
    const/4 p1, -0x1

    return p1
.end method

.method public getHeaderViewType(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemPositionInterval(I)[I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    const/4 v1, 0x2

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-ge p1, v2, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    add-int/2addr p1, v3

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :goto_0
    sub-int/2addr p1, v3

    goto :goto_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result p1

    goto :goto_0

    :goto_1
    new-array v1, v1, [I

    const/4 v2, 0x0

    aput v0, v1, v2

    aput p1, v1, v3

    return-object v1

    :cond_1
    new-array p1, v1, [I

    fill-array-data p1, :array_0

    return-object p1

    nop

    :array_0
    .array-data 4
        -0x1
        -0x1
    .end array-data
.end method

.method public getItemSortTime(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x5

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x8

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

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

.method public onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemPositionInterval(I)[I

    move-result-object p2

    const/4 v1, 0x0

    aget p2, p2, v1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object p2

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/ui/HomePageGridHeaderItem;

    const/16 v1, 0xf

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/HomePageGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 2

    const-string v0, "HomePageAdapter"

    const-string v1, "onCreateViewHolder %d"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    const v0, 0x7f0b008e

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 1

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    const v0, 0x7f0b008f

    invoke-static {p1, v0}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->getView(Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    return-object p2
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->onViewRecycled(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;)V
    .locals 3

    const-string v0, "HomePageAdapter"

    const-string v1, "onViewRecycled %d"

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->getAdapterPosition()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    return-void
.end method

.method protected onViewScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->onViewScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    if-nez p2, :cond_1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0902cd

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {p0, v1, v2}, Lcom/miui/gallery/adapter/HomePageAdapter;->bindContentDescription(Landroid/view/View;I)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public packageFuzzyMatchItem(I)Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;
    .locals 8

    new-instance v7, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v0

    const/4 v1, 0x4

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItem(I)Landroid/database/Cursor;

    move-result-object v0

    const/16 v1, 0xf

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    move-object v0, v7

    move v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/recyclerview/transition/FuzzyMatchItem;-><init>(IJLjava/lang/String;J)V

    return-object v7
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

    move-result-object v2

    const-string v3, "extra_timeline_group_start_pos"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "extra_timeline_group_start_locations"

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    move-object v5, v2

    move-object v2, v0

    move-object v0, v5

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    :goto_0
    if-eqz v0, :cond_1

    if-eqz v3, :cond_1

    if-eqz v1, :cond_1

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {v2}, Lcom/miui/gallery/util/BurstFilterCursor;->getResultPos()Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0, p1, v1, v3}, Lcom/miui/gallery/util/BurstFilterCursor;->wrapGroupInfos(Ljava/util/List;ILjava/util/List;Ljava/util/List;)V

    goto :goto_1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/adapter/HomePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_4
    :goto_1
    invoke-super {p0, v2}, Lcom/miui/gallery/adapter/PreloadMediaAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
