.class public Lcom/miui/gallery/loader/DiscoveryMessageLoader;
.super Landroid/content/AsyncTaskLoader;
.source "DiscoveryMessageLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Ljava/util/ArrayList<",
        "Lcom/miui/gallery/model/DiscoveryMessage;",
        ">;>;"
    }
.end annotation


# instance fields
.field private mContentObserver:Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

.field private mContext:Landroid/content/Context;

.field private mDataSet:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation
.end field

.field private mMessageTypeMask:I


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContext:Landroid/content/Context;

    new-instance p1, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    invoke-direct {p1, p0, p2}, Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;-><init>(Lcom/miui/gallery/loader/DiscoveryMessageLoader;I)V

    iput-object p1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContentObserver:Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    iput p2, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mMessageTypeMask:I

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContentObserver:Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->registerContentObserver(Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->deliverResult(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final deliverResult(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->isStarted()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_2
    if-eqz v0, :cond_3

    if-eq v0, p1, :cond_3

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    :cond_3
    return-void
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->loadInBackground()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public loadInBackground()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContext:Landroid/content/Context;

    iget v2, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mMessageTypeMask:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->loadMessage(Landroid/content/Context;I)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected onAbandon()V
    .locals 2

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onAbandon()V

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContentObserver:Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->unregisterContentObserver(Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V

    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->onCanceled(Ljava/util/ArrayList;)V

    return-void
.end method

.method public final onCanceled(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/DiscoveryMessage;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    :cond_0
    return-void
.end method

.method protected final onReset()V
    .locals 2

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->onStopLoading()V

    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mContentObserver:Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->unregisterContentObserver(Lcom/miui/gallery/loader/DiscoveryMessageLoader$ForceLoadContentObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    :cond_0
    return-void
.end method

.method protected final onStartLoading()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->deliverResult(Ljava/util/ArrayList;)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->mDataSet:Ljava/util/ArrayList;

    if-nez v0, :cond_2

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/loader/DiscoveryMessageLoader;->forceLoad()V

    :cond_2
    return-void
.end method
