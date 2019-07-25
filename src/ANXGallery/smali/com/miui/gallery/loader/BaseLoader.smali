.class public abstract Lcom/miui/gallery/loader/BaseLoader;
.super Landroid/content/AsyncTaskLoader;
.source "BaseLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Lcom/miui/gallery/model/BaseDataSet;",
        ">;"
    }
.end annotation


# instance fields
.field private mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

.field protected mDataSet:Lcom/miui/gallery/model/BaseDataSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public final deliverResult(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataSet;->release()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    iput-object p1, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/loader/BaseLoader;->mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/loader/BaseLoader;->mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

    invoke-interface {v1, p0, p1}, Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;->onLoadComplete(Lcom/miui/gallery/loader/BaseLoader;Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_3
    :goto_0
    if-eqz v0, :cond_4

    if-eq v0, p1, :cond_4

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->release()V

    :cond_4
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/BaseLoader;->deliverResult(Lcom/miui/gallery/model/BaseDataSet;)V

    return-void
.end method

.method public final onCanceled(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/model/BaseDataSet;->release()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->isStarted()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/loader/BaseLoader;->mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/loader/BaseLoader;->mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

    const/4 v0, 0x0

    invoke-interface {p1, p0, v0}, Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;->onLoadComplete(Lcom/miui/gallery/loader/BaseLoader;Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_1
    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/BaseLoader;->onCanceled(Lcom/miui/gallery/model/BaseDataSet;)V

    return-void
.end method

.method protected final onReset()V
    .locals 1

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->onStopLoading()V

    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {v0}, Lcom/miui/gallery/model/BaseDataSet;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    :cond_0
    return-void
.end method

.method protected final onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/BaseLoader;->deliverResult(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/BaseLoader;->mDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->forceLoad()V

    :cond_2
    return-void
.end method

.method protected final onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/loader/BaseLoader;->cancelLoad()Z

    return-void
.end method

.method public setBackgroundLoadListener(Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/loader/BaseLoader;->mBackgroundLoadListener:Lcom/miui/gallery/loader/BaseLoader$OnLoadCompleteListener;

    return-void
.end method
