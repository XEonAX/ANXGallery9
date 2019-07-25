.class public Lcom/miui/gallery/search/SearchStatusLoader;
.super Landroid/content/AsyncTaskLoader;
.source "SearchStatusLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;,
        Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/content/AsyncTaskLoader<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mBroadCastReceiver:Landroid/content/BroadcastReceiver;

.field private mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

.field private mHandler:Landroid/os/Handler;

.field private mLastStatus:I

.field private mStatusReportDelegateRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;",
            ">;"
        }
    .end annotation
.end field

.field private mUploadingObserver:Landroid/database/ContentObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mLastStatus:I

    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mHandler:Landroid/os/Handler;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mStatusReportDelegateRef:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public deliverResult(Ljava/lang/Integer;)V
    .locals 1

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mLastStatus:I

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/SearchStatusLoader;->deliverResult(Ljava/lang/Integer;)V

    return-void
.end method

.method public loadInBackground()Ljava/lang/Integer;
    .locals 6

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/SearchStatusLoader;->shouldReportStatus(I)Z

    move-result v1

    const/16 v2, 0xa

    const/4 v3, 0x3

    const/4 v4, 0x1

    const/4 v5, 0x4

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isActiveNetworkMetered()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p0, v4}, Lcom/miui/gallery/search/SearchStatusLoader;->shouldReportStatus(I)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/NetworkUtils;->isNetworkConnected()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v3}, Lcom/miui/gallery/search/SearchStatusLoader;->shouldReportStatus(I)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_2

    const/4 v0, 0x3

    goto :goto_0

    :cond_2
    invoke-virtual {p0, v5}, Lcom/miui/gallery/search/SearchStatusLoader;->shouldReportStatus(I)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_4

    :cond_3
    const/4 v0, 0x4

    goto :goto_0

    :cond_4
    invoke-virtual {p0, v2}, Lcom/miui/gallery/search/SearchStatusLoader;->shouldReportStatus(I)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->isGalleryCloudSyncable(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_3

    const/16 v0, 0xa

    goto :goto_0

    :cond_5
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->loadInBackground()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method protected onReset()V
    .locals 0

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->onStopLoading()V

    return-void
.end method

.method protected onStartLoading()V
    .locals 5

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onStartLoading()V

    iget v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mLastStatus:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    iget v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mLastStatus:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/SearchStatusLoader;->deliverResult(Ljava/lang/Integer;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;-><init>(Lcom/miui/gallery/search/SearchStatusLoader;Lcom/miui/gallery/search/SearchStatusLoader$1;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    new-instance v0, Landroid/content/IntentFilter;

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE_IMMEDIATE"

    invoke-direct {v0, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const-string v2, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    invoke-virtual {v2, v3, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mUploadingObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/search/SearchStatusLoader$1;

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mHandler:Landroid/os/Handler;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/search/SearchStatusLoader$1;-><init>(Lcom/miui/gallery/search/SearchStatusLoader;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mUploadingObserver:Landroid/database/ContentObserver;

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->UPLOAD_STATE_URI:Landroid/net/Uri;

    const/4 v3, 0x1

    iget-object v4, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mUploadingObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2, v3, v4}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_3

    new-instance v0, Lcom/miui/gallery/search/SearchStatusLoader$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/SearchStatusLoader$2;-><init>(Lcom/miui/gallery/search/SearchStatusLoader;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.miui.gallery.action.FIRST_SYNC_FINISHED"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v3, Landroid/content/IntentFilter;

    const-string v4, "com.miui.gallery.action.AI_ALBUM_SWITCH_CHANGE"

    invoke-direct {v3, v4}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->takeContentChanged()Z

    move-result v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mLastStatus:I

    if-ne v0, v1, :cond_5

    :cond_4
    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->forceLoad()V

    :cond_5
    return-void
.end method

.method protected onStopLoading()V
    .locals 3

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onStopLoading()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->cancelLoad()Z

    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    invoke-virtual {v0, v2}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mConnectivityReceiver:Lcom/miui/gallery/search/SearchStatusLoader$ConnectivityReceiver;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mUploadingObserver:Landroid/database/ContentObserver;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mUploadingObserver:Landroid/database/ContentObserver;

    invoke-virtual {v0, v2}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchStatusLoader;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v2}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    iput-object v1, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mBroadCastReceiver:Landroid/content/BroadcastReceiver;

    :cond_2
    return-void
.end method

.method protected shouldReportStatus(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mStatusReportDelegateRef:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchStatusLoader;->mStatusReportDelegateRef:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;->shouldReportStatus(I)Z

    move-result p1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 p1, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p1, 0x1

    :goto_2
    return p1
.end method
