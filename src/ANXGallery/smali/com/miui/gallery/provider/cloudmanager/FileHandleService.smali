.class public Lcom/miui/gallery/provider/cloudmanager/FileHandleService;
.super Lcom/miui/gallery/service/ServiceBase;
.source "FileHandleService.java"

# interfaces
.implements Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;
    }
.end annotation


# instance fields
.field private mNeedNotifyUri:Z

.field private volatile mServiceHandler:Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;

.field private volatile mServiceLooper:Landroid/os/Looper;

.field private mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/service/ServiceBase;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mNeedNotifyUri:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;[J)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->handleRecords([J)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->stopSelfIfComplete()V

    return-void
.end method

.method public static checkUnhandledMedias(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/Intent;

    const-string v1, "check_unhandled_media_ids"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v1, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-virtual {v0, p0, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    invoke-static {p0, v0}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static dispatchTask(Landroid/content/Context;Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)Z"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;

    invoke-static {p1}, Lcom/miui/gallery/util/Numbers;->toArray(Ljava/util/List;)[J

    move-result-object p1

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;-><init>(Landroid/content/Context;[J)V

    const/4 p1, 0x0

    invoke-virtual {v0, p1, p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleTask;->run(Landroid/database/sqlite/SQLiteDatabase;Lcom/miui/gallery/provider/cache/MediaManager;)[J

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->needNotifyUri([J)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->notifyUri(Landroid/content/Context;)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static execute(Landroid/content/Context;ZLjava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-static {p0, p2}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->dispatchTask(Landroid/content/Context;Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_1

    new-instance p1, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object p2, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    const-wide/16 v0, 0x231

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    goto :goto_0

    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-string v0, "dispatch_media_ids"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-class v0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;

    invoke-virtual {p1, p0, v0}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    const-string v0, "ids"

    invoke-static {p2}, Lcom/miui/gallery/util/Numbers;->toArray(Ljava/util/List;)[J

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[J)Landroid/content/Intent;

    invoke-static {p0, p1}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method

.method private handleRecords([J)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    invoke-direct {v0, p0, p0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;-><init>(Landroid/content/Context;Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor$FileHandleListener;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->submit([J)V

    return-void
.end method

.method private static needNotifyUri([J)Z
    .locals 9

    const/4 v0, 0x0

    if-eqz p0, :cond_3

    array-length v1, p0

    if-gtz v1, :cond_0

    goto :goto_2

    :cond_0
    array-length v1, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-wide v4, p0, v2

    const-wide/16 v6, 0x1

    cmp-long v8, v4, v6

    if-nez v8, :cond_1

    const/4 v4, 0x1

    goto :goto_1

    :cond_1
    const/4 v4, 0x0

    :goto_1
    or-int/2addr v3, v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return v3

    :cond_3
    :goto_2
    return v0
.end method

.method private static notifyUri(Landroid/content/Context;)V
    .locals 3

    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Cloud;->CLOUD_URI:Landroid/net/Uri;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {p0, v0, v2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OWNER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p0, v0, v2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI_OTHER_ALBUM_MEDIA:Landroid/net/Uri;

    invoke-virtual {p0, v0, v2, v1}, Landroid/content/ContentResolver;->notifyChange(Landroid/net/Uri;Landroid/database/ContentObserver;Z)V

    return-void
.end method

.method private stopSelfIfComplete()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->isCompleted()Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_0
    iget-boolean v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mNeedNotifyUri:Z

    if-eqz v0, :cond_1

    const-string v0, "CloudManager.FileHandleService"

    const-string v1, "Stop self and request sync"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const-wide/16 v1, 0x231

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->stopSelf()V

    :cond_2
    return-void
.end method


# virtual methods
.method protected getNotification()Landroid/app/Notification;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/NotificationHelper;->getEmptyNotification(Landroid/content/Context;)Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method protected getNotificationId()I
    .locals 1

    const/16 v0, 0x9

    return v0
.end method

.method public onAllTaskExecuted()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->stopSelfIfComplete()V

    return-void
.end method

.method public onCancel()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->stopSelfIfComplete()V

    return-void
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/service/ServiceBase;->onCreate()V

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CloudManager.FileHandleService"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceLooper:Landroid/os/Looper;

    new-instance v0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;

    iget-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceLooper:Landroid/os/Looper;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;-><init>(Lcom/miui/gallery/provider/cloudmanager/FileHandleService;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceHandler:Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/service/ServiceBase;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    const/4 v1, 0x0

    iput-object v1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mTaskExecutor:Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;

    invoke-virtual {v0}, Lcom/miui/gallery/provider/cloudmanager/FileTaskExecutor;->shutdown()V

    :cond_0
    return-void
.end method

.method public onRecordsHandled([J[J)V
    .locals 2

    if-eqz p1, :cond_2

    if-eqz p2, :cond_2

    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lcom/miui/gallery/provider/cloudmanager/MediaRemarkManager;->doneHandleFileForMediaIds([J)Z

    const-string p1, "CloudManager.FileHandleService"

    const-string v0, "On receive results [%s]"

    const-string v1, ","

    invoke-static {v1, p2}, Lcom/miui/gallery/util/StringUtils;->join(Ljava/lang/String;[J)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-static {p2}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->needNotifyUri([J)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "CloudManager.FileHandleService"

    const-string p2, "Need notify uri"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {p0}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->notifyUri(Landroid/content/Context;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mNeedNotifyUri:Z

    :cond_1
    return-void

    :cond_2
    :goto_0
    const-string v0, "CloudManager.FileHandleService"

    const-string v1, "Invalid results ids:%s, results:%s"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 0

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/service/ServiceBase;->onStartCommand(Landroid/content/Intent;II)I

    iget-object p2, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceHandler:Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;

    invoke-virtual {p2}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->obtainMessage()Landroid/os/Message;

    move-result-object p2

    iput p3, p2, Landroid/os/Message;->arg1:I

    iput-object p1, p2, Landroid/os/Message;->obj:Ljava/lang/Object;

    iget-object p1, p0, Lcom/miui/gallery/provider/cloudmanager/FileHandleService;->mServiceHandler:Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/provider/cloudmanager/FileHandleService$ServiceHandler;->sendMessage(Landroid/os/Message;)Z

    const/4 p1, 0x3

    return p1
.end method
