.class public Lcom/miui/gallery/GalleryApp;
.super Lmiui/external/Application;
.source "GalleryApp.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/GalleryApp$ApplicationDelegate;
    }
.end annotation


# static fields
.field private static final BLOCK_MONITOR:Z

.field private static volatile sContext:Landroid/content/Context;


# instance fields
.field private mImageLoaderInitializer:Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    sget-boolean v0, Lcom/miui/os/Rom;->IS_ALPHA:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    const-string v0, "BLOCK_MONITOR"

    const/4 v2, 0x3

    invoke-static {v0, v2}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lcom/miui/gallery/GalleryApp;->BLOCK_MONITOR:Z

    sget-boolean v0, Lcom/miui/core/SdkHelper;->IS_MIUI:Z

    if-eqz v0, :cond_2

    sget-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x7

    goto :goto_1

    :cond_1
    const/4 v0, 0x2

    :goto_1
    invoke-static {v0}, Lcom/miui/gallery/util/Log;->setLogLevel(I)V

    sget-boolean v0, Lcom/miui/os/Rom;->IS_STABLE:Z

    xor-int/2addr v0, v1

    invoke-static {v0}, Lcom/miui/gallery/util/logger/TimingTracing;->setEnabled(Z)V

    goto :goto_2

    :cond_2
    const/4 v0, 0x6

    invoke-static {v0}, Lcom/miui/gallery/util/Log;->setLogLevel(I)V

    :goto_2
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lmiui/external/Application;-><init>()V

    new-instance v0, Lcom/miui/gallery/GalleryApp$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/GalleryApp$2;-><init>(Lcom/miui/gallery/GalleryApp;)V

    iput-object v0, p0, Lcom/miui/gallery/GalleryApp;->mImageLoaderInitializer:Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->initDataInUIThread()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->initDataInSubThread()V

    return-void
.end method

.method static synthetic access$200()Z
    .locals 1

    sget-boolean v0, Lcom/miui/gallery/GalleryApp;->BLOCK_MONITOR:Z

    return v0
.end method

