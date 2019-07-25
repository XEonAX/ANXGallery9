.class public Lcom/miui/gallery/ui/TopSearchBarController;
.super Ljava/lang/Object;
.source "TopSearchBarController.java"

# interfaces
.implements Landroid/app/LoaderManager$LoaderCallbacks;
.implements Lcom/miui/gallery/search/widget/BannerSearchBar$OnHintClickListener;
.implements Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/app/LoaderManager$LoaderCallbacks<",
        "Lcom/miui/gallery/search/core/result/SuggestionResult;",
        ">;",
        "Lcom/miui/gallery/search/widget/BannerSearchBar$OnHintClickListener;",
        "Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;"
    }
.end annotation


# instance fields
.field private mActionBundle:Landroid/os/Bundle;

.field private mDefaultHints:[Lcom/miui/gallery/search/hint/SearchBarHintItem;

.field private mFragment:Lmiui/app/Fragment;

.field private mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

.field private mNeedReloadHint:Z

.field private mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

.field private mSearchTextView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/widget/BannerSearchBar;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mNeedReloadHint:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mDefaultHints:[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    iput-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mActionBundle:Landroid/os/Bundle;

    iput-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mFragment:Lmiui/app/Fragment;

    iput-object p2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const p2, 0x7f090059

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/widget/BannerSearchBar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    new-instance p1, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    invoke-direct {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getLocalDefaultHints()[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;-><init>([Lcom/miui/gallery/search/hint/SearchBarHintItem;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->setOnUpdateTextListener(Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnUpdateTextListener;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    iget-object p2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setHintAdapter(Lcom/miui/gallery/search/hint/SearchBarHintAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setOnHintClickListener(Lcom/miui/gallery/search/widget/BannerSearchBar$OnHintClickListener;)V

    const/4 p1, 0x1

    if-eqz p3, :cond_0

    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2, p1}, Landroid/os/Bundle;-><init>(I)V

    iput-object p2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mActionBundle:Landroid/os/Bundle;

    iget-object p2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mActionBundle:Landroid/os/Bundle;

    const-string v0, "from"

    invoke-virtual {p2, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    iput-boolean p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mNeedReloadHint:Z

    return-void
.end method

.method private formatHintResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)[Lcom/miui/gallery/search/hint/SearchBarHintItem;
    .locals 6

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-interface {p1}, Lcom/miui/gallery/search/core/result/SuggestionResult;->getData()Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v0

    new-array v0, v0, [Lcom/miui/gallery/search/hint/SearchBarHintItem;

    const/4 v1, 0x0

    :goto_0
    invoke-interface {p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-interface {p1, v1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->moveToPosition(I)Z

    const/16 v2, 0xfa0

    const-string v3, "display_duration"

    invoke-static {p1, v3}, Lcom/miui/gallery/ui/TopSearchBarController;->getString(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move v2, v3

    goto :goto_1

    :catch_0
    move-exception v3

    const-string v4, "TopSearchBarController"

    const-string v5, "error occurred when formatting hint display duration, %s"

    invoke-static {v4, v5, v3}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    :goto_1
    new-instance v3, Lcom/miui/gallery/search/hint/SearchBarHintItem;

    const-string v4, "hint_text"

    invoke-static {p1, v4}, Lcom/miui/gallery/ui/TopSearchBarController;->getString(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "query_text"

    invoke-static {p1, v5}, Lcom/miui/gallery/ui/TopSearchBarController;->getString(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5, v2}, Lcom/miui/gallery/search/hint/SearchBarHintItem;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    aput-object v3, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method private getHintText(IZ)Ljava/lang/String;
    .locals 1

    if-ltz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->getItem(I)Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/search/hint/SearchBarHintItem;

    if-eqz p2, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/search/hint/SearchBarHintItem;->getQueryText()Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Lcom/miui/gallery/search/hint/SearchBarHintItem;->getHintText()Ljava/lang/String;

    move-result-object p1

    :goto_0
    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private getLocalDefaultHints()[Lcom/miui/gallery/search/hint/SearchBarHintItem;
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mDefaultHints:[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    new-array v0, v0, [Lcom/miui/gallery/search/hint/SearchBarHintItem;

    const/4 v1, 0x0

    new-instance v2, Lcom/miui/gallery/search/hint/SearchBarHintItem;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const v4, 0x7f100623

    invoke-virtual {v3, v4}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lcom/miui/gallery/search/hint/SearchBarHintItem;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    aput-object v2, v0, v1

    iput-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mDefaultHints:[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mDefaultHints:[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    return-object v0
.end method

.method private static getString(Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    invoke-interface {p0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p1

    if-ltz p1, :cond_0

    invoke-interface {p0, p1}, Lcom/miui/gallery/search/core/suggestion/SuggestionCursor;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method private goToSearchPage(Landroid/net/Uri;)V
    .locals 9

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mActionBundle:Landroid/os/Bundle;

    invoke-static {v0, p1, v1}, Lcom/miui/gallery/util/ActionURIHandler;->handleUri(Landroid/app/Activity;Landroid/net/Uri;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object p1

    const/high16 v0, 0x7f010000

    const v1, 0x7f010001

    invoke-virtual {p1, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    goto/16 :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;

    invoke-direct {v1}, Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;-><init>()V

    invoke-static {v0, v1}, Landroid/support/v4/app/ActivityCompat;->setExitSharedElementCallback(Landroid/app/Activity;Landroid/support/v4/app/SharedElementCallback;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050128

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f050129

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/miui/gallery/search/SearchActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    const-string p1, "from"

    iget-object v1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mActionBundle:Landroid/os/Bundle;

    const-string v2, "from"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string p1, "usingSpecialAnimation"

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const v2, 0x7f090283

    invoke-virtual {p1, v2}, Lcom/miui/gallery/search/widget/BannerSearchBar;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const v3, 0x7f090285

    invoke-virtual {v2, v3}, Lcom/miui/gallery/search/widget/BannerSearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const/4 v4, 0x3

    new-array v4, v4, [Landroid/support/v4/util/Pair;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const v8, 0x7f100641

    invoke-virtual {v7, v8}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v5

    const v6, 0x7f100640

    invoke-virtual {v5, v6}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object p1

    aput-object p1, v4, v1

    const/4 p1, 0x2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v5, 0x7f100642

    invoke-virtual {v1, v5}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Landroid/support/v4/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/support/v4/util/Pair;

    move-result-object v1

    aput-object v1, v4, p1

    invoke-static {v3, v4}, Landroid/support/v4/app/ActivityOptionsCompat;->makeSceneTransitionAnimation(Landroid/app/Activity;[Landroid/support/v4/util/Pair;)Landroid/support/v4/app/ActivityOptionsCompat;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {p1}, Landroid/support/v4/app/ActivityOptionsCompat;->toBundle()Landroid/os/Bundle;

    move-result-object p1

    invoke-static {v1, v0, p1}, Landroid/support/v4/app/ActivityCompat;->startActivity(Landroid/content/Context;Landroid/content/Intent;Landroid/os/Bundle;)V

    :goto_0
    return-void
.end method

.method private updateHintData([Lcom/miui/gallery/search/hint/SearchBarHintItem;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mHintAdapter:Lcom/miui/gallery/search/hint/SearchBarHintAdapter;

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getLocalDefaultHints()[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    move-result-object p1

    :cond_0
    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/hint/SearchBarHintAdapter;->setData([Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;)V

    return-void
.end method


# virtual methods
.method protected getActivity()Landroid/app/Activity;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    return-object v0
.end method

.method protected getLoaderManager()Landroid/app/LoaderManager;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mFragment:Lmiui/app/Fragment;

    invoke-virtual {v0}, Lmiui/app/Fragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    return-object v0
.end method

.method public onCreateLoader(ILandroid/os/Bundle;)Landroid/content/Loader;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Landroid/os/Bundle;",
            ")",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ">;"
        }
    .end annotation

    new-instance p1, Lcom/miui/gallery/search/core/QueryInfo$Builder;

    sget-object p2, Lcom/miui/gallery/search/SearchConstants$SearchType;->SEARCH_TYPE_HINT:Lcom/miui/gallery/search/SearchConstants$SearchType;

    invoke-direct {p1, p2}, Lcom/miui/gallery/search/core/QueryInfo$Builder;-><init>(Lcom/miui/gallery/search/SearchConstants$SearchType;)V

    invoke-virtual {p1}, Lcom/miui/gallery/search/core/QueryInfo$Builder;->build()Lcom/miui/gallery/search/core/QueryInfo;

    move-result-object p1

    new-instance p2, Lcom/miui/gallery/search/core/query/QueryLoader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getActivity()Landroid/app/Activity;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/core/resultprocessor/LinearResultProcessor;

    invoke-direct {v1}, Lcom/miui/gallery/search/core/resultprocessor/LinearResultProcessor;-><init>()V

    invoke-direct {p2, v0, p1, v1}, Lcom/miui/gallery/search/core/query/QueryLoader;-><init>(Landroid/content/Context;Lcom/miui/gallery/search/core/QueryInfo;Lcom/miui/gallery/search/core/resultprocessor/ResultProcessor;)V

    return-object p2
.end method

.method public onHintClicked(Lcom/miui/gallery/search/widget/BannerSearchBar;I)V
    .locals 1

    sget-object p1, Lcom/miui/gallery/provider/GalleryContract$Search;->URI_SEARCH_PAGE:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    const/4 v0, 0x1

    invoke-direct {p0, p2, v0}, Lcom/miui/gallery/ui/TopSearchBarController;->getHintText(IZ)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "queryHint"

    invoke-virtual {p1, v0, p2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_0
    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/TopSearchBarController;->goToSearchPage(Landroid/net/Uri;)V

    return-void
.end method

.method public onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Loader<",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ">;",
            "Lcom/miui/gallery/search/core/result/SuggestionResult;",
            ")V"
        }
    .end annotation

    if-eqz p2, :cond_0

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/TopSearchBarController;->formatHintResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)[Lcom/miui/gallery/search/hint/SearchBarHintItem;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, v0}, Lcom/miui/gallery/ui/TopSearchBarController;->updateHintData([Lcom/miui/gallery/search/hint/SearchBarHintItem;)V

    if-eqz p2, :cond_2

    invoke-static {p2}, Lcom/miui/gallery/search/utils/SearchUtils;->isErrorResult(Lcom/miui/gallery/search/core/result/SuggestionResult;)Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    goto :goto_2

    :cond_2
    :goto_1
    const/4 p2, 0x1

    :goto_2
    iput-boolean p2, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mNeedReloadHint:Z

    :try_start_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Loader;->getId()I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/app/LoaderManager;->destroyLoader(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    const-string p2, "TopSearchBarController"

    const-string v0, "Failed when destroying loader [%s]"

    invoke-static {p2, v0, p1}, Lcom/miui/gallery/search/utils/SearchLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    :goto_3
    return-void
.end method

.method public bridge synthetic onLoadFinished(Landroid/content/Loader;Ljava/lang/Object;)V
    .locals 0

    check-cast p2, Lcom/miui/gallery/search/core/result/SuggestionResult;

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/TopSearchBarController;->onLoadFinished(Landroid/content/Loader;Lcom/miui/gallery/search/core/result/SuggestionResult;)V

    return-void
.end method

.method public onLoaderReset(Landroid/content/Loader;)V
    .locals 0

    return-void
.end method

.method public onPause()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/BannerSearchBar;->getLooperController()Lcom/miui/gallery/search/widget/bannerView/ILoopController;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/widget/bannerView/ILoopController;->stopLoop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const v1, 0x7f09005a

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public onResume()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/BannerSearchBar;->getLooperController()Lcom/miui/gallery/search/widget/bannerView/ILoopController;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/search/widget/bannerView/ILoopController;->startLoop()V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const v1, 0x7f09005a

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setHintTextColor(I)V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mNeedReloadHint:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/TopSearchBarController;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/16 v2, 0xb

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, p0}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mNeedReloadHint:Z

    :cond_0
    return-void
.end method

.method public onUpdateText(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchTextView:Landroid/widget/TextView;

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setHint(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setEnable(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setClickable(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/TopSearchBarController;->mSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setEnabled(Z)V

    return-void
.end method
