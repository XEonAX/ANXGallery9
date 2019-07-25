.class public Lcom/miui/gallery/adapter/AlbumAdapterBase;
.super Lcom/miui/gallery/adapter/BaseAlbumListAdapter;
.source "AlbumAdapterBase.java"

# interfaces
.implements Lcom/miui/gallery/widget/DividerTypeProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;,
        Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumFaceItemViewHolder;,
        Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumNormalItemViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/adapter/BaseAlbumListAdapter<",
        "Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;",
        ">;",
        "Lcom/miui/gallery/widget/DividerTypeProvider;"
    }
.end annotation


# static fields
.field private static sIsGalleryCloudSyncable:Z


# instance fields
.field private mDisplayFaceOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mDisplayVideoOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

.field private mDisplayVideoOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

.field private mIsInPickMode:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;-><init>(Landroid/content/Context;)V

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result p1

    sput-boolean p1, Lcom/miui/gallery/adapter/AlbumAdapterBase;->sIsGalleryCloudSyncable:Z

    return-void
.end method


# virtual methods
.method public getBottomDividerType(I)I
    .locals 2

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    const/4 v1, 0x3

    if-ne p1, v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItemCount()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    if-ge p1, v0, :cond_2

    const/4 p1, 0x2

    return p1

    :cond_2
    return v1
.end method

.method public getDisplayVideoOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getFileLength(I)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayVideoOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1, v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object p1

    return-object p1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayVideoOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    return-object p1
.end method

