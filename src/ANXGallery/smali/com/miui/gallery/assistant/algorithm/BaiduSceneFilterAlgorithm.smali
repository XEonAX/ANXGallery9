.class public Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;
.super Lcom/miui/gallery/assistant/algorithm/Algorithm;
.source "BaiduSceneFilterAlgorithm.java"


# instance fields
.field private volatile mIsInitialized:Z


# direct methods
.method constructor <init>()V
    .locals 2

    const-wide/16 v0, 0x3ed

    invoke-direct {p0, v0, v1}, Lcom/miui/gallery/assistant/algorithm/Algorithm;-><init>(J)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->mIsInitialized:Z

    return-void
.end method


# virtual methods
.method protected onDestroyAlgorithm()V
    .locals 3

    :try_start_0
    invoke-static {}, Lcom/baidu/vis/ClassIfication/Predictor;->getInstance()Lcom/baidu/vis/ClassIfication/Predictor;

    invoke-static {}, Lcom/baidu/vis/ClassIfication/Predictor;->modelRelease()I

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->TAG:Ljava/lang/String;

    const-string v2, "Model release fail:%d"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_0
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense; {:try_start_0 .. :try_end_0} :catch_2
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$NotInit; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-virtual {v0}, Lcom/baidu/vis/ClassIfication/SDKExceptions$NotInit;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v0

    invoke-virtual {v0}, Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method protected onInitAlgorithm()Z
    .locals 3

    const/4 v0, 0x0

    :try_start_0
    invoke-static {}, Lcom/baidu/vis/ClassIfication/Predictor;->getInstance()Lcom/baidu/vis/ClassIfication/Predictor;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Gallery"

    invoke-static {v1, v2}, Lcom/baidu/vis/ClassIfication/Predictor;->init(Landroid/content/Context;Ljava/lang/String;)I
    :try_end_0
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$loadNativeLibraryError; {:try_start_0 .. :try_end_0} :catch_5
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$loadLicenseLibraryError; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3

    :try_start_1
    invoke-static {}, Lcom/miui/gallery/assistant/library/LibraryManager;->getInstance()Lcom/miui/gallery/assistant/library/LibraryManager;

    move-result-object v1

    const-string v2, "model.mlm"

    invoke-virtual {v1, v2}, Lcom/miui/gallery/assistant/library/LibraryManager;->getLibraryItemPath(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/util/FileUtils;->isFileExist(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static {}, Lcom/baidu/vis/ClassIfication/Predictor;->getInstance()Lcom/baidu/vis/ClassIfication/Predictor;

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/baidu/vis/ClassIfication/Predictor;->initModelWithPath(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->mIsInitialized:Z
    :try_end_1
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$NV21BytesLengthNotMatch; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    return v1

    :catch_0
    move-exception v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    return v0

    :catch_1
    move-exception v1

    invoke-virtual {v1}, Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception v1

    invoke-virtual {v1}, Lcom/baidu/vis/ClassIfication/SDKExceptions$NV21BytesLengthNotMatch;->printStackTrace()V

    :cond_0
    :goto_0
    return v0

    :catch_3
    move-exception v1

    invoke-virtual {p0, v1}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    return v0

    :catch_4
    move-exception v1

    iget-object v2, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0

    :catch_5
    move-exception v1

    iget-object v2, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->TAG:Ljava/lang/String;

    invoke-static {v2, v1}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    return v0
.end method

.method public declared-synchronized predict(Landroid/graphics/Bitmap;)Lcom/baidu/vis/ClassIfication/Response;
    .locals 1

    monitor-enter p0

    :try_start_0
    iget-boolean v0, p0, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->mIsInitialized:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    :try_start_1
    invoke-static {}, Lcom/baidu/vis/ClassIfication/Predictor;->getInstance()Lcom/baidu/vis/ClassIfication/Predictor;

    invoke-static {p1}, Lcom/baidu/vis/ClassIfication/Predictor;->predict(Ljava/lang/Object;)Lcom/baidu/vis/ClassIfication/Response;

    move-result-object p1
    :try_end_1
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense; {:try_start_1 .. :try_end_1} :catch_2
    .catch Lcom/baidu/vis/ClassIfication/SDKExceptions$NotInit; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catch_0
    move-exception p1

    :try_start_2
    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/algorithm/BaiduSceneFilterAlgorithm;->reportAlgorithmError(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception p1

    invoke-virtual {p1}, Lcom/baidu/vis/ClassIfication/SDKExceptions$NotInit;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p1

    invoke-virtual {p1}, Lcom/baidu/vis/ClassIfication/SDKExceptions$IlleagleLicense;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_0
    :goto_0
    const/4 p1, 0x0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method
