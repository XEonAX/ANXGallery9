.class public Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;
.super Ljava/lang/Object;
.source "SkyResourceDownloadHelper.java"


# static fields
.field private static SKY_RES_DIR:Ljava/lang/String; = "sky_res"

.field private static SKY_V1_DIR:Ljava/lang/String; = "filter_sky_v1"

.field private static sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;


# instance fields
.field private mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

.field private mIsDownloading:Z

.field private mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->refreshDownloading(I)V

    return-void
.end method

.method private downloadResource(Z)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->refreshDownloadStart()V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    :cond_0
    new-instance v0, Lcom/miui/gallery/net/resource/Resource;

    invoke-direct {v0}, Lcom/miui/gallery/net/resource/Resource;-><init>()V

    const-wide v1, 0x281843f55d0040L

    iput-wide v1, v0, Lcom/miui/gallery/net/resource/Resource;->id:J

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->getDownloadPath()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "file.zip"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;

    invoke-direct {v2, p0, v1, v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$vxgxV8kbswnf_kKYiql5OjcG3ow;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lcom/miui/gallery/net/resource/Resource;Z)V

    invoke-static {v2}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$EjJI6ukmgjewVbylr51bXCUuN2c;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$EjJI6ukmgjewVbylr51bXCUuN2c;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$fuVOmyj2hO7TorySt6W5mr7TT-c;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyResourceDownloadHelper$fuVOmyj2hO7TorySt6W5mr7TT-c;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;)V

    invoke-virtual {p1, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method private getDownloadPath()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/miui/gallery/util/StaticContext;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->SKY_RES_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;

    return-object v0
.end method

.method public static synthetic lambda$downloadResource$100(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/Integer;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->refreshDownloadResult(ZI)V

    return-void
.end method

.method public static synthetic lambda$downloadResource$98(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lcom/miui/gallery/net/resource/Resource;ZLio/reactivex/ObservableEmitter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;

    invoke-direct {v0, p0, p1, p4}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper$1;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Lio/reactivex/ObservableEmitter;)V

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-virtual {p4, p2, p1, v0, p3}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;->download(Lcom/miui/gallery/net/resource/Resource;Ljava/lang/String;Lcom/miui/gallery/net/download/Request$Listener;Z)V

    return-void
.end method

.method public static synthetic lambda$downloadResource$99(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/util/UnzipUtils;->unZipFile(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, -0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    :cond_0
    const-string p1, "SkyResourceDownloadHelper"

    const-string v0, "download %s :%d"

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->getDownloadPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object p2
.end method

.method private refreshDownloadResult(ZI)V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mIsDownloading:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    const/4 v1, 0x2

    invoke-interface {v0, v1, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onFinish(IZI)V

    :cond_0
    return-void
.end method

.method private refreshDownloadStart()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mIsDownloading:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    const/4 v1, 0x2

    invoke-interface {v0, v1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onDownloadStart(I)V

    :cond_0
    return-void
.end method

.method private refreshDownloading(I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    const/4 v1, 0x2

    invoke-interface {v0, v1, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onDownloading(II)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getSkyResPathV1()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->getDownloadPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->SKY_V1_DIR:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isResourceDownloaded()Z
    .locals 3

    new-instance v0, Ljava/io/File;

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->getDownloadPath()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->SKY_V1_DIR:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setDownloadStateListener(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    return-void
.end method

.method public startDownload(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->mIsDownloading:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyResourceDownloadHelper;->downloadResource(Z)V

    return-void
.end method
