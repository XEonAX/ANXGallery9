.class public abstract Lcom/miui/gallery/data/DBImage;
.super Ljava/lang/Object;
.source "DBImage.java"

# interfaces
.implements Lcom/miui/gallery/data/DBItem;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/data/DBImage$ExifDataConst;,
        Lcom/miui/gallery/data/DBImage$SubUbiImage;
    }
.end annotation


# static fields
.field public static final sExifDataConst:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/data/DBImage$ExifDataConst;",
            ">;"
        }
    .end annotation
.end field

.field private static final sSecretKeyLock:Ljava/lang/Object;


# instance fields
.field protected mAppKey:Ljava/lang/String;

.field protected mAttributes:J

.field protected mBabyInfoJson:Ljava/lang/String;

.field protected mCreatorId:Ljava/lang/String;

.field private mDateModified:J

.field private mDatetaken:J

.field private mDescription:Ljava/lang/String;

.field private mDownloadFile:Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field protected mDownloadFileAddTime:J

.field private mDuration:I

.field protected mEditedColumns:Ljava/lang/String;

.field private mExifInfo:Lorg/json/JSONObject;

.field private mFileName:Ljava/lang/String;

.field protected mFromLocalGroupId:Ljava/lang/String;

.field protected mGeoInfo:Lorg/json/JSONObject;

.field private mGroupId:J

.field private mId:Ljava/lang/String;

.field protected mIsFavorite:Z

.field protected mLables:I

.field protected mLatitudeStr:Ljava/lang/String;

.field protected mLatitudeStrRef:Ljava/lang/String;

.field private mLocalFile:Ljava/lang/String;

.field private mLocalFlag:I

.field private mLocalGroupId:Ljava/lang/String;

.field private mLocalImageId:Ljava/lang/String;

.field protected mLongitudeStr:Ljava/lang/String;

.field protected mLongitudeStrRef:Ljava/lang/String;

.field private mMicroThumbFile:Ljava/lang/String;

.field private mMimeType:Ljava/lang/String;

.field protected mMixedDateTime:J

.field protected mPeopleFaceId:Ljava/lang/String;

