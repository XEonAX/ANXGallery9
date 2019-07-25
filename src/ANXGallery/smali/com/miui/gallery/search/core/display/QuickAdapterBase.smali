.class public abstract Lcom/miui/gallery/search/core/display/QuickAdapterBase;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "QuickAdapterBase.java"

# interfaces
.implements Lcom/miui/gallery/search/core/display/FullSpanDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;,
        Lcom/miui/gallery/search/core/display/QuickAdapterBase$InnerDiffCallback;,
        Lcom/miui/gallery/search/core/display/QuickAdapterBase$NonDataDiffCallback;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;",
        ">;",
        "Lcom/miui/gallery/search/core/display/FullSpanDelegate;"
    }
.end annotation


# instance fields
.field protected final mContext:Landroid/content/Context;

.field private mCopyFooterLayout:Landroid/widget/LinearLayout;

.field private mCopyHeaderLayout:Landroid/widget/LinearLayout;

.field private mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

.field private mEmptyView:Landroid/view/View;

.field private mFootAndEmptyEnable:Z

.field private mFooterLayout:Landroid/widget/LinearLayout;

.field private mHeadAndEmptyEnable:Z

.field private mHeaderLayout:Landroid/widget/LinearLayout;

.field protected final mLayoutInflater:Landroid/view/LayoutInflater;

.field private mLoadCompleteView:Landroid/view/View;

.field private mLoadCompleteViewRes:I

.field private mLoadFailedViewOnClickListener:Landroid/view/View$OnClickListener;

.field private mLoadMoreFailedView:Landroid/view/View;

.field private mLoadMoreFailedViewRes:I

.field private mLoadMoreRequested:Z

.field private mLoadingView:Landroid/view/View;

.field private mLoadingViewRes:I

.field private mNextLoadEnable:Z

.field private mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

.field private mShowLoadingView:Z

