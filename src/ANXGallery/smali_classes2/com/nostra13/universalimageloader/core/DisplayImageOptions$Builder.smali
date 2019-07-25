.class public Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
.super Ljava/lang/Object;
.source "DisplayImageOptions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field private blurRadius:I

.field private cacheInMemory:Z

.field private cacheInSubMemory:Z

.field private cacheOnDisk:Z

.field private cacheThumbnail:Z

.field private considerExifParams:Z

.field private considerFileLength:Z

.field private decodingOptions:Landroid/graphics/BitmapFactory$Options;

.field private delayBeforeLoading:I

.field private delayCacheThumbnail:Z

.field private displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

.field private extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

.field private fileLength:J

.field private handler:Landroid/os/Handler;

.field private imageForEmptyUri:Landroid/graphics/drawable/Drawable;

.field private imageOnFail:Landroid/graphics/drawable/Drawable;

.field private imageOnLoading:Landroid/graphics/drawable/Drawable;

.field private imageResForEmptyUri:I

.field private imageResOnFail:I

.field private imageResOnLoading:I

.field private imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

.field private isBitmapReused:Z

.field private isCacheBigPhoto:Z

.field private isHighPriority:Z

.field private isLoadFromBigPhotoCache:Z

.field private isLoadFromMicroCache:Z

.field private isLoadFromThumbnailCache:Z

.field private isLoadOriginScaleThumbnail:Z

.field private isManual:Z

.field private isPreferSyncLoadFromMicroCache:Z

.field private isSecretImage:Z

.field private isSyncLoadFromThumbCache:Z

.field private isSyncLoading:Z

.field private postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

.field private preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

.field private resetViewBeforeLoading:Z

.field private reusedBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

.field private secretKey:[B

.field private usingRegionDecoderFace:Z


# direct methods
.method public constructor <init>()V
    .locals 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    sget-object v2, Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;->IN_SAMPLE_POWER_OF_2:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    new-instance v2, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v2}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    invoke-static {}, Lcom/nostra13/universalimageloader/core/DefaultConfigurationFactory;->createBitmapDisplayer()Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    move-result-object v2

    iput-object v2, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    iput-object v1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isHighPriority:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayCacheThumbnail:Z

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isPreferSyncLoadFromMicroCache:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->blurRadius:I

    return-void
.end method

.method static synthetic access$000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .locals 0

    iget p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    return p0
.end method

.method static synthetic access$100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .locals 0

    iget p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    return p0
.end method

.method static synthetic access$1000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/BitmapFactory$Options;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .locals 0

    iget p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    return p0
.end method

.method static synthetic access$1200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    return p0
.end method

.method static synthetic access$1300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/download/ExtraInfo;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/os/Handler;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$1800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    return p0
.end method

.method static synthetic access$1900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail:Z

    return p0
.end method

.method static synthetic access$200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .locals 0

    iget p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    return p0
.end method

.method static synthetic access$2000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayCacheThumbnail:Z

    return p0
.end method

.method static synthetic access$2100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace:Z

    return p0
.end method

.method static synthetic access$2200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSecretImage:Z

    return p0
.end method

.method static synthetic access$2300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)[B
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey:[B

    return-object p0
.end method

.method static synthetic access$2400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoadFromThumbCache:Z

    return p0
.end method

.method static synthetic access$2500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/miui/gallery/util/ReusedBitmapCache;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->reusedBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    return-object p0
.end method

.method static synthetic access$2600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromThumbnailCache:Z

    return p0
.end method

.method static synthetic access$2700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadOriginScaleThumbnail:Z

    return p0
.end method

.method static synthetic access$2800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromMicroCache:Z

    return p0
.end method

.method static synthetic access$2900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isCacheBigPhoto:Z

    return p0
.end method

.method static synthetic access$300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$3000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromBigPhotoCache:Z

    return p0
.end method

.method static synthetic access$3100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isPreferSyncLoadFromMicroCache:Z

    return p0
.end method

.method static synthetic access$3200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isHighPriority:Z

    return p0
.end method

.method static synthetic access$3300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength:Z

    return p0
.end method

.method static synthetic access$3400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)J
    .locals 2

    iget-wide v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength:J

    return-wide v0
.end method

.method static synthetic access$3500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)I
    .locals 0

    iget p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->blurRadius:I

    return p0
.end method

.method static synthetic access$3600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInSubMemory:Z

    return p0
.end method

.method static synthetic access$3700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isBitmapReused:Z

    return p0
.end method

.method static synthetic access$3800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isManual:Z

    return p0
.end method

.method static synthetic access$400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Landroid/graphics/drawable/Drawable;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method static synthetic access$600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    return p0
.end method

.method static synthetic access$700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    return p0
.end method

.method static synthetic access$800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    return p0
.end method

.method static synthetic access$900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;)Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;
    .locals 0

    iget-object p0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    return-object p0
.end method


