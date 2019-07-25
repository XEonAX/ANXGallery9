.class public Lcom/miui/gallery/loader/AlbumSnapshotLoader;
.super Landroid/content/AsyncTaskLoader;
.source "AlbumSnapshotLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Ljava/util/List<",
        "Lcom/miui/gallery/model/Album;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mDataSet:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->deliverResult(Ljava/util/List;)V

    return-void
.end method

.method public final deliverResult(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    iput-object p1, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->isStarted()Z

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

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->loadInBackground()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v0

    const-class v1, Lcom/miui/gallery/model/Album;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, v2}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->query(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->onCanceled(Ljava/util/List;)V

    return-void
.end method

.method public final onCanceled(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
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

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->onStopLoading()V

    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    :cond_0
    return-void
.end method

.method protected final onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->deliverResult(Ljava/util/List;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->mDataSet:Ljava/util/List;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->forceLoad()V

    :cond_2
    return-void
.end method

.method protected onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/loader/AlbumSnapshotLoader;->cancelLoad()Z

    return-void
.end method
