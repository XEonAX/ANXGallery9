.class public Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;
.super Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;
.source "SearchImageResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;,
        Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;,
        Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;
    }
.end annotation


# instance fields
.field private mChoiceModeListener:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

.field private mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

.field private mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

.field private mFilterVisibleFilterThreshold:I

.field private mFilterVisibleImageThreshold:I

.field protected mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mChoiceModeListener:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleImageThreshold:I

    iput v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleFilterThreshold:I

    iput-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    iput-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$1500(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->onSend(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method private onSend(Ljava/lang/String;Ljava/lang/String;)V
    .locals 24

    move-object/from16 v12, p0

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v13

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const v2, 0x7fffffff

    const/4 v3, 0x0

    const/4 v4, 0x0

    const v5, 0x7fffffff

    :goto_0
    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    invoke-virtual {v13, v4}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v6

    invoke-virtual {v13, v6}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v7, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v7, v6}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemKey(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v6, v5, :cond_0

    move v5, v6

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v9, v4, [I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v8, v4, [J

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v9, v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    aput-wide v6, v8, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    if-ne v5, v2, :cond_4

    goto :goto_2

    :cond_4
    move v3, v5

    :goto_2
    new-instance v7, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemKey(I)J

    move-result-wide v15

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getMicroThumbnailSize()Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    move-result-object v18

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v19

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v21

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getFileLength(I)J

    move-result-wide v22

    move-object v14, v7

    move/from16 v20, v3

    invoke-direct/range {v14 .. v23}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getPhotoPageDataLoaderUri()Landroid/net/Uri;

    move-result-object v1

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v4

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getSelection()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getSelectionArguments()[Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p0 .. p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getOrder()Ljava/lang/String;

    move-result-object v10

    move-object/from16 v0, p0

    move v2, v3

    move v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v10

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    invoke-static/range {v0 .. v11}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V

    iget-object v0, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->stopActionMode()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "queryText"

    iget-object v2, v12, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "count"

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "serverIds"

    invoke-virtual {v12, v13}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getCheckedServerIds(Landroid/util/SparseBooleanArray;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "from_image_result"

    const-string v2, "client_image_operation_share"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private restartSectionLoader(Z)V
    .locals 2

    if-eqz p1, :cond_0

    new-instance p1, Landroid/os/Bundle;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/os/Bundle;-><init>(I)V

    const-string v1, "force_requery"

    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->restartSectionLoader(Landroid/os/Bundle;)V

    return-void
.end method

.method private showFilterBar()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v0

    iget v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleImageThreshold:I

    if-lt v0, v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    invoke-virtual {v3}, Lcom/miui/gallery/search/resultpage/FilterBarController;->getFilterDataCount()I

    move-result v3

    iget v4, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleFilterThreshold:I

    if-lt v3, v4, :cond_1

    const/4 v3, 0x1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    iget-object v4, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    if-eqz v0, :cond_2

    if-eqz v3, :cond_2

    goto :goto_2

    :cond_2
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v4, v1}, Lcom/miui/gallery/search/resultpage/FilterBarController;->showFilterBar(Z)V

    :cond_3
    return-void
.end method


# virtual methods
.method protected changeFilterData(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/resultpage/FilterBarController;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getView()Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/widget/TwoStageDrawer;

    const-string v3, "from_image_result"

    invoke-direct {v0, v1, v2, v3}, Lcom/miui/gallery/search/resultpage/FilterBarController;-><init>(Landroid/app/Activity;Lcom/miui/gallery/widget/TwoStageDrawer;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterBarController:Lcom/miui/gallery/search/resultpage/FilterBarController;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/search/resultpage/FilterBarController;->swapCursor(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->showFilterBar()V

    return-void
.end method

.method protected changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->showFilterBar()V

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->getRankInfo(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)Lcom/miui/gallery/search/core/suggestion/RankInfo;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/search/SearchConstants;->isHorizontalDocumentStyle(Lcom/miui/gallery/search/core/suggestion/RankInfo;)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->disableScaleImageViewAniWhenInActionMode()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->enableScaleImageViewAniWhenInActionMode()V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mChoiceModeListener:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;->inChoiceMode()Z

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->showLikelyBar()V

    :cond_1
    return-void
.end method

.method protected createSearchResultHelper(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;)Lcom/miui/gallery/search/resultpage/SearchResultHelper;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/search/core/QueryInfo;",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;)",
            "Lcom/miui/gallery/search/resultpage/SearchResultHelper;"
        }
    .end annotation

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, p1, v2, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;ZLcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor;)V

    return-object v0
.end method

.method protected getFrom()Ljava/lang/String;
    .locals 1

    const-string v0, "from_image_result"

    return-object v0
.end method

.method protected getLayoutResource()I
    .locals 1

    const v0, 0x7f0b0140

    return v0
.end method

.method protected getLoader()Landroid/content/Loader;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getLoaders()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Landroid/content/Loader;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "search_image_result"

    return-object v0
.end method

.method protected getResultView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0

    const/4 p3, 0x1

    if-ne p1, p3, :cond_1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->hideLikelyBar()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    :cond_0
    invoke-direct {p0, p3}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->restartSectionLoader(Z)V

    :cond_1
    return-void
.end method

.method protected onInflateView(Landroid/view/View;Landroid/os/Bundle;Landroid/net/Uri;)V
    .locals 0

    new-instance p2, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;

    iget-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p3}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;-><init>(Landroid/content/Context;)V

    const p3, 0x7f09014b

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p0, p3, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->bind(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;)V

    new-instance p3, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/search/resultpage/ImageResultAdapter;->setHeaderClickListener(Lcom/miui/gallery/search/resultpage/ImageResultAdapter$OnHeaderItemClickedListener;)V

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setChoiceMode(I)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mChoiceModeListener:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$ChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance p3, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$2;

    invoke-direct {p3, p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$2;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a0043

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleImageThreshold:I

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a0042

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterVisibleFilterThreshold:I

    iget-boolean p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    invoke-static {p2}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->needToQueryLikelyImagesForFeedbackTask(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    new-instance p2, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    const p3, 0x7f0901a0

    invoke-virtual {p1, p3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/view/ViewStub;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Landroid/view/ViewStub;)V

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFeedbackLikelyController:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$VoiceAssistantReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "com.miui.gallery.action.VOICE_ASSISTANT_SELECT_SHARE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_0
    return-void
.end method

.method protected receiveResultUpdates()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method protected restartFilterLoader(Landroid/os/Bundle;)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mFilterLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected restartSectionDataLoader(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mSectionDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected restartSectionLoader(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mSectionsLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected updateTitle(Ljava/lang/String;)V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const v0, 0x7f10061a

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->updateTitle(Ljava/lang/String;)V

    return-void
.end method
