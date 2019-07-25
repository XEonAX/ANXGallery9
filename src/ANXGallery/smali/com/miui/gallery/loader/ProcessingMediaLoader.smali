.class public Lcom/miui/gallery/loader/ProcessingMediaLoader;
.super Landroid/content/AsyncTaskLoader;
.source "ProcessingMediaLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Ljava/util/List<",
        "Lcom/miui/gallery/provider/ProcessingMedia;",
        ">;>;"
    }
.end annotation


# static fields
.field private static sHasSpecialTypesProvider:Z = true


# instance fields
.field private mDataSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;"
        }
    .end annotation
.end field

.field private final mForceLoadContentObserver:Landroid/database/ContentObserver;

.field private mIsObserversRegistered:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    new-instance p1, Landroid/content/Loader$ForceLoadContentObserver;

    invoke-direct {p1, p0}, Landroid/content/Loader$ForceLoadContentObserver;-><init>(Landroid/content/Loader;)V

    iput-object p1, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mForceLoadContentObserver:Landroid/database/ContentObserver;

    return-void
.end method

.method private registerContentObservers()V
    .locals 4

    iget-boolean v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mIsObserversRegistered:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mIsObserversRegistered:Z

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-boolean v2, Lcom/miui/gallery/loader/ProcessingMediaLoader;->sHasSpecialTypesProvider:Z

    if-eqz v2, :cond_1

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/photosapi/PhotosOemApi;->getQueryProcessingUri(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mForceLoadContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    sput-boolean v0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->sHasSpecialTypesProvider:Z

    :cond_1
    :goto_0
    return-void
.end method

.method private unregisterContentObservers()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mIsObserversRegistered:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mIsObserversRegistered:Z

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mForceLoadContentObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->deliverResult(Ljava/util/List;)V

    return-void
.end method

.method public final deliverResult(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_2
    if-eqz v0, :cond_3

    if-eq v0, p1, :cond_3

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_3
    return-void
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->loadInBackground()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/provider/ProcessingMediaManager;->queryProcessingMedias()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected onAbandon()V
    .locals 0

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onAbandon()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->unregisterContentObservers()V

    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->onCanceled(Ljava/util/List;)V

    return-void
.end method

.method public final onCanceled(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/provider/ProcessingMedia;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_0
    return-void
.end method

.method protected final onReset()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->onStopLoading()V

    invoke-direct {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->unregisterContentObservers()V

    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    :cond_0
    return-void
.end method

.method protected final onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->deliverResult(Ljava/util/List;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/ProcessingMediaLoader;->mDataSet:Ljava/util/List;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->forceLoad()V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->registerContentObservers()V

    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/loader/ProcessingMediaLoader;->cancelLoad()Z

    return-void
.end method
