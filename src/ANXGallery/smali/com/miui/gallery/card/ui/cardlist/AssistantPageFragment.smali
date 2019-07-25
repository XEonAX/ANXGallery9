.class public Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "AssistantPageFragment.java"


# instance fields
.field private mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

.field private final mAdapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field private final mCardObserver:Lcom/miui/gallery/card/CardManager$CardObserver;

.field private mEmptyPage:Lcom/miui/gallery/widget/EmptyPage;

.field private mHasMore:Z

.field private mIsFirstLoad:Z

.field private mIsLoading:Z

.field private mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

.field private mLoadMoreLayout:Lcom/miui/gallery/widget/LoadMoreLayout;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private final mScrollToBottomListener:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsLoading:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mHasMore:Z

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsFirstLoad:Z

    new-instance v0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$1;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mScrollToBottomListener:Ljava/lang/Runnable;

    new-instance v0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$2;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    new-instance v0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$3;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mCardObserver:Lcom/miui/gallery/card/CardManager$CardObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->loadMoreCard()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/card/ui/cardlist/CardAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->updateCardList()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;ILcom/miui/gallery/card/Card;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->updateCard(ILcom/miui/gallery/card/Card;)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Lcom/miui/gallery/widget/LoadMoreLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mLoadMoreLayout:Lcom/miui/gallery/widget/LoadMoreLayout;

    return-object p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mHasMore:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsFirstLoad:Z

    return p0
.end method

.method static synthetic access$702(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsFirstLoad:Z

    return p1
.end method

.method static synthetic access$802(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsLoading:Z

    return p1
.end method

.method private loadMoreCard()V
    .locals 3

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsLoading:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mHasMore:Z

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mUserFirstVisible:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "AssistantPageFragment"

    const-string v1, "loadMoreCard"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mIsLoading:Z

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mLoadMoreLayout:Lcom/miui/gallery/widget/LoadMoreLayout;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/LoadMoreLayout;->startLoad()V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMiscPool()Lcom/miui/gallery/threadpool/ThreadPool;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$6;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    new-instance v2, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;

    invoke-direct {v2, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$7;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/threadpool/ThreadPool;->submit(Lcom/miui/gallery/threadpool/ThreadPool$Job;Lcom/miui/gallery/threadpool/FutureListener;)Lcom/miui/gallery/threadpool/Future;

    return-void

    :cond_1
    :goto_0
    return-void
.end method

.method private postOnUiThread(Ljava/lang/Runnable;)V
    .locals 2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :goto_0
    return-void
.end method

.method private updateCard(ILcom/miui/gallery/card/Card;)V
    .locals 0

    if-gez p1, :cond_0

    return-void

    :cond_0
    new-instance p2, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$4;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$4;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;I)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->postOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private updateCardList()V
    .locals 1

    new-instance v0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$5;

    invoke-direct {v0, p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment$5;-><init>(Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;)V

    invoke-direct {p0, v0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->postOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "assistant"

    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mCardObserver:Lcom/miui/gallery/card/CardManager$CardObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/CardManager;->unregisterObserver(Lcom/miui/gallery/card/CardManager$CardObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    :cond_0
    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b0020

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    const v0, 0x7f090258

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mLayoutManager:Landroid/support/v7/widget/RecyclerView$LayoutManager;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f070080

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Lcom/miui/gallery/util/DividerItemDecoration;

    const/4 v3, 0x1

    invoke-direct {v2, v0, p3, v3}, Lcom/miui/gallery/util/DividerItemDecoration;-><init>(Landroid/graphics/drawable/Drawable;II)V

    invoke-virtual {v1, v2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mScrollToBottomListener:Ljava/lang/Runnable;

    invoke-static {v0, v1}, Lcom/miui/gallery/util/MiscUtil;->setRecyclerViewScrollToBottomListener(Landroid/support/v7/widget/RecyclerView;Ljava/lang/Runnable;)V

    new-instance v0, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object v1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapterDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const v1, 0x7f0b00a9

    invoke-virtual {p1, v1, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/LoadMoreLayout;

    iput-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mLoadMoreLayout:Lcom/miui/gallery/widget/LoadMoreLayout;

    iget-object v0, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const v1, 0x7f0b003c

    invoke-virtual {p1, v1, v0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/EmptyPage;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mEmptyPage:Lcom/miui/gallery/widget/EmptyPage;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mEmptyPage:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/EmptyPage;->setActionButtonVisible(Z)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mEmptyPage:Lcom/miui/gallery/widget/EmptyPage;

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$Assistant;->hasCardEver()Z

    move-result p3

    if-eqz p3, :cond_0

    const p3, 0x7f10032f

    goto :goto_0

    :cond_0
    const p3, 0x7f10032e

    :goto_0
    invoke-virtual {p1, p3}, Lcom/miui/gallery/widget/EmptyPage;->setDescription(I)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mEmptyPage:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/card/ui/cardlist/CardAdapter;->setEmptyView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mAdapter:Lcom/miui/gallery/card/ui/cardlist/CardAdapter;

    invoke-virtual {p1, p3}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    invoke-static {}, Lcom/miui/gallery/card/CardManager;->getInstance()Lcom/miui/gallery/card/CardManager;

    move-result-object p1

    iget-object p3, p0, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->mCardObserver:Lcom/miui/gallery/card/CardManager$CardObserver;

    invoke-virtual {p1, p3}, Lcom/miui/gallery/card/CardManager;->registerObserver(Lcom/miui/gallery/card/CardManager$CardObserver;)V

    return-object p2
.end method

.method protected onUserFirstVisible()V
    .locals 2

    const-string v0, "AssistantPageFragment"

    const-string v1, "onUserFirstVisible"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/miui/gallery/card/ui/cardlist/AssistantPageFragment;->loadMoreCard()V

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->setUserVisibleHint(Z)V

    if-eqz p1, :cond_0

    const-string p1, "assistant"

    const-string v0, "assistant_tab_page_view"

    invoke-static {p1, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
