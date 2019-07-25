.class public Lcom/miui/gallery/movie/nvsdk/NvMovieManager;
.super Lcom/miui/gallery/movie/core/MovieManager;
.source "NvMovieManager.java"


# static fields
.field private static final sCompileRateBlackList:[Ljava/lang/String;

.field private static sIsPaused:Z


# instance fields
.field private mContext:Landroid/content/Context;

.field private mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

.field private mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

.field private mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

.field private mSeekIndex:I

.field private mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

.field private mThemeEnable:Z

.field private mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

.field private mTimeline:Lcom/meicam/sdk/NvsTimeline;

.field private mVideoHeight:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const-string v0, "grus"

    const-string v1, "pyxis"

    const-string v2, "davinci"

    const-string v3, "davinciin"

    const-string v4, "vela"

    filled-new-array {v0, v1, v2, v3, v4}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sCompileRateBlackList:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/movie/core/MovieManager;-><init>()V

    new-instance v0, Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-direct {v0}, Lcom/meicam/themehelper/NvsThemeHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    return-object p0
.end method

.method private applyThemeAsset(Ljava/lang/String;)V
    .locals 3

    const-string v0, "movieAssetsNormal"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2, v0}, Lcom/meicam/themehelper/NvsThemeHelper;->applyTimelineTheme(Ljava/lang/String;ZZ)Z

    return-void
.end method

.method private applyThemeFile(Ljava/lang/String;)Z
    .locals 3

    invoke-static {p1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v2, v1}, Lcom/meicam/themehelper/NvsThemeHelper;->applyTimelineTheme(Ljava/lang/String;ZZ)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "NvMovieManager"

    const-string v2, "failed to apply theme, delete file: %s,"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/miui/gallery/util/BaseFileUtils;->deleteFile(Ljava/io/File;)Z

    :cond_0
    if-nez v1, :cond_1

    const-string p1, "movieAssetsNormal"

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeAsset(Ljava/lang/String;)V

    :cond_1
    return v1
.end method