.field protected mSecretKey:[B

.field private mServerId:Ljava/lang/String;

.field private mServerStatus:Ljava/lang/String;

.field private mServerTag:J

.field private mServerType:I

.field private mSha1:Ljava/lang/String;

.field private mShareAlbumId:Ljava/lang/String;

.field private mSize:J

.field protected mSpecialTypeFlags:J

.field private mThumbnailFile:Ljava/lang/String;

.field private mTitle:Ljava/lang/String;

.field protected mUbiFocusIndex:I

.field protected mUbiSubImageCount:I

.field protected mUbiSubIndex:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "imageWidth"

    const-string v3, "ImageWidth"

    const/4 v4, 0x0

    const/16 v5, 0xe

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "imageLength"

    const-string v3, "ImageLength"

    const/16 v5, 0xf

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "orientation"

    const-string v3, "Orientation"

    const/16 v5, 0x10

    invoke-direct {v1, v5, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSLatitude"

    const-string v3, "GPSLatitude"

    const/4 v5, 0x1

    const/16 v6, 0x11

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSLongitude"

    const-string v3, "GPSLongitude"

    const/16 v6, 0x12

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "make"

    const-string v3, "Make"

    const/16 v6, 0x13

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "model"

    const-string v3, "Model"

    const/16 v6, 0x14

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "flash"

    const-string v3, "Flash"

    const/16 v6, 0x15

    invoke-direct {v1, v6, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSLatitudeRef"

    const-string v3, "GPSLatitudeRef"

    const/16 v6, 0x16

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSLongitudeRef"

    const-string v3, "GPSLongitudeRef"

    const/16 v6, 0x17

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "exposureTime"

    const-string v3, "ExposureTime"

    const/16 v6, 0x18

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "FNumber"

    const-string v3, "FNumber"

    const/16 v6, 0x19

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "ISOSpeedRatings"

    const-string v3, "ISOSpeedRatings"

    const/16 v6, 0x1a

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSAltitude"

    const-string v3, "GPSAltitude"

    const/16 v6, 0x1b

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSAltitudeRef"

    const-string v3, "GPSAltitudeRef"

    const/16 v6, 0x1c

    invoke-direct {v1, v6, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSTimeStamp"

    const-string v3, "GPSTimeStamp"

    const/16 v6, 0x1d

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSDateStamp"

    const-string v3, "GPSDateStamp"

    const/16 v6, 0x1e

    invoke-direct {v1, v6, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "whiteBalance"

    const-string v3, "WhiteBalance"

    const/16 v6, 0x1f

    invoke-direct {v1, v6, v2, v3, v4}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "focalLength"

    const-string v3, "FocalLength"

    const/16 v4, 0x20

    invoke-direct {v1, v4, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "GPSProcessingMethod"

    const-string v3, "GPSProcessingMethod"

    const/16 v4, 0x21

    invoke-direct {v1, v4, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    new-instance v1, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    const-string v2, "dateTime"

    const-string v3, "DateTime"

    const/16 v4, 0x22

    invoke-direct {v1, v4, v2, v3, v5}, Lcom/miui/gallery/data/DBImage$ExifDataConst;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/data/DBImage;->sSecretKeyLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/DBImage;->mGeoInfo:Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/data/DBImage;->reloadData(Landroid/database/Cursor;)Z

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/data/DBImage;->mGeoInfo:Lorg/json/JSONObject;

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mServerId:Ljava/lang/String;

    return-void
.end method

.method private generateSecretKey()V
    .locals 9

    sget-object v0, Lcom/miui/gallery/data/DBImage;->sSecretKeyLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getBaseUri()Landroid/net/Uri;

    move-result-object v7

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "_id = \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    const-string v1, "secretKey"

    filled-new-array {v1}, [Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    new-instance v6, Lcom/miui/gallery/data/DBImage$1;

    invoke-direct {v6, p0}, Lcom/miui/gallery/data/DBImage$1;-><init>(Lcom/miui/gallery/data/DBImage;)V

    move-object v1, v7

    move-object v3, v8

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/util/GalleryUtils;->safeQuery(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/util/GalleryUtils$QueryHandler;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    if-nez v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/util/CryptoUtil;->generateRandomKey()[B

    move-result-object v1

    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    const-string v3, "secretKey"

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    const/4 v3, 0x0

    invoke-static {v7, v2, v8, v3}, Lcom/miui/gallery/util/GalleryUtils;->safeUpdate(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    const-string v2, "DBImage"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "generateSecretKey  secret key exists:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    :goto_0
    iput-object v1, p0, Lcom/miui/gallery/data/DBImage;->mSecretKey:[B

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public abstract getAlbumId()Ljava/lang/String;
.end method

.method public getAppKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mAppKey:Ljava/lang/String;

    return-object v0
.end method

.method public getAttributes()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mAttributes:J

    return-wide v0
.end method

.method public getBabyInfoJson()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mBabyInfoJson:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getBaseUri()Landroid/net/Uri;
.end method

.method protected getBasicValues(Lorg/json/JSONObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    const-string v0, "fileName"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "dateTaken"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getDatetaken()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "dateModified"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getDateModified()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/cloud/CloudUtils;->collectAlbumDescription(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_0
    const/4 v1, 0x1

    if-eq v0, v1, :cond_2

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getDescription()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_2
    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/cloud/CloudUtils;->collectMediaDescription(Lcom/miui/gallery/data/DBImage;)Ljava/lang/String;

    move-result-object v0

    :goto_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "description"

    invoke-virtual {p1, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    const-string v0, "DBImage"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "type is invalid:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    :pswitch_0
    const-string v0, "type"

    const-string v1, "video"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "size"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "mimeType"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "title"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sha1"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "duration"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getDuration()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto/16 :goto_2

    :pswitch_1
    const-string v0, "type"

    const-string v1, "image"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "size"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSize()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    const-string v0, "mimeType"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMimeType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "title"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    const-string v0, "sha1"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSha1()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_2

    :pswitch_2
    const-string v0, "type"

    const-string v1, "group"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isAutoUploadFeatureOpen()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getAppKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "appKey"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getAppKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_4
    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isBabyAlbumFeatureOpen()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mBabyInfoJson:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_6

    new-instance v0, Lorg/json/JSONObject;

    iget-object v1, p0, Lcom/miui/gallery/data/DBImage;->mBabyInfoJson:Ljava/lang/String;

    invoke-direct {v0, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "localFlag"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "localFlag"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->remove(Ljava/lang/String;)Ljava/lang/Object;

    :cond_5
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    const-string v0, "renderInfos"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_6
    :goto_2
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getExifInfo()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0}, Lorg/json/JSONObject;->length()I

    move-result v0

    if-lez v0, :cond_7

    const-string v0, "exifInfo"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getExifInfo()Lorg/json/JSONObject;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_7
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public getCreatorId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mCreatorId:Ljava/lang/String;

    return-object v0
.end method

.method public getDateModified()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mDateModified:J

    return-wide v0
.end method

.method public getDatetaken()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mDatetaken:J

    return-wide v0
.end method

.method public getDescription()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mDescription:Ljava/lang/String;

    return-object v0
.end method

.method public getDuration()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBImage;->mDuration:I

    return v0
.end method

.method public getEditedColumns()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mEditedColumns:Ljava/lang/String;

    return-object v0
.end method

.method public getEncodedFileName()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMD5Key()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->getEncryptedFileName(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getExifInfo()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    return-object v0
.end method

.method public getFromLocalGroupId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mFromLocalGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public getGeoInfo()Lorg/json/JSONObject;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mGeoInfo:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getGroupId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mGroupId:J

    return-wide v0
.end method

.method public getId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mId:Ljava/lang/String;

    return-object v0
.end method

.method public getJsonExifString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getExifInfo()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getExifInfo()Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Lorg/json/JSONException;->printStackTrace()V

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getLocalFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mLocalFile:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalFlag()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBImage;->mLocalFlag:I

    return v0
.end method

.method public getLocalGroupId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mLocalGroupId:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalImageId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mLocalImageId:Ljava/lang/String;

    return-object v0
.end method

.method public getMD5Key()Ljava/lang/String;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getSecretKey()[B

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->getMD5Key([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMicroThumbnailFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mMicroThumbFile:Ljava/lang/String;

    return-object v0
.end method

.method public getMimeType()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mMimeType:Ljava/lang/String;

    return-object v0
.end method

.method public getMixedDateTime()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mMixedDateTime:J

    return-wide v0
.end method

.method public getOriginSha1()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public abstract getRequestId()Ljava/lang/String;
.end method

.method public getSecretKey()[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mSecretKey:[B

    invoke-static {v0}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->isEmpty([B)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/data/DBImage;->generateSecretKey()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mSecretKey:[B

    return-object v0
.end method

.method public getSecretKeyNoGenerate()[B
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mSecretKey:[B

    return-object v0
.end method

.method public getServerId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mServerId:Ljava/lang/String;

    return-object v0
.end method

.method public getServerStatus()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mServerStatus:Ljava/lang/String;

    return-object v0
.end method

.method public getServerTag()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mServerTag:J

    return-wide v0
.end method

.method public getServerType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBImage;->mServerType:I

    return v0
.end method

.method public getSha1()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    return-object v0
.end method

.method public getSha1FileName()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    invoke-static {v1}, Lmiui/os/ExtraFileUtils;->getExtension(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSha1Thumbnail()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "jpg"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSha1ThumbnailSA()Ljava/lang/String;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getMD5Key()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->isVideoType()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/cloud/CloudUtils$SecretAlbumUtils;->getSha1ThumbnailSA(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getShareAlbumId()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mShareAlbumId:Ljava/lang/String;

    return-object v0
.end method

.method public getSize()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mSize:J

    return-wide v0
.end method

.method public getSpecialTypeFlags()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/data/DBImage;->mSpecialTypeFlags:J

    return-wide v0
.end method

.method public getSubUbiImageCount()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubImageCount:I

    return v0
.end method

.method public getSubUbiIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubIndex:I

    return v0
.end method

.method public abstract getTagId()Ljava/lang/String;
.end method

.method public getThumbnailFile()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mThumbnailFile:Ljava/lang/String;

    return-object v0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/data/DBImage;->mTitle:Ljava/lang/String;

    return-object v0
.end method

.method public getUbiServerId()Ljava/lang/String;
    .locals 1

    const-string v0, ""

    return-object v0
.end method

.method public isFavorite()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/data/DBImage;->mIsFavorite:Z

    return v0
.end method

.method public isImageType()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method public isItemType()Z
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    return v1
.end method

.method public isSecretItem()Z
    .locals 2

    invoke-static {}, Lcom/miui/gallery/util/deviceprovider/ApplicationHelper;->isSecretAlbumFeatureOpen()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getGroupId()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getLocalGroupId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/cloud/CloudTableUtils;->isSecretAlbum(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isShareItem()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isSubUbiFocus()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isUbiFocus()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public isVideoType()Z
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public reloadData(Landroid/database/Cursor;)Z
    .locals 9

    new-instance v0, Lcom/miui/gallery/util/UpdateHelper;

    invoke-direct {v0}, Lcom/miui/gallery/util/UpdateHelper;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/data/DBImage;->mId:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {p1, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iput-object v1, p0, Lcom/miui/gallery/data/DBImage;->mId:Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mGroupId:J

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mGroupId:J

    iget-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mSize:J

    const/4 v5, 0x2

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mSize:J

    iget-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mDateModified:J

    const/4 v5, 0x3

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mDateModified:J

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mMimeType:Ljava/lang/String;

    const/4 v4, 0x4

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mMimeType:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mTitle:Ljava/lang/String;

    const/4 v4, 0x5

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mTitle:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mDescription:Ljava/lang/String;

    const/4 v4, 0x6

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mDescription:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    const/4 v4, 0x7

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    iget-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mDatetaken:J

    const/16 v5, 0x8

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mDatetaken:J

    iget v3, p0, Lcom/miui/gallery/data/DBImage;->mDuration:I

    const/16 v4, 0x9

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/data/DBImage;->mDuration:I

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mServerId:Ljava/lang/String;

    const/16 v4, 0xa

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mServerId:Ljava/lang/String;

    iget v3, p0, Lcom/miui/gallery/data/DBImage;->mServerType:I

    const/16 v4, 0xb

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/data/DBImage;->mServerType:I

    iget-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mServerTag:J

    const/16 v5, 0xd

    invoke-interface {p1, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    invoke-virtual {v0, v3, v4, v5, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(JJ)J

    move-result-wide v3

    iput-wide v3, p0, Lcom/miui/gallery/data/DBImage;->mServerTag:J

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mServerStatus:Ljava/lang/String;

    const/16 v4, 0xc

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mServerStatus:Ljava/lang/String;

    iget v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalFlag:I

    const/16 v4, 0x23

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v3

    iput v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalFlag:I

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mThumbnailFile:Ljava/lang/String;

    const/16 v4, 0x24

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mThumbnailFile:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mDownloadFile:Ljava/lang/String;

    const/16 v4, 0x25

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mDownloadFile:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mMicroThumbFile:Ljava/lang/String;

    const/16 v4, 0x29

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mMicroThumbFile:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalFile:Ljava/lang/String;

    const/16 v4, 0x26

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalFile:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    const/16 v4, 0x27

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalGroupId:Ljava/lang/String;

    const/16 v4, 0x2a

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalGroupId:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalImageId:Ljava/lang/String;

    const/16 v4, 0x2b

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLocalImageId:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mShareAlbumId:Ljava/lang/String;

    const/16 v4, 0x2c

    invoke-static {p1, v4}, Lcom/miui/gallery/provider/GalleryDBHelper;->getCursorString(Landroid/database/Cursor;I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mShareAlbumId:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLongitudeStr:Ljava/lang/String;

    const/16 v4, 0x12

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLongitudeStr:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLatitudeStr:Ljava/lang/String;

    const/16 v4, 0x11

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLatitudeStr:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLongitudeStrRef:Ljava/lang/String;

    const/16 v4, 0x17

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLongitudeStrRef:Ljava/lang/String;

    iget-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLatitudeStrRef:Ljava/lang/String;

    const/16 v4, 0x16

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    iput-object v3, p0, Lcom/miui/gallery/data/DBImage;->mLatitudeStrRef:Ljava/lang/String;

    :try_start_0
    sget-object v3, Lcom/miui/gallery/data/DBImage;->sExifDataConst:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v4, 0x0

    :cond_0
    :goto_0
    :try_start_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;

    iget v6, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->exifValueType:I

    const/4 v7, 0x0

    packed-switch v6, :pswitch_data_0

    const-string v6, "DBImage"

    goto/16 :goto_4

    :pswitch_0
    iget v6, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->columnIndex:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_1

    iget-object v6, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    if-eqz v6, :cond_0

    :try_start_2
    iget-object v4, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v5, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v4, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_2

    :cond_1
    :try_start_3
    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    goto :goto_1

    :cond_2
    const/4 v4, 0x1

    :goto_1
    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v5, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    :pswitch_1
    iget v6, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->columnIndex:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->isNull(I)Z

    move-result v6

    if-eqz v6, :cond_3

    iget-object v6, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    if-eqz v6, :cond_0

    :try_start_4
    iget-object v4, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v5, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v4, v5, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    :goto_2
    const/4 v4, 0x1

    goto :goto_0

    :catch_0
    const/4 v4, 0x1

    goto :goto_5

    :cond_3
    :try_start_5
    iget v6, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->columnIndex:I

    invoke-interface {p1, v6}, Landroid/database/Cursor;->getInt(I)I

    move-result v6

    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v8, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v0, v7, v6}, Lcom/miui/gallery/util/UpdateHelper;->update(II)I

    move-result v6

    goto :goto_3

    :cond_4
    const/4 v4, 0x1

    :goto_3
    iget-object v7, p0, Lcom/miui/gallery/data/DBImage;->mExifInfo:Lorg/json/JSONObject;

    iget-object v5, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->cloudTagName:Ljava/lang/String;

    invoke-virtual {v7, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    goto/16 :goto_0

    :goto_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "exifDataConst.exifValueType is wrong: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v5, v5, Lcom/miui/gallery/data/DBImage$ExifDataConst;->exifValueType:I

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v6, v5}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_2

    goto/16 :goto_0

    :catch_1
    const/4 v4, 0x0

    :catch_2
    :goto_5
    const-string p1, "DBCloud"

    const-string v3, "DBCloud(Cursor c): put JSON error"

    invoke-static {p1, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    if-nez v4, :cond_7

    invoke-virtual {v0}, Lcom/miui/gallery/util/UpdateHelper;->isUpdated()Z

    move-result p1

    if-eqz p1, :cond_6

    goto :goto_6

    :cond_6
    const/4 v1, 0x0

    :cond_7
    :goto_6
    return v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mFileName:Ljava/lang/String;

    return-void
.end method

.method public setGroupId(J)V
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/data/DBImage;->mGroupId:J

    return-void
.end method

.method public setLocalFile(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mLocalFile:Ljava/lang/String;

    return-void
.end method

.method public setMicroThumbFile(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mMicroThumbFile:Ljava/lang/String;

    return-void
.end method

.method public setOriginInfo(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public abstract setRequestAlbumId(Ljava/lang/String;)V
.end method

.method public setSecretKey([B)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mSecretKey:[B

    return-void
.end method

.method public setServerId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mServerId:Ljava/lang/String;

    return-void
.end method

.method public setServerType(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/data/DBImage;->mServerType:I

    return-void
.end method

.method public setSha1(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mSha1:Ljava/lang/String;

    return-void
.end method

.method public setShareAlbumId(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mShareAlbumId:Ljava/lang/String;

    return-void
.end method

.method public setShareId(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public setSubUbiImageCount(I)V
    .locals 0

    iput p1, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubImageCount:I

    return-void
.end method

.method public setThumbnailFile(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mThumbnailFile:Ljava/lang/String;

    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/data/DBImage;->mTitle:Ljava/lang/String;

    return-void
.end method

.method public toJSONObject()Lorg/json/JSONObject;
    .locals 7

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/data/DBImage;->getBasicValues(Lorg/json/JSONObject;)V

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getGroupId()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long v5, v1, v3

    if-eqz v5, :cond_0

    const-string v1, "groupId"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getGroupId()J

    move-result-wide v5

    invoke-virtual {v0, v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "id"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_2

    const-string v1, "status"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerStatus()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    :cond_2
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v1

    cmp-long v5, v1, v3

    if-eqz v5, :cond_3

    const-string v1, "tag"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getServerTag()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    :cond_3
    iget v1, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubImageCount:I

    if-lez v1, :cond_4

    const-string v1, "ubiSubImageCount"

    iget v2, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubImageCount:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "currentFocusIndex"

    iget v2, p0, Lcom/miui/gallery/data/DBImage;->mUbiFocusIndex:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    const-string v1, "ubiDefaultIndex"

    iget v2, p0, Lcom/miui/gallery/data/DBImage;->mUbiSubIndex:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    const-string v1, "originSha1"

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getOriginSha1()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string v1, "DBCloud"

    const-string v2, "toJSONObject: get JSON error"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    :goto_0
    return-object v0
.end method

.method public toJsonObjectForSubUbi()Lorg/json/JSONObject;
    .locals 4

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/data/DBImage;->getBasicValues(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    const-string v2, "type"

    :goto_0
    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    const-string v1, "DBCloud"

    const-string v2, "put null JSON_TAG_TYPE failed"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :catchall_0
    move-exception v2

    goto :goto_2

    :catch_1
    :try_start_2
    const-string v2, "DBCloud"

    const-string v3, "toJsonObjectForSubUbi: get JSON error"

    invoke-static {v2, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    const-string v2, "type"
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_0

    :goto_1
    return-object v0

    :goto_2
    :try_start_4
    const-string v3, "type"

    invoke-virtual {v0, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_3

    :catch_2
    const-string v0, "DBCloud"

    const-string v1, "put null JSON_TAG_TYPE failed"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :goto_3
    throw v2
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "[ _id = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", albumId = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/data/DBImage;->getAlbumId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
