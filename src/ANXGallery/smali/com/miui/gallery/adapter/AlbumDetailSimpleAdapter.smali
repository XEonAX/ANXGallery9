.class public Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;
.super Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;
.source "AlbumDetailSimpleAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;
    }
.end annotation


# static fields
.field public static final PROJECTION:[Ljava/lang/String;

.field protected static final PROJECTION_INTERNAL:[Ljava/lang/String;


# instance fields
.field private mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

.field protected mGroupItemCount:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field protected mGroupStartLocations:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected mGroupStartPos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;


# direct methods
.method static constructor <clinit>()V
    .locals 22

    const-string v0, "_id"

    const-string v1, "alias_micro_thumbnail"

    const-string v2, "localFile"

    const-string v3, "title"

    const-string v4, "alias_create_date"

    const-string v5, "alias_create_time"

    const-string v6, "location"

    const-string v7, "sha1"

    const-string v8, "serverType"

    const-string v9, "duration"

    const-string v10, "mimeType"

    const-string v11, "size"

    const-string v12, "alias_sync_state"

    const-string v13, "secretKey"

    const-string v14, "thumbnailFile"

    const-string v15, "localFile"

    const-string v16, "creatorId"

    const-string v17, "alias_sort_time"

    const-string v18, "alias_clear_thumbnail"

    const-string v19, "alias_is_favorite"

    const-string v20, "specialTypeFlags"

    const-string v21, "burst_group_id"

    filled-new-array/range {v0 .. v21}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->PROJECTION_INTERNAL:[Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->copyStringArray([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    sget-object v0, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_IN_CHECK_MODE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    sget-object p1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    sget-object p1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    sget-object p1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->NORMAL:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    return-void
.end method

.method private buildNoDiskCacheDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    return-object v0
.end method

.method private buildSecretPhotoDisplayOptions([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method private getDisplayImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isScreenshotAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroScreenshotTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isPanoAlbum()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroPanoTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isRecentAlbum()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroRecentTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0

    :cond_2
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method private isNoCacheDisplayAlbum()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isScreenshotAlbum()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isPanoAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method


# virtual methods
.method protected bindContentDescription(Landroid/view/View;I)V
    .locals 5

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p2

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x5

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/4 v3, 0x6

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/16 v4, 0xa

    invoke-interface {p2, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {v0, v1, v2, v3, p2}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 20

    move-object/from16 v0, p0

    move-object/from16 v2, p3

    move-object/from16 v9, p1

    check-cast v9, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v10

    invoke-virtual {v0, v10}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v10}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v0, v10}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v4

    invoke-virtual {v9, v1, v3, v4}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    const/16 v1, 0xa

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/16 v1, 0x9

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    instance-of v1, v2, Lcom/miui/gallery/util/BurstFilterCursor;

    const/4 v11, 0x1

    const/4 v12, 0x0

    if-eqz v1, :cond_0

    move-object v1, v2

    check-cast v1, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v1, v10}, Lcom/miui/gallery/util/BurstFilterCursor;->isBurstPosition(I)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v13, 0x1

    goto :goto_0

    :cond_0
    const/4 v13, 0x0

    :goto_0
    iget-object v1, v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    sget-object v3, Lcom/miui/gallery/widget/SortByHeader$SortBy;->SIZE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v1, v3, :cond_1

    const/16 v1, 0xb

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {v9, v3, v4}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindFileSize(J)V

    goto :goto_2

    :cond_1
    const/16 v1, 0x14

    invoke-interface {v2, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isSecretAlbum()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {v7, v8}, Lcom/miui/gallery/Config$SecretAlbumConfig;->getSupportedSpecialTypeFlags(J)J

    move-result-wide v7

    goto :goto_1

    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isOtherShareAlbum()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-static {v7, v8}, Lcom/miui/gallery/Config$ShareAlbumConfig;->getSupportedSpecialTypeFlags(J)J

    move-result-wide v7

    :cond_3
    :goto_1
    if-eqz v13, :cond_4

    const-wide/16 v14, 0x40

    or-long/2addr v7, v14

    :cond_4
    const-wide/16 v14, 0x0

    invoke-virtual {v9, v14, v15}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindFileSize(J)V

    move-object v3, v9

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    :goto_2
    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isSecretAlbum()Z

    move-result v1

    if-nez v1, :cond_5

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isFavorite(I)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_3

    :cond_5
    const/4 v11, 0x0

    :goto_3
    invoke-virtual {v9, v11}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindFavoriteIndicator(Z)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getSyncState(Landroid/database/Cursor;)I

    move-result v4

    invoke-interface {v2, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    iget-object v5, v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mShowScene:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    iget v6, v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mSyncStateDisplayOptions:I

    move-object v1, v9

    move-wide v2, v7

    invoke-virtual/range {v1 .. v6}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindSyncIndicator(JILcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;I)V

    iget v1, v0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mViewScrollState:I

    if-nez v1, :cond_6

    invoke-virtual {v0, v9, v10}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->bindContentDescription(Landroid/view/View;I)V

    :cond_6
    if-eqz v13, :cond_7

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v14

    const/16 v17, 0x0

    const/16 v18, 0x0

    invoke-virtual {v0, v10}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v19

    move-wide v15, v7

    invoke-virtual/range {v14 .. v19}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZLjava/util/List;)Z

    move-result v1

    invoke-virtual {v9, v1}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setIsSimilarBestImage(Z)V

    goto :goto_4

    :cond_7
    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v1

    invoke-virtual {v1, v7, v8, v12, v12}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->shouldShowSelectionStar(JZZ)Z

    move-result v1

    invoke-virtual {v9, v1}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setIsSimilarBestImage(Z)V

    :goto_4
    return-void
.end method

.method public getBurstItemKeys(I)Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/util/BurstFilterCursor;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/miui/gallery/util/BurstFilterCursor;->getBurstIdsInGroup(II)Ljava/util/ArrayList;

    move-result-object p1

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getItemKey(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    move-object p1, v0

    :goto_0
    return-object p1
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p1

    return-object p1
.end method

.method public getClearThumbFilePath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x12

    const/4 v1, 0x7

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCreatorId(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x10

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getCurrentSortBy()Lcom/miui/gallery/widget/SortByHeader$SortBy;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-object v0
.end method

.method protected getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isSecretAlbum()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_1

    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->buildSecretPhotoDisplayOptions([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    move-object v0, p1

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isNoCacheDisplayAlbum()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->buildNoDiskCacheDisplayOptions()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    :cond_1
    :goto_0
    return-object v0
.end method

.method protected getDisplayImageSize(I)Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDisplayImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p1

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDownloadUri(Landroid/database/Cursor;II)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemSecretKey(I)[B
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isSecretAlbum()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    return-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;->getItemSecretKey(I)[B

    move-result-object p1

    return-object p1
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x7

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getMicroPath(Landroid/database/Cursor;II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMicroThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xa

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected getSyncState(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getSyncStateInternal(I)I

    move-result p1

    return p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xe

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public isBabyAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->BABY:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x13

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

.method public isOtherShareAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->OTHER_SHARE:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isPanoAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->PANO:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isRecentAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->RECENT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isScreenshotAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SCREENSHOT:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isSecretAlbum()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    sget-object v1, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;->SECRET:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isScreenshotAlbum()Z

    move-result p2

    const v0, 0x7f07022f

    const/4 v1, 0x0

    if-eqz p2, :cond_0

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b000e

    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDisplayImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageForeground(I)V

    return-object p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isPanoAlbum()Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b000d

    invoke-virtual {p1, p2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDisplayImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    return-object p1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isRecentAlbum()Z

    move-result p2

    const v2, 0x7f0b000c

    if-eqz p2, :cond_2

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p1, v2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->getDisplayImageSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageSize(Lcom/nostra13/universalimageloader/core/assist/ImageSize;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->setImageForeground(I)V

    return-object p1

    :cond_2
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    invoke-virtual {p1, v2, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onViewScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 3

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;->onViewScrollStateChanged(Landroid/widget/AbsListView;I)V

    if-nez p2, :cond_1

    invoke-virtual {p1}, Landroid/widget/AbsListView;->getChildCount()I

    move-result p2

    const/4 v0, 0x0

    :goto_0
    if-ge v0, p2, :cond_1

    invoke-virtual {p1, v0}, Landroid/widget/AbsListView;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f0902cd

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p0, v1, v2}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->bindContentDescription(Landroid/view/View;I)V

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public setAlbumType(Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mAlbumType:Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter$AlbumType;

    invoke-direct {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->isNoCacheDisplayAlbum()Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->setPreloadNum(I)V

    :cond_0
    return-void
.end method

.method public setCurrentSortBy(Lcom/miui/gallery/widget/SortByHeader$SortBy;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mSortBy:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    return-void
.end method

.method public supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;
    .locals 6

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    invoke-interface {p1}, Landroid/database/Cursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "extra_timeline_item_count_in_group"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    const-string v2, "extra_timeline_group_start_pos"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getIntegerArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    const-string v3, "extra_timeline_group_start_locations"

    invoke-virtual {v0, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    move-object v5, v1

    move-object v1, v0

    move-object v0, v5

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v3

    if-eqz v3, :cond_1

    if-eqz p1, :cond_1

    new-instance v3, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-direct {v3, p1}, Lcom/miui/gallery/util/BurstFilterCursor;-><init>(Landroid/database/Cursor;)V

    goto :goto_1

    :cond_1
    move-object v3, p1

    :goto_1
    if-eqz v0, :cond_2

    if-eqz v2, :cond_2

    if-eqz v1, :cond_2

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v4, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->supportFoldBurstItems()Z

    move-result v0

    if-eqz v0, :cond_5

    move-object v0, v3

    check-cast v0, Lcom/miui/gallery/util/BurstFilterCursor;

    invoke-virtual {v0}, Lcom/miui/gallery/util/BurstFilterCursor;->getResultPos()Ljava/util/ArrayList;

    move-result-object v0

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0, p1, v1, v2}, Lcom/miui/gallery/util/BurstFilterCursor;->wrapGroupInfos(Ljava/util/List;ILjava/util/List;Ljava/util/List;)V

    goto :goto_2

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumDetailSimpleAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_5
    :goto_2
    invoke-super {p0, v3}, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
