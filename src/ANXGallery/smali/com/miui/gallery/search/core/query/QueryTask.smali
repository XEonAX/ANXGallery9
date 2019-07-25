.class public Lcom/miui/gallery/search/core/query/QueryTask;
.super Lcom/miui/gallery/search/core/context/PriorityTaskExecutor$PriorityTask;
.source "QueryTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C::",
        "Lcom/miui/gallery/search/core/result/SuggestionResult;",
        ">",
        "Lcom/miui/gallery/search/core/context/PriorityTaskExecutor$PriorityTask;"
    }
.end annotation


# instance fields
.field private final mConsumer:Lcom/miui/gallery/search/core/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/Consumer<",
            "TC;>;"
        }
    .end annotation
.end field

.field private final mHandler:Landroid/os/Handler;

.field private final mProvider:Lcom/miui/gallery/search/core/source/SuggestionResultProvider;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/source/SuggestionResultProvider<",
            "TC;>;"
        }
    .end annotation
.end field

.field private final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/source/SuggestionResultProvider;Lcom/miui/gallery/search/core/Consumer;Landroid/os/Handler;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/source/SuggestionResultProvider<",
            "TC;>;",
            "Lcom/miui/gallery/search/core/Consumer<",
            "TC;>;",
            "Landroid/os/Handler;",
            "I)V"
        }
    .end annotation

    invoke-direct {p0}, Lcom/miui/gallery/search/core/context/PriorityTaskExecutor$PriorityTask;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p2, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mProvider:Lcom/miui/gallery/search/core/source/SuggestionResultProvider;

    iput-object p3, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mConsumer:Lcom/miui/gallery/search/core/Consumer;

    iput-object p4, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mHandler:Landroid/os/Handler;

    iput p5, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mPriority:I

    return-void
.end method


# virtual methods
.method public bridge synthetic run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/query/QueryTask;->run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;

    move-result-object p1

    return-object p1
.end method

.method public run(Lcom/miui/gallery/threadpool/ThreadPool$JobContext;)Ljava/lang/Void;
    .locals 8

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/search/core/query/QueryTask;->setExcuteTime(J)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mProvider:Lcom/miui/gallery/search/core/source/SuggestionResultProvider;

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-interface {v0, v2}, Lcom/miui/gallery/search/core/source/SuggestionResultProvider;->getSuggestions(Lcom/miui/gallery/search/core/QueryInfo;)Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v0

    invoke-interface {p1}, Lcom/miui/gallery/threadpool/ThreadPool$JobContext;->isCancelled()Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v1

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mConsumer:Lcom/miui/gallery/search/core/Consumer;

    invoke-static {p1, v2, v0}, Lcom/miui/gallery/search/core/ConsumerUtils;->consumeAsync(Landroid/os/Handler;Lcom/miui/gallery/search/core/Consumer;Ljava/lang/Object;)V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p0, v2, v3}, Lcom/miui/gallery/search/core/query/QueryTask;->setFinishTime(J)V

    const-string p1, "QueryTask"

    const-string v2, "%s cost %sms, result %s"

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getFinishTime()J

    move-result-wide v4

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getExcuteTime()J

    move-result-wide v6

    sub-long/2addr v4, v6

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    if-eqz v0, :cond_3

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v5

    if-nez v5, :cond_2

    goto :goto_0

    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, " items@"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_3
    :goto_0
    const-string v0, "is empty"

    :goto_1
    invoke-static {p1, v2, v3, v4, v0}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    const-string v0, "submit_create"

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getSubmitTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getNewTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "execute_submit"

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getExcuteTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getSubmitTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "finish_execute"

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getFinishTime()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryTask;->getExcuteTime()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "search"

    const-string v2, "search_query_task"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-object v1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "From "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mProvider:Lcom/miui/gallery/search/core/source/SuggestionResultProvider;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryTask;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
