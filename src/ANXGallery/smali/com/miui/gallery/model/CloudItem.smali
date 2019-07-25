.class public Lcom/miui/gallery/model/CloudItem;
.super Lcom/miui/gallery/model/BaseDataItem;
.source "CloudItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;
    }
.end annotation


# static fields
.field private static final DETAIL_INFO_PROJECTION:[Ljava/lang/String;


# instance fields
.field private transient mAddToFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

.field private mCreatorId:Ljava/lang/String;

.field private mHasFace:Z

.field private mId:J

.field private mIsFavorite:I

.field private mIsShareItem:Z

.field private mIsSynced:Z

.field private mOrientation:I

.field private transient mRemoveFromFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

.field private mServerId:Ljava/lang/String;

.field private mSha1:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const-string v0, "fileName"

    const-string v1, "exifModel"

    const-string v2, "exifMake"

    const-string v3, "exifFNumber"

    const-string v4, "exifFocalLength"

    const-string v5, "exifISOSpeedRatings"

    const-string v6, "exifExposureTime"

    const-string v7, "exifFlash"

    const-string v8, "exifOrientation"

    filled-new-array/range {v0 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/model/CloudItem;->DETAIL_INFO_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/model/BaseDataItem;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/model/CloudItem;->mOrientation:I

    return-void
.end method

.method private canDelete()Z
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->isOwner()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isMine()Z

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

.method private isCreatorEqualsCurrentAccount()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/model/CloudItem;->mCreatorId:Ljava/lang/String;

    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method private isCreatorFromAlbumOwner()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mCreatorId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsSynced:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private isOwner()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method private needDownloadOrigin()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isBurstItem()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getBurstGroup()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/model/BaseDataItem;

    invoke-virtual {v1}, Lcom/miui/gallery/model/BaseDataItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_1
    const/4 v0, 0x0

    return v0

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method


# virtual methods
.method public checkOriginalFileExist()Z
    .locals 5

    invoke-super {p0}, Lcom/miui/gallery/model/BaseDataItem;->checkOriginalFileExist()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getSize()J

    move-result-wide v2

    cmp-long v4, v0, v2

    if-ltz v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;
    .locals 11

    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->getDetailInfo(Landroid/content/Context;)Lcom/miui/gallery/model/PhotoDetailInfo;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    const/4 v1, 0x0

    :cond_0
    const/16 v3, 0xc8

    if-nez v2, :cond_3

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isVideo()Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isGif()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_3

    invoke-virtual {v0, v3, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v2, 0x2

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v2, 0x3

    new-instance v4, Ljava/io/File;

    invoke-direct {v4, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :try_start_0
    invoke-static {v1}, Lmiui/graphics/BitmapFactory;->getBitmapSize(Ljava/lang/String;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v1

    const/4 v2, 0x4

    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    const/4 v2, 0x5

    iget v1, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :cond_2
    :goto_0
    invoke-virtual {v0, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->removeDetail(I)V

    const/16 v1, 0x8

    const v2, 0x7f1006ea

    invoke-virtual {p1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/model/PhotoDetailInfo;->addDetail(ILjava/lang/Object;)V

    :cond_3
    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isSecret()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-virtual {v0, v3}, Lcom/miui/gallery/model/PhotoDetailInfo;->removeDetail(I)V

    :cond_4
    new-instance v10, Lcom/miui/gallery/model/CloudItem$1;

    invoke-direct {v10, p0, v0}, Lcom/miui/gallery/model/CloudItem$1;-><init>(Lcom/miui/gallery/model/CloudItem;Lcom/miui/gallery/model/PhotoDetailInfo;)V

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v0

    if-eqz v0, :cond_5

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$ShareImage;->SHARE_URI:Landroid/net/Uri;

    :goto_2
    move-object v5, v0

    goto :goto_3

    :cond_5
    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    goto :goto_2

    :goto_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/provider/ShareMediaManager;->getOriginalMediaId(J)J

    move-result-wide v0

    goto :goto_4

    :cond_6
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v0

    :goto_4
    sget-object v6, Lcom/miui/gallery/model/CloudItem;->DETAIL_INFO_PROJECTION:[Ljava/lang/String;

    const-string v7, "_id=?"

    const/4 v2, 0x1

    new-array v8, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v8, v2

    const/4 v9, 0x0

    move-object v4, p1

    invoke-static/range {v4 .. v10}, Lcom/miui/gallery/util/SafeDBUtil;->safeQuery(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/SafeDBUtil$QueryHandler;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/model/PhotoDetailInfo;

    return-object p1
.end method

.method public getDownloadUri()Landroid/net/Uri;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getId()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/util/uil/CloudUriAdapter;->getDownloadUri(J)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public getFavoriteInfo(Z)Lcom/miui/gallery/model/FavoriteInfo;
    .locals 3

    new-instance p1, Lcom/miui/gallery/model/FavoriteInfo;

    invoke-direct {p1}, Lcom/miui/gallery/model/FavoriteInfo;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isSecret()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1, v0}, Lcom/miui/gallery/model/FavoriteInfo;->setFavoriteUsable(Z)V

    iget v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsFavorite:I

    if-lez v0, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {p1, v1}, Lcom/miui/gallery/model/FavoriteInfo;->setFavorite(Z)V

    return-object p1
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/model/CloudItem;->mId:J

    return-wide v0
.end method

.method public getMicroPath()Ljava/lang/String;
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mSha1:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/model/BaseDataItem;->getMicroPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getOrientation()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/model/CloudItem;->mOrientation:I

    return v0
.end method

.method public getServerId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mServerId:Ljava/lang/String;

    return-object v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public hasFace()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mHasFace:Z

    return v0
.end method

.method public initSupportOperations()I
    .locals 7

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getPathDisplayBetter()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isVideo()Z

    move-result v1

    const/high16 v6, 0x100000

    if-eqz v1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getVideoSupportedOperations(Ljava/lang/String;)I

    move-result v0

    or-int/2addr v0, v6

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/model/CloudItem;->mMimeType:Ljava/lang/String;

    iget-wide v2, p0, Lcom/miui/gallery/model/CloudItem;->mLatitude:D

    iget-wide v4, p0, Lcom/miui/gallery/model/CloudItem;->mLongitude:D

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/util/PhotoOperationsUtil;->getImageSupportedOperations(Ljava/lang/String;Ljava/lang/String;DD)I

    move-result v0

    or-int/2addr v0, v6

    :goto_0
    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isGif()Z

    move-result v1

    if-nez v1, :cond_1

    or-int/lit16 v0, v0, 0x200

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->needDownloadOrigin()Z

    move-result v1

    if-eqz v1, :cond_2

    or-int/lit16 v0, v0, 0x100

    goto :goto_1

    :cond_2
    and-int/lit16 v0, v0, -0x101

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v1

    const v2, -0x1000001

    const v3, -0x800001

    if-eqz v1, :cond_3

    and-int/2addr v0, v3

    and-int/2addr v0, v2

    and-int/lit16 v0, v0, -0x201

    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->canDelete()Z

    move-result v1

    if-nez v1, :cond_8

    and-int/lit8 v0, v0, -0x2

    goto :goto_2

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isSecret()Z

    move-result v1

    if-eqz v1, :cond_5

    and-int/2addr v0, v3

    const v1, -0x100001

    and-int/2addr v0, v1

    and-int/lit8 v0, v0, -0x21

    and-int/lit16 v0, v0, -0x801

    and-int/lit16 v0, v0, -0x1001

    const v1, -0x400001

    and-int/2addr v0, v1

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isVideo()Z

    move-result v1

    if-eqz v1, :cond_4

    and-int/lit16 v0, v0, -0x201

    :cond_4
    const/high16 v1, 0x1000000

    or-int/2addr v0, v1

    goto :goto_2

    :cond_5
    and-int/2addr v0, v2

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isVideo()Z

    move-result v1

    const/high16 v2, 0x800000

    if-eqz v1, :cond_6

    invoke-static {}, Lcom/miui/gallery/Config$SecretAlbumConfig;->isVideoSupported()Z

    move-result v1

    if-eqz v1, :cond_8

    or-int/2addr v0, v2

    goto :goto_2

    :cond_6
    or-int/2addr v0, v2

    goto :goto_2

    :cond_7
    and-int/2addr v0, v3

    :cond_8
    :goto_2
    return v0
.end method

.method public isEverSynced()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mServerId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public isMine()Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isShare()Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->isCreatorEqualsCurrentAccount()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsSynced:Z

    if-nez v0, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->isCreatorFromAlbumOwner()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->isCreatorEqualsCurrentAccount()Z

    move-result v0

    if-nez v0, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsSynced:Z

    if-nez v0, :cond_4

    :cond_3
    const/4 v1, 0x1

    :cond_4
    return v1
.end method

.method public isSecret()Z
    .locals 5

    invoke-super {p0}, Lcom/miui/gallery/model/BaseDataItem;->isSecret()Z

    move-result v0

    if-nez v0, :cond_1

    iget-wide v0, p0, Lcom/miui/gallery/model/CloudItem;->mLocalGroupId:J

    const-wide/16 v2, -0x3e8

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

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

.method public isShare()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsShareItem:Z

    return v0
.end method

.method public isSynced()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/model/CloudItem;->mIsSynced:Z

    return v0
.end method

.method protected onLoadCache()V
    .locals 6

    invoke-super {p0}, Lcom/miui/gallery/model/BaseDataItem;->onLoadCache()V

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getOriginalPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->isEverSynced()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getSize()J

    move-result-wide v3

    cmp-long v5, v0, v3

    if-gez v5, :cond_0

    invoke-virtual {p0, v2}, Lcom/miui/gallery/model/CloudItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/model/CloudItem;->getThumnailPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/model/CloudItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    :cond_1
    return-void
.end method

.method public setCreatorId(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/CloudItem;->mCreatorId:Ljava/lang/String;

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    invoke-direct {p0}, Lcom/miui/gallery/model/CloudItem;->needDownloadOrigin()Z

    move-result p1

    if-nez p1, :cond_0

    const/16 p1, 0x100

    invoke-virtual {p0, p1}, Lcom/miui/gallery/model/CloudItem;->removeSupportOperation(I)V

    :cond_0
    return-object p0
.end method

.method public setHasFace(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/CloudItem;->mHasFace:Z

    return-void
.end method

.method public setId(J)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/model/CloudItem;->mId:J

    return-object p0
.end method

.method public setIsFavorite(I)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/CloudItem;->mIsFavorite:I

    return-object p0
.end method

.method public bridge synthetic setOrientation(I)Lcom/miui/gallery/model/BaseDataItem;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/model/CloudItem;->setOrientation(I)Lcom/miui/gallery/model/CloudItem;

    move-result-object p1

    return-object p1
.end method

.method public setOrientation(I)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput p1, p0, Lcom/miui/gallery/model/CloudItem;->mOrientation:I

    return-object p0
.end method

.method public setServerId(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/CloudItem;->mServerId:Ljava/lang/String;

    return-object p0
.end method

.method public setSha1(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/model/CloudItem;->mSha1:Ljava/lang/String;

    return-object p0
.end method

.method public setShare(Z)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/CloudItem;->mIsShareItem:Z

    return-object p0
.end method

.method public setSynced(Z)Lcom/miui/gallery/model/CloudItem;
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/model/CloudItem;->mIsSynced:Z

    return-object p0
.end method

.method public wrapAddToFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mAddToFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mAddToFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    invoke-static {v0}, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;->access$000(Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    const/4 v1, 0x1

    invoke-direct {v0, p1, p0, v1}, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;-><init>(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Lcom/miui/gallery/model/CloudItem;I)V

    iput-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mAddToFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/model/CloudItem;->mAddToFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    return-object p1
.end method

.method public wrapRemoveFromFavoritesListener(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;)Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mRemoveFromFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mRemoveFromFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    invoke-static {v0}, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;->access$000(Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;)Ljava/lang/ref/WeakReference;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    new-instance v0, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    const/4 v1, 0x2

    invoke-direct {v0, p1, p0, v1}, Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;-><init>(Lcom/miui/gallery/util/MediaAndAlbumOperations$OnCompleteListener;Lcom/miui/gallery/model/CloudItem;I)V

    iput-object v0, p0, Lcom/miui/gallery/model/CloudItem;->mRemoveFromFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/model/CloudItem;->mRemoveFromFavoritesListener:Lcom/miui/gallery/model/CloudItem$OnCompleteListenerWrapper;

    return-object p1
.end method
