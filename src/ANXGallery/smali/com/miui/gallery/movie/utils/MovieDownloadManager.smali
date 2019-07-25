.class public Lcom/miui/gallery/movie/utils/MovieDownloadManager;
.super Ljava/lang/Object;
.source "MovieDownloadManager.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/movie/utils/MovieDownloadManager;


# instance fields
.field private mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;-><init>()V

    sput-object v0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->sInstance:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/movie/utils/MovieDownloadManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->sInstance:Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    return-object v0
.end method

.method public static synthetic lambda$downloadResource$117(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;ZLio/reactivex/ObservableEmitter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;

    invoke-direct {v0, p0, p1, p3}, Lcom/miui/gallery/movie/utils/MovieDownloadManager$2;-><init>(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;Lio/reactivex/ObservableEmitter;)V

    iget-object p3, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-virtual {p1}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p3, p1, v1, v0, p2}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;->download(Lcom/miui/gallery/net/resource/Resource;Ljava/lang/String;Lcom/miui/gallery/net/download/Request$Listener;Z)V

    return-void
.end method

.method static synthetic lambda$downloadResource$118(Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;Ljava/lang/Integer;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    if-eqz p0, :cond_0

    invoke-interface {p0, v1}, Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;->onCompleted(Z)V

    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-nez p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method static synthetic lambda$downloadResource$119(Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;Ljava/lang/Integer;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "MovieDownloadManager"

    const-string v1, "download %s :%d"

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/entity/MovieResource;->getDownloadFilePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/util/UnzipUtils;->unZipFile(Ljava/lang/String;)Z

    move-result p0

    if-eqz p1, :cond_0

    invoke-interface {p1, p0}, Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;->onCompleted(Z)V

    :cond_0
    return-void
.end method


# virtual methods
.method public cancelAll()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-virtual {v0}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;->cancelAll()V

    :cond_0
    return-void
.end method

.method public downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/net/resource/ResourceDownloadManager;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->mResourceDownloadManager:Lcom/miui/gallery/net/resource/ResourceDownloadManager;

    :cond_0
    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;->onStart()V

    :cond_1
    new-instance v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;

    invoke-direct {v0, p0, p1, p3}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$V2fKzthEkVbzgocLeR-7Ytbapxo;-><init>(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;Z)V

    invoke-static {v0}, Lio/reactivex/Observable;->create(Lio/reactivex/ObservableOnSubscribe;)Lio/reactivex/Observable;

    move-result-object p3

    new-instance v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$aQkf9PtLZZocazfUROwqcgIwPBI;

    invoke-direct {v0, p2}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$aQkf9PtLZZocazfUROwqcgIwPBI;-><init>(Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;)V

    invoke-virtual {p3, v0}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object p3

    invoke-static {}, Lio/reactivex/schedulers/Schedulers;->io()Lio/reactivex/Scheduler;

    move-result-object v0

    invoke-virtual {p3, v0}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p3

    new-instance v0, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$ZlthSabCRDUJGeKKRa9jztf6u9E;

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieDownloadManager$ZlthSabCRDUJGeKKRa9jztf6u9E;-><init>(Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;)V

    invoke-virtual {p3, v0}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method

.method public downloadResourceWithCheck(Landroid/app/Activity;Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;)V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_0

    const p2, 0x7f100490

    invoke-static {p1, p2}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;I)V

    const-string p1, "MovieDownloadManager"

    const-string p2, "download resource no network"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v6, Lcom/miui/gallery/movie/utils/MovieDownloadManager$1;

    invoke-direct {v6, p0, p2, p3}, Lcom/miui/gallery/movie/utils/MovieDownloadManager$1;-><init>(Lcom/miui/gallery/movie/utils/MovieDownloadManager;Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;)V

    invoke-virtual {p1}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100494

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100493

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f100487

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f10048e

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v1 .. v6}, Lcom/miui/gallery/ui/ConfirmDialog;->showConfirmDialog(Landroid/app/FragmentManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/ui/ConfirmDialog$ConfirmDialogInterface;)V

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    invoke-virtual {p0, p2, p3, p1}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;Z)V

    :goto_0
    return-void
.end method