.method public getItemViewType(I)I
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumType()Lcom/miui/gallery/model/Album$AlbumType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/model/Album$AlbumType;->OTHER_ALBUMS:Lcom/miui/gallery/model/Album$AlbumType;

    if-ne v0, v1, :cond_0

    const/4 p1, 0x3

    return p1

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItemId(I)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isFaceAlbum(J)Z

    move-result p1

    if-eqz p1, :cond_1

    const/4 p1, 0x2

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method public getTopDividerType(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected initDisplayImageOptions()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->initDisplayImageOptions()V

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const v1, 0x7f0700d8

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayVideoOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayVideoOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayVideoOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-direct {v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDefaultDisplayImageOptions:Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayFaceOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    return-void
.end method

.method public isAutoUploadedAlbum(I)Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->sIsGalleryCloudSyncable:Z

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isAutoUploadedAlbum(I)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public isAutoUploadedAlbum(JLjava/lang/String;J)Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->sIsGalleryCloudSyncable:Z

    if-eqz v0, :cond_0

    invoke-super/range {p0 .. p5}, Lcom/miui/gallery/adapter/BaseAlbumListAdapter;->isAutoUploadedAlbum(JLjava/lang/String;J)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;I)V
    .locals 10

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItem(I)Lcom/miui/gallery/model/Album;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->getItemViewType()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    packed-switch v1, :pswitch_data_0

    goto/16 :goto_6

    :pswitch_0
    iget-object p1, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/ui/AlbumPageListLocalItem;

    iget-object p2, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/ui/AlbumPageListLocalItem;->bindAlbumNameDesc(Landroid/content/Context;Lcom/miui/gallery/model/Album;)V

    goto/16 :goto_6

    :pswitch_1
    iget-object p1, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/ui/AlbumPageListFaceItem;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result v1

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->isPlaceholder()Z

    move-result v4

    invoke-virtual {p1, p2, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->bindCommonInfo(Ljava/lang/String;IZ)V

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getPeopleFaceCover()Landroid/os/Bundle;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mDisplayFaceOptionsBuilder:Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    invoke-virtual {p1, p2, v1}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->bindImageAndAlbumCount(Landroid/os/Bundle;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)V

    sget-object p2, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SYSTEM:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    iget-object v1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    const v4, 0x7f100057

    invoke-virtual {v1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, p2, v1}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->shouldShowForceTop(Lcom/miui/gallery/model/Album;)Z

    move-result p2

    if-eqz p2, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isForceTypeTime(Lcom/miui/gallery/model/Album;)Z

    move-result p2

    if-eqz p2, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/AlbumPageListFaceItem;->bindForceTopIcon(Z)V

    goto/16 :goto_6

    :pswitch_2
    iget-object p1, p1, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Lcom/miui/gallery/ui/AlbumPageListNormalItem;

    if-eqz p2, :cond_3

    add-int/lit8 v1, p2, -0x1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getBottomDividerType(I)I

    move-result v1

    if-ne v1, v3, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x0

    goto :goto_1

    :cond_3
    :goto_0
    const/4 v1, 0x1

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getItemCount()I

    move-result v4

    sub-int/2addr v4, v3

    if-eq p2, v4, :cond_5

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getBottomDividerType(I)I

    move-result v4

    if-ne v4, v3, :cond_4

    goto :goto_2

    :cond_4
    const/4 v4, 0x0

    goto :goto_3

    :cond_5
    :goto_2
    const/4 v4, 0x1

    :goto_3
    invoke-virtual {p1, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->adjustAlbumCoverContainerPadding(ZZ)V

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getLocalizedAlbumName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getCount()I

    move-result v4

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->isPlaceholder()Z

    move-result v5

    invoke-virtual {p1, v1, v4, v5}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindCommonInfo(Ljava/lang/String;IZ)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getLocalPath(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getDownloadUri(I)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isVideoAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v5

    if-eqz v5, :cond_6

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getDisplayVideoOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    goto :goto_4

    :cond_6
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getDisplayImageOptions(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    move-result-object v5

    :goto_4
    invoke-virtual {p1, v1, v4, v5}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindImage(Ljava/lang/String;Landroid/net/Uri;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isOtherShareAlbum(J)Z

    move-result v1

    const/4 v4, 0x0

    if-eqz v1, :cond_9

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getShareAlbumInfo(I)Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;

    move-result-object v1

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_8

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isBabyAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v4

    if-eqz v4, :cond_7

    sget-object v4, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SHARE:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    iget-object v5, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    const v6, 0x7f10003e

    new-array v7, v3, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v2

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v4, v1}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto/16 :goto_5

    :cond_7
    sget-object v4, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SHARE:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    iget-object v5, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    const v6, 0x7f10003f

    new-array v7, v3, [Ljava/lang/Object;

    invoke-virtual {v1}, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->getOwnerName()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v7, v2

    invoke-virtual {v5, v6, v7}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v4, v1}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto :goto_5

    :cond_8
    sget-object v1, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SHARE:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    invoke-virtual {p1, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto :goto_5

    :cond_9
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isBabyAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_a

    sget-object v1, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->BABY:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    iget-object v4, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    const v5, 0x7f100055

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto :goto_5

    :cond_a
    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v5

    invoke-virtual {p0, v5, v6}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isOwnerShareAlbum(J)Z

    move-result v1

    if-eqz v1, :cond_b

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->getShareAlbumInfo(I)Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;

    move-result-object v1

    if-eqz v1, :cond_d

    sget-object v4, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->OWNER:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    iget-object v5, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0e0007

    iget v7, v1, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mUserCount:I

    new-array v8, v3, [Ljava/lang/Object;

    iget v1, v1, Lcom/miui/gallery/model/AlbumConstants$ShareAlbum;->mUserCount:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v8, v2

    invoke-virtual {v5, v6, v7, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v4, v1}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto :goto_5

    :cond_b
    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isSystemAlbum(I)Z

    move-result v1

    if-eqz v1, :cond_c

    sget-object v1, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->SYSTEM:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    invoke-virtual {p1, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    goto :goto_5

    :cond_c
    sget-object v1, Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;->NORMAL:Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;

    invoke-virtual {p1, v1, v4}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindType(Lcom/miui/gallery/ui/AlbumPageListItemBase$AlbumType;Ljava/lang/String;)V

    :cond_d
    :goto_5
    invoke-static {v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isRecentAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v5

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isVideoAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v6

    invoke-static {v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isFavoritesAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v7

    invoke-static {v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isAutoUploadedAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result v8

    iget-boolean v9, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mIsInPickMode:Z

    move-object v4, p1

    invoke-virtual/range {v4 .. v9}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindIndicator(ZZZZZ)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->shouldShowForceTop(Lcom/miui/gallery/model/Album;)Z

    move-result v1

    if-eqz v1, :cond_e

    invoke-virtual {p0, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isForceTypeTime(Lcom/miui/gallery/model/Album;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v2, 0x1

    :cond_e
    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindForceTopIcon(Z)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isHiddenAlbum(I)Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/ui/AlbumPageListNormalItem;->bindHiddenMask(Z)V

    :goto_6
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
    .locals 0

    packed-switch p2, :pswitch_data_0

    const/4 p1, 0x0

    goto :goto_0

    :pswitch_0
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;->newInstance(Landroid/view/ViewGroup;)Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumOthersItemViewHolder;

    move-result-object p1

    goto :goto_0

    :pswitch_1
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumFaceItemViewHolder;->newInstance(Landroid/view/ViewGroup;)Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumFaceItemViewHolder;

    move-result-object p1

    goto :goto_0

    :pswitch_2
    invoke-static {p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumNormalItemViewHolder;->newInstance(Landroid/view/ViewGroup;)Lcom/miui/gallery/adapter/AlbumAdapterBase$AlbumNormalItemViewHolder;

    move-result-object p1

    :goto_0
    return-object p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setInPickMode(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mIsInPickMode:Z

    return-void
.end method

.method protected shouldShowForceTop(Lcom/miui/gallery/model/Album;)Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mIsInPickMode:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->isOtherAlbum(Lcom/miui/gallery/model/Album;)Z

    move-result p1

    if-nez p1, :cond_0

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

.method public updateGalleryCloudSyncableState()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    sget-boolean v1, Lcom/miui/gallery/adapter/AlbumAdapterBase;->sIsGalleryCloudSyncable:Z

    if-eq v1, v0, :cond_0

    sput-boolean v0, Lcom/miui/gallery/adapter/AlbumAdapterBase;->sIsGalleryCloudSyncable:Z

    invoke-virtual {p0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
