.class public Lcom/miui/gallery/util/face/PeopleCursorHelper;
.super Ljava/lang/Object;
.source "PeopleCursorHelper.java"


# static fields
.field public static final PROJECTION:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 18

    const-string v0, "_id"

    const-string v1, "peopleName"

    const-string v2, "serverId"

    const-string v3, "photo_id"

    const-string v4, "sha1"

    const-string v5, "microthumbfile"

    const-string v6, "thumbnailFile"

    const-string v7, "localFile"

    const-string v8, "exifOrientation"

    const-string v9, "faceXScale"

    const-string v10, "faceYScale"

    const-string v11, "faceWScale"

    const-string v12, "faceHScale"

    const-string v13, "relationType"

    const-string v14, "relationText"

    const-string v15, "visibilityType"

    const-string v16, "faceCount"

    const-string v17, "size"

    filled-new-array/range {v0 .. v17}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public static add2MatrixCursor(Landroid/database/MatrixCursor;Landroid/database/Cursor;)V
    .locals 3

    sget-object v0, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    :goto_0
    sget-object v2, Lcom/miui/gallery/util/face/PeopleCursorHelper;->PROJECTION:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_0

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v0}, Landroid/database/MatrixCursor;->addRow([Ljava/lang/Object;)V

    return-void
.end method

.method public static getCoverId(Landroid/database/Cursor;)J
    .locals 2

    const/4 v0, 0x3

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getCoverSize(Landroid/database/Cursor;)J
    .locals 2

    const/16 v0, 0x11

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public static getFaceCount(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0x10

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getFaceRegionRectF(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/FaceRegionRectF;
    .locals 12

    if-nez p0, :cond_0

    new-instance p0, Lcom/miui/gallery/util/face/FaceRegionRectF;

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    return-object p0

    :cond_0
    new-instance v0, Lcom/miui/gallery/util/face/FaceRegionRectF;

    const/16 v1, 0x9

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v7

    const/16 v2, 0xa

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v8

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    const/16 v3, 0xb

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getFloat(I)F

    move-result v3

    add-float v9, v1, v3

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v1

    const/16 v2, 0xc

    invoke-interface {p0, v2}, Landroid/database/Cursor;->getFloat(I)F

    move-result v2

    add-float v10, v1, v2

    const/16 v1, 0x8

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    move-object v6, v0

    invoke-direct/range {v6 .. v11}, Lcom/miui/gallery/util/face/FaceRegionRectF;-><init>(FFFFI)V

    return-object v0
.end method

.method public static getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    :cond_0
    const/4 v0, 0x1

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getPeopleServerId(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x2

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRelationText(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 1

    const/16 v0, 0xe

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getRelationType(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0xd

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static getThumbnailDownloadType(Landroid/database/Cursor;)Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    const/4 v0, 0x6

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x7

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_0

    sget-object p0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    goto :goto_0

    :cond_0
    sget-object p0, Lcom/miui/gallery/sdk/download/DownloadType;->THUMBNAIL:Lcom/miui/gallery/sdk/download/DownloadType;

    :goto_0
    return-object p0
.end method

.method public static getThumbnailDownloadUri(Landroid/database/Cursor;)Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getCoverId(Landroid/database/Cursor;)J

    move-result-wide v1

    invoke-static {v0, v1, v2}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x6

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x7

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x5

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x4

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/StorageUtils;->getPriorMicroThumbnailPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method public static getVisibilityType(Landroid/database/Cursor;)I
    .locals 1

    const/16 v0, 0xf

    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result p0

    return p0
.end method

.method public static toPeople(Landroid/database/Cursor;)Lcom/miui/gallery/people/model/People;
    .locals 3

    new-instance v0, Lcom/miui/gallery/people/model/People;

    invoke-direct {v0}, Lcom/miui/gallery/people/model/People;-><init>()V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleLocalId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/people/model/People;->setId(J)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleServerId(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setServerId(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getPeopleName(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setName(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getCoverId(Landroid/database/Cursor;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/people/model/People;->setCoverImageId(J)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setCoverPath(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getThumbnailDownloadType(Landroid/database/Cursor;)Lcom/miui/gallery/sdk/download/DownloadType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setCoverType(Lcom/miui/gallery/sdk/download/DownloadType;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationType(Landroid/database/Cursor;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setRelationType(I)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getRelationText(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setRelationText(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getFaceRegionRectF(Landroid/database/Cursor;)Lcom/miui/gallery/util/face/FaceRegionRectF;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setCoverFaceRect(Landroid/graphics/RectF;)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getVisibilityType(Landroid/database/Cursor;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/people/model/People;->setVisibilityType(I)V

    invoke-static {p0}, Lcom/miui/gallery/util/face/PeopleCursorHelper;->getFaceCount(Landroid/database/Cursor;)I

    move-result p0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/people/model/People;->setFaceCount(I)V

    return-object v0
.end method
