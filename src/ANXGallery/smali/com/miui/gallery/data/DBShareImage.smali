.class public Lcom/miui/gallery/data/DBShareImage;
.super Lcom/miui/gallery/data/DBImage;
.source "DBShareImage.java"


# instance fields
.field private mShareId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/data/DBImage;-><init>(Landroid/database/Cursor;)V

    return-void
.end method


# virtual methods
.method public getAlbumId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getShareAlbumId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getBaseUri()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_IMAGE_URI:Landroid/net/Uri;

    return-object v0
.end method

.method public getRequestId()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getShareId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShareId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBShareImage;->mShareId:Ljava/lang/String;

    return-object v0
.end method

.method public getTagId()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DBShareImage"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isShareItem()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public isUbiFocus()Z
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiSubImageCount:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reloadData(Landroid/database/Cursor;)Z
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/data/DBImage;->reloadData(Landroid/database/Cursor;)Z

    move-result v0

    new-instance v1, Lcom/miui/gallery/util/UpdateHelper;

    invoke-direct {v1}, Lcom/miui/gallery/util/UpdateHelper;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mCreatorId:Ljava/lang/String;

    const/16 v3, 0x2d

    invoke-static {p1, v3}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mCreatorId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mShareId:Ljava/lang/String;

    const/16 v3, 0x2e

    invoke-static {p1, v3}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mShareId:Ljava/lang/String;

    iget-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mDownloadFileAddTime:J

    const/16 v4, 0x30

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mDownloadFileAddTime:J

    iget-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mMixedDateTime:J

    const/16 v4, 0x31

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mMixedDateTime:J

    iget v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiSubImageCount:I

    const/16 v3, 0x32

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiSubImageCount:I

    iget v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiFocusIndex:I

    const/16 v3, 0x33

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiFocusIndex:I

    iget v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiSubIndex:I

    const/16 v3, 0x34

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareImage;->mUbiSubIndex:I

    iget v2, p0, Lcom/miui/gallery/data/DBShareImage;->mLables:I

    const/16 v3, 0x38

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/data/DBShareImage;->mLables:I

    iget-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mEditedColumns:Ljava/lang/String;

    const/16 v3, 0x35

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mEditedColumns:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mFromLocalGroupId:Ljava/lang/String;

    const/16 v3, 0x36

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mFromLocalGroupId:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mSecretKey:[B

    const/16 v3, 0x37

    invoke-interface {p1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/util/UpdateHelper;->update([B[B)[B

    move-result-object v2

    if-eqz v2, :cond_0

    iput-object v2, p0, Lcom/miui/gallery/data/DBShareImage;->mSecretKey:[B

    :cond_0
    iget-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mSpecialTypeFlags:J

    const/16 v4, 0x3c

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-virtual {v1, v2, v3, v4, v5}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/miui/gallery/data/DBShareImage;->mSpecialTypeFlags:J

    if-nez v0, :cond_2

    invoke-virtual {v1}, Lcom/miui/gallery/util/UpdateHelper;->isUpdated()Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public setRequestAlbumId(Ljava/lang/String;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/DBShareImage;->setShareAlbumId(Ljava/lang/String;)V

    return-void
.end method

.method public setShareId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBShareImage;->mShareId:Ljava/lang/String;

    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 3

    invoke-super {p0}, Lcom/miui/gallery/data/DBImage;->toJSONObject()Lorg/json/JSONObject;

    move-result-object v0

    if-nez v0, :cond_0

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getCreatorId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "creatorId"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getCreatorId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getShareId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "shareId"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBShareImage;->getShareId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v1, "DBCloud"

    const-string v2, "toJSONObject: get JSON error"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_0
    return-object v0
.end method
