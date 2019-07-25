.class public Lcom/miui/gallery/adapter/FacePageAdapter;
.super Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;
.source "FacePageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private isPhotoModeNotFaceMode:Z

.field private mCheckable:Z

.field protected mFaceModeDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mFaceModeDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

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


# direct methods
.method static constructor <clinit>()V
    .locals 19

    const-string v0, "_id"

    const-string v1, "microthumbfile"

    const-string v2, "thumbnailFile"

    const-string v3, "mixedDateTime"

    const-string v4, "mimeType"

    const-string v5, "duration"

    const-string v6, "faceXScale"

    const-string v7, "faceYScale"

    const-string v8, "faceWScale"

    const-string v9, "faceHScale"

    const-string v10, "exifOrientation"

    const-string v11, "photo_id"

    const-string v12, "sha1"

    const-string v13, "localFile"

    const-string v14, "serverId"

    const-string v15, "isFavorite"

    const-string v16, "location"

    const-string v17, "specialTypeFlags"

    const-string v18, "size"

    filled-new-array/range {v0 .. v18}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/adapter/FacePageAdapter;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->isPhotoModeNotFaceMode:Z

    return-void
.end method

.method private getItemPathInternal(Landroid/database/Cursor;Z)Ljava/lang/String;
    .locals 3

    const/16 v0, 0xd

    const/4 v1, 0x1

    const/4 v2, 0x2

    if-eqz p2, :cond_1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_2
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    :cond_3
    :goto_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/16 p2, 0xc

    invoke-interface {p1, p2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_4
    return-object p2
.end method


# virtual methods
.method public changeDisplayMode()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->isPhotoModeNotFaceMode:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->isPhotoModeNotFaceMode:Z

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/FacePageAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public doBindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 16

    move-object/from16 v0, p0

    move-object/from16 v2, p3

    move-object/from16 v1, p1

    check-cast v1, Lcom/miui/gallery/ui/FacePageGridItem;

    invoke-interface/range {p3 .. p3}, Landroid/database/Cursor;->getPosition()I

    move-result v9

    iget-boolean v3, v0, Lcom/miui/gallery/adapter/FacePageAdapter;->isPhotoModeNotFaceMode:Z

    if-eqz v3, :cond_0

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    invoke-virtual {v1, v3, v4, v5}, Lcom/miui/gallery/ui/FacePageGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    goto :goto_0

    :cond_0
    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemBigPicPath(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->getFaceModeDisplayOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    new-instance v6, Lcom/miui/gallery/util/face/FaceRegionRectF;

    const/4 v7, 0x6

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getFloat(I)F

    move-result v11

    const/4 v8, 0x7

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getFloat(I)F

    move-result v12

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    const/16 v10, 0x8

    invoke-interface {v2, v10}, Landroid/database/Cursor;->getFloat(I)F

    move-result v10

    add-float v13, v7, v10

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    const/16 v8, 0x9

    invoke-interface {v2, v8}, Landroid/database/Cursor;->getFloat(I)F

    move-result v8

    add-float v14, v7, v8

    const/16 v7, 0xa

    invoke-interface {v2, v7}, Landroid/database/Cursor;->getInt(I)I

    move-result v15

    move-object v10, v6

    invoke-direct/range {v10 .. v15}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    invoke-virtual {v1, v3, v4, v5, v6}, Lcom/miui/gallery/ui/FacePageGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V

    :goto_0
    const/4 v3, 0x4

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v3, 0x5

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/16 v3, 0x11

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    move-object v3, v1

    move-object v4, v10

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/ui/FacePageGridItem;->bindIndicator(Ljava/lang/String;JJ)V

    invoke-virtual {v0, v9}, Lcom/miui/gallery/adapter/FacePageAdapter;->isFavorite(I)Z

    move-result v3

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/FacePageGridItem;->bindFavoriteIndicator(Z)V

    iget-boolean v3, v0, Lcom/miui/gallery/adapter/FacePageAdapter;->mCheckable:Z

    invoke-virtual {v1, v3}, Lcom/miui/gallery/ui/FacePageGridItem;->setCheckable(Z)V

    const/4 v3, 0x3

    invoke-interface {v2, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/16 v5, 0x10

    invoke-interface {v2, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v5, p2

    invoke-static {v5, v3, v4, v2, v10}, Lcom/miui/gallery/util/TalkBackUtil;->getContentDescriptionForImage(Landroid/content/Context;JLjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/miui/gallery/ui/FacePageGridItem;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    check-cast p1, Lcom/miui/gallery/ui/FacePageGridItem;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/FacePageGridItem;->getCheckBox()Landroid/widget/CheckBox;

    move-result-object p1

    return-object p1
.end method

.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

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

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xb

    invoke-static {p1, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getDownloadUri(Landroid/database/Cursor;I)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFaceModeDisplayOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getFileLength(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mFaceModeDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mFaceModeDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0x12

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getFirstFaceServerId()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object v0

    const/16 v1, 0xe

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    if-nez p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b000a

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    const/4 p3, 0x0

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p3, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {p3, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    move-object v0, p2

    check-cast v0, Lcom/miui/gallery/ui/AlbumDetailGridHeaderItem;

    const/4 v1, 0x3

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-static {v1, v2}, Lcom/miui/gallery/util/GalleryDateUtils;->formatRelativeDate(J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, p3}, Lcom/miui/gallery/ui/AlbumDetailGridHeaderItem;->bindData(Ljava/lang/String;Ljava/lang/String;)V

    return-object p2
.end method

.method public getItemBigPicPath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemPathInternal(Landroid/database/Cursor;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemPhotoId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemPathInternal(Landroid/database/Cursor;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getItemPhotoId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xb

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalPath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/adapter/FacePageAdapter;->getItemPathInternal(Landroid/database/Cursor;Z)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getMimeType(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getOriginFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xd

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getSha1(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->initDisplayImageOptions()V

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mFaceModeDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mFaceModeDisplayOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mFaceModeDisplayOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public isFaceDisplayMode()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->isPhotoModeNotFaceMode:Z

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isFavorite(I)Z
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/FacePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    const/16 v0, 0xf

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

    const p2, 0x7f0b007d

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
    .locals 5

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

    move-object v4, v1

    move-object v1, v0

    move-object v0, v4

    goto :goto_0

    :cond_0
    move-object v1, v0

    move-object v2, v1

    :goto_0
    if-eqz v0, :cond_1

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v3, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupItemCount:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartPos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/adapter/FacePageAdapter;->mGroupStartLocations:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_4
    :goto_1
    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseMediaAdapterDeprecated;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    move-result-object p1

    return-object p1
.end method
