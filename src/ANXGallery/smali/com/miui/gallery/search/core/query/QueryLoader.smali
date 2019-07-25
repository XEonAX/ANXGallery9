.class public Lcom/miui/gallery/search/core/query/QueryLoader;
.super Landroid/content/AsyncTaskLoader;
.source "QueryLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Lcom/miui/gallery/search/core/result/SuggestionResult;",
        ">",
        "Landroid/content/AsyncTaskLoader<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field private mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/query/ControllableTask<",
            "Lcom/miui/gallery/search/core/query/QueryResult;",
            ">;"
        }
    .end annotation
.end field

.field private mReceiveResultUpdates:Z

.field private mReceiveSourceUpdates:Z

.field private mReportTillDone:Z

.field private mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private mResultContentObserver:Landroid/database/ContentObserver;

.field private final mResultProcessor:Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mSourceDataSetObserver:Landroid/database/DataSetObserver;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor<",
            "TT;>;)V"
        }
    .end annotation

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/search/core/query/QueryLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;ZZZ)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;ZZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor<",
            "TT;>;ZZZ)V"
        }
    .end annotation

    invoke-direct {p0, p1}, Landroid/content/AsyncTaskLoader;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p3, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResultProcessor:Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;

    iput-boolean p4, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReceiveSourceUpdates:Z

    iput-boolean p5, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReceiveResultUpdates:Z

    iput-boolean p6, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReportTillDone:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/query/QueryLoader;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReportTillDone:Z

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/query/QueryLoader;)Lcom/miui/gallery/search/core/query/ControllableTask;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    return-object p0
.end method

.method private getResultContentObserver()Landroid/database/ContentObserver;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResultContentObserver:Landroid/database/ContentObserver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/core/query/QueryLoader$2;

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/core/query/QueryLoader$2;-><init>(Lcom/miui/gallery/search/core/query/QueryLoader;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResultContentObserver:Landroid/database/ContentObserver;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResultContentObserver:Landroid/database/ContentObserver;

    return-object v0
.end method

.method private getSourceDataSetObserver()Landroid/database/DataSetObserver;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mSourceDataSetObserver:Landroid/database/DataSetObserver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/core/query/QueryLoader$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/query/QueryLoader$1;-><init>(Lcom/miui/gallery/search/core/query/QueryLoader;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mSourceDataSetObserver:Landroid/database/DataSetObserver;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mSourceDataSetObserver:Landroid/database/DataSetObserver;

    return-object v0
.end method

.method private onReleaseResources(Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->release()V

    :cond_0
    return-void
.end method


# virtual methods
.method public deliverResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->isReset()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/query/QueryLoader;->onReleaseResources(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    iput-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    iget-boolean p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReceiveResultUpdates:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-direct {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->getResultContentObserver()Landroid/database/ContentObserver;

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->registerContentObserver(Landroid/database/ContentObserver;)V

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->isStarted()Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-super {p0, p1}, Landroid/content/AsyncTaskLoader;->deliverResult(Ljava/lang/Object;)V

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    if-eq v0, p1, :cond_3

    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/core/query/QueryLoader;->onReleaseResources(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    :cond_3
    return-void
.end method

.method public bridge synthetic deliverResult(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/query/QueryLoader;->deliverResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method public loadInBackground()Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->isLoadInBackgroundCanceled()Z

    move-result v0

    if-nez v0, :cond_5

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v2}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/search/core/query/QueryResult;

    invoke-virtual {v2}, Lcom/miui/gallery/search/core/query/QueryResult;->getSourceResults()Ljava/util/List;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResultProcessor:Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;->process(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v3}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/miui/gallery/search/core/query/QueryResult;

    invoke-virtual {v3}, Lcom/miui/gallery/search/core/query/QueryResult;->isDone()Z

    move-result v3

    invoke-interface {v2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object v4

    sget-object v5, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v4, v5, :cond_0

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    :cond_0
    const-string v5, "is_done"

    invoke-virtual {v4, v5, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-interface {v2, v4}, Lcom/miui/gallery/search/core/result/SuggestionResult;->setResultExtras(Landroid/os/Bundle;)V

    :cond_1
    const-string v3, "QueryLoader"

    const-string v4, "Load result for {%s} cost %s ms, result %s"

    iget-object v5, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    sub-long/2addr v6, v0

    invoke-static {v6, v7}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    if-nez v2, :cond_2

    const-string v1, "is null"

    goto :goto_1

    :cond_2
    invoke-interface {v2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    invoke-interface {v2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v1

    if-nez v1, :cond_3

    goto :goto_0

    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "has "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v6

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, "items"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1

    :cond_4
    :goto_0
    const-string v1, "is empty"

    :goto_1
    invoke-static {v3, v4, v5, v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2

    :cond_5
    new-instance v0, Landroid/os/OperationCanceledException;

    invoke-direct {v0}, Landroid/os/OperationCanceledException;-><init>()V

    throw v0
.end method

.method public bridge synthetic loadInBackground()Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->loadInBackground()Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v0

    return-object v0
.end method

.method public onCanceled(Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    return-void
.end method

.method public bridge synthetic onCanceled(Ljava/lang/Object;)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/query/QueryLoader;->onCanceled(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void
.end method

.method protected onReset()V
    .locals 2

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->onReset()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->onStopLoading()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/query/QueryResult;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/query/QueryResult;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/query/QueryResult;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/query/QueryResult;->close()V

    :cond_0
    iput-object v1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/core/query/QueryLoader;->onReleaseResources(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    iput-object v1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    return-void
.end method

.method protected onStartLoading()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iget-boolean v1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mReceiveSourceUpdates:Z

    invoke-static {v0, v1}, Lcom/miui/gallery/search/core/query/QueryPackageHelper;->getQueryResult(Lcom/miui/gallery/search/core/QueryInfo;Z)Lcom/miui/gallery/search/core/query/ControllableTask;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    if-nez v0, :cond_1

    const-string v0, "QueryLoader"

    const-string v1, "No query task was created for query %s"

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->isCanceled()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mResult:Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/query/QueryLoader;->deliverResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->started()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->start()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryTask:Lcom/miui/gallery/search/core/query/ControllableTask;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/query/ControllableTask;->getResult()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/query/QueryResult;

    invoke-direct {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->getSourceDataSetObserver()Landroid/database/DataSetObserver;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/query/QueryResult;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->takeContentChanged()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->forceLoad()V

    :cond_4
    return-void

    :cond_5
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Invalid inner source, query task has been cancelled!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onStopLoading()V
    .locals 0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryLoader;->cancelLoad()Z

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Landroid/content/AsyncTaskLoader;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryLoader;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
