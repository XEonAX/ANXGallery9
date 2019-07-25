.class public Lcom/miui/gallery/search/core/query/QueryResult;
.super Ljava/lang/Object;
.source "QueryResult.java"


# instance fields
.field private mClosed:Z

.field private final mDataSetObservable:Landroid/database/DataSetObservable;

.field private mDone:Z

.field private final mExpectedSources:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/source/Source;",
            ">;"
        }
    .end annotation
.end field

.field private mHasResults:Z

.field protected final mQuery:Lcom/miui/gallery/search/core/QueryInfo;

.field private final mSourcePositions:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private final mSourceResultLock:Ljava/lang/Object;

.field private final mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/source/Source;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    new-instance v1, Landroid/database/DataSetObservable;

    invoke-direct {v1}, Landroid/database/DataSetObservable;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDataSetObservable:Landroid/database/DataSetObservable;

    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResultLock:Ljava/lang/Object;

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDone:Z

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mHasResults:Z

    iput-object p1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mQuery:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    iget-object p2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    new-array p2, p2, [Lcom/miui/gallery/search/core/result/SourceResult;

    iput-object p2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourcePositions:Ljava/util/HashMap;

    const/4 p2, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge p2, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourcePositions:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/search/core/source/Source;

    invoke-interface {v2}, Lcom/miui/gallery/search/core/source/Source;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_0
    const-string p2, "QueryResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "new QueryResult ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "] query \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, "\" expected sources: "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mHasResults:Z

    return-void
.end method

.method private getSourceResultsCount()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResultLock:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    :try_start_0
    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    array-length v3, v3

    if-ge v1, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    aget-object v3, v3, v1

    if-eqz v3, :cond_0

    add-int/lit8 v2, v2, 0x1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v0

    return v2

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method public addSourceResults(Ljava/util/List;)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)Z"
        }
    .end annotation

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryResult;->isClosed()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    goto :goto_0

    :cond_0
    return v1

    :cond_1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v2

    invoke-interface {v2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v2

    if-lez v2, :cond_2

    iput-boolean v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mHasResults:Z

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourcePositions:Ljava/util/HashMap;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->getSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v4

    invoke-interface {v4}, Lcom/miui/gallery/search/core/source/Source;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    if-nez v2, :cond_3

    const-string v2, "QueryResult"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Got unexpected SourceResult from corpus "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->getSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v4

    invoke-interface {v4}, Lcom/miui/gallery/search/core/source/Source;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    goto :goto_1

    :cond_3
    iget-object v4, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResultLock:Ljava/lang/Object;

    monitor-enter v4

    :try_start_0
    iget-object v5, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v5, v5, v6

    if-eqz v5, :cond_5

    iget-object v5, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v5, v5, v6

    invoke-static {v5, v0}, Lcom/miui/gallery/search/utils/SearchUtils;->compareResultHashCode(Lcom/miui/gallery/search/core/result/SourceResult;Lcom/miui/gallery/search/core/result/SourceResult;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v2, "QueryResult"

    const-string v3, "We ignored later result of query [%s] source %s, for they are identical"

    iget-object v5, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mQuery:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->getSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v6

    invoke-static {v2, v3, v5, v6}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    move v3, v1

    goto :goto_2

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v5

    aget-object v1, v1, v5

    invoke-interface {v1}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->acquire()V

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput-object v0, v1, v2

    goto :goto_2

    :cond_5
    invoke-interface {v0}, Lcom/miui/gallery/search/core/result/SourceResult;->acquire()V

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aput-object v0, v1, v2

    :goto_2
    monitor-exit v4

    move v1, v3

    goto/16 :goto_1

    :catchall_0
    move-exception p1

    monitor-exit v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1

    :cond_6
    if-eqz v1, :cond_7

    new-instance p1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p1, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v0, Lcom/miui/gallery/search/core/query/QueryResult$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/query/QueryResult$1;-><init>(Lcom/miui/gallery/search/core/query/QueryResult;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_7
    return v1
.end method

.method public close()V
    .locals 5

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0}, Landroid/database/DataSetObservable;->unregisterAll()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResultLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    if-eqz v4, :cond_0

    invoke-interface {v4}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([Ljava/lang/Object;Ljava/lang/Object;)V

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Double close()"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected finalize()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    if-nez v0, :cond_0

    const-string v0, "QueryResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LEAK! Finalized without being closed: QueryResult["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryResult;->getQuery()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/query/QueryResult;->close()V

    :cond_0
    return-void
.end method

.method public getQuery()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mQuery:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method public getSourceResults()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResultLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    array-length v2, v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    array-length v3, v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    aget-object v3, v3, v2

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mSourceResults:[Lcom/miui/gallery/search/core/result/SourceResult;

    aget-object v3, v3, v2

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public isClosed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    return v0
.end method

.method public isDone()Z
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDone:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/search/core/query/QueryResult;->getSourceResultsCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method protected notifyDataSetChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0}, Landroid/database/DataSetObservable;->notifyChanged()V

    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mClosed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, p1}, Landroid/database/DataSetObservable;->registerObserver(Ljava/lang/Object;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "registerDataSetObserver() when closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "QueryResult@"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "{expectedSources="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/miui/gallery/search/core/query/QueryResult;->mExpectedSources:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ",getSourceResultsCount()="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-direct {p0}, Lcom/miui/gallery/search/core/query/QueryResult;->getSourceResultsCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
