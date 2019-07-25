.class Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;
.super Ljava/lang/Object;
.source "SearchResultFragmentBase.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/search/core/result/SuggestionResult;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ">;"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->getSectionDataQueryInfoBuilder()Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    if-eqz p1, :cond_1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->setAppendSerialInfo(Z)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-static {v1, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->access$000(Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;Landroid/os/Bundle;)Z

    move-result p2

    if-eqz p2, :cond_0

    const-string p2, "use_persistent_response"

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    :cond_0
    new-instance p2, Lcom/miui/gallery/search/core/query/QueryLoader;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->access$300(Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v2

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v3

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultHelper;->getDataListResultProcessor()Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;

    move-result-object v4

    const/4 v5, 0x0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->receiveResultUpdates()Z

    move-result v6

    const/4 v7, 0x0

    move-object v1, p2

    invoke-direct/range {v1 .. v7}, Lcom/miui/gallery/search/core/query/QueryLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;ZZZ)V

    return-object p2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->closeLoadMore()V

    const/4 p1, 0x0

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ">;",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ")V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/SearchResultHelper;->isInvalid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-static {v0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->access$400(Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;)J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->abs(J)J

    move-result-wide v2

    const-wide/16 v4, 0xbb8

    cmp-long v0, v2, v4

    if-gez v0, :cond_1

    if-eqz p2, :cond_0

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->getErrorStatus(Lcom/miui/gallery/search/core/result/SuggestionResult;)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v1, v1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    move v1, p1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    const/16 p1, 0xb

    const/16 v1, 0xb

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->closeLoadMore()V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->getFrom()Ljava/lang/String;

    move-result-object v2

    const-string v3, "result_invalid_hash"

    const-string v4, "Query"

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo;->toString()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Time"

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v7

    invoke-static/range {v2 .. v7}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_1
    if-eqz p2, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    goto :goto_1

    :cond_2
    const-string p2, "SearchResultFragmentBase"

    const-string v0, "Loader %s load finished, invalid hash code got no data available"

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_1
    new-instance p1, Landroid/os/Bundle;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/os/Bundle;-><init>(I)V

    const-string v0, "force_requery"

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->restartSectionDataLoader(Landroid/os/Bundle;)V

    :goto_2
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    invoke-static {p1, v2, v3}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->access$402(Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;J)J

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/StatusHandleHelper;->updateResultStatus(I)V

    return-void

    :cond_3
    if-eqz p2, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->getErrorStatus(Lcom/miui/gallery/search/core/result/SuggestionResult;)I

    move-result v1

    goto :goto_3

    :cond_4
    const-string p2, "SearchResultFragmentBase"

    const-string v0, "Loader %s load finished, got no data available"

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_3
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultHelper;->isLoadCompleted()Z

    move-result p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->onLoadComplete()V

    goto :goto_4

    :cond_5
    invoke-static {v1}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->openLoadMore()V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->getErrorViewAdapter()Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;->isEmptyDataView()Z

    move-result p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultHelper;->isInvalid()Z

    move-result p1

    if-nez p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->onLoadMoreRequested()V

    goto :goto_4

    :cond_6
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->closeLoadMore()V

    :cond_7
    :goto_4
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->this$0:Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;

    iget-object p1, p1, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/StatusHandleHelper;->updateResultStatus(I)V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase$2;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method