# virtual methods
.method public bitmapConfig(Landroid/graphics/Bitmap$Config;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    iput-object p1, v0, Landroid/graphics/BitmapFactory$Options;->inPreferredConfig:Landroid/graphics/Bitmap$Config;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "bitmapConfig can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public blurRadius(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->blurRadius:I

    return-object p0
.end method

.method public build()Lcom/nostra13/universalimageloader/core/DisplayImageOptions;
    .locals 2

    new-instance v0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;-><init>(Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;Lcom/nostra13/universalimageloader/core/DisplayImageOptions$1;)V

    return-object v0
.end method

.method public cacheBigPhoto(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isCacheBigPhoto:Z

    return-object p0
.end method

.method public cacheInMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    return-object p0
.end method

.method public cacheInSubMemory(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInSubMemory:Z

    return-object p0
.end method

.method public cacheOnDisc()Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    move-result-object v0

    return-object v0
.end method

.method public cacheOnDisk(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    return-object p0
.end method

.method public cacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail:Z

    return-object p0
.end method

.method public cloneFrom(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 2

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$3900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageForEmptyUri:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnFail:Landroid/graphics/drawable/Drawable;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInMemory:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheOnDisk:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$4900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/graphics/BitmapFactory$Options;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->decodingOptions:Landroid/graphics/BitmapFactory$Options;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayBeforeLoading:I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->preProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->postProcessor:Lcom/nostra13/universalimageloader/core/process/BitmapProcessor;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Landroid/os/Handler;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheThumbnail:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$5900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayCacheThumbnail:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSecretImage:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey:[B

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoadFromThumbCache:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Lcom/miui/gallery/util/ReusedBitmapCache;

    move-result-object v0

    iput-object v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->reusedBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromThumbnailCache:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadOriginScaleThumbnail:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6700(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromMicroCache:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6800(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isCacheBigPhoto:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$6900(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromBigPhotoCache:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7000(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isPreferSyncLoadFromMicroCache:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7100(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7200(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength:J

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7300(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)I

    move-result v0

    iput v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->blurRadius:I

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7400(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->cacheInSubMemory:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7500(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isBitmapReused:Z

    invoke-static {p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions;->access$7600(Lcom/nostra13/universalimageloader/core/DisplayImageOptions;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isManual:Z

    return-object p0
.end method

.method public considerExifParams(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerExifParams:Z

    return-object p0
.end method

.method public considerFileLength(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength:Z

    return-object p0
.end method

.method public delayCacheThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->delayCacheThumbnail:Z

    return-object p0
.end method

.method public displayer(Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 1

    if-eqz p1, :cond_0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->displayer:Lcom/nostra13/universalimageloader/core/display/BitmapDisplayer;

    return-object p0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "displayer can\'t be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public extraForDownloader(Lcom/nostra13/universalimageloader/core/download/ExtraInfo;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->extraForDownloader:Lcom/nostra13/universalimageloader/core/download/ExtraInfo;

    return-object p0
.end method

.method public fileLength(J)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->considerFileLength:Z

    iput-wide p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->fileLength:J

    return-object p0
.end method

.method public handler(Landroid/os/Handler;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->handler:Landroid/os/Handler;

    return-object p0
.end method

.method public highPriority(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isHighPriority:Z

    return-object p0
.end method

.method public imageScaleType(Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageScaleType:Lcom/nostra13/universalimageloader/core/assist/ImageScaleType;

    return-object p0
.end method

.method public loadFromBigPhotoCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromBigPhotoCache:Z

    return-object p0
.end method

.method public loadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromMicroCache:Z

    return-object p0
.end method

.method public loadFromThumbnailCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadFromThumbnailCache:Z

    return-object p0
.end method

.method public loadOriginScaleThumbnail(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isLoadOriginScaleThumbnail:Z

    return-object p0
.end method

.method public preferSyncLoadFromMicroCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isPreferSyncLoadFromMicroCache:Z

    return-object p0
.end method

.method public resetViewBeforeLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->resetViewBeforeLoading:Z

    return-object p0
.end method

.method public reusedBitmapCache(Lcom/miui/gallery/util/ReusedBitmapCache;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->reusedBitmapCache:Lcom/miui/gallery/util/ReusedBitmapCache;

    return-object p0
.end method

.method public secretKey([B)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 1

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSecretImage:Z

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->secretKey:[B

    return-object p0
.end method

.method public setManual(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isManual:Z

    return-object p0
.end method

.method public showImageForEmptyUri(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResForEmptyUri:I

    return-object p0
.end method

.method public showImageOnFail(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnFail:I

    return-object p0
.end method

.method public showImageOnLoading(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    return-object p0
.end method

.method public showImageOnLoading(Landroid/graphics/drawable/Drawable;)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-object p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageOnLoading:Landroid/graphics/drawable/Drawable;

    return-object p0
.end method

.method public showStubImage(I)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    iput p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->imageResOnLoading:I

    return-object p0
.end method

.method public syncLoadFromThumbCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoadFromThumbCache:Z

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->loadFromThumbnailCache(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;

    return-object p0
.end method

.method public syncLoading(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->isSyncLoading:Z

    return-object p0
.end method

.method public usingRegionDecoderFace(Z)Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;
    .locals 0

    iput-boolean p1, p0, Lcom/nostra13/universalimageloader/core/DisplayImageOptions$Builder;->usingRegionDecoderFace:Z

    return-object p0
.end method
