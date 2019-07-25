.class public Lcom/miui/gallery/util/deviceprovider/UploadStatusController;
.super Ljava/lang/Object;
.source "UploadStatusController.java"

# interfaces
.implements Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;


# static fields
.field private static sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;


# instance fields
.field private mCount:I

.field private volatile mHasPendingItem:Z

.field private final mLock:Ljava/lang/Object;

.field private final mUploadingItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mUploadingItems:Ljava/util/List;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mLock:Ljava/lang/Object;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    return-void
.end method

.method private accept(Lcom/miui/gallery/cloud/RequestItemBase;)Z
    .locals 2

    iget v0, p1, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    iget v0, p1, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_1

    iget v0, p1, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    iget p1, p1, Lcom/miui/gallery/cloud/RequestItemBase;->priority:I

    const/4 v0, 0x3

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method static synthetic access$000(Lcom/miui/gallery/util/deviceprovider/UploadStatusController;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mHasPendingItem:Z

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/util/deviceprovider/UploadStatusController;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mHasPendingItem:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/util/deviceprovider/UploadStatusController;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->refreshUploadStatus()V

    return-void
.end method

.method private checkPendingStatus()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController$1;-><init>(Lcom/miui/gallery/util/deviceprovider/UploadStatusController;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/miui/gallery/util/deviceprovider/UploadStatusController;
    .locals 3

    const-class v0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    if-nez v1, :cond_0

    new-instance v1, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    invoke-direct {v1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;-><init>()V

    sput-object v1, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    const/4 v1, 0x4

    invoke-static {v1}, Lcom/miui/gallery/cloud/UpDownloadManager;->instance(I)Lcom/miui/gallery/cloud/UpDownloadManager;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cloud/UpDownloadManager;->addOnItemChangedListener(Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V

    const/4 v1, 0x2

    invoke-static {v1}, Lcom/miui/gallery/cloud/UpDownloadManager;->instance(I)Lcom/miui/gallery/cloud/UpDownloadManager;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;

    invoke-virtual {v1, v2}, Lcom/miui/gallery/cloud/UpDownloadManager;->addOnItemChangedListener(Lcom/miui/gallery/cloud/thread/RequestCommandQueue$OnItemChangedListener;)V

    :cond_0
    sget-object v1, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->sThis:Lcom/miui/gallery/util/deviceprovider/UploadStatusController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private refreshUploadStatus()V
    .locals 5

    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    const-string v1, "is_upload"

    iget v2, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    const/4 v3, 0x1

    if-lez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    const-string v1, "has_pending_item"

    iget-boolean v2, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mHasPendingItem:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Boolean;)V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/provider/deprecated/GalleryCloudProvider;->UPLOAD_STATE_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v4, v4}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getDirtyCount(Landroid/content/Context;)Lcom/miui/gallery/cloud/syncstate/DirtyCount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/syncstate/DirtyCount;->getSyncableCount()I

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "UploadStatusController"

    const-string v1, "recover syncType"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->UNKNOW:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1, v3}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V

    :cond_1
    return-void
.end method


# virtual methods
.method public declared-synchronized end(Lcom/miui/gallery/cloud/RequestItemBase;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->accept(Lcom/miui/gallery/cloud/RequestItemBase;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {v0, p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;-><init>(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    iget-object p1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mUploadingItems:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->onUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public endUpload()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    add-int/lit8 v1, v1, -0x1

    iput v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    iget v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    if-nez v1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->refreshUploadStatus()V

    const-string v1, "UploadStatusController"

    const-string v2, "end upload"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getUploadStatus(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mUploadingItems:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return-object v1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public isPending()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mHasPendingItem:Z

    return v0
.end method

.method public isUploading()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public onAddItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->checkPendingStatus()V

    return-void
.end method

.method public onRemoveItem(Lcom/miui/gallery/cloud/RequestCloudItem;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->checkPendingStatus()V

    return-void
.end method

.method public declared-synchronized start(Lcom/miui/gallery/cloud/RequestItemBase;)V
    .locals 1

    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->accept(Lcom/miui/gallery/cloud/RequestItemBase;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance v0, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;

    check-cast p1, Lcom/miui/gallery/cloud/RequestCloudItem;

    invoke-direct {v0, p1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;-><init>(Lcom/miui/gallery/cloud/RequestCloudItem;)V

    iget-object p1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mUploadingItems:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    iget-object p1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mUploadingItems:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->onUploadStatusChanged(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusItem;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public startUpload()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    iget v1, p0, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->mCount:I

    if-ne v1, v2, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/util/deviceprovider/UploadStatusController;->refreshUploadStatus()V

    const-string v1, "UploadStatusController"

    const-string v2, "start upload"

    invoke-static {v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method
