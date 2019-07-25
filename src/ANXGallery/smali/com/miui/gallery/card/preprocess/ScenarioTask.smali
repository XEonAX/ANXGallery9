.class public abstract Lcom/miui/gallery/card/preprocess/ScenarioTask;
.super Lcom/miui/gallery/assistant/process/BaseImageTask;
.source "ScenarioTask.java"


# direct methods
.method constructor <init>(I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/assistant/process/BaseImageTask;-><init>(I)V

    return-void
.end method

.method private static parseRecordId(Lorg/json/JSONObject;)J
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    const-string v0, "recordId"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public static post(ILjava/lang/String;J)V
    .locals 0

    invoke-static {p2, p3}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->wrapTaskData(J)Lorg/json/JSONObject;

    move-result-object p2

    invoke-static {}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->getInstance()Lcom/miui/gallery/pendingtask/PendingTaskManager;

    move-result-object p3

    invoke-virtual {p3, p0, p2, p1}, Lcom/miui/gallery/pendingtask/PendingTaskManager;->postTask(ILjava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method private static wrapTaskData(J)Lorg/json/JSONObject;
    .locals 2

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    :try_start_0
    const-string v1, "recordId"

    invoke-virtual {v0, v1, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const-string p1, "ScenarioTask"

    const-string v1, "wrap task data error.\n"

    invoke-static {p1, v1, p0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_0
    return-object v0
.end method


# virtual methods
.method public getNetworkType()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method protected abstract onProcess(Lorg/json/JSONObject;J)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public bridge synthetic process(Ljava/lang/Object;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->process(Lorg/json/JSONObject;)Z

    move-result p1

    return p1
.end method

.method public final process(Lorg/json/JSONObject;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->parseRecordId(Lorg/json/JSONObject;)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    const-string p1, "ScenarioTask"

    const-string v0, "data parse failed"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return p1

    :cond_0
    invoke-virtual {p0, p1, v0, v1}, Lcom/miui/gallery/card/preprocess/ScenarioTask;->onProcess(Lorg/json/JSONObject;J)Z

    move-result p1

    return p1
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
