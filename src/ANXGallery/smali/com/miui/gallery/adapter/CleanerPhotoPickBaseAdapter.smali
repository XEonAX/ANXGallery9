.class public Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;
.super Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;
.source "CleanerPhotoPickBaseAdapter.java"


# instance fields
.field private mClickToPhotoPage:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/AlbumDetailTimeLineAdapter;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->mClickToPhotoPage:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;Landroid/view/View;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->onItemClick(Landroid/view/View;I)V

    return-void
.end method

.method private onItemClick(Landroid/view/View;I)V
    .locals 25

    move-object/from16 v0, p0

    move/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    new-instance v9, Ljava/util/ArrayList;

    const/4 v3, 0x1

    invoke-direct {v9, v3}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v4, 0x2

    new-array v4, v4, [I

    move-object/from16 v5, p1

    invoke-virtual {v5, v4}, Landroid/view/View;->getLocationInWindow([I)V

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getWidth()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScaleX()F

    move-result v7

    mul-float v6, v6, v7

    float-to-int v6, v6

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getHeight()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getScaleY()F

    move-result v5

    mul-float v7, v7, v5

    float-to-int v5, v7

    new-instance v7, Lcom/miui/gallery/util/photoview/ItemViewInfo;

    const/4 v8, 0x0

    aget v12, v4, v8

    aget v13, v4, v3

    const/4 v11, 0x0

    move-object v10, v7

    move v14, v6

    move v15, v5

    invoke-direct/range {v10 .. v15}, Lcom/miui/gallery/util/photoview/ItemViewInfo;-><init>(IIIII)V

    invoke-virtual {v9, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v10, Lcom/miui/gallery/model/ImageLoadParams;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getItemKey(I)J

    move-result-wide v15

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v17

    new-instance v4, Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-direct {v4, v6, v5}, Lcom/nostra13/universalimageloader/core/assist/ImageSize;-><init>(II)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v21

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getFileLength(I)J

    move-result-wide v23

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    move-object v14, v10

    move-object/from16 v18, v4

    invoke-direct/range {v14 .. v24}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;ZJ)V

    iget-object v1, v0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->mContext:Landroid/content/Context;

    check-cast v1, Landroid/app/Activity;

    sget-object v4, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "_id = %d"

    new-array v7, v3, [Ljava/lang/Object;

    invoke-static {v2}, Lcom/miui/gallery/picker/helper/CursorUtils;->getId(Landroid/database/Cursor;)J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->supportFoldBurstItems()Z

    move-result v2

    xor-int/2addr v2, v3

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v3, v1

    move-object v8, v10

    move v10, v2

    invoke-static/range {v3 .. v10}, Lcom/miui/gallery/util/IntentUtil;->gotoPhotoPageFromPicker(Landroid/app/Activity;Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;Ljava/util/ArrayList;Z)V

    return-void
.end method


# virtual methods
.method public doBindData(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 9

    move-object p2, p1

    check-cast p2, Lcom/miui/gallery/ui/AlbumDetailGridItem;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result v6

    invoke-virtual {p0, v6}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getClearThumbFilePath(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v6}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {p0, v6}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v2

    invoke-virtual {p2, v0, v1, v2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    const/16 v0, 0xa

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const/16 v0, 0x9

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->getCurrentSortBy()Lcom/miui/gallery/widget/SortByHeader$SortBy;

    move-result-object v0

    sget-object v4, Lcom/miui/gallery/widget/SortByHeader$SortBy;->SIZE:Lcom/miui/gallery/widget/SortByHeader$SortBy;

    if-ne v0, v4, :cond_0

    const/16 v0, 0xb

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindFileSize(J)V

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x14

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/miui/gallery/Config$ShareAlbumConfig;->getSupportedSpecialTypeFlags(J)J

    move-result-wide v4

    const-wide/16 v7, 0x0

    invoke-virtual {p2, v7, v8}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindFileSize(J)V

    move-object v0, p2

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    :goto_0
    iget p3, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->mViewScrollState:I

    if-nez p3, :cond_1

    invoke-virtual {p0, p2, v6}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->bindContentDescription(Landroid/view/View;I)V

    :cond_1
    invoke-virtual {p2}, Lcom/miui/gallery/ui/AlbumDetailGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p2

    iget-boolean p3, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->mClickToPhotoPage:Z

    if-eqz p3, :cond_2

    new-instance p3, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;

    new-instance v0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;

    invoke-direct {v0, p0, v6}, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter$1;-><init>(Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;I)V

    invoke-direct {p3, p1, p2, v0}, Lcom/miui/gallery/adapter/ExcludeOnTouchListener;-><init>(Landroid/view/View;Landroid/view/View;Lcom/miui/gallery/adapter/ExcludeOnTouchListener$OnTouchValidListener;)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    :cond_2
    return-void
.end method

.method public setClickToPhotoPageEnable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/CleanerPhotoPickBaseAdapter;->mClickToPhotoPage:Z

    return-void
.end method

.method public supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
