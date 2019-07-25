.class public Lcom/miui/gallery/cloud/ThumbnailInfo;
.super Ljava/lang/Object;
.source "ThumbnailInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;
    }
.end annotation


# instance fields
.field private mBgImageId:Ljava/lang/String;

.field private mBgImageLocalId:J

.field private mBgUrl:Ljava/lang/String;

.field private mCoverImageId:Ljava/lang/String;

.field private mCoverUrl:Ljava/lang/String;

.field private mFaceId:Ljava/lang/String;

.field private mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

.field private mFaceUrl:Ljava/lang/String;

.field private final mGroupLocalId:I

.field private final mIsSharerAlbum:Z

.field private mLastTimeRequest:J


# direct methods
.method public constructor <init>(IZLjava/lang/String;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    iput p1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mGroupLocalId:I

    iput-boolean p2, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mIsSharerAlbum:Z

    invoke-direct {p0, p3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->initBy(Ljava/lang/String;)V

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

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    const-string v1, "backgroundImageId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    const-string v1, "backgroundImageLocalId"

    const-wide/16 v2, -0x1

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    const-string v1, "faceId"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    const-string v1, "coverUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    const-string v1, "faceUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    const-string v1, "backgroundUrl"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

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
    invoke-static {v1}, Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;->from(Ljava/lang/String;)Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    const-string v1, "lastTimeRequest"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mLastTimeRequest:J
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

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

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


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    instance-of v1, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    :cond_1
    check-cast p1, Lcom/miui/gallery/cloud/ThumbnailInfo;

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    iget-wide v5, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    iget-object p1, p1, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    invoke-static {v1, p1}, Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;->equals(Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method getBgImageLocalId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    return-wide v0
.end method

.method public getFaceId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    const/4 v0, 0x0

    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    const-string v2, "coverImageId"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverImageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "backgroundImageId"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceId"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceId:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "coverUrl"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mCoverUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceUrl"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "backgroundUrl"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgUrl:Ljava/lang/String;

    invoke-direct {p0, v1, v2, v3}, Lcom/miui/gallery/cloud/ThumbnailInfo;->putString(Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)V

    const-string v2, "faceInfo"

    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    if-nez v3, :cond_0

    move-object v3, v0

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mFaceInfo:Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/ThumbnailInfo$FaceInfo;->toJSON()Ljava/lang/String;

    move-result-object v3

    :goto_0
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    iget-wide v2, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    const-wide/16 v4, -0x1

    cmp-long v6, v2, v4

    if-eqz v6, :cond_1

    const-string v2, "backgroundImageLocalId"

    iget-wide v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mBgImageLocalId:J

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_1
    iget-wide v2, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mLastTimeRequest:J

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_2

    const-string v2, "lastTimeRequest"

    iget-wide v3, p0, Lcom/miui/gallery/cloud/ThumbnailInfo;->mLastTimeRequest:J

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
