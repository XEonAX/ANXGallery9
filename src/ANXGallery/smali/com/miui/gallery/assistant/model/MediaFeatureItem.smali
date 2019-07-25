.class public Lcom/miui/gallery/assistant/model/MediaFeatureItem;
.super Ljava/lang/Object;
.source "MediaFeatureItem.java"

# interfaces
.implements Lcom/miui/gallery/assistant/model/ImageFeatureItem;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/assistant/model/ImageFeatureItem;",
        "Ljava/lang/Comparable<",
        "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
        ">;"
    }
.end annotation


# static fields
.field public static final MEDIA_PROJECTION:[Ljava/lang/String;

.field public static final PROJECTION:[Ljava/lang/String;


# instance fields
.field private mDateTime:J

.field private mId:J

.field private transient mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

.field private mLocalFlag:I

.field private mMicroThumbnailPath:Ljava/lang/String;

.field private mOriginPath:Ljava/lang/String;

.field private mServerId:J

.field private mSha1:Ljava/lang/String;

.field private mThumbnailPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const-string v0, "_id"

    const-string v1, "sha1"

    const-string v2, "microthumbfile"

    const-string v3, "thumbnailFile"

    const-string v4, "localFile"

    const-string v5, "mixedDateTime"

    const-string v6, "localFlag"

    const-string v7, "serverId"

    filled-new-array/range {v0 .. v7}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->PROJECTION:[Ljava/lang/String;

    const-string v1, "_id"

    const-string v2, "sha1"

    const-string v3, "microthumbfile"

    const-string v4, "thumbnailFile"

    const-string v5, "localFile"

    const-string v6, "alias_create_time"

    const-string v7, "localFlag"

    const-string v8, "serverId"

    filled-new-array/range {v1 .. v8}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->MEDIA_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mId:J

    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mSha1:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mMicroThumbnailPath:Ljava/lang/String;

    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mThumbnailPath:Ljava/lang/String;

    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mOriginPath:Ljava/lang/String;

    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mDateTime:J

    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mLocalFlag:I

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mServerId:J

    :cond_0
    return-void
.end method

.method public static getMediaFeatureItemsFromCursor(Landroid/database/Cursor;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_1

    invoke-interface {p0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    new-instance v1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-direct {v1, p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;-><init>(Landroid/database/Cursor;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_1
    return-object v0
.end method


# virtual methods
.method public compareTo(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    if-eqz v0, :cond_0

    iget-object p1, p1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getScore()D

    move-result-wide v0

    iget-object p1, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/ImageFeature;->getScore()D

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Double;->compare(DD)I

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    check-cast p1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->compareTo(Lcom/miui/gallery/assistant/model/MediaFeatureItem;)I

    move-result p1

    return p1
.end method

.method public getDateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mDateTime:J

    return-wide v0
.end method

.method public getId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mId:J

    return-wide v0
.end method

.method public getImageFeature()Lcom/miui/gallery/assistant/model/ImageFeature;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    return-object v0
.end method

.method public getImagePath()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getOriginPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getMicroThumbnailPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getThumbnailPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getOriginPath()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method public getLocalFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mLocalFlag:I

    return v0
.end method

.method public getMediaId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mId:J

    return-wide v0
.end method

.method public getMediaSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getMicroThumbnailPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mMicroThumbnailPath:Ljava/lang/String;

    return-object v0
.end method

.method public getOriginPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mOriginPath:Ljava/lang/String;

    return-object v0
.end method

.method public getServerId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mServerId:J

    return-wide v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getThumbnailPath()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mThumbnailPath:Ljava/lang/String;

    return-object v0
.end method

.method public isSelectionFeatureDone()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/model/ImageFeature;->isSelectionFeatureDone()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setImageFeature(Lcom/miui/gallery/assistant/model/ImageFeature;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mImageFeature:Lcom/miui/gallery/assistant/model/ImageFeature;

    return-void
.end method

.method public setMicroThumbnailPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mMicroThumbnailPath:Ljava/lang/String;

    return-void
.end method

.method public setOriginPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mOriginPath:Ljava/lang/String;

    return-void
.end method

.method public setThumbnailPath(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->mThumbnailPath:Ljava/lang/String;

    return-void
.end method
