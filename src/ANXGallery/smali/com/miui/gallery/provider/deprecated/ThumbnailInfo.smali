.class public Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;
.super Ljava/lang/Object;
.source "ThumbnailInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;
    }
.end annotation


# instance fields
.field private mBgImageId:Ljava/lang/String;

.field private mBgImageLocalId:J

.field private mBgUrl:Ljava/lang/String;

.field private mCoverImageId:Ljava/lang/String;

.field private mCoverUrl:Ljava/lang/String;

.field private mFaceId:Ljava/lang/String;

.field private mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

.field private mFaceRegion:Landroid/graphics/RectF;

.field private mFaceUrl:Ljava/lang/String;

.field private final mGroupLocalId:J

.field private final mIsSharerAlbum:Z

.field private mLastTimeRequest:J


# direct methods
.method public constructor <init>(JZLjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    iput-wide p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mGroupLocalId:J

    iput-boolean p3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    invoke-direct {p0, p4}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->initBy(Ljava/lang/String;)V

    return-void
.end method

.method public static getFaceByFaceId(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/provider/FaceManager;->queryCoverImageOfOneFace(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getItemCursor(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 7

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getLimitUri(Landroid/net/Uri;I)Landroid/net/Uri;

    move-result-object v2

    const-string p0, "*"

    filled-new-array {p0}, [Ljava/lang/String;

    move-result-object v3

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "=?"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-array v5, v0, [Ljava/lang/String;

    const/4 p0, 0x0

    aput-object p2, v5, p0

    const/4 v6, 0x0

    invoke-virtual/range {v1 .. v6}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    return-object p0
.end method

.method private getThumbnailInfoFromServer()V
    .locals 11

    iget-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mGroupLocalId:J

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    iget-boolean v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils;->getDBShareAlbumByLocalId(Ljava/lang/String;)Lcom/miui/gallery/data/DBShareAlbum;

    move-result-object v0

    if-nez v0, :cond_0

    :goto_0
    move-object v0, v2

    goto :goto_1

    :cond_0
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBShareAlbum;->getAlbumId()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_1
    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "_id"

    invoke-static {v1, v3, v4, v0}, Lcom/miui/gallery/cloud/CloudUtils;->getItem(Landroid/net/Uri;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/data/DBImage;

    move-result-object v0

    if-nez v0, :cond_2

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    return-void

    :cond_3
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v1

    if-nez v1, :cond_4

    const-string v0, "ThumbnailInfo"

    const-string v1, "cta not allowed"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_4
    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccountInfo()Lcom/miui/gallery/cloud/AccountCache$AccountInfo;

    move-result-object v1

    if-nez v1, :cond_5

    const-string v0, "ThumbnailInfo"

    const-string v1, "accountInfo is null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    :cond_5
    iget-boolean v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    invoke-static {v3}, Lcom/miui/gallery/cloud/CloudGroupUrlProvider;->getUrlProvider(Z)Lcom/miui/gallery/cloud/CloudGroupUrlProvider;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->getAccountName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v0}, Lcom/miui/gallery/cloud/CloudGroupUrlProvider;->getThumbnailInfoUrl(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    :try_start_0
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Lorg/apache/http/message/BasicNameValuePair;

    const-string v4, "sharedAlbumId"

    invoke-direct {v3, v4, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v7, v1, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mAccount:Landroid/accounts/Account;

    iget-object v8, v1, Lcom/miui/gallery/cloud/AccountCache$AccountInfo;->mToken:Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v5 .. v10}, Lcom/miui/gallery/cloud/CloudUtils;->getFromXiaomi(Ljava/lang/String;Ljava/util/List;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;IZ)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "ThumbnailInfo"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "get thumbnail info from server: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static {v0}, Lcom/miui/gallery/cloud/CheckResult;->parseErrorCode(Lorg/json/JSONObject;)I

    move-result v1

    if-nez v1, :cond_9

    const-string v1, "data"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mGroupLocalId:J

    iget-boolean v5, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v3, v4, v5, v0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;-><init>(JZLjava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, v1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, v1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    iget-object v0, v1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    :cond_7
    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v5, -0x1

    cmp-long v0, v3, v5

    if-nez v0, :cond_8

    iget-object v0, v1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    iput-object v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    :cond_8
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mLastTimeRequest:J

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->saveToDB()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_9
    :goto_2
    return-void
.end method

.method private initBy(Ljava/lang/String;)V
    .locals 5

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "coverImageId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    const-string v1, "backgroundImageId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    const-string v1, "backgroundImageLocalId"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-string v1, "faceId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    const-string v1, "coverUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    const-string v1, "faceUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    const-string v1, "backgroundUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    const-string v1, "faceInfo"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "faceExif"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const/4 v3, -0x1

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    const-string v4, "orientation"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    :goto_0
    const-string v1, "faceOrientation"

    invoke-virtual {v2, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-static {v1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->from(Ljava/lang/String;)Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    const-string v1, "lastTimeRequest"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mLastTimeRequest:J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "ThumbnailInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fail to parse ThumbnailInfo from "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1
    return-void
.end method

.method private putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1, p2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_0
    return-void
.end method

.method private saveToDB()V
    .locals 9

    iget-boolean v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    const-string v0, "thumbnailInfo"

    iget-boolean v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    const-string v1, "_id"

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->userChanged()Z

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    if-eqz v2, :cond_0

    const-string v2, "shareAlbum"

    goto :goto_0

    :cond_0
    const-string v2, "cloud"

    :goto_0
    iget-boolean v5, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    if-eqz v5, :cond_1

    const/16 v5, 0x1d

    goto :goto_1

    :cond_1
    const/16 v5, 0x42

    :goto_1
    invoke-static {v5}, Lcom/miui/gallery/cloud/GalleryCloudUtils;->transformToEditedColumnsElement(I)Ljava/lang/String;

    move-result-object v5

    iget-boolean v6, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    const-string v6, "editedColumns"

    const-string v7, "update %s set %s=%s, %s=coalesce(replace(%s, \'%s\', \'\') || \'%s\', \'%s\') where %s=%d"

    const/16 v8, 0xa

    new-array v8, v8, [Ljava/lang/Object;

    aput-object v2, v8, v3

    aput-object v0, v8, v4

    const/4 v0, 0x2

    invoke-virtual {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/database/DatabaseUtils;->sqlEscapeString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v8, v0

    const/4 v0, 0x3

    aput-object v6, v8, v0

    const/4 v0, 0x4

    aput-object v6, v8, v0

    const/4 v0, 0x5

    aput-object v5, v8, v0

    const/4 v0, 0x6

    aput-object v5, v8, v0

    const/4 v0, 0x7

    aput-object v5, v8, v0

    const/16 v0, 0x8

    aput-object v1, v8, v0

    const/16 v0, 0x9

    iget-wide v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mGroupLocalId:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v8, v0

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/GalleryUtils;->safeExec(Ljava/lang/String;)Z

    goto :goto_3

    :cond_2
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v0, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mIsSharerAlbum:Z

    if-eqz v0, :cond_3

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->SHARE_ALBUM_URI:Landroid/net/Uri;

    goto :goto_2

    :cond_3
    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    :goto_2
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%s=?"

    new-array v7, v4, [Ljava/lang/Object;

    aput-object v1, v7, v3

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    new-array v5, v4, [Ljava/lang/String;

    iget-wide v6, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mGroupLocalId:J

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v0, v2, v1, v5}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    :goto_3
    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v4}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    return-void
.end method

.method private thumbnailInfoTimeout()Z
    .locals 5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mLastTimeRequest:J

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    cmp-long v4, v0, v2

    if-lez v4, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private userChanged()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

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
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    iget-wide v5, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    iget-object p1, p1, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    invoke-static {v1, p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->equals(Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public getBgPath()Ljava/lang/String;
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v0, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const-string v1, "serverId"

    iget-object v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->getItemId(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v0

    :cond_0
    const/4 v2, 0x0

    :try_start_0
    sget-object v3, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const-string v4, "_id"

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v4, v0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getItemCursor(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_2

    :try_start_1
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getItemPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_1
    return-object v1

    :catchall_0
    move-exception v1

    move-object v2, v0

    goto :goto_0

    :cond_2
    if-eqz v0, :cond_3

    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    :cond_3
    const-string v0, ""

    return-object v0

    :catchall_1
    move-exception v1

    :goto_0
    if-eqz v2, :cond_4

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    :cond_4
    throw v1
.end method

.method public getFaceInfo(Z)Ljava/lang/String;
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez p1, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    new-array v3, v2, [Landroid/graphics/RectF;

    iget-object v4, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v4, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getFaceByFaceId(Ljava/lang/String;[Landroid/graphics/RectF;)Ljava/lang/String;

    move-result-object v4

    aget-object v3, v3, v1

    iput-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceRegion:Landroid/graphics/RectF;

    goto :goto_0

    :cond_0
    move-object v4, v0

    :goto_0
    if-nez v4, :cond_6

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz p1, :cond_2

    if-nez v3, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->thumbnailInfoTimeout()Z

    move-result p1

    if-eqz p1, :cond_3

    :cond_1
    :goto_1
    const/4 v1, 0x1

    goto :goto_2

    :cond_2
    if-eqz v3, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->thumbnailInfoTimeout()Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    :goto_2
    if-eqz v1, :cond_4

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getThumbnailInfoFromServer()V

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    return-object p1

    :cond_5
    return-object v0

    :cond_6
    return-object v4
.end method

.method public getFaceRegion()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceRegion:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getFaceRegionFromFaceInfo()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->getFacePosition()Landroid/graphics/RectF;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getItemPath(Landroid/database/Cursor;)Ljava/lang/String;
    .locals 2

    const-string v0, "localFile"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    return-object v0

    :cond_0
    const-string v0, "thumbnailFile"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    return-object v0

    :cond_1
    const-string v0, "microthumbfile"

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public setBgImage(J)Ljava/lang/String;
    .locals 6

    const-wide/16 v0, -0x3e9

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloud/GalleryCloudUtils;->CLOUD_URI:Landroid/net/Uri;

    const-string v2, "_id"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, v2, p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getItemCursor(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    if-eqz p1, :cond_5

    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-nez p2, :cond_0

    goto/16 :goto_1

    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    new-instance p2, Landroid/content/ContentValues;

    invoke-direct {p2}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "localFlag"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    const/4 v2, 0x6

    if-eqz v1, :cond_1

    const/4 v3, 0x5

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_1

    const-string v1, "ThumbnailInfo"

    const-string v2, "no server id, just insert as manual create"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "localFlag"

    const/4 v2, -0x2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_0

    :cond_1
    const-string v1, "ThumbnailInfo"

    const-string v3, "server id found, insert as copy from cloud"

    invoke-static {v1, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "localFlag"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    :goto_0
    const-string v1, "microthumbfile"

    const-string v2, "microthumbfile"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "thumbnailFile"

    const-string v2, "thumbnailFile"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localFile"

    const-string v2, "localFile"

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v1, "localGroupId"

    invoke-virtual {p2, v1, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "localImageId"

    const-string v1, "_id"

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p2, v0, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->getItemPath(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v0

    if-eqz p1, :cond_2

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    const-string v1, "cloud"

    invoke-virtual {p1, v1, p2}, Lcom/miui/gallery/provider/GalleryDBHelper;->insert(Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide p1

    const-string v1, "ThumbnailInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mediaId1 : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-lez v3, :cond_4

    iget-wide v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v3, -0x1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    iget-wide v1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    invoke-static {v1, v2}, Lcom/miui/gallery/cloud/CloudUtils;->deleteItemInHiddenAlbum(J)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "ThumbnailInfo"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "failed to delete old bg, old local id: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    iput-wide p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    invoke-direct {p0}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->saveToDB()V

    :cond_4
    return-object v0

    :cond_5
    :goto_1
    if-eqz p1, :cond_6

    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    :cond_6
    const-string p1, ""

    return-object p1
.end method

.method public setFaceId(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "coverImageId"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "backgroundImageId"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceId"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "coverUrl"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceUrl"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "backgroundUrl"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceInfo"

    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    if-nez v3, :cond_0

    move-object v3, v0

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo$FaceInfo;->toJSON()Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-eqz v6, :cond_1

    const-string v2, "backgroundImageLocalId"

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mBgImageLocalId:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_1
    iget-wide v2, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mLastTimeRequest:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_2

    const-string v2, "lastTimeRequest"

    iget-wide v3, p0, Lcom/miui/gallery/provider/deprecated/ThumbnailInfo;->mLastTimeRequest:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_2
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Lorg/json/JSONException;->printStackTrace()V

    return-object v0
.end method
