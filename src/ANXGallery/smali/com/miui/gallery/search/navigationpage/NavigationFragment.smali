.class public Lcom/miui/gallery/search/navigationpage/NavigationFragment;
.super Lcom/miui/gallery/search/SearchFragmentBase;
.source "NavigationFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/navigationpage/NavigationFragment$StatusReportDelegate;,
        Lcom/miui/gallery/search/navigationpage/NavigationFragment$ErrorViewAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

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

.field private mIsLoading:Z

.field private mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

.field private mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

.field private mStatusLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/app/LoaderManager$LoaderCallbacks<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mStatusReportDelegate:Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragmentBase;-><init>()V

    new-instance v0, Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-direct {v0}, Lcom/miui/gallery/search/StatusHandleHelper;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    new-instance v0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$StatusReportDelegate;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$StatusReportDelegate;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusReportDelegate:Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;

    new-instance v0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$2;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

    new-instance v0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$3;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    new-instance v0, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$4;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mSectionProcessor:Lcom/miui/gallery/search/core/resultprocessor/SectionedResultProcessor;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/navigationpage/NavigationAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mAdapter:Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mIsLoading:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/search/navigationpage/NavigationFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mIsLoading:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/StatusHandleHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusReportDelegate:Lcom/miui/gallery/search/SearchStatusLoader$StatusReportDelegate;

    return-object p0
.end method

.method private restartDataLoader()V
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mIsLoading:Z

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->refreshInfoViews()V

    return-void
.end method


# virtual methods
.method public doRetry()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    invoke-virtual {v0}, Lcom/miui/gallery/search/StatusHandleHelper;->getResultStatus()I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/search/SearchConstants;->isErrorStatus(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->restartDataLoader()V

    :cond_0
    return-void
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "search_navigation"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/search/SearchFragmentBase;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-direct {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->restartDataLoader()V

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

    iput-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2, p3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p2, Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

    iget-object p3, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/context/SearchContext;->getSuggestionViewFactory()Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    move-result-object v0

    const-string v1, "from_navigation"

    invoke-direct {p2, p3, v0, v1}, Lcom/miui/gallery/search/navigationpage/NavigationAdapter;-><init>(Landroid/app/Activity;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mAdapter:Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    iget-object p3, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mAdapter:Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance p3, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mAdapter:Lcom/miui/gallery/search/navigationpage/NavigationAdapter;

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p3

    invoke-direct/range {v0 .. v5}, Lcom/miui/gallery/search/core/display/SectionedSuggestionItemDecoration;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/display/SectionedSuggestionAdapter;ZIZ)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    new-instance p3, Lcom/miui/gallery/search/navigationpage/NavigationFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$1;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/RecyclerView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mStatusHandleHelper:Lcom/miui/gallery/search/StatusHandleHelper;

    iget-object v1, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mDataView:Landroid/support/v7/widget/RecyclerView;

    const p2, 0x7f09017a

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const p2, 0x7f0901b5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const p2, 0x7f0900fd

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v5, Lcom/miui/gallery/search/navigationpage/NavigationFragment$ErrorViewAdapter;

    iget-object p2, p0, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v5, p0, p2}, Lcom/miui/gallery/search/navigationpage/NavigationFragment$ErrorViewAdapter;-><init>(Lcom/miui/gallery/search/navigationpage/NavigationFragment;Landroid/content/Context;)V

    invoke-virtual/range {v0 .. v5}, Lcom/miui/gallery/search/StatusHandleHelper;->init(Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/miui/gallery/search/StatusHandleHelper$ErrorViewAdapter;)V

    return-object p1
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/search/SearchFragmentBase;->onResume()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Loader;->forceLoad()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;->doRetry()V

    return-void
.end method
