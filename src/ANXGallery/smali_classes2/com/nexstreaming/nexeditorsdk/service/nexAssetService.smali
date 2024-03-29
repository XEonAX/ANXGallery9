.class public Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;
.super Landroid/app/Service;
.source "nexAssetService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;
    }
.end annotation


# static fields
.field public static final ACTION_ASSET_FEATUREDLIST_COMPLETED:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.asset.feathredlist.completed"

.field public static final ACTION_ASSET_INSTALL_COMPLETED:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.asset.install.completed"

.field public static final ACTION_ASSET_UNINSTALL_COMPLETED:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.asset.uninstall.completed"

.field private static final ACTION_BIND:Ljava/lang/String; = "com.nexstreaming.nexeditorsdk.service.bind"

.field private static final TAG:Ljava/lang/String; = "nexAssetService"

.field private static final TYPE_BITMAP_DATA:I = 0x1

.field private static final TYPE_JSON_DATA:I

.field private static final sInstallThreadExcutor:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private checkReceivedFeaturedListAsyncTask:Landroid/os/AsyncTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/AsyncTask<",
            "Landroid/content/Context;",
            "Ljava/lang/Void;",
            "Ljava/lang/Void;",
            ">;"
        }
    .end annotation
.end field

.field private isRunningAsyncTask:Z

.field private volatile isUpdatedFeaturedList:Z

.field private volatile lastReceivedFeaturedListTime:J

.field private mCurrentAssetInfo:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

.field private mCurrentThumbnail:Landroid/graphics/Bitmap;

.field private mFileOutputStream:Ljava/io/FileOutputStream;

.field private mReceivedDataSize:J

