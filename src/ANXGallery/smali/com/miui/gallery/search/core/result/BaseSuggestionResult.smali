.class public Lcom/miui/gallery/search/core/result/BaseSuggestionResult;
.super Ljava/lang/Object;
.source "BaseSuggestionResult.java"

# interfaces
.implements Lcom/miui/gallery/search/core/result/SuggestionResult;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<S::",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/search/core/result/SuggestionResult<",
        "TS;>;"
    }
.end annotation


# instance fields
.field private mClosed:Z

.field private final mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TS;"
        }
    .end annotation
.end field

.field private mErrorInfo:Lcom/miui/gallery/search/core/result/ErrorInfo;

.field private mExtras:Landroid/os/Bundle;

.field private final mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

.field private mRefCount:I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "TS;)V"
        }
    .end annotation

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-void
.end method

.method public constructor <init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/result/ErrorInfo;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "TS;",
            "Lcom/miui/gallery/search/core/result/ErrorInfo;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mClosed:Z

    iput v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    sget-object v0, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    iput-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mExtras:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    iput-object p2, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    iput-object p3, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mErrorInfo:Lcom/miui/gallery/search/core/result/ErrorInfo;

    return-void
.end method

.method private close()V
    .locals 3

    const-string v0, "BaseSuggestionResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "SuggestionResult close() ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mClosed:Z

    if-eqz v0, :cond_0

    const-string v0, "BaseSuggestionResult"

    const-string v1, "Double close()"

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mClosed:Z

    :try_start_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->close()V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_2

    const-string v0, "BaseSuggestionResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]\'s data is already closed before result is closed!"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "BaseSuggestionResult"

    invoke-static {v1, v0}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public acquire()V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    return-void
.end method

.method protected finalize()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "BaseSuggestionResult"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LEAK! Finalized without being closed: BaseSuggestionResult["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->close()V

    :cond_0
    return-void
.end method

.method public getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TS;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_1

    return-object v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    return-object v0
.end method

.method public getErrorInfo()Lcom/miui/gallery/search/core/result/ErrorInfo;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mErrorInfo:Lcom/miui/gallery/search/core/result/ErrorInfo;

    return-object v0

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "getErrorMessage() when closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    return-object v0
.end method

.method public getResultExtras()Landroid/os/Bundle;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mExtras:Landroid/os/Bundle;

    return-object v0
.end method

.method public isClosed()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mClosed:Z

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

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

.method public registerContentObserver(Landroid/database/ContentObserver;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerContentObserver(Landroid/database/ContentObserver;)V

    :cond_0
    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mData:Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    invoke-interface {v0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method

.method public release()V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    iget v0, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mRefCount:I

    if-gtz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->close()V

    :cond_0
    return-void
.end method

.method public setErrorInfo(Lcom/miui/gallery/search/core/result/ErrorInfo;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mErrorInfo:Lcom/miui/gallery/search/core/result/ErrorInfo;

    return-void
.end method

.method public setResultExtras(Landroid/os/Bundle;)V
    .locals 0

    if-nez p1, :cond_0

    sget-object p1, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;->mExtras:Landroid/os/Bundle;

    return-void
.end method
