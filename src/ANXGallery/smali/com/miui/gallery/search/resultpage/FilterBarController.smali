.class public Lcom/miui/gallery/search/resultpage/FilterBarController;
.super Ljava/lang/Object;
.source "FilterBarController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/FilterBarController$PaddingDecoration;
    }
.end annotation


# instance fields
.field private mActivity:Landroid/app/Activity;

.field private mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

.field private mContainer:Landroid/view/View;

.field private mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

.field private mFrom:Ljava/lang/String;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/miui/gallery/widget/TwoStageDrawer;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mActivity:Landroid/app/Activity;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iput-object p3, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mFrom:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/FilterBarController;)Lcom/miui/gallery/widget/TwoStageDrawer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/resultpage/FilterBarController;)Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    return-object p0
.end method


# virtual methods
.method public getFilterDataCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->getItemCount()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFilterBarVisible()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public showFilterBar(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/FilterBarController;->isFilterBarVisible()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    new-instance v0, Lcom/miui/gallery/search/resultpage/FilterBarController$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/resultpage/FilterBarController$1;-><init>(Lcom/miui/gallery/search/resultpage/FilterBarController;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/FilterBarController;->isFilterBarVisible()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    new-instance v0, Lcom/miui/gallery/search/resultpage/FilterBarController$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/resultpage/FilterBarController$2;-><init>(Lcom/miui/gallery/search/resultpage/FilterBarController;)V

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->post(Ljava/lang/Runnable;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method public swapCursor(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 5

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    const v2, 0x7f09012e

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/TwoStageDrawer;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mContainer:Landroid/view/View;

    const v2, 0x7f09012f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    const v2, 0x7f09012d

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mActivity:Landroid/app/Activity;

    invoke-static {}, Lcom/miui/gallery/search/core/context/SearchContext;->getInstance()Lcom/miui/gallery/search/core/context/SearchContext;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/search/core/context/SearchContext;->getSuggestionViewFactory()Lcom/miui/gallery/search/core/display/SuggestionViewFactory;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mFrom:Ljava/lang/String;

    invoke-direct {v0, v2, v3, v4}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;-><init>(Landroid/app/Activity;Lcom/miui/gallery/search/core/display/SuggestionViewFactory;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v2, v1, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v2, Lcom/miui/gallery/search/resultpage/FilterBarController$PaddingDecoration;

    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f060243

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    invoke-direct {v2, p0, v3}, Lcom/miui/gallery/search/resultpage/FilterBarController$PaddingDecoration;-><init>(Lcom/miui/gallery/search/resultpage/FilterBarController;I)V

    invoke-virtual {v0, v2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    :cond_1
    if-eqz p2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {p2}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v2, "filter_style"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mActivity:Landroid/app/Activity;

    invoke-virtual {v2}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const/4 v3, 0x1

    if-ne v0, v3, :cond_2

    const v0, 0x7f060244

    goto :goto_0

    :cond_2
    const v0, 0x7f060245

    :goto_0
    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/FilterBarController;->mAdapter:Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/search/core/display/BaseSuggestionAdapter;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    return-void
.end method
