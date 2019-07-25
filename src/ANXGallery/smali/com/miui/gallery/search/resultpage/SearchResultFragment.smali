.class public Lcom/miui/gallery/search/resultpage/SearchResultFragment;
.super Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;
.source "SearchResultFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;,
        Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;
    }
.end annotation


# instance fields
.field private mDefaultTitle:Ljava/lang/String;

.field protected mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

.field private mFrom:Ljava/lang/String;

.field private mPageName:Ljava/lang/String;

.field private mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter<",
            "Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;",
            ">;"
        }
    .end annotation
.end field

.field private mResultView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/SearchResultFragment;)Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    return-object p0
.end method

.method private genFeedbackTaskModeActionClickListener()Lcom/miui/gallery/search/core/display/OnActionClickListener;
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$1;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/resultpage/SearchResultFragment$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method protected changeFilterData(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    return-void
.end method

.method protected changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    :cond_0
    return-void
.end method

.method protected closeLoadMore()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->closeLoadMore()V

    return-void
.end method

.method protected getDefaultTitle()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mDefaultTitle:Ljava/lang/String;

    return-object v0
.end method

.method protected getErrorViewAdapter()Lcom/miui/gallery/search/StatusHandleHelper$AbstractErrorViewAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mErrorViewAdapter:Lcom/miui/gallery/search/resultpage/SearchResultFragment$ErrorViewAdapter;

    return-object v0
.end method

.method protected getFrom()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mFrom:Ljava/lang/String;

    return-object v0
.end method

.method protected getLayoutResource()I
    .locals 1

    const v0, 0x7f0b014a

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

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    if-eqz v1, :cond_1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mPageName:Ljava/lang/String;

    return-object v0
.end method

.method protected getResultView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method protected moreThanOnePage()Z
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v3}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->getItemCount()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-virtual {v2, v3}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v2

    if-eqz v0, :cond_0

    if-nez v2, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method protected onInflateView(Landroid/view/View;Landroid/os/Bundle;Landroid/net/Uri;)V
    .locals 9

    const p2, 0x7f090267

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    const-string p1, "locationList"

    const-string p2, "type"

    invoke-virtual {p3, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const-string p1, "from_location_list"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mFrom:Ljava/lang/String;

    const p1, 0x7f100639

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mDefaultTitle:Ljava/lang/String;

    const-string p1, "search_location_list"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mPageName:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string p1, "tagList"

    const-string p2, "type"

    invoke-virtual {p3, p2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "from_tag_list"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mFrom:Ljava/lang/String;

    const p1, 0x7f10063f

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mDefaultTitle:Ljava/lang/String;

    const-string p1, "search_tag_list"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mPageName:Ljava/lang/String;

    goto :goto_0

    :cond_1
    const-string p1, "from_image_result"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mFrom:Ljava/lang/String;

    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragmentBase;->getDefaultTitle()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mDefaultTitle:Ljava/lang/String;

    const-string p1, "search_result"

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mPageName:Ljava/lang/String;

    :goto_0
    new-instance p1, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object p3

    invoke-virtual {p3}, Lcom/miui/gallery/search/core/context/SearchContext;->getSuggestionViewFactory()Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    move-result-object p3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mFrom:Ljava/lang/String;

    invoke-direct {p1, p2, p3, v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;-><init>(Landroid/app/Activity;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Ljava/lang/String;)V

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->setOnLoadMoreListener(Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-boolean p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mInFeedbackTaskMode:Z

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->genFeedbackTaskModeActionClickListener()Lcom/miui/gallery/search/core/display/OnActionClickListener;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->setActionClickListener(Lcom/miui/gallery/search/core/display/OnActionClickListener;)V

    :cond_2
    new-instance v8, Landroid/support/v7/widget/GridLayoutManager;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0a004e

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getInteger(I)I

    move-result p2

    invoke-direct {v8, p1, p2}, Landroid/support/v7/widget/GridLayoutManager;-><init>(Landroid/content/Context;I)V

    new-instance p1, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-direct {p1, p0, v8, p2}, Lcom/miui/gallery/search/resultpage/SearchResultFragment$GridSpanLookUp;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;Landroid/support/v7/widget/GridLayoutManager;Lcom/miui/gallery/search/core/display/FullSpanDelegate;)V

    invoke-virtual {v8, p1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanSizeLookup(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1, v8}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0603d0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0603d1

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultView:Landroid/support/v7/widget/RecyclerView;

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p2

    move v1, v3

    invoke-direct/range {v0 .. v8}, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;-><init>(IIIIIIZLandroid/support/v7/widget/GridLayoutManager;)V

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method protected onLoadComplete()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->closeLoadMore()V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->refreshInfoViews()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/resultpage/SearchResultFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment$2;-><init>(Lcom/miui/gallery/search/resultpage/SearchResultFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method protected openLoadMore()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mResultAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->openLoadMore(Z)V

    return-void
.end method

.method protected restartFilterLoader(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method protected restartSectionDataLoader(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mSectionDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected restartSectionLoader(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchResultFragment;->mSectionsLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected usePersistentResponse()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
