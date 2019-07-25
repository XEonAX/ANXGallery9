.class public abstract Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;
.super Ljava/lang/Object;
.source "ResultProcessor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<OUT::",
        "Lcom/miui/gallery/search/core/result/SuggestionResult;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected getMergedErrorInfo(Ljava/util/List;)Lcom/miui/gallery/search/core/result/ErrorInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)",
            "Lcom/miui/gallery/search/core/result/ErrorInfo;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/search/core/resultprocessor/SimpleErrorProcessor;

    invoke-direct {v0}, Lcom/miui/gallery/search/core/resultprocessor/SimpleErrorProcessor;-><init>()V

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/core/resultprocessor/SimpleErrorProcessor;->process(Ljava/util/List;)Lcom/miui/gallery/search/core/result/ErrorInfo;

    move-result-object p1

    return-object p1
.end method

.method protected abstract getMergedResult(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)TOUT;"
        }
    .end annotation
.end method

.method protected getSortedSourceResults(Ljava/util/List;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-gt v0, v1, :cond_0

    return-object p1

    :cond_0
    new-instance v0, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor$1;-><init>(Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    return-object p1
.end method

.method public process(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)TOUT;"
        }
    .end annotation

    if-eqz p1, :cond_4

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_2

    :cond_0
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/result/SourceResult;->acquire()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;->getSortedSourceResults(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_2

    const-string v1, "ResultProcessor"

    const-string v2, "The sorted source results are null!"

    invoke-static {v1, v2}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;->getMergedResult(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/result/SourceResult;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/result/SourceResult;->release()V

    goto :goto_1

    :cond_3
    return-object v0

    :cond_4
    :goto_2
    const-string p1, "ResultProcessor"

    const-string v0, "Received a null input value!"

    invoke-static {p1, v0}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method protected toSuggestion(Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;
    .locals 8

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    instance-of v0, p1, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    return-object p1

    :cond_1
    new-instance v7, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v1

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionIcon()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object v4

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionExtras()Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;

    move-result-object v5

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionSource()Lcom/miui/gallery/search/core/source/Source;

    move-result-object v6

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionExtras;Lcom/miui/gallery/search/core/source/Source;)V

    return-object v7
.end method