.field private final mViewTypePositionList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyHeaderLayout:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyFooterLayout:Landroid/widget/LinearLayout;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mShowLoadingView:Z

    iput-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreRequested:Z

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingViewRes:I

    iput v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreFailedViewRes:I

    iput v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteViewRes:I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$1;-><init>(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadFailedViewOnClickListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/search/core/display/QuickAdapterBase$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$2;-><init>(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mContext:Landroid/content/Context;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mDataObserver:Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreFailedView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/core/display/QuickAdapterBase;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->genPositionList()V

    return-void
.end method

.method private ensureLayoutParams(Landroid/view/View;Landroid/view/ViewGroup;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-nez v0, :cond_0

    instance-of v0, p2, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    check-cast p2, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p2

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p2, v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->generateLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Landroid/support/v7/widget/RecyclerView$LayoutParams;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-void
.end method

.method private genPositionList()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getItemCount()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->ensureCapacity(I)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->noItemView()Z

    move-result v0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_4

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeadAndEmptyEnable:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFootAndEmptyEnable:Z

    if-eqz v0, :cond_8

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_5
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getInnerItemViewCount()I

    move-result v2

    if-ge v0, v2, :cond_6

    iget-object v2, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getInnerItemViewType(I)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_6
    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mShowLoadingView:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    const/4 v2, 0x4

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_8

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_8
    :goto_1
    return-void
.end method

.method private getLoadingView(Landroid/view/ViewGroup;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingView:Landroid/view/View;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingViewRes:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingViewRes:I

    goto :goto_0

    :cond_0
    const v1, 0x7f0b0145

    :goto_0
    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingView:Landroid/view/View;

    :cond_1
    new-instance p1, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadingView:Landroid/view/View;

    invoke-direct {p1, v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;-><init>(Landroid/view/View;)V

    return-object p1
.end method

.method private noItemView()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getInnerItemViewCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private notifyNonDataChanged()V
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->genPositionList()V

    new-instance v1, Lcom/miui/gallery/search/core/display/QuickAdapterBase$NonDataDiffCallback;

    iget-object v2, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-direct {v1, v0, v2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$NonDataDiffCallback;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    invoke-static {v1}, Landroid/support/v7/util/DiffUtil;->calculateDiff(Landroid/support/v7/util/DiffUtil$Callback;)Landroid/support/v7/util/DiffUtil$DiffResult;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/support/v7/util/DiffUtil$DiffResult;->dispatchUpdatesTo(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method private onBindLoadMore(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    iget-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreRequested:Z

    if-nez p1, :cond_0

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreRequested:Z

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    invoke-interface {p1}, Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;->onLoadMoreRequested()V

    :cond_0
    return-void
.end method


# virtual methods
.method public addFooterView(Landroid/view/View;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->addFooterView(Landroid/view/View;I)V

    return-void
.end method

.method public addFooterView(Landroid/view/View;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyFooterLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyFooterLayout:Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyFooterLayout:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt p2, v0, :cond_2

    const/4 p2, -0x1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method public addHeaderView(Landroid/view/View;)V
    .locals 1

    const/4 v0, -0x1

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->addHeaderView(Landroid/view/View;I)V

    return-void
.end method

.method public addHeaderView(Landroid/view/View;I)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyHeaderLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    new-instance v0, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyHeaderLayout:Landroid/widget/LinearLayout;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mCopyHeaderLayout:Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v0

    if-lt p2, v0, :cond_2

    const/4 p2, -0x1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;I)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method protected abstract bindInnerItemViewHolder(Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;I)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation
.end method

.method public closeLoadMore()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iput-boolean v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    :cond_0
    iput-boolean v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreRequested:Z

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->hideLoadMoreFailedView()V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method protected abstract createInnerItemViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TVH;"
        }
    .end annotation
.end method

.method protected getInnerItemPosition(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    sub-int/2addr p1, v0

    return p1
.end method

.method protected abstract getInnerItemViewCount()I
.end method

.method protected abstract getInnerItemViewType(I)I
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public hideLoadMoreFailedView()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreFailedView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreFailedView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->removeFooterView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method public isFullSpan(I)Z
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getItemViewType(I)I

    move-result p1

    packed-switch p1, :pswitch_data_0

    const/4 p1, 0x0

    return p1

    :pswitch_0
    const/4 p1, 0x1

    return p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isLoading()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    return v0
.end method

.method protected notifyDataChanged(Landroid/support/v7/util/DiffUtil$Callback;)V
    .locals 3

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->genPositionList()V

    new-instance v1, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;

    iget-object v2, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mViewTypePositionList:Ljava/util/ArrayList;

    invoke-direct {v1, v0, v2, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase$DataDiffCallback;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/support/v7/util/DiffUtil$Callback;)V

    invoke-static {v1}, Landroid/support/v7/util/DiffUtil;->calculateDiff(Landroid/support/v7/util/DiffUtil$Callback;)Landroid/support/v7/util/DiffUtil$DiffResult;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/support/v7/util/DiffUtil$DiffResult;->dispatchUpdatesTo(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    check-cast p1, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->onBindViewHolder(Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;I)V
    .locals 0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getItemViewType()I

    move-result p2

    packed-switch p2, :pswitch_data_0

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->getLayoutPosition()I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getInnerItemPosition(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->bindInnerItemViewHolder(Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;I)V

    iget-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mShowLoadingView:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getInnerItemViewCount()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    if-ne p2, p1, :cond_0

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->onBindLoadMore(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->onBindLoadMore(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_0
    :goto_0
    :pswitch_1
    return-void

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;
    .locals 1

    packed-switch p2, :pswitch_data_0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->createInnerItemViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    move-result-object p2

    goto :goto_0

    :pswitch_0
    invoke-direct {p0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->getLoadingView(Landroid/view/ViewGroup;)Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    move-result-object p2

    iget-object v0, p2, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;->itemView:Landroid/view/View;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->ensureLayoutParams(Landroid/view/View;Landroid/view/ViewGroup;)V

    goto :goto_0

    :pswitch_1
    new-instance p2, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mEmptyView:Landroid/view/View;

    invoke-direct {p2, v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;-><init>(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mEmptyView:Landroid/view/View;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->ensureLayoutParams(Landroid/view/View;Landroid/view/ViewGroup;)V

    goto :goto_0

    :pswitch_2
    new-instance p2, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-direct {p2, v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;-><init>(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->ensureLayoutParams(Landroid/view/View;Landroid/view/ViewGroup;)V

    goto :goto_0

    :pswitch_3
    new-instance p2, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-direct {p2, v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionViewHolder;-><init>(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-direct {p0, v0, p1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->ensureLayoutParams(Landroid/view/View;Landroid/view/ViewGroup;)V

    :goto_0
    return-object p2

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public openLoadMore()V
    .locals 1

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->openLoadMore(Z)V

    return-void
.end method

.method public openLoadMore(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mShowLoadingView:Z

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mNextLoadEnable:Z

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadMoreRequested:Z

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->hideLoadMoreFailedView()V

    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method public removeFooterView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mFooterLayout:Landroid/widget/LinearLayout;

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method public removeHeaderView(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->removeView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    if-nez p1, :cond_1

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mHeaderLayout:Landroid/widget/LinearLayout;

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->notifyNonDataChanged()V

    return-void
.end method

.method public setOnLoadMoreListener(Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mRequestLoadMoreListener:Lcom/miui/gallery/search/core/display/RequestLoadMoreListener;

    return-void
.end method

.method public showLoadCompleteView()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->closeLoadMore()V

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteView:Landroid/view/View;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLayoutInflater:Landroid/view/LayoutInflater;

    iget v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteViewRes:I

    if-lez v1, :cond_0

    iget v1, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteViewRes:I

    goto :goto_0

    :cond_0
    const v1, 0x7f0b0144

    :goto_0
    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteView:Landroid/view/View;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->mLoadCompleteView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/search/core/display/QuickAdapterBase;->addFooterView(Landroid/view/View;I)V

    return-void
.end method