.method static synthetic access$300(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->openBlockMonitor()V

    return-void
.end method

.method static synthetic access$400()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$500(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->doInitInSubThreadAtOnce()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/GalleryApp;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->doInitInSubThreadDelay()V

    return-void
.end method

.method private doInitInSubThreadAtOnce()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/GalleryApp;->mImageLoaderInitializer:Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;

    invoke-virtual {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;->preInitialize()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/GalleryApp;->mImageLoaderInitializer:Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;

    invoke-static {}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->getInstance()Lcom/miui/gallery/cloudcontrol/CloudControlManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlManager;->init(Landroid/content/Context;)V

    invoke-direct {p0, p0}, Lcom/miui/gallery/GalleryApp;->registerTimeChangedReceiver(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/util/deprecated/Preference;->sGetDefaultPreferences()Landroid/content/SharedPreferences;

    invoke-static {}, Lcom/miui/gallery/preference/PreferenceHelper;->getPreferences()Landroid/content/SharedPreferences;

    invoke-static {}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->getInstance()Lcom/miui/gallery/dao/GalleryLiteEntityManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/dao/GalleryLiteEntityManager;->warmUp()V

    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->isImageFeatureCalculationEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->getInstance()Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/cache/ImageFeatureCacheManager;->init()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/assistant/library/LibraryManager;->init(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/cloud/control/SyncMonitor;->getInstance()Lcom/miui/gallery/cloud/control/SyncMonitor;

    return-void
.end method

.method private doInitInSubThreadDelay()V
    .locals 5

    invoke-static {p0}, Lcom/miui/gallery/discovery/GalleryJobService;->scheduleJobs(Landroid/content/Context;)V

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-static {v1, v0, v1}, Lcom/miui/gallery/cloud/CloudUtils;->checkAccount(Landroid/app/Activity;ZLjava/lang/Runnable;)Z

    invoke-static {}, Lcom/miui/gallery/data/CitySearcher;->getInstance()Lcom/miui/gallery/data/CitySearcher;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/data/CitySearcher;->preLoadData()V

    const-string v1, "android.permission.WRITE_EXTERNAL_STORAGE"

    invoke-static {p0, v1}, Lcom/miui/gallery/permission/core/PermissionUtils;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    invoke-static {v1}, Lcom/miui/gallery/data/OldThumbnailTransferer;->transfer(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/util/OldCacheCleaner;->clean()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->getInstance()Lcom/miui/gallery/util/uil/PhotoReusedBitCache;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/util/uil/PhotoReusedBitCache;->initFirstCacheBitmap()V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getEverRefillLocalGroupId()Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {}, Lcom/miui/gallery/provider/GalleryDBHelper;->getInstance()Lcom/miui/gallery/provider/GalleryDBHelper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/provider/GalleryDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, v0, v2}, Lcom/miui/gallery/provider/GalleryDBHelper;->refillLocalGroupId(Landroid/database/sqlite/SQLiteDatabase;ZZ)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setEverRefillLocalGroupId()V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getEverSyncedSystemAlbum()Z

    move-result v0

    if-nez v0, :cond_2

    new-instance v0, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    invoke-direct {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;-><init>()V

    sget-object v1, Lcom/miui/gallery/cloud/base/SyncType;->NORMAL:Lcom/miui/gallery/cloud/base/SyncType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncType(Lcom/miui/gallery/cloud/base/SyncType;)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    const-wide/16 v1, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->setSyncReason(J)Lcom/miui/gallery/cloud/base/SyncRequest$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/base/SyncRequest$Builder;->build()Lcom/miui/gallery/cloud/base/SyncRequest;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/miui/gallery/util/SyncUtil;->requestSync(Landroid/content/Context;Lcom/miui/gallery/cloud/base/SyncRequest;)V

    :cond_2
    invoke-static {}, Lcom/miui/gallery/push/GalleryPushManager;->getInstance()Lcom/miui/gallery/push/GalleryPushManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/miui/gallery/push/GalleryPushManager;->registerPush(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CTA;->canConnectNetwork()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$CloudControl;->getLastRequestSucceedTime()J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0xf731400

    cmp-long v4, v0, v2

    if-ltz v4, :cond_3

    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object v2

    invoke-virtual {v2}, Lmiui/net/ConnectivityHelper;->isUnmeteredNetworkConnected()Z

    move-result v2

    if-eqz v2, :cond_3

    new-instance v0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    goto :goto_0

    :cond_3
    const-wide/32 v2, 0x240c8400

    cmp-long v4, v0, v2

    if-ltz v4, :cond_4

    invoke-static {}, Lmiui/net/ConnectivityHelper;->getInstance()Lmiui/net/ConnectivityHelper;

    move-result-object v0

    invoke-virtual {v0}, Lmiui/net/ConnectivityHelper;->isNetworkConnected()Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;

    invoke-direct {v0, p0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/miui/gallery/cloudcontrol/CloudControlRequestHelper;->execRequestSync()Z

    :cond_4
    :goto_0
    invoke-static {p0}, Lcom/miui/gallery/util/PrivacyAgreementUtils;->isCloudServiceAgreementEnable(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {p0}, Lcom/miui/gallery/cloud/receiver/CloudPrivacyAgreementDeniedReceiver;->onCloudPrivacyAgreementDenied(Landroid/content/Context;)V

    :cond_5
    invoke-static {}, Lcom/miui/gallery/video/editor/manager/SmartVideoGuideHelper;->init()V

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSupportNewVideoPlayer()Z

    return-void
.end method

.method private initDataInSubThread()V
    .locals 2

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/miui/gallery/GalleryApp$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/GalleryApp$4;-><init>(Lcom/miui/gallery/GalleryApp;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method

.method private initDataInUIThread()V
    .locals 3

    sget-object v0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/xiaomi/micloudsdk/request/utils/Request;->init(Landroid/content/Context;)V

    sget-object v0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/uil/CloudImageLoader;->init(Landroid/content/Context;)V

    iget-object v0, p0, Lcom/miui/gallery/GalleryApp;->mImageLoaderInitializer:Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;

    invoke-static {v0}, Lcom/nostra13/universalimageloader/core/ImageLoader;->setInitializer(Lcom/nostra13/universalimageloader/core/ImageLoader$Initializer;)V

    invoke-static {p0}, Lcom/miui/gallery/util/GalleryStatHelper;->init(Landroid/content/Context;)V

    invoke-direct {p0}, Lcom/miui/gallery/GalleryApp;->setupLeakCanary()V

    invoke-static {}, Lcom/miui/gallery/cloud/CloudReceiverRegister;->getInstance()Lcom/miui/gallery/cloud/CloudReceiverRegister;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/cloud/CloudReceiverRegister;->onAppCreate()V

    invoke-static {}, Lcom/miui/gallery/util/PreferenceCleaner;->clean()V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    new-instance v2, Lcom/miui/gallery/util/uil/CloudUriAdapter;

    invoke-direct {v2}, Lcom/miui/gallery/util/uil/CloudUriAdapter;-><init>()V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->init(Landroid/content/Context;Lcom/miui/gallery/sdk/uploadstatus/UriAdapter;)V

    invoke-static {}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getInstance()Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/sdk/uploadstatus/SyncProxy;->getUploadStatusProxy()Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/GalleryApp$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/GalleryApp$3;-><init>(Lcom/miui/gallery/GalleryApp;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy;->addUploadStatusChangedListener(Lcom/miui/gallery/sdk/uploadstatus/UploadStatusProxy$UploadStatusChangedListener;)V

    return-void
.end method

.method public static isEditorProcess()Z
    .locals 2

    const-string v0, "com.miui.gallery:photo_editor"

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v1

    invoke-static {v1}, Lmiui/os/ProcessUtils;->getProcessNameByPid(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private openBlockMonitor()V
    .locals 3

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    const-wide/16 v1, 0x96

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/monitor/LooperBlockDetector;->start(Landroid/os/Looper;J)V

    return-void
.end method

.method private registerTimeChangedReceiver(Landroid/content/Context;)V
    .locals 4

    new-instance v0, Lcom/miui/gallery/receiver/TimeChangedReceiver;

    invoke-direct {v0}, Lcom/miui/gallery/receiver/TimeChangedReceiver;-><init>()V

    const-string v1, "android.intent.action.TIME_SET"

    const-string v2, "android.intent.action.DATE_CHANGED"

    const-string v3, "android.intent.action.TIMEZONE_CHANGED"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/ReceiverUtils;->registerReceiver(Landroid/content/Context;Landroid/content/BroadcastReceiver;[Ljava/lang/String;)V

    return-void
.end method

.method public static sGetAndroidContext()Landroid/content/Context;
    .locals 1

    sget-object v0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    return-object v0
.end method

.method private setupLeakCanary()V
    .locals 0

    return-void
.end method


# virtual methods
.method public onCreateApplicationDelegate()Lmiui/external/ApplicationDelegate;
    .locals 1

    sput-object p0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    sget-object v0, Lcom/miui/gallery/GalleryApp;->sContext:Landroid/content/Context;

    invoke-static {v0}, Lcom/miui/gallery/util/StaticContext;->init(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/modules/ModulesRegister;->register()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->isEditorProcess()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate;

    invoke-direct {v0}, Lcom/miui/gallery/editor/photo/app/EditorApplicationDelegate;-><init>()V

    return-object v0

    :cond_0
    new-instance v0, Lcom/miui/gallery/GalleryApp$ApplicationDelegate;

    invoke-direct {v0, p0}, Lcom/miui/gallery/GalleryApp$ApplicationDelegate;-><init>(Lcom/miui/gallery/GalleryApp;)V

    return-object v0
.end method
