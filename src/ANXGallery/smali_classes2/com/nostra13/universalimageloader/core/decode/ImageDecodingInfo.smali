.class public Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;
.super Ljava/lang/Object;
.source "ImageDecodingInfo.java"


# instance fields
.field private final considerExifParams:Z

.field private final considerFileLength:Z

.field private final decodingOptions:Landroid/graphics/BitmapFactory$Options;

.field private final downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

.field private final extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

.field private final fileLength:J

.field private final imageKey:Ljava/lang/String;

.field private final imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

.field private final imageUri:Ljava/lang/String;

.field private final inBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

.field private final isCacheBigPhoto:Z

.field private final isLoadFromBigPhotoCache:Z

.field private final isRegionDecodeFace:Z

.field private final isSecretImage:Z

.field private final originalImageUri:Ljava/lang/String;

.field private final regionDecodeRect:Landroid/graphics/RectF;

.field private final secretKey:[B

.field private final targetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

.field private final viewScaleType:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Lcom/nostra13/universalimageloader/core/download/ImageDownloader;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageKey:Ljava/lang/String;

    iput-object p2, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageUri:Ljava/lang/String;

    iput-object p3, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->originalImageUri:Ljava/lang/String;

    iput-object p4, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->targetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageScaleType()Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    iput-object p5, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->viewScaleType:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    iput-object p6, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getExtraForDownloader()Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isConsiderExifParams()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerExifParams:Z

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getDecodingOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object p1

    iget-object p2, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->copyOptions(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->regionDecodeRect:Landroid/graphics/RectF;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isRegionDecodeFace:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isSecretImage()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isSecretImage:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getSecretKey()[B

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->secretKey:[B

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getReusedBitmapCache()Lcom/miui/gallery/util/ReusedBitmapCache;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->inBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isCacheBigPhoto()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isCacheBigPhoto:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isLoadFromBigPhotoCache()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isLoadFromBigPhotoCache:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isConsiderFileLength()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerFileLength:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getFileLength()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->fileLength:J

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;Lcom/nostra13/universalimageloader/core/download/ImageDownloader;Lcom/nostra13/universalimageloader/core/DisplayImageOptions;Landroid/graphics/RectF;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageKey:Ljava/lang/String;

    iput-object p2, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageUri:Ljava/lang/String;

    iput-object p3, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->originalImageUri:Ljava/lang/String;

    iput-object p4, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->targetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getImageScaleType()Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    iput-object p5, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->viewScaleType:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    iput-object p6, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getExtraForDownloader()Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isConsiderExifParams()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerExifParams:Z

    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getDecodingOptions()Landroid/graphics/BitmapFactory$Options;

    move-result-object p1

    iget-object p2, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->copyOptions(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V

    iput-object p8, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->regionDecodeRect:Landroid/graphics/RectF;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->usingRegionDecoderFace()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isRegionDecodeFace:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isSecretImage()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isSecretImage:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getSecretKey()[B

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->secretKey:[B

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getReusedBitmapCache()Lcom/miui/gallery/util/ReusedBitmapCache;

    move-result-object p1

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->inBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isCacheBigPhoto()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isCacheBigPhoto:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isLoadFromBigPhotoCache()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isLoadFromBigPhotoCache:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->isConsiderFileLength()Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerFileLength:Z

    invoke-virtual {p7}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->getFileLength()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->fileLength:J

    return-void
.end method

.method private copyOptions(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V
    .locals 2

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inDensity:I

    iget-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inDither:Z

    iget-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inInputShareable:Z

    iget-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iget-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iput-object v0, p2, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    iget-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inPurgeable:Z

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iget-boolean v0, p1, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    iput-boolean v0, p2, Landroid/graphics/BitmapFactory$Options;->inScaled:Z

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inScreenDensity:I

    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inScreenDensity:I

    iget v0, p1, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    iput v0, p2, Landroid/graphics/BitmapFactory$Options;->inTargetDensity:I

    iget-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    iput-object v0, p2, Landroid/graphics/BitmapFactory$Options;->inTempStorage:[B

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xa

    if-lt v0, v1, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->copyOptions10(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V

    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_1

    invoke-direct {p0, p1, p2}, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->copyOptions11(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V

    :cond_1
    return-void
.end method

.method private copyOptions10(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V
    .locals 0
    .annotation build Landroid/annotation/TargetApi;
        value = 0xa
    .end annotation

    iget-boolean p1, p1, Landroid/graphics/BitmapFactory$Options;->inPreferQualityOverSpeed:Z

    iput-boolean p1, p2, Landroid/graphics/BitmapFactory$Options;->inPreferQualityOverSpeed:Z

    return-void
.end method

.method private copyOptions11(Landroid/graphics/BitmapFactory$Options;Landroid/graphics/BitmapFactory$Options;)V
    .locals 1
    .annotation build Landroid/annotation/TargetApi;
        value = 0xb
    .end annotation

    iget-object v0, p1, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    iput-object v0, p2, Landroid/graphics/BitmapFactory$Options;->inBitmap:Landroid/graphics/Bitmap;

    iget-boolean p1, p1, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    iput-boolean p1, p2, Landroid/graphics/BitmapFactory$Options;->inMutable:Z

    return-void
.end method


# virtual methods
.method public getDecodingOptions()Landroid/graphics/BitmapFactory$Options;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    return-object v0
.end method

.method public getDownloader()Lcom/nostra13/universalimageloader/core/download/ImageDownloader;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->downloader:Lcom/nostra13/universalimageloader/core/download/ImageDownloader;

    return-object v0
.end method

.method public getExtraForDownloader()Lcom/nostra13/universalimageloader/core/download/ExtraInfo;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    return-object v0
.end method

.method public getFileLength()J
    .locals 2

    iget-wide v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->fileLength:J

    return-wide v0
.end method

.method public getImageKey()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageKey:Ljava/lang/String;

    return-object v0
.end method

.method public getImageScaleType()Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    return-object v0
.end method

.method public getImageUri()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->imageUri:Ljava/lang/String;

    return-object v0
.end method

.method public getInBitmapCache()Lcom/miui/gallery/util/ReusedBitmapCache;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->inBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    return-object v0
.end method

.method public getRegionDecodeRect()Landroid/graphics/RectF;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->regionDecodeRect:Landroid/graphics/RectF;

    return-object v0
.end method

.method public getSecretKey()[B
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->secretKey:[B

    return-object v0
.end method

.method public getTargetSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->targetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    return-object v0
.end method

.method public getViewScaleType()Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;
    .locals 1

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->viewScaleType:Lcom/nostra13/universalimageloader/core/assist/ViewScaleType;

    return-object v0
.end method

.method public isCacheBigPhoto()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isCacheBigPhoto:Z

    return v0
.end method

.method public isConsiderFileLength()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerFileLength:Z

    return v0
.end method

.method public isLoadFromBigPhotoCache()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isLoadFromBigPhotoCache:Z

    return v0
.end method

.method public isRegionDecodeFace()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isRegionDecodeFace:Z

    return v0
.end method

.method public isSecretImage()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->isSecretImage:Z

    return v0
.end method

.method public shouldConsiderExifParams()Z
    .locals 1

    iget-boolean v0, p0, Lcom/nostra13/universalimageloader/core/decode/ImageDecodingInfo;->considerExifParams:Z

    return v0
.end method
