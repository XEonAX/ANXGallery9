.class Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;
.super Ljava/lang/Object;
.source "GalleryOpenProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/provider/GalleryOpenProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MediaInfo"
.end annotation


# instance fields
.field mAlbumName:Ljava/lang/String;

.field mBucketId:J

.field mBucketName:Ljava/lang/String;

.field mDateModified:Ljava/lang/Long;

.field mDateTaken:Ljava/lang/Long;

.field mDuration:Ljava/lang/Long;

.field mFileName:Ljava/lang/String;

.field mHeight:Ljava/lang/Integer;

.field mId:J

.field mLatitude:Ljava/lang/Double;

.field mLongitude:Ljava/lang/Double;

.field mMimeType:Ljava/lang/String;

.field mOrientation:Ljava/lang/Integer;

.field mPath:Ljava/lang/String;

.field mResolution:Ljava/lang/String;

.field mSize:Ljava/lang/Long;

.field mTitle:Ljava/lang/String;

.field mType:I

.field mWidth:Ljava/lang/Integer;

.field final synthetic this$0:Lcom/miui/gallery/provider/GalleryOpenProvider;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/provider/GalleryOpenProvider;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->this$0:Lcom/miui/gallery/provider/GalleryOpenProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/provider/GalleryOpenProvider;Lcom/miui/gallery/provider/GalleryOpenProvider$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;-><init>(Lcom/miui/gallery/provider/GalleryOpenProvider;)V

    return-void
.end method

