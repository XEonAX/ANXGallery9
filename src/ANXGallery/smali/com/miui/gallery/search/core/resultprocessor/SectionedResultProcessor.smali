.class public Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;
.super Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;
.source "SectionedResultProcessor.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor<",
        "Lcom/miui/gallery/search/core/result/SuggestionResult<",
        "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
        "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field private mRemoveDuplicateItems:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->mRemoveDuplicateItems:Z

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->mRemoveDuplicateItems:Z

    return-void
.end method


# virtual methods
.method protected acceptEmptySection(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method protected getIndependentSection(Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ")",
            "Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_0
    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->getSuggestionKey(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    iget-boolean v2, p0, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->mRemoveDuplicateItems:Z

    if-eqz v2, :cond_1

    invoke-virtual {p1, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_2
    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v1

    invoke-virtual {p0, p2, v1}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToNext()Z

    move-result v1

    if-nez v1, :cond_0

    :cond_3
    new-instance p1, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v3

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTypeString()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v1

    invoke-direct {v5, v1, v0}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getDataURI()Ljava/lang/String;

    move-result-object v6

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTitle()Ljava/lang/String;

    move-result-object v7

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionSubTitle()Ljava/lang/String;

    move-result-object v8

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToMore()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object v9

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getRankInfos()Ljava/util/List;

    move-result-object v10

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getExtras()Landroid/os/Bundle;

    move-result-object v11

    move-object v2, p1

    invoke-direct/range {v2 .. v11}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;Ljava/util/List;Landroid/os/Bundle;)V

    return-object p1
.end method

.method protected getMergedResult(Ljava/util/List;)Lcom/miui/gallery/search/core/result/SuggestionResult;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/result/SourceResult;",
            ">;)",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;"
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->getMergedErrorInfo(Ljava/util/List;)Lcom/miui/gallery/search/core/result/ErrorInfo;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v3, 0x0

    move-object v4, v3

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/search/core/result/SourceResult;

    if-nez v3, :cond_1

    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getQueryInfo()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v3

    :cond_1
    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    if-nez v6, :cond_2

    goto :goto_0

    :cond_2
    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    instance-of v6, v6, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-eqz v6, :cond_4

    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v5}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v6

    sget-object v7, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne v6, v7, :cond_3

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v6

    if-gtz v6, :cond_7

    :cond_3
    invoke-virtual {p0, v1, v2, v5}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->onAddSection(Ljava/util/List;Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)V

    goto :goto_2

    :cond_4
    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v6

    instance-of v6, v6, Lcom/miui/gallery/search/core/GroupList;

    if-eqz v6, :cond_7

    invoke-interface {v5}, Lcom/miui/gallery/search/core/result/SourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object v5

    check-cast v5, Lcom/miui/gallery/search/core/GroupList;

    const/4 v6, 0x0

    :goto_1
    invoke-interface {v5}, Lcom/miui/gallery/search/core/GroupList;->getGroupCount()I

    move-result v7

    if-ge v6, v7, :cond_7

    invoke-interface {v5, v6}, Lcom/miui/gallery/search/core/GroupList;->getGroup(I)Ljava/lang/Object;

    move-result-object v7

    instance-of v8, v7, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    if-eqz v8, :cond_6

    check-cast v7, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v7}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v8

    sget-object v9, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-ne v8, v9, :cond_5

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-lez v8, :cond_5

    goto :goto_2

    :cond_5
    invoke-virtual {p0, v1, v2, v7}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->onAddSection(Ljava/util/List;Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)V

    :cond_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_7
    :goto_2
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string v5, "itemCount"

    invoke-virtual {v2}, Ljava/util/HashSet;->size()I

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {p0, v3, v1, v4}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->packData(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;

    move-result-object v4

    goto/16 :goto_0

    :cond_8
    new-instance p1, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;

    invoke-direct {p1, v3, v4, v0}, Lcom/miui/gallery/search/core/result/BaseSuggestionResult;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Lcom/miui/gallery/search/core/result/ErrorInfo;)V

    return-object p1
.end method

.method protected getSuggestionKey(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Ljava/lang/String;
    .locals 3

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConfig;->getSuggestionConfig()Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;

    move-result-object v0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;->countToRecall(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "%s%s"

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getSuggestionTitle()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/Suggestion;->getIntentActionURI()Ljava/lang/String;

    move-result-object p2

    aput-object p2, v0, v1

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method protected onAddSection(Ljava/util/List;Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;",
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ")V"
        }
    .end annotation

    invoke-virtual {p0, p3}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->acceptEmptySection(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p3}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    invoke-interface {p3}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getDataURI()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v0

    invoke-interface {p3}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/SearchConfig;->showSection(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->getIndependentSection(Ljava/util/HashSet;Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method protected packData(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;",
            "Landroid/os/Bundle;",
            ")",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;

    invoke-direct {v0, p1, p2}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V

    if-eqz p3, :cond_0

    invoke-virtual {v0, p3}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->setExtras(Landroid/os/Bundle;)V

    :cond_0
    return-object v0
.end method

.method protected toSuggestion(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;
    .locals 0

    invoke-super {p0, p2}, Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object p1

    return-object p1
.end method
