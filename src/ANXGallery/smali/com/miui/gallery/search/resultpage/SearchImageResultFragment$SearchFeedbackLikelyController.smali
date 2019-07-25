.class Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;
.super Ljava/lang/Object;
.source "SearchImageResultFragment.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SearchFeedbackLikelyController"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/search/resultpage/DataListSourceResult;",
        ">;"
    }
.end annotation


# instance fields
.field private mHasLikelyItems:Ljava/lang/Boolean;

.field private mLikelyGuide:Landroid/view/View;

.field private mLikelyGuideStub:Landroid/view/ViewStub;

.field final synthetic this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;Landroid/view/ViewStub;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuideStub:Landroid/view/ViewStub;

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuideStub:Landroid/view/ViewStub;

    return-void
.end method


# virtual methods
.method public hideLikelyBar()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/resultpage/DataListSourceResult;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/search/core/QueryInfo$Builder;

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-direct {p1, p2}, Lcom/miui/gallery/search/core/QueryInfo$Builder;-><init>(Lcom/miui/gallery/search/SearchConstants$SearchType;)V

    const-string p2, "pos"

    const-string v0, "0"

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const-string p2, "num"

    const-string v0, "1"

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const-string p2, "tagName"

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    const-string p2, "inFeedbackTaskMode"

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-boolean v0, v0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mInFeedbackTaskMode:Z

    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, p2, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->addParam(Ljava/lang/String;Ljava/lang/String;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object v2

    new-instance p1, Lcom/miui/gallery/search/core/query/QueryLoader;

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-static {p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->access$300(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;)Lcom/miui/gallery/activity/BaseActivity;

    move-result-object v1

    new-instance v3, Lcom/miui/gallery/search/resultpage/DataListResultProcessor;

    invoke-direct {v3}, Lcom/miui/gallery/search/resultpage/DataListResultProcessor;-><init>()V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-virtual {p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->receiveResultUpdates()Z

    move-result v5

    const/4 v4, 0x0

    const/4 v6, 0x0

    move-object v0, p1

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/search/core/query/QueryLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;ZZZ)V

    return-object p1
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/resultpage/DataListSourceResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/resultpage/DataListSourceResult;",
            ">;",
            "Lcom/miui/gallery/search/resultpage/DataListSourceResult;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p2}, Lcom/miui/gallery/search/resultpage/DataListSourceResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    const-string p1, "SearchImageResultFragment"

    const-string p2, "On query likely item finished [%s]"

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/search/utils/SearchLog;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->showLikelyBar()V

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/app/LoaderManager;->destroyLoader(I)V

    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/search/resultpage/DataListSourceResult;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/resultpage/DataListSourceResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/resultpage/DataListSourceResult;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public showLikelyBar()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x4

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mHasLikelyItems:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuideStub:Landroid/view/ViewStub;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuideStub:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    const v2, 0x7f09008f

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v2, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;

    invoke-direct {v2, p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->mLikelyGuide:Landroid/view/View;

    const v2, 0x7f0902fa

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    const v3, 0x7f10061c

    invoke-virtual {v2, v3}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment$SearchFeedbackLikelyController;->this$0:Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;

    iget-object v4, v4, Lcom/miui/gallery/search/resultpage/SearchImageResultFragment;->mQueryText:Ljava/lang/String;

    aput-object v4, v3, v1

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_3
    return-void
.end method