.method private initTimeLine(Landroid/content/Context;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    if-nez v0, :cond_0

    const-string p1, "NvMovieManager"

    const-string v0, "streamingContext is null!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    new-instance v0, Lcom/meicam/sdk/NvsVideoResolution;

    invoke-direct {v0}, Lcom/meicam/sdk/NvsVideoResolution;-><init>()V

    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result v1

    iput v1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageWidth:I

    const/high16 v1, 0x3f800000    # 1.0f

    check-cast p1, Landroid/app/Activity;

    invoke-static {p1}, Lcom/miui/gallery/util/ScreenUtils;->getFullScreenHeight(Landroid/app/Activity;)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, v1

    iget v1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageWidth:I

    int-to-float v1, v1

    div-float/2addr p1, v1

    invoke-static {p1}, Lcom/miui/gallery/movie/entity/MovieAspectRatio;->getFitRatio(F)Lcom/miui/gallery/movie/entity/MovieAspectRatio;

    move-result-object p1

    iget v1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageWidth:I

    int-to-float v1, v1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieAspectRatio;->getRatio()F

    move-result p1

    mul-float v1, v1, p1

    float-to-int p1, v1

    iput p1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageHeight:I

    const-string p1, "NvMovieManager"

    const-string v1, "initTimeLine in size: %d:%d"

    iget v2, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageHeight:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageWidth:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p1, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    iget p1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imageHeight:I

    iput p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mVideoHeight:I

    new-instance p1, Lcom/meicam/sdk/NvsRational;

    const/4 v1, 0x1

    invoke-direct {p1, v1, v1}, Lcom/meicam/sdk/NvsRational;-><init>(II)V

    iput-object p1, v0, Lcom/meicam/sdk/NvsVideoResolution;->imagePAR:Lcom/meicam/sdk/NvsRational;

    new-instance p1, Lcom/meicam/sdk/NvsRational;

    const/16 v2, 0x19

    invoke-direct {p1, v2, v1}, Lcom/meicam/sdk/NvsRational;-><init>(II)V

    new-instance v1, Lcom/meicam/sdk/NvsAudioResolution;

    invoke-direct {v1}, Lcom/meicam/sdk/NvsAudioResolution;-><init>()V

    const v2, 0xac44

    iput v2, v1, Lcom/meicam/sdk/NvsAudioResolution;->sampleRate:I

    const/4 v2, 0x2

    iput v2, v1, Lcom/meicam/sdk/NvsAudioResolution;->channelCount:I

    iget-object v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    invoke-virtual {v2, v0, p1, v1}, Lcom/meicam/sdk/NvsStreamingContext;->createTimeline(Lcom/meicam/sdk/NvsVideoResolution;Lcom/meicam/sdk/NvsRational;Lcom/meicam/sdk/NvsAudioResolution;)Lcom/meicam/sdk/NvsTimeline;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    if-nez p1, :cond_1

    const-string p1, "NvMovieManager"

    const-string v0, "mTimeline is null!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_1
    new-instance p1, Lcom/miui/gallery/movie/nvsdk/NvStateController;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;-><init>(Lcom/meicam/sdk/NvsStreamingContext;Lcom/meicam/sdk/NvsTimeline;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

    invoke-virtual {p1, v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->connectTimelineWithLiveWindowExt(Lcom/meicam/sdk/NvsTimeline;Lcom/meicam/sdk/NvsLiveWindowExt;)Z

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {p1, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setStreamingEngineCallback(Lcom/meicam/sdk/NvsStreamingContext$StreamingEngineCallback;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {p1, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setPlaybackCallback(Lcom/meicam/sdk/NvsStreamingContext$PlaybackCallback;)V

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {p1, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setPlaybackCallback2(Lcom/meicam/sdk/NvsStreamingContext$PlaybackCallback2;)V

    const/4 p1, 0x0

    sput-boolean p1, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sIsPaused:Z

    return-void
.end method

.method private isDisableCompileRate()Z
    .locals 6

    sget-object v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sCompileRateBlackList:[Ljava/lang/String;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    sget-object v5, Landroid/os/Build;->DEVICE:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v2
.end method

.method public static synthetic lambda$export$144(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;Lcom/meicam/sdk/NvsTimeline;Z)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    const/4 v0, 0x0

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    invoke-interface {p2, v0, p1, v0}, Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;->onEncodeEnd(ZZI)V

    goto :goto_0

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    invoke-interface {p2, p1, v0, v0}, Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;->onEncodeEnd(ZZI)V

    :cond_1
    :goto_0
    return-void
.end method

.method private parseClipFromFile(Ljava/util/List;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/entity/ImageEntity;",
            ">;)",
            "Ljava/util/ArrayList<",
            "Lcom/meicam/themehelper/NvsImageFileDesc;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge v2, v3, :cond_0

    new-instance v3, Lcom/meicam/themehelper/NvsImageFileDesc;

    invoke-direct {v3}, Lcom/meicam/themehelper/NvsImageFileDesc;-><init>()V

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/movie/entity/ImageEntity;

    iget-object v4, v4, Lcom/miui/gallery/movie/entity/ImageEntity;->image:Ljava/lang/String;

    iput-object v4, v3, Lcom/meicam/themehelper/NvsImageFileDesc;->filePath:Ljava/lang/String;

    iput-boolean v1, v3, Lcom/meicam/themehelper/NvsImageFileDesc;->hasFace:Z

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/meicam/themehelper/NvsImageFileDesc;->show:Z

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v0
.end method


# virtual methods
.method public addImage(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/entity/ImageEntity;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->parseClipFromFile(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->insertClip(Ljava/util/ArrayList;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public addStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->addStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V

    return-void
.end method

.method public cancelExport()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->cancelExport()V

    return-void
.end method

.method public destroy()V
    .locals 2

    sget-boolean v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sIsPaused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->removeTimeline(Lcom/meicam/sdk/NvsTimeline;)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->clearCachedResources(Z)V

    invoke-static {}, Lcom/meicam/sdk/NvsStreamingContext;->close()V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

    invoke-super {p0}, Lcom/miui/gallery/movie/core/MovieManager;->destroy()V

    return-void
.end method

.method public export(Ljava/lang/String;Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;)V
    .locals 10

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0, v1}, Lcom/meicam/sdk/NvsStreamingContext;->getTimelineCurrentPosition(Lcom/meicam/sdk/NvsTimeline;)J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    iget-object v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    const-wide/16 v3, 0x3e8

    div-long/2addr v0, v3

    long-to-int v0, v0

    invoke-virtual {v2, v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->seek(I)V

    :cond_0
    iput-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mExportListener:Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;

    invoke-interface {p2}, Lcom/miui/gallery/movie/core/MovieManager$EncodeStateInterface;->onEncodeStart()V

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    new-instance v0, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvMovieManager$BfgObwHdZIh18TPYs4u00AwR_Pk;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/nvsdk/-$$Lambda$NvMovieManager$BfgObwHdZIh18TPYs4u00AwR_Pk;-><init>(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)V

    invoke-virtual {p2, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setCompileCallback2(Lcom/meicam/sdk/NvsStreamingContext$CompileCallback2;)V

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    new-instance v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager$1;-><init>(Lcom/miui/gallery/movie/nvsdk/NvMovieManager;)V

    invoke-virtual {p2, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setCompileCallback(Lcom/meicam/sdk/NvsStreamingContext$CompileCallback;)V

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mVideoHeight:I

    invoke-virtual {p2, v0}, Lcom/meicam/sdk/NvsStreamingContext;->setCustomCompileVideoHeight(I)V

    const/4 p2, 0x4

    invoke-direct {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->isDisableCompileRate()Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 p2, 0x6

    const/4 v9, 0x6

    goto :goto_0

    :cond_1
    const/4 v9, 0x4

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    const-wide/16 v2, 0x0

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {p2}, Lcom/meicam/sdk/NvsTimeline;->getDuration()J

    move-result-wide v4

    const/16 v7, 0x100

    const/4 v8, 0x2

    move-object v6, p1

    invoke-virtual/range {v0 .. v9}, Lcom/meicam/sdk/NvsStreamingContext;->compileTimeline(Lcom/meicam/sdk/NvsTimeline;JJLjava/lang/String;III)Z

    return-void
.end method

.method public getThumbnailImages()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/meicam/sdk/NvsMultiThumbnailSequenceView$ThumbnailSequenceDesc;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0}, Lcom/meicam/themehelper/NvsThemeHelper;->getThumbnailImages()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getTotalTime()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    invoke-virtual {v0}, Lcom/meicam/sdk/NvsTimeline;->getDuration()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public init(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mContext:Landroid/content/Context;

    invoke-static {}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getLibraryDirPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/meicam/sdk/NvsStreamingContext;->setNativeLibraryDirPath(Ljava/lang/String;)V

    move-object v0, p1

    check-cast v0, Landroid/app/Activity;

    const-string v1, "assets:/nv/nvsdk.lic"

    const/16 v2, 0x12

    invoke-static {v0, v1, v2}, Lcom/meicam/sdk/NvsStreamingContext;->init(Landroid/app/Activity;Ljava/lang/String;I)Lcom/meicam/sdk/NvsStreamingContext;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    new-instance v0, Lcom/meicam/sdk/NvsLiveWindowExt;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/meicam/sdk/NvsLiveWindowExt;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

    iput-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mDisplayView:Landroid/view/View;

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x3

    :goto_0
    invoke-static {v1}, Lcom/meicam/sdk/NvsStreamingContext;->setDebugLevel(I)V

    goto :goto_1

    :cond_1
    invoke-static {v1}, Lcom/meicam/sdk/NvsStreamingContext;->setDebugLevel(I)V

    :goto_1
    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->initTimeLine(Landroid/content/Context;)V

    return-void
.end method

.method public isSupportVideo(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mStreamingContext:Lcom/meicam/sdk/NvsStreamingContext;

    invoke-virtual {v0, p1}, Lcom/meicam/sdk/NvsStreamingContext;->getAVFileInfo(Ljava/lang/String;)Lcom/meicam/sdk/NvsAVFileInfo;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public moveImage(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p1, p2}, Lcom/meicam/themehelper/NvsThemeHelper;->moveClip(II)Z

    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->onPause()V

    const/4 v0, 0x1

    sput-boolean v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sIsPaused:Z

    invoke-super {p0}, Lcom/miui/gallery/movie/core/MovieManager;->onPause()V

    return-void
.end method

.method public onResume()V
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->sIsPaused:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mLiveWindow:Lcom/meicam/sdk/NvsLiveWindowExt;

    invoke-virtual {v0}, Lcom/meicam/sdk/NvsLiveWindowExt;->repaintVideoFrame()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->onResume()V

    invoke-super {p0}, Lcom/miui/gallery/movie/core/MovieManager;->onResume()V

    return-void
.end method

.method public pause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->pause()V

    return-void
.end method

.method public pauseOrResume()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->isResume()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mSeekIndex:I

    invoke-virtual {v1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->getTimelinePosition(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play(J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->resume()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->pause()V

    :goto_0
    return-void
.end method

.method public play()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mSeekIndex:I

    invoke-virtual {v1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->getTimelinePosition(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play(J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play()V

    :goto_0
    return-void
.end method

.method public removeImageAtIndex(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->deleteClip(I)Z

    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public removeStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->removeStateChangeListener(Lcom/miui/gallery/movie/core/MovieManager$StateChangeListener;)V

    return-void
.end method

.method public replay()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->replay()V

    return-void
.end method

.method public resetImage(Ljava/util/List;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/entity/ImageEntity;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p2}, Lcom/meicam/themehelper/NvsThemeHelper;->changeTimelineDuration(Z)Z

    iget-object p2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->parseClipFromFile(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->resetClip(Ljava/util/ArrayList;)Z

    return-void
.end method

.method public resume()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mSeekIndex:I

    invoke-virtual {v1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->getTimelinePosition(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->play(J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->resume()V

    :goto_0
    return-void
.end method

.method public seek(I)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->seek(I)V

    return-void
.end method

.method public seekToIndex(I)I
    .locals 4

    iput p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mSeekIndex:I

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->setThemeEnable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->getTimelinePosition(I)J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    long-to-int p1, v0

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mMovieController:Lcom/miui/gallery/movie/nvsdk/NvStateController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/nvsdk/NvStateController;->seek(I)V

    return p1
.end method

.method public setAudio(Lcom/miui/gallery/movie/entity/AudioResource;)V
    .locals 3

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/AudioResource;->getResType()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/AudioResource;->getResType()I

    move-result v0

    const/4 v2, 0x2

    if-ne v0, v2, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/AudioResource;->getDownloadSrcPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, v1}, Lcom/meicam/themehelper/NvsThemeHelper;->changeMusic(Ljava/lang/String;I)Z

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/AudioResource;->getDownloadSrcPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->changeMusic(Ljava/lang/String;I)Z

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    const/4 v0, 0x0

    const/4 v1, -0x1

    invoke-virtual {p1, v0, v1}, Lcom/meicam/themehelper/NvsThemeHelper;->changeMusic(Ljava/lang/String;I)Z

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public setInfo(Lcom/miui/gallery/movie/entity/MovieInfo;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget-object v1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mTimeline:Lcom/meicam/sdk/NvsTimeline;

    iget-object v3, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->imageList:Ljava/util/List;

    invoke-direct {p0, v3}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->parseClipFromFile(Ljava/util/List;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/meicam/themehelper/NvsThemeHelper;->initHelper(Landroid/content/Context;Lcom/meicam/sdk/NvsTimeline;Ljava/util/ArrayList;)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    const-string v1, "assets:/nv/defaultRhythm.json"

    const-string v2, "assets:/nv/defaultRhythm10s.json"

    invoke-virtual {v0, v1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->setDefaultRhythmPath(Ljava/lang/String;Ljava/lang/String;)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget-object v1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->title:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->changeCaptionText(Ljava/lang/String;I)Z

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    iget-object v1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->subTitle:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-virtual {v0, v1, v3}, Lcom/meicam/themehelper/NvsThemeHelper;->changeCaptionText(Ljava/lang/String;I)Z

    iget-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "movieAssetsNormal"

    iput-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    const-string v0, "movieAssetsNormal"

    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeAsset(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    iget-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    const-string v1, "Assets"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeAsset(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    iget-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/movie/ui/factory/TemplateFactory;->getTemplateDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeFile(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "movieAssetsNormal"

    iput-object v0, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->template:Ljava/lang/String;

    :cond_2
    :goto_0
    iget-boolean p1, p1, Lcom/miui/gallery/movie/entity/MovieInfo;->isShortVideo:Z

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {p1, v2}, Lcom/meicam/themehelper/NvsThemeHelper;->changeTimelineDuration(Z)Z

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public setIsShortVideo(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->changeTimelineDuration(Z)Z

    return-void
.end method

.method public setTemplate(Lcom/miui/gallery/movie/entity/TemplateResource;)V
    .locals 1

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/TemplateResource;->getSrcPath()Ljava/lang/String;

    move-result-object p1

    const-string v0, "movieAssetsNormal"

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeAsset(Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->applyThemeFile(Ljava/lang/String;)Z

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->replay()V

    return-void
.end method

.method public setThemeEnable(Z)V
    .locals 1

    iput-boolean p1, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeEnable:Z

    iget-object v0, p0, Lcom/miui/gallery/movie/nvsdk/NvMovieManager;->mThemeHelper:Lcom/meicam/themehelper/NvsThemeHelper;

    invoke-virtual {v0, p1}, Lcom/meicam/themehelper/NvsThemeHelper;->setThemeEnabled(Z)V

    return-void
.end method
