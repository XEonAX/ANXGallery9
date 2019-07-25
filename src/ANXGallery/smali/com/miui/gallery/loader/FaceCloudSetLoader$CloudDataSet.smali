.class Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;
.super Lcom/miui/gallery/model/BaseCloudDataSet;
.source "FaceCloudSetLoader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/loader/FaceCloudSetLoader;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CloudDataSet"
.end annotation


# direct methods
.method public constructor <init>(Landroid/database/Cursor;IIJLjava/lang/String;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/miui/gallery/model/BaseCloudDataSet;-><init>(Landroid/database/Cursor;IIJLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected bindItem(Lcom/miui/gallery/model/BaseDataItem;I)V
    .locals 7

    invoke-virtual {p0, p2}, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p2}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x0

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/model/BaseDataItem;->setKey(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setMicroPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x2

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setThumbPath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x3

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setFilePath(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x4

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setMimeType(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x5

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setCreateTime(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x6

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setLocation(Ljava/lang/String;)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v3, 0x7

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    invoke-virtual {p2, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setSize(J)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0x8

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setWidth(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0x9

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setHeight(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0xa

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setDuration(I)Lcom/miui/gallery/model/BaseDataItem;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0x10

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/miui/gallery/model/BaseDataItem;->setSecretKey([B)Lcom/miui/gallery/model/BaseDataItem;

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0xb

    invoke-interface {p2, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v3, 0xc

    invoke-interface {v1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v4, 0xd

    invoke-interface {v3, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v5, 0xe

    invoke-interface {v4, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {p2, v1}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v5

    invoke-virtual {p1, v5, v6}, Lcom/miui/gallery/model/BaseDataItem;->setLatitude(D)Lcom/miui/gallery/model/BaseDataItem;

    invoke-static {v3, v4}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v3

    invoke-virtual {p1, v3, v4}, Lcom/miui/gallery/model/BaseDataItem;->setLongitude(D)Lcom/miui/gallery/model/BaseDataItem;

    :cond_0
    check-cast p1, Lcom/miui/gallery/model/CloudItem;

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/model/CloudItem;->setId(J)Lcom/miui/gallery/model/CloudItem;

    move-result-object p2

    invoke-virtual {p2, v2}, Lcom/miui/gallery/model/CloudItem;->setSynced(Z)Lcom/miui/gallery/model/CloudItem;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0x11

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/model/CloudItem;->setSha1(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v1, 0xf

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/miui/gallery/model/CloudItem;->setLocalGroupId(J)Lcom/miui/gallery/model/BaseDataItem;

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v0, 0x12

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/CloudItem;->setServerId(Ljava/lang/String;)Lcom/miui/gallery/model/CloudItem;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    xor-int/2addr p2, v2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/CloudItem;->setHasFace(Z)V

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v0, 0x13

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/CloudItem;->setOrientation(I)Lcom/miui/gallery/model/CloudItem;

    iget-object p2, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/16 v0, 0x14

    invoke-interface {p2, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/model/CloudItem;->setIsFavorite(I)Lcom/miui/gallery/model/CloudItem;

    :cond_1
    return-void
.end method

.method protected foldBurst()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getItemKey(I)J
    .locals 2

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method protected getItemPath(I)Ljava/lang/String;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->isValidate(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    invoke-interface {v0, p1}, Landroid/database/Cursor;->moveToPosition(I)Z

    iget-object p1, p0, Lcom/miui/gallery/loader/FaceCloudSetLoader$CloudDataSet;->mCursor:Landroid/database/Cursor;

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method protected isAlbumRemovable()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
