.class public Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;
.super Lcom/miui/gallery/search/SearchFragmentBase;
.source "SuggestionFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;,
        Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$SuggestionAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

.field private mDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult<",
            "Lcom/miui/gallery/search/core/suggestion/GroupedSuggestionCursor<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionSection;",
            ">;>;>;"
        }
    .end annotation
.end field

.field private mDataView:Landroid/support/v7/widget/RecyclerView;

.field private mErrorViewAdapter:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;

.field private mIsLoading:Z

.field private final mQueryHandler:Landroid/os/Handler;

.field private mQueryText:Ljava/lang/String;

.field private mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

.field private mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragmentBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-direct {v0}, Lcom/miui/gallery/search/StatusHandleHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryText:Ljava/lang/String;

    new-instance v0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$1;-><init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryHandler:Landroid/os/Handler;

    new-instance v0, Lcom/miui/gallery/search/suggestionpage/SuggestionResultProcessor;

    invoke-direct {v0}, Lcom/miui/gallery/search/suggestionpage/SuggestionResultProcessor;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

    new-instance v0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$3;-><init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->restartDataLoader(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mIsLoading:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mIsLoading:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)Lcom/miui/gallery/search/StatusHandleHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    return-object p0
.end method

.method private requery(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryHandler:Landroid/os/Handler;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->hasMessages(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    :cond_0
    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    if-ne p1, v0, :cond_1

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->restartDataLoader(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryHandler:Landroid/os/Handler;

    invoke-virtual {p1, v1, p2}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryHandler:Landroid/os/Handler;

    const-wide/16 v0, 0x12c

    invoke-virtual {p2, p1, v0, v1}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    :goto_0
    return-void
.end method

.method private restartDataLoader(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->isAdded()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "data_loader_extra_type"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    const-string p1, "data_loader_extra_text"

    invoke-virtual {v0, p1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string p1, "data_loader_extra_enable_shortcut"

    invoke-virtual {v0, p1, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    const/4 p3, 0x1

    invoke-virtual {p1, p3, v0, p2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean p3, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mIsLoading:Z

    iget-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/StatusHandleHelper;->refreshInfoViews()V

    :cond_0
    return-void
.end method


# virtual methods
.method public doRetryIfNeeded()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->getResultStatus()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryText:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryText:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, v2}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->requery(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V

    :cond_0
    return-void
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "search_suggestions"

    return-object v0
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/search/SearchFragmentBase;->onDestroy()V

    const-string v0, "from_suggestion"

    invoke-static {v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->onCompleteSerial(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6

    const/4 p3, 0x0

    const v0, 0x7f0b00c3

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0900c1

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/support/v7/widget/RecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, p3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p3, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$SuggestionAdapter;

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/search/core/context/SearchContext;->getSuggestionViewFactory()Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    move-result-object p2

    const-string v1, "from_suggestion"

    invoke-direct {p3, v0, p2, v1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$SuggestionAdapter;-><init>(Landroid/app/Activity;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Ljava/lang/String;)V

    iput-object p3, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object p3, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance p3, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;

    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v3, 0x7f06010e

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    const/4 v3, 0x1

    const/4 v5, 0x1

    move-object v0, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;ZIZ)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance p3, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$2;

    invoke-direct {p3, p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$2;-><init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance p2, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;

    iget-object p3, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;-><init>(Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    iget-object v1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    const p2, 0x7f09017a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const p2, 0x7f0901b5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const p2, 0x7f0900fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/suggestionpage/SuggestionFragment$ErrorViewAdapter;

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/search/StatusHandleHelper;->init(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/miui/gallery/search/StatusHandleHelper$ErrorViewAdapter;)V

    return-object p1
.end method

.method public onResume()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/search/SearchFragmentBase;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->doRetryIfNeeded()V

    return-void
.end method

.method public setQueryText(Ljava/lang/String;ZZ)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    iput-object p1, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mQueryText:Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/StatusHandleHelper;->updateResultStatus(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->mAdapter:Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1}, Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    :cond_0
    if-eqz p2, :cond_1

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SEARCH:Lcom/miui/gallery/search/SearchConstants$SearchType;

    goto :goto_0

    :cond_1
    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_SUGGESTION:Lcom/miui/gallery/search/SearchConstants$SearchType;

    :goto_0
    invoke-direct {p0, p2, p1, p3}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;->requery(Lcom/miui/gallery/search/SearchConstants$SearchType;Ljava/lang/String;Z)V

    :cond_2
    return-void
.end method
