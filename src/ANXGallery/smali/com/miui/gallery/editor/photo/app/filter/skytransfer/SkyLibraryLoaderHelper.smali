.class public Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;
.super Ljava/lang/Object;
.source "SkyLibraryLoaderHelper.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;


# instance fields
.field private mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

.field private mIsDownloading:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;-><init>()V

    sput-object v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->refreshDownloading(I)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;ZI)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->refreshDownloadResult(ZI)V

    return-void
.end method

.method private doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper$1;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->sInstance:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;

    return-object v0
.end method

.method private getLoaderState(Lcom/miui/gallery/assistant/library/Library;)I
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/library/Library;->getLibraryStatus()Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/assistant/library/Library$LibraryStatus;->STATE_AVAILABLE:Lcom/miui/gallery/assistant/library/Library$LibraryStatus;

    if-ne p1, v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mIsDownloading:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x2

    return p1
.end method

.method static synthetic lambda$startDownload$96(Lio/reactivex/ObservableEmitter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/OptionalResult;

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v1

    const-wide/16 v2, 0x3f4    # 5.0E-321

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrarySync(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/OptionalResult;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$startDownload$97(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;ZLcom/miui/gallery/util/OptionalResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p2}, Lcom/miui/gallery/util/OptionalResult;->getIncludeNull()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/assistant/library/Library;

    if-nez p2, :cond_0

    const-string p1, "SkyLibraryLoaderHelper"

    const-string p2, "getLibrarySync failed"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 p2, -0x2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->refreshDownloadResult(ZI)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V

    :goto_0
    return-void
.end method

.method private refreshDownloadResult(ZI)V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mIsDownloading:Z

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    const/4 v1, 0x1

    invoke-interface {v0, v1, p1, p2}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onFinish(IZI)V

    :cond_0
    return-void
.end method

.method private refreshDownloadStart()V
    .locals 2

    const-string v0, "SkyLibraryLoaderHelper"

    const-string v1, "refreshDownloadStart"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mIsDownloading:Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    invoke-interface {v1, v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onDownloadStart(I)V

    :cond_0
    return-void
.end method

.method private refreshDownloading(I)V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mIsDownloading:Z

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    invoke-interface {v1, v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;->onDownloading(II)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getLibraryDirPath()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/assistant/library/LibraryUtils;->getLibraryDirPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getLoaderState()I
    .locals 3

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    const-wide/16 v1, 0x3f4    # 5.0E-321

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->getLoaderState(Lcom/miui/gallery/assistant/library/Library;)I

    move-result v0

    return v0
.end method

.method public setDownloadStateListener(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->mDownloadStateListener:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyDownloadStateListener;

    return-void
.end method

.method public startDownload(Z)V
    .locals 3
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "CheckResult"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->refreshDownloadStart()V

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    const-wide/16 v1, 0x3f4    # 5.0E-321

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4;->INSTANCE:Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyLibraryLoaderHelper$qmL23Q1AG0OUmP05fSaJIcgKCK4;

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {v1}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyLibraryLoaderHelper$yy_d5SSdRIAMrO_QbquNFEln1yE;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/-$$Lambda$SkyLibraryLoaderHelper$yy_d5SSdRIAMrO_QbquNFEln1yE;-><init>(Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;Z)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_0
    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/editor/photo/app/filter/skytransfer/SkyLibraryLoaderHelper;->doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V

    :goto_0
    return-void
.end method
