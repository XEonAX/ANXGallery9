.class public Lcom/miui/gallery/util/MovieLibraryLoaderHelper;
.super Ljava/lang/Object;
.source "MovieLibraryLoaderHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;,
        Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;
    }
.end annotation


# static fields
.field private static sInstance:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;


# instance fields
.field private mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;",
            ">;"
        }
    .end annotation
.end field

.field private mIsDownloading:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    invoke-direct {v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;-><init>()V

    sput-object v0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->sInstance:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->startDownloadWithCheckLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;ZI)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->refreshDownloadResult(ZI)V

    return-void
.end method

.method private doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$2;-><init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;)V

    invoke-virtual {v0, p1, p2, v1}, Lcom/miui/gallery/assistant/library/LibraryManager;->downloadLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/assistant/library/LibraryManager$DownloadListener;)Lcom/miui/gallery/threadpool/Future;

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/util/MovieLibraryLoaderHelper;
    .locals 1

    sget-object v0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->sInstance:Lcom/miui/gallery/util/MovieLibraryLoaderHelper;

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
    iget-boolean p1, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mIsDownloading:Z

    if-eqz p1, :cond_1

    const/4 p1, 0x1

    return p1

    :cond_1
    const/4 p1, 0x2

    return p1
.end method

.method static synthetic lambda$startDownloadWithCheckLibrary$11(Lio/reactivex/ObservableEmitter;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/util/OptionalResult;

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v1

    const-wide/16 v2, 0x3f3

    invoke-virtual {v1, v2, v3}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrarySync(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/OptionalResult;-><init>(Ljava/lang/Object;)V

    invoke-interface {p0, v0}, Lio/reactivex/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic lambda$startDownloadWithCheckLibrary$12(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;ZLcom/miui/gallery/util/OptionalResult;)V
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

    const-string p1, "MovieLibraryLoaderHelper"

    const-string p2, "getLibrarySync failed"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    const/4 p2, -0x2

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->refreshDownloadResult(ZI)V

    goto :goto_0

    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V

    :goto_0
    return-void
.end method

.method private onDownloading()V
    .locals 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mIsDownloading:Z

    iget-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

    invoke-interface {v1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;->onDownloading()V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private refreshDownloadResult(ZI)V
    .locals 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mIsDownloading:Z

    iget-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;

    invoke-interface {v1, p1, p2}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;->onFinish(ZI)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/movie/utils/MovieStatUtils;->statMovieLibraryDownloadResult(Z)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p2

    if-eqz p1, :cond_1

    const p1, 0x7f100563

    goto :goto_1

    :cond_1
    const p1, 0x7f100562

    :goto_1
    invoke-static {p2, p1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    return-void
.end method

.method private startDownloadWithCheck(Landroid/app/Activity;Lcom/miui/gallery/assistant/library/Library;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V
    .locals 8

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f100490

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string p1, "MovieLibraryLoaderHelper"

    const-string p2, "download sdk no network"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, -0x1

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->refreshDownloadResult(ZI)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v7, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;

    invoke-direct {v7, p0, p2, p3}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$1;-><init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Lcom/miui/gallery/assistant/library/Library;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100492

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100491

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100487

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f10048e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_1
    invoke-direct {p0, p2, v1, p3}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->startDownloadWithCheckLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V

    :goto_0
    return-void
.end method

.method private startDownloadWithCheckLibrary(Lcom/miui/gallery/assistant/library/Library;ZLcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V
    .locals 0

    if-eqz p3, :cond_0

    invoke-interface {p3}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;->onDownloadStart()V

    :cond_0
    if-nez p1, :cond_1

    sget-object p1, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4;->INSTANCE:Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$JqYlSH515W9VJVeXikiMLmIyjW4;

    invoke-static {p1}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {p3}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object p3

    invoke-virtual {p1, p3}, Lio/reactivex/Observable;->subscribeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    invoke-static {}, Lio/reactivex/android/schedulers/AndroidSchedulers;->mainThread()Lio/reactivex/Scheduler;

    move-result-object p3

    invoke-virtual {p1, p3}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance p3, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;

    invoke-direct {p3, p0, p2}, Lcom/miui/gallery/util/-$$Lambda$MovieLibraryLoaderHelper$i3En029MODiqSlzkyb1lBaIAsjk;-><init>(Lcom/miui/gallery/util/MovieLibraryLoaderHelper;Z)V

    invoke-virtual {p1, p3}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    goto :goto_0

    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->doDownloadLibrary(Lcom/miui/gallery/assistant/library/Library;Z)V

    :goto_0
    return-void
.end method


# virtual methods
.method public addDownloadStateListener(Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method

.method public checkAbleOrDownload(Landroid/app/Activity;)Z
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->checkAbleOrDownload(Landroid/app/Activity;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)Z

    move-result p1

    return p1
.end method

.method public checkAbleOrDownload(Landroid/app/Activity;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)Z
    .locals 3

    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    const-wide/16 v1, 0x3f3

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getLoaderState(Lcom/miui/gallery/assistant/library/Library;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->onDownloading()V

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->startDownloadWithCheck(Landroid/app/Activity;Lcom/miui/gallery/assistant/library/Library;Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStartListener;)V

    const/4 p1, 0x0

    return p1
.end method

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

    const-wide/16 v1, 0x3f3

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibrary(J)Lcom/miui/gallery/assistant/library/Library;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->getLoaderState(Lcom/miui/gallery/assistant/library/Library;)I

    move-result v0

    return v0
.end method

.method public removeDownloadStateListener(Lcom/miui/gallery/util/MovieLibraryLoaderHelper$DownloadStateListener;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/util/MovieLibraryLoaderHelper;->mDownloadStateListeners:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    :cond_0
    return-void
.end method