.field private nexAssetService:Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->sInstallThreadExcutor:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$2;

    invoke-direct {v0, p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$2;-><init>(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)V

    iput-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->nexAssetService:Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;

    return-void
.end method

.method static synthetic access$000(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)J
    .locals 2

    iget-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->lastReceivedFeaturedListTime:J

    return-wide v0
.end method

.method static synthetic access$100(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isUpdatedFeaturedList:Z

    return p0
.end method

.method static synthetic access$102(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isUpdatedFeaturedList:Z

    return p1
.end method

.method static synthetic access$202(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isRunningAsyncTask:Z

    return p1
.end method

.method static synthetic access$300(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;ILjava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3, p4}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onConnectionInstaller(ILjava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;)V

    return-void
.end method

.method static synthetic access$400(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;ILjava/lang/String;IJLcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V
    .locals 0

    invoke-direct/range {p0 .. p6}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onReceivedAssetData(ILjava/lang/String;IJLcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V

    return-void
.end method

.method static synthetic access$500(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;ILcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onUninstallAsset(ILcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;)V

    return-void
.end method

.method static synthetic access$600(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onLoadInstalledAssetList(Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;)V

    return-void
.end method

.method static synthetic access$700(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;IILjava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->onReceivedAssetInfoData(IILjava/lang/String;)V

    return-void
.end method

.method private installAsset(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V
    .locals 7

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    if-eqz p3, :cond_0

    if-eqz p4, :cond_0

    new-instance v0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;

    move-object v1, v0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V

    sget-object p1, Landroid/os/AsyncTask;->SERIAL_EXECUTOR:Ljava/util/concurrent/Executor;

    const/4 p2, 0x0

    new-array p2, p2, [Ljava/lang/Void;

    invoke-virtual {v0, p1, p2}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$a;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    :cond_0
    const-string p2, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "installAsset fail!="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p4, :cond_1

    :try_start_0
    iget p1, p3, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;->idx:I

    const-string p2, "component not found!"

    invoke-interface {p4, p1, p2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;->onInstallFailed(ILjava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_1
    :goto_0
    return-void
.end method

.method private onConnectionInstaller(ILjava/lang/String;Ljava/lang/String;Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;)V
    .locals 2

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    if-eqz p4, :cond_0

    const/4 v0, 0x0

    invoke-static {p2, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p2

    array-length v1, p2

    invoke-static {p2, v0, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentThumbnail:Landroid/graphics/Bitmap;

    const-string p2, "nexAssetService"

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onConnectionInstaller: make bitmap completed "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentThumbnail:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    new-instance p2, Lcom/google/gson_nex/Gson;

    invoke-direct {p2}, Lcom/google/gson_nex/Gson;-><init>()V

    const-class v0, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    invoke-virtual {p2, p3, v0}, Lcom/google/gson_nex/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iput-object p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentAssetInfo:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    const-string p2, "nexAssetService"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onConnectionInstaller: convert Asset completed "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentAssetInfo:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_0
    invoke-interface {p4, p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetConnectionCallback;->onConnectionCompleted(I)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    invoke-virtual {p1}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private onLoadInstalledAssetList(Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;)V
    .locals 18

    move-object/from16 v1, p0

    move-object/from16 v0, p1

    if-eqz v0, :cond_6

    const-string v2, "nexAssetService"

    const-string v3, "internalLoadInstallAssetList() called"

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-static/range {p0 .. p0}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstance(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    move-result-object v2

    invoke-virtual {v2}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getAssetInstalledDownloadItemItems()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_5

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;

    invoke-static/range {p0 .. p0}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/assetpackage/c;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/c;->a(Lcom/nexstreaming/app/common/nexasset/assetpackage/b;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "nexAssetService"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "expire Asset Idx="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetIdx()I

    move-result v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetIdx()I

    move-result v7

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetId()Ljava/lang/String;

    move-result-object v8

    const-string v5, ""

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetName()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetName()Ljava/util/Map;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/nexstreaming/app/common/util/n;->a(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    :cond_1
    move-object v9, v5

    const-string v5, ""

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/a;

    move-result-object v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/a;

    move-result-object v5

    invoke-interface {v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/a;->getCategoryAlias()Ljava/lang/String;

    move-result-object v5

    :cond_2
    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetSubCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/d;

    move-result-object v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetSubCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/d;

    move-result-object v5

    invoke-interface {v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/d;->getSubCategoryAlias()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetSubCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/d;

    move-result-object v6

    invoke-interface {v6}, Lcom/nexstreaming/app/common/nexasset/assetpackage/d;->getSubCategoryName()Ljava/util/Map;

    move-result-object v6

    if-eqz v6, :cond_3

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getAssetSubCategory()Lcom/nexstreaming/app/common/nexasset/assetpackage/d;

    move-result-object v5

    invoke-interface {v5}, Lcom/nexstreaming/app/common/nexasset/assetpackage/d;->getSubCategoryName()Ljava/util/Map;

    move-result-object v5

    invoke-static {v1, v5}, Lcom/nexstreaming/app/common/util/n;->a(Landroid/content/Context;Ljava/util/Map;)Ljava/lang/String;

    move-result-object v5

    :cond_3
    move-object v10, v5

    new-instance v5, Lcom/nexstreaming/nexeditorsdk/service/NexInstalledAssetItem;

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getThumbUrl()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getInstalledTime()J

    move-result-wide v12

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getExpireTime()J

    move-result-wide v14

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getMinVersion()I

    move-result v16

    invoke-interface {v4}, Lcom/nexstreaming/app/common/nexasset/assetpackage/b;->getPackageVersion()I

    move-result v17

    move-object v6, v5

    invoke-direct/range {v6 .. v17}, Lcom/nexstreaming/nexeditorsdk/service/NexInstalledAssetItem;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJII)V

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0

    :cond_4
    new-instance v2, Lcom/google/gson_nex/Gson;

    invoke-direct {v2}, Lcom/google/gson_nex/Gson;-><init>()V

    invoke-virtual {v2, v3}, Lcom/google/gson_nex/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :try_start_0
    invoke-interface {v0, v2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;->onLoadAssetDatas(Ljava/lang/String;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    goto :goto_1

    :cond_5
    const/4 v2, 0x0

    :try_start_1
    invoke-interface {v0, v2}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetDataCallback;->onLoadAssetDatas(Ljava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Landroid/os/RemoteException;->printStackTrace()V

    :cond_6
    :goto_1
    return-void
.end method

.method private onReceivedAssetData(ILjava/lang/String;IJLcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V
    .locals 4

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    sget-object v1, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, ".zip"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    int-to-long v2, p3

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    const/4 v0, 0x0

    invoke-static {p2, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p2

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mFileOutputStream:Ljava/io/FileOutputStream;

    if-nez v1, :cond_0

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :try_start_0
    new-instance v2, Ljava/io/FileOutputStream;

    invoke-direct {v2, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    iput-object v2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mFileOutputStream:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :cond_0
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mFileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {v1, p2, v0, p3}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p2

    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    iget-wide p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    cmp-long v0, p2, p4

    if-nez v0, :cond_1

    const-string p2, "nexAssetService"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "onReceivedAssetData: Received Completed size "

    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide p4, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    invoke-virtual {p3, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_2
    const-string p2, "nexAssetService"

    const-string p3, "onReceivedAssetData: try close stream "

    invoke-static {p2, p3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mFileOutputStream:Ljava/io/FileOutputStream;

    invoke-virtual {p2}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_2

    :catch_2
    move-exception p2

    const-string p3, "nexAssetService"

    const-string p4, "onReceivedAssetData: fileOutputStream close error"

    invoke-static {p3, p4, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_2
    iget-object p2, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentThumbnail:Landroid/graphics/Bitmap;

    iget-object p3, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentAssetInfo:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    invoke-direct {p0, p1, p2, p3, p6}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->installAsset(Ljava/lang/String;Landroid/graphics/Bitmap;Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;Lcom/nexstreaming/nexeditorsdk/service/INexAssetInstallCallback;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mFileOutputStream:Ljava/io/FileOutputStream;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentAssetInfo:Lcom/nexstreaming/app/common/nexasset/store/json/AssetStoreAPIData$AssetInfo;

    iput-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mCurrentThumbnail:Landroid/graphics/Bitmap;

    const-wide/16 p1, 0x0

    iput-wide p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->mReceivedDataSize:J

    :cond_1
    return-void
.end method

.method private onReceivedAssetInfoData(IILjava/lang/String;)V
    .locals 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->lastReceivedFeaturedListTime:J

    if-eqz p3, :cond_2

    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    invoke-virtual {p3}, Ljava/lang/String;->getBytes()[B

    move-result-object p1

    invoke-static {p1, v0}, Landroid/util/Base64;->decode([BI)[B

    move-result-object p1

    array-length p3, p1

    invoke-static {p1, v0, p3}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->saveFeaturedThumbnail(ILandroid/graphics/Bitmap;)V

    const-string p1, "nexAssetService"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onReceivedAssetInfoData: bitmap index : "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :pswitch_1
    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isRunningAsyncTask:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isRunningAsyncTask:Z

    iput-boolean v0, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isUpdatedFeaturedList:Z

    new-instance v1, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;

    invoke-direct {v1, p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService$1;-><init>(Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;)V

    iput-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->checkReceivedFeaturedListAsyncTask:Landroid/os/AsyncTask;

    iget-object v1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->checkReceivedFeaturedListAsyncTask:Landroid/os/AsyncTask;

    sget-object v2, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->sInstallThreadExcutor:Ljava/util/concurrent/ExecutorService;

    const/4 v3, 0x3

    new-array v3, v3, [Landroid/content/Context;

    aput-object p0, v3, v0

    const/4 v0, 0x0

    aput-object v0, v3, p1

    const/4 p1, 0x2

    aput-object v0, v3, p1

    invoke-virtual {v1, v2, v3}, Landroid/os/AsyncTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    :cond_0
    iget-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isUpdatedFeaturedList:Z

    if-nez p1, :cond_1

    invoke-static {p2, p3}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->isUpdatedFeaturedList(ILjava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->isUpdatedFeaturedList:Z

    :cond_1
    invoke-static {p2, p3}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->saveFeaturedList(ILjava/lang/String;)V

    const-string p1, "nexAssetService"

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "onReceivedAssetInfoData: featuredAsset ="

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    :goto_0
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onUninstallAsset(ILcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;)V
    .locals 3

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->getAssetPackageManager(Landroid/content/Context;)Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/nexeditorsdk/nexAssetPackageManager;->putUninstallItem(I)V

    :try_start_0
    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->getInstance(Landroid/content/Context;)Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/nexstreaming/app/common/nexasset/store/AssetLocalInstallDB;->uninstallPackage(I)I

    invoke-interface {p2, p1}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;->onUninstallCompleted(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "nexAssetService"

    const-string v2, "onUninstallAsset: error "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p2, p1, v0}, Lcom/nexstreaming/nexeditorsdk/service/INexAssetUninstallCallback;->onUninstallFailed(ILjava/lang/String;)V
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception p2

    const-string v0, "nexAssetService"

    const-string v1, "onUninstallAsset: "

    invoke-static {v0, v1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_0
    new-instance p2, Landroid/content/Intent;

    const-string v0, "com.nexstreaming.nexeditorsdk.asset.uninstall.completed"

    invoke-direct {p2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string v0, "index"

    invoke-virtual {p2, v0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    invoke-virtual {p0, p2}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->sendBroadcast(Landroid/content/Intent;)V

    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 3

    const-string v0, "nexAssetService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onBind() called with: intent = ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    const-string v1, "com.nexstreaming.nexeditorsdk.service.bind"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    invoke-virtual {p0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "com.nexstreaming.app.assetstore.sdk.service.bind"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ".AssetStoreService"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->setClassName(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "nexAssetService"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onBind: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p0, v0}, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    iget-object p1, p0, Lcom/nexstreaming/nexeditorsdk/service/nexAssetService;->nexAssetService:Lcom/nexstreaming/nexeditorsdk/service/INexAssetService$Stub;

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method public onCreate()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    const-string v0, "nexAssetService"

    const-string v1, "onCreate() called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const-string v0, "nexAssetService"

    const-string v1, "onDestroy() called"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public onTaskRemoved(Landroid/content/Intent;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/app/Service;->onTaskRemoved(Landroid/content/Intent;)V

    const-string p1, "nexAssetService"

    const-string v0, "onTaskRemoved() called"

    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
