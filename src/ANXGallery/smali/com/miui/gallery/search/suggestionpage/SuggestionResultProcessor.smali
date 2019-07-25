.class public Lcom/miui/gallery/search/suggestionpage/SuggestionResultProcessor;
.super Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;
.source "SuggestionResultProcessor.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;-><init>(Z)V

    return-void
.end method

.method private getShortcutUri(Ljava/util/List;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-static {p1}, Lcom/miui/gallery/util/MiscUtil;->isValid(Ljava/util/Collection;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/SearchConfig;->getSuggestionConfig()Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;->supportShortcut(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToFirst()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getIntentActionURI()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-interface {v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getIntentActionURI()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method


# virtual methods
.method protected acceptEmptySection(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Z
    .locals 2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-eq v0, v1, :cond_1

    invoke-super {p0, p1}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->acceptEmptySection(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method protected packData(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;
    .locals 15
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

    move-object v1, p0

    move-object/from16 v0, p1

    move-object/from16 v2, p2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v10

    :try_start_0
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v3

    const/4 v4, 0x1

    if-le v3, v4, :cond_5

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v4}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v4

    sget-object v5, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_NO_RESULT:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-eq v4, v5, :cond_0

    goto/16 :goto_2

    :cond_0
    new-instance v12, Ljava/util/ArrayList;

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v12, v4}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/miui/gallery/search/SearchConfig;->getSuggestionConfig()Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;

    move-result-object v5

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;->shouldDrawSectionHeader(Lcom/miui/gallery/search/SearchConstants$SectionType;)Z

    move-result v7

    if-nez v7, :cond_2

    const/4 v7, 0x0

    :goto_1
    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCount()I

    move-result v8

    if-ge v7, v8, :cond_1

    invoke-interface {v6, v7}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->moveToPosition(I)Z

    invoke-interface {v6}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getCurrent()Lcom/miui/gallery/search/core/suggestion/Suggestion;

    move-result-object v8

    invoke-interface {v4, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_2
    invoke-interface {v12, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_4

    sget-object v5, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SectionType;

    new-instance v13, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    new-instance v6, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;

    invoke-direct {v6, v0, v4}, Lcom/miui/gallery/search/core/suggestion/ListSuggestionCursor;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;)V

    const/4 v7, 0x0

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v2

    invoke-virtual {v2, v5}, Lcom/miui/gallery/search/SearchConfig;->getTitleForSection(Lcom/miui/gallery/search/SearchConstants$SectionType;)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v14, 0x0

    move-object v2, v13

    move-object/from16 v3, p1

    move-object v4, v5

    move-object v5, v6

    move-object v6, v7

    move-object v7, v8

    move-object v8, v9

    move-object v9, v14

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/SearchConstants$SectionType;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;)V

    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_4
    move-object/from16 v3, p3

    invoke-super {p0, v0, v12, v3}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->packData(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v2, "SuggestionResultProcessor"

    const-string v3, "Pack data cost %d"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v0

    :cond_5
    :goto_2
    move-object/from16 v3, p3

    :try_start_1
    invoke-super/range {p0 .. p3}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->packData(Lcom/miui/gallery/search/core/QueryInfo;Ljava/util/List;Landroid/os/Bundle;)Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;

    move-result-object v3

    if-eqz v3, :cond_8

    const-string v4, "enableShortcut"

    invoke-virtual {v0, v4}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_8

    const-string v4, "enableShortcut"

    invoke-virtual {v0, v4}, Lcom/miui/gallery/search/core/QueryInfo;->getParam(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-direct {p0, v2}, Lcom/miui/gallery/search/suggestionpage/SuggestionResultProcessor;->getShortcutUri(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_8

    invoke-virtual {v3}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v2

    if-eqz v2, :cond_6

    sget-object v4, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    if-ne v2, v4, :cond_7

    :cond_6
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    :cond_7
    const-string v4, "short_cut_uri"

    invoke-virtual {v2, v4, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;->setExtras(Landroid/os/Bundle;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :cond_8
    const-string v0, "SuggestionResultProcessor"

    const-string v2, "Pack data cost %d"

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v4

    sub-long/2addr v4, v10

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v0, v2, v4}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-object v3

    :catchall_0
    move-exception v0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    sub-long/2addr v2, v10

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    const-string v3, "SuggestionResultProcessor"

    const-string v4, "Pack data cost %d"

    invoke-static {v3, v4, v2}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    throw v0
.end method

.method protected toSuggestion(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;->toSuggestion(Lcom/miui/gallery/search/core/suggestion/SuggestionSection;Lcom/miui/gallery/search/core/suggestion/Suggestion;)Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;

    move-result-object p2

    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->getSuggestionSubTitle()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_OTHER:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-eq v0, v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionType()Lcom/miui/gallery/search/SearchConstants$SectionType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_GUIDE:Lcom/miui/gallery/search/SearchConstants$SectionType;

    if-eq v0, v1, :cond_0

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionSection;->getSectionTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestion;->setSuggestionSubTitle(Ljava/lang/String;)V

    :cond_0
    return-object p2
.end method
