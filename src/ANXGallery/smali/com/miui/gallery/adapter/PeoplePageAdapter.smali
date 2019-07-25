.class public Lcom/miui/gallery/adapter/PeoplePageAdapter;
.super Lcom/miui/gallery/adapter/BaseAdapter;
.source "PeoplePageAdapter.java"

# interfaces
.implements Lcom/miui/gallery/adapter/CheckableAdapter;
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;


# instance fields
.field private mCheckable:Z

.field private mUserDefineRelationMap:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mContext:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public bindView(Landroid/view/View;Landroid/content/Context;Landroid/database/Cursor;)V
    .locals 6

    check-cast p1, Lcom/miui/gallery/ui/PeoplePageGridItem;

    invoke-interface {p3}, Landroid/database/Cursor;->getPosition()I

    move-result p2

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v3

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getFaceRegionRectF(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-result-object v4

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailDownloadType(Landroid/database/Cursor;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v5

    move-object v0, p1

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/ui/PeoplePageGridItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p3}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PeoplePageGridItem;->setName(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mContext:Landroid/content/Context;

    const p3, 0x7f100503

    invoke-virtual {p2, p3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PeoplePageGridItem;->setName(Ljava/lang/String;)V

    :goto_0
    invoke-virtual {p1, v1, v2, v0}, Lcom/miui/gallery/ui/PeoplePageGridItem;->saveIds2Tag(JLjava/lang/String;)V

    iget-boolean p2, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mCheckable:Z

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/PeoplePageGridItem;->setCheckable(Z)V

    return-void
.end method

.method public enterChoiceMode()V
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mCheckable:Z

    return-void
.end method

.method public exitChoiceMode()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mCheckable:Z

    return-void
.end method

.method public getCheckableView(Landroid/view/View;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getDownloadUri(I)Landroid/net/Uri;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailDownloadUri(Landroid/database/Cursor;)Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method public getFaceRegionRectF(I)Landroid/graphics/RectF;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getFaceRegionRectF(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-result-object p1

    return-object p1
.end method

.method public getFileLength(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getCoverSize(Landroid/database/Cursor;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderId(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTypeOfItem(I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/model/PeopleContactInfo;->isUserDefineRelation(I)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTextOfItem(I)Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mUserDefineRelationMap:Ljava/util/HashMap;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mUserDefineRelationMap:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mUserDefineRelationMap:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationTypesCount()I

    move-result p1

    add-int/2addr p1, v0

    int-to-long v0, p1

    return-wide v0

    :cond_1
    int-to-long v0, v0

    return-wide v0
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTypeOfItem(I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/model/PeopleContactInfo;->isUnKnownRelation(I)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b00ec

    invoke-virtual {p1, p2, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    if-eqz p2, :cond_1

    instance-of v1, p2, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;

    if-nez v1, :cond_2

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mContext:Landroid/content/Context;

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0b00e9

    invoke-virtual {p2, v1, p3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_2
    invoke-static {v0}, Lcom/miui/gallery/model/PeopleContactInfo;->isUserDefineRelation(I)Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getRelationTextOfItem(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_3
    invoke-static {v0}, Lcom/miui/gallery/model/PeopleContactInfo;->getRelationShow(I)Ljava/lang/String;

    move-result-object p1

    :goto_0
    move-object p3, p2

    check-cast p3, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/ui/PeoplePageGridHeaderItem;->bindData(Ljava/lang/String;)V

    return-object p2
.end method

.method public getPeopleIdOfItem(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getPeopleLocalIdOfItem(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRelationTextOfItem(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationText(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getRelationTypeOfItem(I)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/database/Cursor;

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationType(Landroid/database/Cursor;)I

    move-result p1

    return p1
.end method

.method public getThumbFilePath(I)Ljava/lang/String;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->getCursorByPosition(I)Landroid/database/Cursor;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method protected initDisplayImageOptions()V
    .locals 3

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v2, 0x7f0700d7

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->EXACTLY:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;

    invoke-direct {v2, v1}, Lcom/miui/gallery/util/face/PeopleItemBitmapDisplayer;-><init>(Z)V

    invoke-virtual {v0, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mDisplayImageOptionBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-void
.end method

.method public newView(Landroid/content/Context;Landroid/database/Cursor;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b00ea

    const/4 v0, 0x0

    invoke-virtual {p1, p2, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public setUserDefineRelationMap(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/adapter/PeoplePageAdapter;->mUserDefineRelationMap:Ljava/util/HashMap;

    return-void
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
