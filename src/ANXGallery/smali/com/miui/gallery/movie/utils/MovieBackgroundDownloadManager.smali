.class public Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;
.super Ljava/lang/Object;
.source "MovieBackgroundDownloadManager.java"


# static fields
.field private static sInstance:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;


# instance fields
.field private mTemplateResources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/movie/entity/TemplateResource;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    invoke-direct {v0}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;-><init>()V

    sput-object v0, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->sInstance:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;
    .locals 1

    sget-object v0, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->sInstance:Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;

    return-object v0
.end method

.method private getTemplateResourceFromNameSync(Ljava/lang/String;)Lcom/miui/gallery/movie/entity/TemplateResource;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->mTemplateResources:Ljava/util/List;

    if-nez v0, :cond_2

    :try_start_0
    new-instance v1, Lcom/miui/gallery/movie/net/TemplateResourceRequest;

    invoke-direct {v1}, Lcom/miui/gallery/movie/net/TemplateResourceRequest;-><init>()V

    invoke-virtual {v1}, Lcom/miui/gallery/movie/net/TemplateResourceRequest;->executeSync()[Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_0

    array-length v2, v1

    if-lez v2, :cond_0

    const/4 v2, 0x0

    aget-object v3, v1, v2

    instance-of v3, v3, Ljava/util/List;

    if-eqz v3, :cond_0

    aget-object v1, v1, v2

    check-cast v1, Ljava/util/List;

    move-object v0, v1

    :cond_0
    const-string v1, "MovieBackgroundDownloadManager"

    const-string v2, "getTemplateList %d "

    if-nez v0, :cond_1

    const/4 v3, -0x1

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v3

    :goto_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/miui/gallery/net/base/RequestError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    const-string v1, "MovieBackgroundDownloadManager"

    const-string v2, "RequestError: getTemplateList"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    :goto_1
    const/4 v1, 0x0

    if-nez v0, :cond_3

    const-string p1, "MovieBackgroundDownloadManager"

    const-string v2, "template resource is null"

    invoke-static {p1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_4
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/movie/entity/TemplateResource;

    iget-object v4, v3, Lcom/miui/gallery/movie/entity/TemplateResource;->nameKey:Ljava/lang/String;

    invoke-static {v4, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_4

    move-object v1, v3

    goto :goto_2

    :cond_5
    :goto_3
    iput-object v0, p0, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->mTemplateResources:Ljava/util/List;

    return-object v1
.end method

.method static synthetic lambda$downloadTemplate$112(Ljava/lang/Integer;)Ljava/lang/String;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    invoke-static {p0}, Lcom/miui/gallery/movie/ui/factory/MovieFactory;->getTemplateNameById(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/movie/ui/factory/MovieFactory;->getParentTemplateName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$downloadTemplate$113(Ljava/lang/String;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "movieAssetsNormal"

    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_1

    invoke-static {p0}, Lcom/miui/gallery/movie/ui/factory/TemplateFactory;->getTemplateDir(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    if-eqz v0, :cond_2

    const-string v2, "MovieBackgroundDownloadManager"

    const-string v3, "template %s is already exist"

    invoke-static {v2, v3, p0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_2
    xor-int/lit8 p0, v0, 0x1

    return p0
.end method

.method public static synthetic lambda$downloadTemplate$114(Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;Ljava/lang/String;)Lcom/miui/gallery/movie/entity/TemplateResource;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-direct {p0, p1}, Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;->getTemplateResourceFromNameSync(Ljava/lang/String;)Lcom/miui/gallery/movie/entity/TemplateResource;

    move-result-object p1

    return-object p1
.end method

.method static synthetic lambda$downloadTemplate$115(Lcom/miui/gallery/movie/entity/TemplateResource;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static synthetic lambda$downloadTemplate$116(Lcom/miui/gallery/movie/entity/TemplateResource;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const-string v0, "MovieBackgroundDownloadManager"

    const-string v1, "start download %s in background"

    iget-object v2, p0, Lcom/miui/gallery/movie/entity/TemplateResource;->nameKey:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->getInstance()Lcom/miui/gallery/movie/utils/MovieDownloadManager;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {v0, p0, v1, v2}, Lcom/miui/gallery/movie/utils/MovieDownloadManager;->downloadResource(Lcom/miui/gallery/movie/entity/MovieResource;Lcom/miui/gallery/movie/ui/listener/MovieDownloadListener;Z)V

    return-void
.end method


# virtual methods
.method public downloadTemplate(Landroid/content/Context;I)V
    .locals 1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_0

    const-string p1, "MovieBackgroundDownloadManager"

    const-string v0, "download templateId %d no network"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_0
    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "MovieBackgroundDownloadManager"

    const-string v0, "download templateId %d in network metered"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, v0, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    invoke-static {p1}, Lcom/miui/gallery/movie/MovieConfig;->init(Landroid/content/Context;)V

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p1}, Lio/reactivex/Observable;->just(Ljava/lang/Object;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    invoke-static {p2}, Lio/reactivex/schedulers/Schedulers;->from(Ljava/util/concurrent/Executor;)Lio/reactivex/Scheduler;

    move-result-object p2

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$yfKRgHsbnL_dX5G5jiDqPey0b20;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$gHz-GdQnrurndwOhmRhtu6DMKEM;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$gHz-GdQnrurndwOhmRhtu6DMKEM;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$qsLC51gQO_E0E-v_qry8XFnjA_s;

    invoke-direct {p2, p0}, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$qsLC51gQO_E0E-v_qry8XFnjA_s;-><init>(Lcom/miui/gallery/movie/utils/MovieBackgroundDownloadManager;)V

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$KLrQYZSJxvxhuGVp6lqQt-EHBYY;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->filter(Lio/reactivex/functions/Predicate;)Lio/reactivex/Observable;

    move-result-object p1

    sget-object p2, Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;->INSTANCE:Lcom/miui/gallery/movie/utils/-$$Lambda$MovieBackgroundDownloadManager$d1WYRnrowXpHZl7121-PcaoY4oM;

    invoke-virtual {p1, p2}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    return-void
.end method
