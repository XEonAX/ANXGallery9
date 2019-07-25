.class Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$FilterProcessor;
.super Lcom/miui/gallery/search/core/resultprocessor/LinearResultProcessor;
.source "SearchImageResultHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FilterProcessor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$FilterProcessor;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-direct {p0}, Lcom/miui/gallery/search/core/resultprocessor/LinearResultProcessor;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$FilterProcessor;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;)V

    return-void
.end method


# virtual methods
.method protected getMergedResult(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$FilterProcessor;->getMergedErrorInfo(Ljava/util/List;)Lcom/miui/gallery/search/core/result/ErrorInfo;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v4, v2

    const/4 v5, 0x0

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/search/core/result/SourceResult;

    if-nez v4, :cond_0

    invoke-interface {v6}, Lcom/miui/gallery/search/core/result/SourceResult;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v7

    if-eqz v7, :cond_0

    invoke-interface {v6}, Lcom/miui/gallery/search/core/result/SourceResult;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v4

    :cond_0
    invoke-interface {v6}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    if-nez v6, :cond_1

    goto :goto_0

    :cond_1
    move v7, v5

    const/4 v5, 0x0

    :goto_1
    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v8

    if-ge v5, v8, :cond_3

    invoke-interface {v6, v5}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper$FilterProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object v8

    if-eqz v8, :cond_2

    invoke-interface {v1, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v8}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    or-int/2addr v7, v8

    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    move v5, v7

    goto :goto_0

    :cond_4
    if-eqz v5, :cond_5

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/search/core/suggestion/Suggestion;

    check-cast v6, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    invoke-virtual {v6, v2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->setSuggestionIcon(Ljava/lang/String;)V

    goto :goto_2

    :cond_5
    new-instance p1, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;

    invoke-direct {p1, v4, v1}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    sget-object v2, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v1, v2, :cond_6

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    :cond_6
    const-string v2, "filter_style"

    if-eqz v5, :cond_7

    goto :goto_3

    :cond_7
    const/4 v3, 0x1

    :goto_3
    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-interface {p1, v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->setExtras(Landroid/os/Bundle;)V

    new-instance v1, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;

    invoke-direct {v1, v4, p1, v0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object v1
.end method
