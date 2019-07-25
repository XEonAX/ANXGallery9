.class public Lcom/miui/gallery/search/statistics/SearchStatUtils;
.super Ljava/lang/Object;
.source "SearchStatUtils.java"


# static fields
.field private static final POW:D

.field private static sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

.field private static final sCachedLogLock:Ljava/lang/Object;

.field private static sGson:Lcom/google/gson/Gson;

.field private static final sSerialLock:Ljava/lang/Object;

.field private static sSerialRandom:Ljava/util/Random;

.field private static sSerialStack:Ljava/util/Stack;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Stack<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialLock:Ljava/lang/Object;

    const/4 v0, 0x0

    sput-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sput-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLogLock:Ljava/lang/Object;

    const-wide/high16 v1, 0x4024000000000000L    # 10.0

    const-wide/high16 v3, 0x4020000000000000L    # 8.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    sput-wide v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->POW:D

    sput-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialRandom:Ljava/util/Random;

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sGson:Lcom/google/gson/Gson;

    return-void
.end method

.method public static buildSearchEventExtras(Landroid/os/Bundle;[Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;
    .locals 2

    if-eqz p1, :cond_3

    if-eqz p2, :cond_3

    array-length v0, p1

    array-length v1, p2

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p0, :cond_1

    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne p0, v0, :cond_2

    :cond_1
    new-instance p0, Landroid/os/Bundle;

    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    :cond_2
    const-string v0, "search_event_keys"

    invoke-virtual {p0, v0, p1}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    const-string p1, "search_event_values"

    invoke-virtual {p0, p1, p2}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    return-object p0

    :cond_3
    :goto_0
    return-object p0
.end method

.method public static buildSearchEventParams(Landroid/os/Bundle;)Ljava/util/Map;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    :cond_0
    const-string v1, "search_event_keys"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const-string v2, "search_event_values"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    if-eqz v1, :cond_2

    if-eqz p0, :cond_2

    array-length v2, v1

    array-length v3, p0

    if-ne v2, v3, :cond_2

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    array-length v3, v1

    if-ge v2, v3, :cond_1

    aget-object v3, v1, v2

    aget-object v4, p0, v2

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    const-string v1, "SearchStatUtils"

    const-string v2, "Error occurred while build search event extras %s"

    invoke-static {v1, v2, p0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    return-object v0

    :cond_2
    return-object v0
.end method

.method public static cacheEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->formLogItem(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    move-result-object p0

    sget-object p1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLogLock:Ljava/lang/Object;

    monitor-enter p1

    :try_start_0
    sget-object p2, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    if-eqz p2, :cond_0

    sget-object p2, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    sput-object p0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p2, :cond_1

    invoke-static {p2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Lcom/miui/gallery/search/statistics/SearchStatLogItem;)V

    :cond_1
    return-void

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static createNewSerial(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    if-nez v0, :cond_1

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/Stack;

    invoke-direct {v1}, Ljava/util/Stack;-><init>()V

    sput-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_1
    :goto_0
    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->createNewSerialId()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialLock:Ljava/lang/Object;

    monitor-enter v1

    :try_start_1
    sget-object v2, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    new-instance v3, Landroid/util/Pair;

    invoke-direct {v3, p0, v0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Ljava/util/Stack;->push(Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1

    return-object v0

    :catchall_1
    move-exception p0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw p0
.end method

.method private static createNewSerialId()Ljava/lang/String;
    .locals 4

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialRandom:Ljava/util/Random;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialRandom:Ljava/util/Random;

    :cond_0
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    sget-object v2, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialRandom:Ljava/util/Random;

    invoke-virtual {v2}, Ljava/util/Random;->nextDouble()D

    move-result-wide v2

    add-double/2addr v2, v0

    sget-wide v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->POW:D

    mul-double v2, v2, v0

    double-to-int v0, v2

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private static formLogItem(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/miui/gallery/search/statistics/SearchStatLogItem;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/miui/gallery/search/statistics/SearchStatLogItem;"
        }
    .end annotation

    if-nez p2, :cond_0

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    :cond_0
    const-string v0, "isInternational"

    sget-boolean v1, Lcom/miui/os/Rom;->IS_INTERNATIONAL:Z

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p2, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p0, :cond_1

    const-string v0, "from"

    invoke-interface {p2, v0, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->getSerialStackHead()Landroid/util/Pair;

    move-result-object p0

    if-nez p0, :cond_2

    const/4 p0, 0x0

    goto :goto_0

    :cond_2
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    :goto_0
    new-instance v0, Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    invoke-direct {v0, p0, p1, p2}, Lcom/miui/gallery/search/statistics/SearchStatLogItem;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v0
.end method

.method public static getCurrentSerial()Ljava/lang/String;
    .locals 1

    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->getSerialStackHead()Landroid/util/Pair;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static getDataJson(Lcom/miui/gallery/search/statistics/SearchStatLogItem;)Ljava/lang/String;
    .locals 1

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sGson:Lcom/google/gson/Gson;

    invoke-virtual {v0, p0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDataJson(Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/statistics/SearchStatLogItem;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "items"

    invoke-interface {v0, v1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sGson:Lcom/google/gson/Gson;

    invoke-virtual {p0, v0}, Lcom/google/gson/Gson;->toJson(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getSerialStackHead()Landroid/util/Pair;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    if-eqz v1, :cond_0

    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->empty()Z

    move-result v1

    if-nez v1, :cond_0

    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    invoke-virtual {v1}, Ljava/util/Stack;->peek()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/util/Pair;

    monitor-exit v0

    return-object v1

    :cond_0
    monitor-exit v0

    const/4 v0, 0x0

    return-object v0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static onCompleteSerial(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    invoke-static {}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->getSerialStackHead()Landroid/util/Pair;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    if-eqz v3, :cond_1

    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v3, p0}, Ljava/lang/String;->contentEquals(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    sget-object v3, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->pop()Ljava/lang/Object;

    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_2

    iget-object p0, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_2
    const-string v0, "SearchStatUtils"

    const-string v2, "Current serial stack empty or head is not from %s, stack size %d!"

    sget-object v3, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sSerialStack:Ljava/util/Stack;

    invoke-virtual {v3}, Ljava/util/Stack;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {v0, v2, p0, v3}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v1

    :catchall_0
    move-exception p0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public static pullCachedEvent()Ljava/lang/String;
    .locals 3

    sget-object v0, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLogLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    monitor-exit v0

    return-object v2

    :cond_0
    sget-object v1, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    sput-object v2, Lcom/miui/gallery/search/statistics/SearchStatUtils;->sCachedLog:Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    invoke-static {v1}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->getDataJson(Lcom/miui/gallery/search/statistics/SearchStatLogItem;)Ljava/lang/String;

    move-result-object v2

    :goto_0
    return-object v2

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static reportEvent(Lcom/miui/gallery/search/statistics/SearchStatLogItem;)V
    .locals 3

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/miui/gallery/search/statistics/SearchStatReportService;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Lcom/miui/gallery/search/statistics/SearchStatReportService;->EXTRA_LOG_ITEM:Ljava/lang/String;

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    sget-object p0, Lcom/miui/gallery/search/statistics/SearchStatReportService;->EXTRA_UPLOAD:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-virtual {v1, p0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/BackgroundServiceHelper;->startForegroundServiceIfNeed(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method

.method public static reportEvent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v0 .. v5}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public static reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    invoke-interface {v0, p2, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    if-eqz p4, :cond_1

    if-eqz p5, :cond_1

    invoke-interface {v0, p4, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    invoke-static {p0, p1, v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method public static reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1, p2}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->formLogItem(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Lcom/miui/gallery/search/statistics/SearchStatLogItem;

    move-result-object p0

    invoke-static {p0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Lcom/miui/gallery/search/statistics/SearchStatLogItem;)V

    return-void
.end method
