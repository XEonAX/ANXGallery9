.class Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;
.super Ljava/lang/Object;
.source "SuggestionFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/search/core/result/SuggestionResult<",
        "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getResultItemCount(Lcom/miui/gallery/search/core/result/SuggestionResult;)I
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "itemCount"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private getShortCutUri(Lcom/miui/gallery/search/core/result/SuggestionResult;)Ljava/lang/String;
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v0, "short_cut_uri"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method private isDone(Lcom/miui/gallery/search/core/result/SuggestionResult;)Z
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getResultExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string v1, "is_done"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method


# virtual methods
.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;>;"
        }
    .end annotation

    sget-object p1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    const-string v0, "data_loader_extra_text"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p1, "SuggestionFragment"

    const-string p2, "Invalid query text for loader!"

    invoke-static {p1, p2}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1

    :cond_0
    const-string v1, "from_suggestion"

    invoke-static {v1}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->onCompleteSerial(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "from_suggestion"

    invoke-static {v1}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->createNewSerial(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "data_loader_extra_type"

    invoke-virtual {p2, v1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object v1

    if-eqz v1, :cond_1

    const-string p1, "data_loader_extra_type"

    invoke-virtual {p2, p1}, Landroid/os/Bundle;->getSerializable(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/SearchConstants$SearchType;

    :cond_1
    new-instance v1, Lcom/miui/gallery/search/core/QueryInfo$Builder;

    invoke-direct {v1, p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;-><init>(Lcom/miui/gallery/search/SearchConstants$SearchType;)V

    const-string p1, "query"

    invoke-virtual {v1, p1, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const-string v0, "enableShortcut"

    const-string v1, "data_loader_extra_enable_shortcut"

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, v0, p2}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->setAppendSerialInfo(Z)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/search/core/query/QueryLoader;

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {v0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$100(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {v1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$200(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

    move-result-object v1

    invoke-direct {p2, v0, p1, v1}, Lcom/miui/gallery/search/core/query/QueryLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;)V

    return-object p2
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;>;",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;)V"
        }
    .end annotation

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/search/core/query/QueryLoader;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/query/QueryLoader;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v0

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->isDone(Lcom/miui/gallery/search/core/result/SuggestionResult;)Z

    move-result v1

    if-eqz p2, :cond_1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    const-string v2, "SuggestionFragment"

    const-string v3, "Loader %s load finished, got empty result"

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    const-string v2, "SuggestionFragment"

    const-string v3, "Loader %s load finished, got %s results"

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;

    invoke-virtual {v4}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getCount()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v2, v3, p1, v4}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$300(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    move-result-object p1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v2

    invoke-virtual {p1, v0, v2}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->getErrorStatus(Lcom/miui/gallery/search/core/result/SuggestionResult;)I

    move-result p1

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->getShortCutUri(Lcom/miui/gallery/search/core/result/SuggestionResult;)Ljava/lang/String;

    move-result-object v2

    if-eqz v1, :cond_2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v3

    new-instance v4, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3$1;

    invoke-direct {v4, p0, v2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3$1;-><init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    goto :goto_1

    :cond_1
    const-string v2, "SuggestionFragment"

    const-string v3, "Loader %s load finished, got no data available"

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {v2, v3, p1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    :cond_2
    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    xor-int/lit8 v3, v1, 0x1

    invoke-static {v2, v3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$402(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;Z)Z

    iget-object v2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {v2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$500(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/StatusHandleHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {v3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$400(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Z

    move-result v3

    if-nez v3, :cond_3

    goto :goto_2

    :cond_3
    const/4 p1, -0x1

    :goto_2
    invoke-virtual {v2, p1}, Lcom/miui/gallery/search/StatusHandleHelper;->updateResultStatus(I)V

    if-eqz v1, :cond_5

    invoke-direct {p0, p2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->getResultItemCount(Lcom/miui/gallery/search/core/result/SuggestionResult;)I

    move-result p1

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/QueryInfo;->getSearchType()Lcom/miui/gallery/search/SearchConstants$SearchType;

    move-result-object p2

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-ne p2, v0, :cond_4

    const-string p2, "from_search"

    goto :goto_3

    :cond_4
    const-string p2, "from_suggestion"

    :goto_3
    const-string v0, "suggestion_recall"

    const-string v1, "ItemCount"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, v0, v1, p1}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;>;)V"
        }
    .end annotation

    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$300(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$300(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0, v0}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-static {p1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$500(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/StatusHandleHelper;

    move-result-object p1

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/StatusHandleHelper;->updateResultStatus(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;->this$0:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->access$402(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;Z)Z

    return-void
.end method