.method private decodeBounds(Ljava/lang/String;)V
    .locals 1

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-static {v0, p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    iget p1, p1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method fillByFile(Ljava/lang/String;)Z
    .locals 4

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "try fill with %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v0, "file not exists"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    new-instance v0, Ljava/io/File;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mSize:Ljava/lang/Long;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->decodeBounds(Ljava/lang/String;)V

    const/4 p1, 0x1

    return p1
.end method

.method init(Landroid/database/Cursor;)Z
    .locals 12

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    iput-wide v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mId:J

    const/4 v1, 0x1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v2

    const/4 v3, 0x2

    if-ne v2, v1, :cond_0

    iput v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    goto :goto_0

    :cond_0
    if-ne v2, v3, :cond_b

    iput v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    :goto_0
    invoke-interface {p1, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x3

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v2, :cond_1

    if-eqz v4, :cond_1

    invoke-static {v2, v4}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLatitude:Ljava/lang/Double;

    :cond_1
    const/4 v2, 0x4

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x5

    invoke-interface {p1, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-eqz v2, :cond_2

    if-eqz v4, :cond_2

    invoke-static {v2, v4}, Lcom/miui/gallery/data/LocationUtil;->convertRationalLatLonToDouble(Ljava/lang/String;Ljava/lang/String;)D

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLongitude:Ljava/lang/Double;

    :cond_2
    const/4 v2, 0x6

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Numbers;->getLong(Landroid/database/Cursor;I)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    const/16 v2, 0x8

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketId:J

    const/16 v2, 0xd

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mFileName:Ljava/lang/String;

    const/16 v2, 0xe

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mTitle:Ljava/lang/String;

    const/16 v2, 0xf

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    const/16 v2, 0x10

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->this$0:Lcom/miui/gallery/provider/GalleryOpenProvider;

    invoke-static {v2}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$200(Lcom/miui/gallery/provider/GalleryOpenProvider;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "cloud"

    const-string v2, "fileName"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v6

    const-string v7, "_id=?"

    new-array v8, v1, [Ljava/lang/String;

    iget-wide v9, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketId:J

    invoke-static {v9, v10}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v8, v0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v4 .. v11}, Landroid/database/sqlite/SQLiteDatabase;->query(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v2

    :try_start_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v2, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_3
    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    iget v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    if-ne v2, v3, :cond_4

    const/16 v2, 0x13

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDuration:Ljava/lang/Long;

    :cond_4
    const/16 v2, 0xb

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    const/16 v0, 0xc

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mSize:Ljava/lang/Long;

    const/16 v0, 0x11

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    const/16 v0, 0x12

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    const/4 v0, 0x7

    invoke-interface {p1, v0}, Landroid/database/Cursor;->isNull(I)Z

    move-result v2

    if-nez v2, :cond_5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getShort(I)S

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/util/ExifUtil;->exifOrientationToDegrees(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    :cond_5
    iget p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    if-ne p1, v3, :cond_6

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mResolution:Ljava/lang/String;

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mAlbumName:Ljava/lang/String;

    :cond_6
    return v1

    :cond_7
    iget v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    if-ne v1, v3, :cond_8

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "current type is video, but no file path"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_8
    const/16 v1, 0xa

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a

    const/16 v1, 0x9

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_9

    goto :goto_1

    :cond_9
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "no path return"

    invoke-static {p1, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return v0

    :cond_a
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->fillByFile(Ljava/lang/String;)Z

    move-result p1

    return p1

    :catchall_0
    move-exception p1

    invoke-interface {v2}, Landroid/database/Cursor;->close()V

    throw p1

    :cond_b
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object p1

    const-string v1, "%d is not a media type"

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v0
.end method

.method init(Ljava/lang/String;)Z
    .locals 6

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "query media info for file: %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    return v2

    :cond_0
    const-wide v3, 0x7fffffffffffffffL

    iput-wide v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mId:J

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->getMimeTypeByParseFile(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isVideoFromMimeType(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    return v2

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileMimeUtil;->isImageFromMimeType(Ljava/lang/String;)Z

    move-result v1

    const/4 v5, 0x1

    if-eqz v1, :cond_2

    const/4 v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v1, 0x2

    :goto_0
    iput v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    iput-wide v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketId:J

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mSize:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mFileName:Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mFileName:Ljava/lang/String;

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->getFileTitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    iget v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    if-ne v0, v5, :cond_7

    invoke-static {p1}, Lcom/miui/gallery/util/FileMimeUtil;->hasExif(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "reading exif"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object v0, Lcom/miui/gallery/util/ExifUtil;->sSupportExifCreator:Lcom/miui/gallery/util/ExifUtil$ExifCreator;

    invoke-interface {v0, p1}, Lcom/miui/gallery/util/ExifUtil$ExifCreator;->create(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/media/ExifInterface;

    if-nez v0, :cond_3

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Failed to read exif for path %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_1

    :cond_3
    invoke-virtual {v0}, Landroid/support/media/ExifInterface;->getLatLong()[D

    move-result-object v1

    if-eqz v1, :cond_4

    aget-wide v3, v1, v2

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLatitude:Ljava/lang/Double;

    aget-wide v3, v1, v5

    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLongitude:Ljava/lang/Double;

    :cond_4
    invoke-static {v0}, Lcom/miui/gallery/util/ExifUtil;->getRotationDegrees(Landroid/support/media/ExifInterface;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/scanner/SaveToCloudUtil;->getDateTaken(Landroid/support/media/ExifInterface;J)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    const-string v1, "ImageWidth"

    invoke-virtual {v0, v1, v2}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    const-string v1, "ImageLength"

    invoke-virtual {v0, v1, v2}, Landroid/support/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-lez v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-gtz v0, :cond_9

    :cond_5
    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->decodeBounds(Ljava/lang/String;)V

    goto/16 :goto_1

    :cond_6
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "no exif found"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->decodeBounds(Ljava/lang/String;)V

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    iget-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    goto :goto_1

    :cond_7
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    const-string v1, "is video, reading video info"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mAlbumName:Ljava/lang/String;

    :try_start_0
    invoke-static {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->read(Ljava/lang/String;)Lcom/miui/gallery/util/VideoAttrsReader;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getTitle()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_8

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mTitle:Ljava/lang/String;

    :cond_8
    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getDateTaken()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getDuration()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDuration:Ljava/lang/Long;

    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getVideoWidth()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {p1}, Lcom/miui/gallery/util/VideoAttrsReader;->getVideoHeight()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mResolution:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_9
    :goto_1
    return v5
.end method

.method toContentValue()Landroid/content/ContentValues;
    .locals 5

    new-instance v0, Landroid/content/ContentValues;

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$300()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    invoke-direct {v0, v1}, Landroid/content/ContentValues;-><init>(I)V

    const/4 v1, 0x0

    :goto_0
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$300()[Ljava/lang/String;

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_0

    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$300()[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v1

    packed-switch v1, :pswitch_data_0

    :pswitch_0
    invoke-virtual {v0, v2}, Landroid/content/ContentValues;->putNull(Ljava/lang/String;)V

    goto/16 :goto_1

    :pswitch_1
    iget v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto/16 :goto_1

    :pswitch_2
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mResolution:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    :pswitch_3
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDuration:Ljava/lang/Long;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto/16 :goto_1

    :pswitch_4
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_5
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_6
    iget-wide v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketId:J

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_7
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_1

    :pswitch_8
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_9
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLongitude:Ljava/lang/Double;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    goto :goto_1

    :pswitch_a
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mLatitude:Ljava/lang/Double;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Double;)V

    goto :goto_1

    :pswitch_b
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_1

    :pswitch_c
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    goto :goto_1

    :pswitch_d
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_e
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_f
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_10
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_11
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :pswitch_12
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mSize:Ljava/lang/Long;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    goto :goto_1

    :pswitch_13
    iget-object v3, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$100()Ljava/lang/String;

    move-result-object v1

    const-string v2, "trans cursor to %s"

    invoke-static {v0}, Lcom/miui/gallery/provider/GalleryOpenProvider;->access$400(Landroid/content/ContentValues;)Landroid/content/ContentValues;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_0
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_3
        :pswitch_0
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "MediaInfo{mId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mType:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", mDateTaken="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateTaken:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mOrientation="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mOrientation:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", mBucketId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", mBucketName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mBucketName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mPath=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mPath:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mSize="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mSize:Ljava/lang/Long;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mFileName=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mFileName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mTitle=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mTitle:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mDateModified="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDateModified:Ljava/lang/Long;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mMimeType=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mMimeType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mWidth="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mWidth:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mHeight="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mHeight:Ljava/lang/Integer;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mDuration="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mDuration:Ljava/lang/Long;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, ", mAlbumName=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mAlbumName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v2, ", mResolution=\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/miui/gallery/provider/GalleryOpenProvider$MediaInfo;->mResolution:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
