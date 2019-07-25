.class public Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;
.super Ljava/lang/Object;
.source "GallerySyncAdapterImpl.java"


# static fields
.field private static sSyncAdapters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/util/Pair<",
            "Ljava/lang/Long;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;",
            ">;>;>;"
        }
    .end annotation
.end field


# instance fields
.field mContext:Landroid/content/Context;

.field private mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x1

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PullSecretDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x4

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PullCardAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x8

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PullFaceDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PullShareAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x20

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PushOwnerDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x40

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PushCardAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x80

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PushFaceDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x100

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PushBabyInfoAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    sget-object v0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    new-instance v1, Landroid/util/Pair;

    const-wide/16 v2, 0x200

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-class v3, Lcom/miui/gallery/cloud/adapter/PushShareDataAdapter;

    invoke-direct {v1, v2, v3}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    return-void
.end method

.method private acquireLock()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    if-nez v0, :cond_0

    const-string v0, "GallerySyncAdapterImpl"

    invoke-static {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService;->newSyncLock(Ljava/lang/String;)Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;->acquire()V

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private static create(Landroid/content/Context;Ljava/lang/Class;)Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;",
            ">(",
            "Landroid/content/Context;",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    const/4 v0, 0x1

    :try_start_0
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Landroid/content/Context;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-virtual {p1, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object p1

    new-array v0, v0, [Ljava/lang/Object;

    aput-object p0, v0, v3

    invoke-virtual {p1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception p0

    invoke-virtual {p0}, Ljava/lang/InstantiationException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private doPostFirstSyncJob()V
    .locals 7

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getLastRequestSucceedTime()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    const/4 v2, 0x1

    if-gtz v6, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->doSync(Landroid/content/Context;)V

    new-instance v3, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    iget-object v4, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync(Z)Z

    move-result v3

    const-string v4, "GallerySyncAdapterImpl"

    const-string v5, "Request cloud control after first sync, result %s"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-static {v4, v5, v3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v3}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v3

    new-instance v4, Landroid/content/Intent;

    const-string v5, "com.miui.gallery.action.FIRST_SYNC_FINISHED"

    invoke-direct {v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->canAutoDownload()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-static {}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->getInstance()Lcom/miui/gallery/cloud/download/BatchDownloadManager;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v3, v4, v2}, Lcom/miui/gallery/cloud/download/BatchDownloadManager;->startBatchDownload(Landroid/content/Context;Z)V

    :cond_1
    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->statFirstSync(J)V

    return-void
.end method

.method private executeAdapter(Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)Lcom/miui/gallery/cloud/base/GallerySyncResult;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/miui/gallery/cloud/base/AbstractSyncAdapter<",
            "TT;>;",
            "Landroid/accounts/Account;",
            "Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/miui/gallery/cloud/base/GallerySyncResult<",
            "TT;>;"
        }
    .end annotation

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->isAsynchronous()Z

    invoke-virtual {p1, p2, p4, p3}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->startSync(Landroid/accounts/Account;Landroid/os/Bundle;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object p1

    return-object p1
.end method

.method private fetchSyncExtraInfoFromV2ToV3(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/client/ClientProtocolException;,
            Ljava/io/IOException;,
            Lorg/json/JSONException;,
            Ljava/net/URISyntaxException;,
            Ljavax/crypto/IllegalBlockSizeException;,
            Ljavax/crypto/BadPaddingException;,
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncFetchSyncExtraInfoFromV2ToV3()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/cloud/FetchSyncExtraInfoTask;

    iget-object v1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1, p1, p2}, Lcom/miui/gallery/cloud/FetchSyncExtraInfoTask;-><init>(Landroid/content/Context;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/FetchSyncExtraInfoTask;->run()V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->getSyncFetchSyncExtraInfoFromV2ToV3()Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "fail to fetch syncExtraInfo when upgrade from v2 to v3"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private handlePush(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v0, p1, p3}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->parsePushParams(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "sync_tag_type"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    const-string v2, "sync_tag_data"

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "GallerySyncAdapterImpl"

    const-string v4, "request caused by push: type[%s], data[%s]."

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-static {v3, v4, v5, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    const-string v3, "sync_data_exist"

    const/4 v4, 0x0

    invoke-virtual {v0, v3, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "push data[%s] exist, ignore!"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_0
    const-wide/16 v3, 0x0

    const/16 v5, 0xb

    if-eq v1, v5, :cond_2

    packed-switch v1, :pswitch_data_0

    const-string v1, "GallerySyncAdapterImpl"

    const-string v2, "unknown push %s"

    invoke-static {v1, v2, p3}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_0
    const-wide/16 v3, 0x10

    goto :goto_0

    :pswitch_1
    invoke-static {}, Lcom/miui/gallery/cloud/control/ServerTagCache;->getInstance()Lcom/miui/gallery/cloud/control/ServerTagCache;

    move-result-object p3

    invoke-virtual {p3, v2}, Lcom/miui/gallery/cloud/control/ServerTagCache;->contains(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_1

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "operation server tag, ignore push: %s"

    invoke-static {p1, p2, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    const-wide/16 v3, 0x1

    goto :goto_0

    :cond_2
    const-wide/16 v3, 0x8

    :goto_0
    const-string p3, "GallerySyncAdapterImpl"

    const-string v1, "request by push, sync reason[%s]"

    invoke-static {v3, v4}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v2

    invoke-static {p3, v1, v2}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-object p3, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p3, v3, v4}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->maskAdapters(Landroid/content/Context;J)Ljava/util/List;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;

    invoke-direct {p0, v1, p1, p2, v0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->executeAdapter(Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    goto :goto_1

    :cond_3
    :goto_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private handleRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)V
    .locals 7

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setFirstSyncStartTime(J)V

    :cond_0
    invoke-static {p3}, Lcom/miui/gallery/util/SyncUtil;->unpackSyncType(Landroid/os/Bundle;)Lcom/miui/gallery/cloud/base/SyncType;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;Z)V

    const-string v1, "sync_reason"

    const-wide v3, 0x7fffffffffffffffL

    invoke-virtual {p3, v1, v3, v4}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v3

    const-string v1, "GallerySyncAdapterImpl"

    const-string v5, "request caused by local: syncType[%s], reason[%s]."

    invoke-static {v3, v4}, Ljava/lang/Long;->toBinaryString(J)Ljava/lang/String;

    move-result-object v6

    invoke-static {v1, v5, v0, v6}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setLastSyncTimestamp(J)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/settingssync/GallerySettingsSyncHelper;->doSync(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v0, v3, v4}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->maskAdapters(Landroid/content/Context;J)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;

    invoke-static {}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->getInstance()Lcom/miui/gallery/cloud/syncstate/SyncStateManager;

    move-result-object v4

    invoke-virtual {v3}, Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;->getBindingReason()J

    move-result-wide v5

    invoke-virtual {v4, v5, v6}, Lcom/miui/gallery/cloud/syncstate/SyncStateManager;->unmergeReason(J)V

    invoke-direct {p0, v3, p1, p2, p3}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->executeAdapter(Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)Lcom/miui/gallery/cloud/base/GallerySyncResult;

    move-result-object v4

    instance-of v3, v3, Lcom/miui/gallery/cloud/adapter/PullOwnerDataAdapter;

    if-eqz v3, :cond_1

    if-eqz v4, :cond_2

    iget-object v1, v4, Lcom/miui/gallery/cloud/base/GallerySyncResult;->code:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    sget-object v3, Lcom/miui/gallery/cloud/base/GallerySyncCode;->OK:Lcom/miui/gallery/cloud/base/GallerySyncCode;

    if-ne v1, v3, :cond_2

    const/4 v1, 0x1

    goto :goto_1

    :cond_2
    const/4 v1, 0x0

    :goto_1
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    goto :goto_0

    :cond_3
    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->onPullOwnerEnd(Z)V

    :cond_4
    return-void
.end method

.method private static isPush(Landroid/os/Bundle;)Z
    .locals 1

    const-string v0, "pushName"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method private static maskAdapters(Landroid/content/Context;J)Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "J)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->sSyncAdapters:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/util/Pair;

    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Long;

    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    and-long/2addr v3, p1

    iget-object v5, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Long;

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    cmp-long v7, v3, v5

    if-nez v7, :cond_0

    iget-object v3, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Class;

    invoke-static {p0, v3}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->create(Landroid/content/Context;Ljava/lang/Class;)Lcom/miui/gallery/cloud/base/AbstractSyncAdapter;

    move-result-object v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    const-string v3, "GallerySyncAdapterImpl"

    const-string v4, "create instance error for %s"

    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method private onPullOwnerEnd(Z)V
    .locals 0

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setSyncCompletelyFinish(Z)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result p1

    if-nez p1, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sSetFirstSynced()V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->doPostFirstSyncJob()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setSyncCompletelyFinish(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method private static parsePushParams(Landroid/content/Context;Landroid/accounts/Account;Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 7

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "pushType"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "pushName"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "pushData"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v2, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->sSyncTagConstantsMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map$Entry;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;

    iget-object v4, v4, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagConstant;->pushName:Ljava/lang/String;

    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    const-string v4, "sync_tag_type"

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v4, "sync_tag_data"

    invoke-virtual {v0, v4, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    new-instance v5, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v5, v3}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;-><init>(I)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-static {p0, p1, v4}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->getSyncTag(Landroid/content/Context;Landroid/accounts/Account;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v3

    const-string v4, "sync_data_exist"

    const/4 v5, 0x0

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;

    iget-wide v5, v3, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils$SyncTagItem;->currentValue:J

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v3

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private recordSyncError(Ljava/lang/Throwable;)V
    .locals 2

    if-eqz p1, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "error"

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string v1, "sync_error_message"

    invoke-static {p1, v1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordErrorEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sIsFirstSynced()Z

    move-result p1

    if-nez p1, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->increaseFirstSyncFailCount()V

    :cond_0
    return-void
.end method

.method private releaseLock()V
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;->release()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mSyncLock:Lcom/miui/gallery/cloud/AsyncUpDownloadService$SyncLock;

    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public static resetAccountInfo(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 0

    invoke-static {p0, p1}, Lcom/miui/gallery/cloud/AccountCache;->update(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    const-string p0, "GallerySyncAdapterImpl"

    const-string p1, "reset AccountCache"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/cloud/GalleryKssManager;->reset()V

    const-string p0, "GallerySyncAdapterImpl"

    const-string p1, "reset GalleryKssManager"

    invoke-static {p0, p1}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private statFirstSync(J)V
    .locals 5

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getFirstSyncStartTime()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    cmp-long v2, v0, p1

    if-lez v2, :cond_0

    goto :goto_0

    :cond_0
    iget-object v2, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v2}, Lcom/miui/gallery/cloud/syncstate/SyncStateUtil;->getSyncedCount(Landroid/content/Context;)[I

    move-result-object v2

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sub-long/2addr p1, v0

    invoke-virtual {v3, p1, p2}, Ljava/util/concurrent/TimeUnit;->toMinutes(J)J

    move-result-wide p1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "image_count"

    const/4 v3, 0x0

    aget v3, v2, v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "video_count"

    const/4 v3, 0x1

    aget v2, v2, v3

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "time_in_minutes"

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "fail_count"

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getFirstSyncFailCount()I

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "Sync"

    const-string p2, "first_sync_duration"

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->clearFirstSyncFailCount()V

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "first sync finished: %s"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    :goto_0
    const-string v2, "GallerySyncAdapterImpl"

    const-string v3, "invalid first sync time, start: %d, finish: %d"

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-static {v2, v3, v0, p1}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method protected onPerformMiCloudSync(Landroid/os/Bundle;Landroid/accounts/Account;Landroid/content/SyncResult;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->acquireLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->start()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const/4 v2, 0x0

    const-wide/16 v3, 0x1

    if-eqz p2, :cond_5

    :try_start_0
    iget-object v5, p2, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_5

    iget-object v5, p2, Landroid/accounts/Account;->type:Ljava/lang/String;

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto/16 :goto_1

    :cond_0
    const/4 v5, 0x1

    invoke-static {v2, v5, v2}, Lcom/miui/gallery/cloud/CloudUtils;->checkAccount(Landroid/app/Activity;ZLjava/lang/Runnable;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "check account failed, return."

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Landroid/net/ParseException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    iget-object p1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->analyze()V

    invoke-static {}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountAfterSyncIfNeeded()V

    return-void

    :cond_1
    :try_start_1
    invoke-static {p2, p4}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->resetAccountInfo(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)V

    iget-object v5, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {v5, p2}, Lcom/miui/gallery/cloud/GalleryCloudSyncTagUtils;->insertAccountToDB(Landroid/content/Context;Landroid/accounts/Account;)V

    invoke-static {}, Lcom/miui/gallery/cloud/ServerErrorCode$MiCloudServerExceptionHandler;->checkMiCloudServerException()V

    const/4 v5, 0x0

    invoke-static {v5}, Lcom/miui/gallery/cloud/SyncConditionManager;->setCancelledForAllBackground(Z)V

    invoke-direct {p0, p2, p4}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->fetchSyncExtraInfoFromV2ToV3(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;)Z

    move-result v5

    if-nez v5, :cond_2

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "fetchSyncExtraInfoFromV2ToV3 Exit"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_5
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Landroid/net/ParseException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    iget-object p1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->analyze()V

    invoke-static {}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountAfterSyncIfNeeded()V

    return-void

    :cond_2
    :try_start_2
    invoke-static {}, Lcom/miui/gallery/cloud/ClearDataManager;->getInstance()Lcom/miui/gallery/cloud/ClearDataManager;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v5, v6, p2}, Lcom/miui/gallery/cloud/ClearDataManager;->clearDataBaseIfNeeded(Landroid/content/Context;Landroid/accounts/Account;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string v5, "GallerySyncAdapterImpl"

    const-string v6, "clear data before syncing"

    invoke-static {v5, v6}, Lcom/miui/gallery/util/SyncLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    invoke-static {p1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->isPush(Landroid/os/Bundle;)Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-direct {p0, p2, p4, p1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->handlePush(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)V

    goto :goto_0

    :cond_4
    invoke-direct {p0, p2, p4, p1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->handleRequest(Landroid/accounts/Account;Lcom/miui/gallery/cloud/base/GalleryExtendedAuthToken;Landroid/os/Bundle;)V

    :goto_0
    invoke-static {}, Lcom/miui/gallery/sdk/download/util/DownloadUtil;->resumeInterrupted()I
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/net/URISyntaxException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Landroid/net/ParseException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto/16 :goto_6

    :catchall_0
    move-exception p1

    goto/16 :goto_d

    :catch_0
    move-exception p1

    goto :goto_4

    :catch_1
    move-exception p1

    goto/16 :goto_7

    :catch_2
    move-exception p1

    goto/16 :goto_8

    :catch_3
    move-exception p1

    goto/16 :goto_9

    :catch_4
    move-exception p1

    goto/16 :goto_a

    :catch_5
    move-exception p1

    goto/16 :goto_b

    :cond_5
    :goto_1
    :try_start_3
    const-string p1, "GallerySyncAdapterImpl"

    const-string p4, "account: %s, name: %s, type %s, have none value, return."

    if-nez p2, :cond_6

    const-string v5, ""

    goto :goto_2

    :cond_6
    iget-object v5, p2, Landroid/accounts/Account;->name:Ljava/lang/String;

    :goto_2
    if-nez p2, :cond_7

    const-string v6, ""

    goto :goto_3

    :cond_7
    iget-object v6, p2, Landroid/accounts/Account;->type:Ljava/lang/String;

    :goto_3
    invoke-static {p1, p4, p2, v5, v6}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/net/URISyntaxException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Landroid/net/ParseException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    const-string p1, "GallerySyncAdapterImpl"

    const-string p2, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p3

    sub-long/2addr p3, v0

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    iget-object p1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->analyze()V

    invoke-static {}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountAfterSyncIfNeeded()V

    return-void

    :goto_4
    :try_start_4
    instance-of p2, p1, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-nez p2, :cond_8

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    :goto_5
    const-string p2, "GallerySyncAdapterImpl"

    invoke-static {p2, p1}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onSyncThrowable(Ljava/lang/Throwable;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->recordSyncError(Ljava/lang/Throwable;)V

    :goto_6
    iget-object p1, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/provider/GalleryDBHelper;->analyze()V

    invoke-static {}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountAfterSyncIfNeeded()V

    goto/16 :goto_c

    :cond_8
    :try_start_5
    move-object p2, p1

    check-cast p2, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;->getCloudServerException()Ljava/lang/Exception;

    move-result-object p2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    :try_start_6
    check-cast p1, Lcom/miui/gallery/cloud/GalleryMiCloudServerException;

    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception p1

    move-object v2, p2

    goto/16 :goto_d

    :goto_7
    :try_start_7
    iget-object p2, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J

    const/4 v5, 0x0

    add-long/2addr p3, v3

    iput-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto :goto_5

    :goto_8
    :try_start_8
    iget-object p2, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J

    const/4 v5, 0x0

    add-long/2addr p3, v3

    iput-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto :goto_5

    :goto_9
    :try_start_9
    iget-object p2, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p3, p2, Landroid/content/SyncStats;->numIoExceptions:J

    const/4 v5, 0x0

    add-long/2addr p3, v3

    iput-wide p3, p2, Landroid/content/SyncStats;->numIoExceptions:J
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto/16 :goto_5

    :goto_a
    :try_start_a
    iget-object p2, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J

    const/4 v5, 0x0

    add-long/2addr p3, v3

    iput-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto/16 :goto_5

    :goto_b
    :try_start_b
    iget-object p2, p3, Landroid/content/SyncResult;->stats:Landroid/content/SyncStats;

    iget-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J

    const/4 v5, 0x0

    add-long/2addr p3, v3

    iput-wide p3, p2, Landroid/content/SyncStats;->numParseExceptions:J
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long/2addr v2, v0

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    goto/16 :goto_5

    :goto_c
    return-void

    :goto_d
    const-string p2, "GallerySyncAdapterImpl"

    const-string p3, "perform sync finished, cost: %d"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    sub-long/2addr v3, v0

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p4

    invoke-static {p2, p3, p4}, Lcom/miui/gallery/util/SyncLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-direct {p0}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->releaseLock()V

    invoke-static {}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->getInstance()Lcom/miui/gallery/cloud/control/BatteryMonitor;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->end()V

    if-eqz v2, :cond_9

    const-string p2, "GallerySyncAdapterImpl"

    invoke-static {p2, v2}, Lcom/miui/gallery/util/SyncLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    move-result-object p2

    invoke-virtual {p2, v2}, Lcom/miui/gallery/cloud/control/SyncMonitor;->onSyncThrowable(Ljava/lang/Throwable;)V

    invoke-direct {p0, v2}, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->recordSyncError(Ljava/lang/Throwable;)V

    :cond_9
    iget-object p2, p0, Lcom/miui/gallery/cloud/GallerySyncAdapterImpl;->mContext:Landroid/content/Context;

    invoke-static {p2}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance(Landroid/content/Context;)Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object p2

    invoke-virtual {p2}, Lcom/miui/gallery/provider/GalleryDBHelper;->analyze()V

    invoke-static {}, Lcom/miui/gallery/cloud/DeleteAccount;->deleteAccountAfterSyncIfNeeded()V

    throw p1
.end method

.method public onSyncCanceled()V
    .locals 1

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/cloud/SyncConditionManager;->setCancelledForAllBackground(Z)V

    invoke-static {v0, v0}, Lcom/miui/gallery/cloud/UpDownloadManager;->cancelAllBackgroundPriority(ZZ)V

    return-void
.end method
