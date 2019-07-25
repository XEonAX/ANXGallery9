.class public Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;
.super Lcom/miui/gallery/assistant/process/BaseImageTask;
.source "ExistImageFeatureTask.java"


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;-><init>(I)V

    return-void
.end method

.method private initPowerState(Landroid/content/Context;)V
    .locals 2

    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p1, v0}, Lcom/miui/gallery/cloud/control/BatteryMonitor;->isPowerCanSync(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result p1

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->setPowerCanSync(Z)V

    :cond_0
    return-void
.end method

.method private recordTriggerEvent(Ljava/lang/String;)V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    move-result-object v0

    const-string v1, "Trigger_Date"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/card/scenario/DateUtils;->getDateFormat(J)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "assistant"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "assistant_schedule_exist_image_task_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public getNetworkType()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method protected getToProcessImages(Z)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/assistant/model/MediaFeatureItem;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/card/scenario/ScenarioConstants;->ALL_IMAGE_BASE_SELECTION:Ljava/lang/String;

    invoke-static {v0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->queryMediaItem(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->getAllProcessedSuccessImages()Ljava/util/List;

    move-result-object v1

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0x64

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v4

    if-nez v4, :cond_0

    return-object v2

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    if-eqz p1, :cond_2

    invoke-virtual {v4}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getImagePath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_1

    :cond_2
    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v4

    if-ne v4, v3, :cond_1

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string v0, "Processing %d images!"

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_4

    return-object v2

    :cond_4
    const/4 p1, 0x0

    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/assistant/model/MediaFeatureItem;

    invoke-virtual {p1}, Lcom/miui/gallery/assistant/model/MediaFeatureItem;->getDateTime()J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->queryNearByMediaItems(J)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/card/CardUtil;->bindImageFeatures(Ljava/util/List;)V

    invoke-static {p1}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->filterNearByImages(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {v2, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string v0, "Processing %d images after add previous images!"

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v2
.end method

.method public onGetImageDownloadType()Lcom/miui/gallery/sdk/download/DownloadType;
    .locals 1

    sget-object v0, Lcom/miui/gallery/sdk/download/DownloadType;->MICRO:Lcom/miui/gallery/sdk/download/DownloadType;

    return-object v0
.end method

.method public bridge synthetic process(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->process(Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method public process(Lorg/json/JSONObject;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->recordImageFeatureTaskInterval()V

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->initPowerState(Landroid/content/Context;)V

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getPowerCanSync()Z

    move-result v0

    const/4 v1, 0x0

    const/16 v2, 0x9

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Sync;->getIsPlugged()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string v0, "The power is weak and not charging,abort processing!"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "fail"

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->recordTriggerEvent(Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/4 v0, 0x0

    const-class v3, Lcom/miui/gallery/assistant/process/ExistImageFeatureChargingTask;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v0, v3}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string v3, "Start process exist images"

    invoke-static {v0, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x2

    invoke-virtual {p0, p1, v2, v0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->processInternal(Lorg/json/JSONObject;II)V

    return v1
.end method

.method processInternal(Lorg/json/JSONObject;II)V
    .locals 8

    const/4 v0, 0x1

    if-gtz p3, :cond_0

    const/4 p3, 0x1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->recordImageFeatureTaskInterval()V

    const-string v1, "success"

    invoke-direct {p0, v1}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->recordTriggerEvent(Ljava/lang/String;)V

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_1
    if-ge v2, p3, :cond_4

    invoke-virtual {p0, v0}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->getToProcessImages(Z)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v4

    if-nez v4, :cond_2

    return-void

    :cond_2
    iget-object v4, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string v5, "process %d hundreds images\uff0cimage batch count:%d"

    add-int/lit8 v2, v2, 0x1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-static {v4, v5, v6, v7}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, p1, v3, v0, v1}, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->processImages(Lorg/json/JSONObject;Ljava/util/List;ZZ)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    const/16 v4, 0x64

    if-ge v3, v4, :cond_1

    :cond_3
    return-void

    :cond_4
    if-lez p2, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/assistant/process/ExistImageFeatureTask;->TAG:Ljava/lang/String;

    const-string p3, "Have more un processed images,schedule next FeatureTask"

    invoke-static {p1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p1

    const/4 p3, 0x0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, p3, v0}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method recordImageFeatureTaskInterval()V
    .locals 10

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->getLastImageFeatureTaskTime()J

    move-result-wide v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v0, v4

    if-lez v6, :cond_1

    invoke-static {}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->generatorCommonParams()Ljava/util/Map;

    sub-long v0, v2, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v6

    const-wide/32 v8, 0x5265c00

    div-long/2addr v6, v8

    cmp-long v8, v6, v4

    if-nez v8, :cond_0

    invoke-static {v0, v1}, Ljava/lang/Math;->abs(J)J

    move-result-wide v0

    const-wide/32 v4, 0x36ee80

    div-long/2addr v0, v4

    const-string v4, "assistant"

    const-string v5, "assistant_imagefeature_task_hours_interval"

    invoke-static {v4, v5, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_0
    const-string v0, "assistant"

    const-string v1, "assistant_imagefeature_task_days_interval"

    invoke-static {v0, v1, v6, v7}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordNumericPropertyEvent(Ljava/lang/String;Ljava/lang/String;J)V

    :cond_1
    invoke-static {v2, v3}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->setLastImageFeatureTaskTime(J)V

    return-void
.end method

.method public requireCharging()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public requireDeviceIdle()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
