.class public Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;
.super Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;
.source "SearchFeedbackLikelyResultFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;
    }
.end annotation


# instance fields
.field private mCheckedIds:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mContentView:Landroid/view/View;

.field private mReportButton:Landroid/widget/TextView;

.field private mSelectAllBtn:Landroid/widget/Button;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;-><init>()V

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;I)Z
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->isChecked(I)Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)Landroid/util/LongSparseArray;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->updateReportButtonState()V

    return-void
.end method

.method private getCheckedItemCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    return v0
.end method

.method private getCheckedPositions()Landroid/util/SparseBooleanArray;
    .locals 3

    new-instance v0, Landroid/util/SparseBooleanArray;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v1

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v2}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-direct {p0, v1}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->isChecked(I)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseBooleanArray;->put(IZ)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private initTopBar()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b013a

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090164

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f100618

    invoke-virtual {p0, v2}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mQueryText:Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v1, 0x7f090160

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v1, 0x7f090296

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    invoke-static {v1, v2, v5}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    invoke-virtual {v1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v1}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Lmiui/app/ActionBar;->setDisplayOptions(I)V

    new-instance v1, Landroid/app/ActionBar$LayoutParams;

    const/4 v2, -0x1

    const/16 v3, 0x13

    invoke-direct {v1, v2, v2, v3}, Landroid/app/ActionBar$LayoutParams;-><init>(III)V

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;Landroid/app/ActionBar$LayoutParams;)V

    return-void
.end method

.method private isChecked(I)Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1, p1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemId(I)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/util/LongSparseArray;->indexOfKey(J)I

    move-result p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private isCheckedAll()Z
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getCheckedItemCount()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private report()V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getCheckedPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getCheckedServerIdList(Landroid/util/SparseBooleanArray;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-gtz v1, :cond_0

    return-void

    :cond_0
    new-instance v1, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$2;-><init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)V

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mQueryText:Ljava/lang/String;

    iget-boolean v4, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mInFeedbackTaskMode:Z

    invoke-static {v2, v3, v4, v0, v1}, Lcom/miui/gallery/search/feedback/SearchFeedbackHelper;->reportFalseNegativeImages(Landroid/app/Activity;Ljava/lang/String;ZLjava/util/ArrayList;Lcom/miui/gallery/search/feedback/SearchFeedbackHelper$OnFeedbackCompleteListener;)V

    return-void
.end method

.method private toggleSelectAll()V
    .locals 5

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->isCheckedAll()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clear()V

    goto :goto_1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mCheckedIds:Landroid/util/LongSparseArray;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getItemId(I)J

    move-result-wide v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v1, v2, v3, v4}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->notifyDataSetChanged()V

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->updateReportButtonState()V

    return-void
.end method

.method private updateReportButtonState()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mReportButton:Landroid/widget/TextView;

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getCheckedItemCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lez v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    const/4 v2, 0x1

    :cond_1
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSelectAllBtn:Landroid/widget/Button;

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->isCheckedAll()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lmiui/gallery/support/MiuiSdkCompat;->setEditActionModeButton(Landroid/content/Context;Landroid/widget/Button;I)V

    return-void
.end method


# virtual methods
.method protected changeFilterData(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    return-void
.end method

.method protected changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V
    .locals 0

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->changeSuggestions(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->updateReportButtonState()V

    return-void
.end method

.method protected getFrom()Ljava/lang/String;
    .locals 1

    const-string v0, "from_likely_image_result"

    return-object v0
.end method

.method protected getLayoutResource()I
    .locals 1

    const v0, 0x7f0b0147

    return v0
.end method

.method protected getLoader()Landroid/content/Loader;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "search_likely_image_result"

    return-object v0
.end method

.method protected getResultView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mContentView:Landroid/view/View;

    return-object v0
.end method

.method protected getSectionDataQueryInfoBuilder()Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->getSectionDataQueryInfoBuilder()Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->setSearchType(Lcom/miui/gallery/search/SearchConstants$SearchType;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    return-object v0
.end method

.method protected initResultQueryInfoBuilder(Landroid/net/Uri;)Lcom/miui/gallery/search/core/QueryInfo$Builder;
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->initResultQueryInfoBuilder(Landroid/net/Uri;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_FEEDBACK_LIKELY_RESULT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->setSearchType(Lcom/miui/gallery/search/SearchConstants$SearchType;)Lcom/miui/gallery/search/core/QueryInfo$Builder;

    return-object p1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    if-nez p1, :cond_0

    return-void

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    const v0, 0x7f090160

    if-eq p1, v0, :cond_3

    const v0, 0x7f090265

    if-eq p1, v0, :cond_2

    const v0, 0x7f090296

    if-eq p1, v0, :cond_1

    goto :goto_0

    :cond_1
    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->toggleSelectAll()V

    goto :goto_0

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->report()V

    goto :goto_0

    :cond_3
    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->finish()V

    :goto_0
    return-void
.end method

.method protected onInflateView(Landroid/view/View;Landroid/os/Bundle;Landroid/net/Uri;)V
    .locals 1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    new-instance p3, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$LikelyResultAdapter;-><init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;Landroid/content/Context;)V

    invoke-virtual {p0, p2, p3}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->bind(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p3, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    new-instance p3, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;

    invoke-direct {p3, p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment$1;-><init>(Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;)V

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const p2, 0x7f0900af

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mContentView:Landroid/view/View;

    const p2, 0x7f090265

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mReportButton:Landroid/widget/TextView;

    iget-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mReportButton:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->initTopBar()V

    return-void
.end method

.method public onLoadMoreRequested()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mAdapter:Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/resultpage/ImageResultSimpleAdapter;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->closeLoadMore()V

    return-void

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/search/resultpage/SearchImageResultFragmentBase;->onLoadMoreRequested()V

    return-void
.end method

.method protected restartFilterLoader(Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method protected restartSectionDataLoader(Landroid/os/Bundle;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSectionDataLoaderCallback:Landroid/app/LoaderManager$LoaderCallbacks;

    invoke-virtual {v0, v1, p1, v2}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    return-void
.end method

.method protected restartSectionLoader(Landroid/os/Bundle;)V
    .locals 11

    new-instance p1, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;

    iget-object v0, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    iget-object v1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    new-instance v10, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;

    iget-object v3, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mResultSectionQueryInfo:Lcom/miui/gallery/search/core/QueryInfo;

    sget-object v4, Lcom/miui/gallery/search/SearchConstants$SectionType;->SECTION_TYPE_IMAGE_LIST:Lcom/miui/gallery/search/SearchConstants$SectionType;

    iget-object v2, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v2}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v5, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v2, v10

    invoke-direct/range {v2 .. v9}, Lcom/miui/gallery/search/core/suggestion/BaseSuggestionSection;-><init>(Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/SearchConstants$SectionType;Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/search/core/suggestion/Suggestion;)V

    const/4 v2, 0x0

    invoke-direct {p1, v0, v1, v2, v10}, Lcom/miui/gallery/search/resultpage/SearchImageResultHelper;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;ZLcom/miui/gallery/search/core/suggestion/SuggestionSection;)V

    iput-object p1, p0, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->mSectionDataResultHelper:Lcom/miui/gallery/search/resultpage/SearchResultHelper;

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->openLoadMore()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/resultpage/SearchFeedbackLikelyResultFragment;->onLoadMoreRequested()V

    return-void
.end method

.method protected updateTitle(Ljava/lang/String;)V
    .locals 0

    return-void
.end method
