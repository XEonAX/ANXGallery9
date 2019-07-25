.class public Lcom/miui/gallery/search/SearchFragment;
.super Lcom/miui/gallery/ui/BaseFragment;
.source "SearchFragment.java"

# interfaces
.implements Lcom/miui/gallery/search/SearchFragmentCallback;
.implements Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;


# instance fields
.field private mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

.field private mSearchView:Lcom/miui/gallery/search/widget/SearchView;

.field private mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

.field private mTopVisibleFragment:Lcom/miui/gallery/search/SearchFragmentBase;

.field private mTransitionHelper:Lcom/miui/gallery/search/transitions/SearchTransitionHelper;

.field private mUseTransition:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseFragment;-><init>()V

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/miui/gallery/search/SearchFragmentBase;

    iput-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    new-instance v0, Lcom/miui/gallery/search/SearchFragment$4;

    invoke-direct {v0, p0}, Lcom/miui/gallery/search/SearchFragment$4;-><init>(Lcom/miui/gallery/search/SearchFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    new-instance v0, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;

    invoke-direct {v0, p0, p0}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;-><init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/transitions/SearchTransitionHelper$SearchTransitionListener;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mTransitionHelper:Lcom/miui/gallery/search/transitions/SearchTransitionHelper;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/search/widget/SearchView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/search/SearchFragmentBase;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mTopVisibleFragment:Lcom/miui/gallery/search/SearchFragmentBase;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/SearchFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragment;->getQueryText()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/search/SearchFragment;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->setTopFragment(I)V

    return-void
.end method

.method static synthetic access$500(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/search/SearchFragment;)Lcom/miui/gallery/activity/BaseActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    return-object p0
.end method

.method private configSearchView()V
    .locals 4

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/SearchFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/search/SearchFragment$1;-><init>(Lcom/miui/gallery/search/SearchFragment;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private ensureFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;
    .locals 2

    packed-switch p1, :pswitch_data_0

    goto :goto_0

    :pswitch_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    aget-object v0, v0, p1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    new-instance v1, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;

    invoke-direct {v1}, Lcom/miui/gallery/search/suggestionpage/SuggestionFragment;-><init>()V

    aput-object v1, v0, p1

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    aget-object v0, v0, p1

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    new-instance v1, Lcom/miui/gallery/search/navigationpage/NavigationFragment;

    invoke-direct {v1}, Lcom/miui/gallery/search/navigationpage/NavigationFragment;-><init>()V

    aput-object v1, v0, p1

    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    aget-object v0, v0, p1

    invoke-virtual {v0, p0}, Lcom/miui/gallery/search/SearchFragmentBase;->setSearchFragmentCallback(Lcom/miui/gallery/search/SearchFragmentCallback;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->getFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;

    move-result-object p1

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private extractQueryFromVoiceAssistantResult(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    :try_start_0
    const-string v0, "android.speech.extra.RESULTS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string p1, "nlpIntention"

    invoke-virtual {v0, p1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Lcom/google/gson/Gson;

    invoke-direct {v0}, Lcom/google/gson/Gson;-><init>()V

    const-class v1, Lcom/google/gson/JsonObject;

    invoke-virtual {v0, p1, v1}, Lcom/google/gson/Gson;->fromJson(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/gson/JsonObject;

    const-string v0, "search_query"

    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const-string v0, "query"

    invoke-virtual {p1, v0}, Lcom/google/gson/JsonObject;->get(Ljava/lang/String;)Lcom/google/gson/JsonElement;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/gson/JsonElement;->getAsString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_1
    const-string v0, "android.speech.extra.RESULTS"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    const-string v0, "SearchFragment"

    const-string v1, "Error occurred while extracting query from voice assistant result, %s"

    invoke-static {v0, v1, p1}, Lcom/miui/gallery/search/utils/SearchLog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method private getFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mFragments:[Lcom/miui/gallery/search/SearchFragmentBase;

    aget-object p1, v0, p1

    return-object p1
.end method

.method private getFromFromIntent(Landroid/content/Intent;)Ljava/lang/String;
    .locals 2

    const-string v0, "from"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    const-string v0, "from"

    invoke-virtual {p1, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method private getQueryText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/SearchView;->getQueryText()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/SearchView;->getQueryText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0
.end method

.method private initTopBar()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/search/widget/SearchView;

    iget-object v1, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/widget/SearchView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowCustomEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setCustomView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lmiui/app/ActionBar;->setDisplayShowTitleEnabled(Z)V

    return-void
.end method

.method private isTopFragment(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mTopVisibleFragment:Lcom/miui/gallery/search/SearchFragmentBase;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mTopVisibleFragment:Lcom/miui/gallery/search/SearchFragmentBase;

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->getFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;

    move-result-object p1

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private recordQueryArrivedFromIntent(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "from_search"

    invoke-static {v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->createNewSerial(Ljava/lang/String;)Ljava/lang/String;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "queryText"

    invoke-virtual {v0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "srcPage"

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "client_enter_search_page"

    const/4 p2, 0x0

    invoke-static {p2, p1, v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->cacheEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private setTopFragment(I)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->isTopFragment(I)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->getFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->ensureFragment(I)Lcom/miui/gallery/search/SearchFragmentBase;

    move-result-object v1

    :cond_0
    const v2, 0x7f090287

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v2, v1, p1}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;Ljava/lang/String;)Landroid/app/FragmentTransaction;

    invoke-virtual {v0}, Landroid/app/FragmentTransaction;->commitAllowingStateLoss()I

    iput-object v1, p0, Lcom/miui/gallery/search/SearchFragment;->mTopVisibleFragment:Lcom/miui/gallery/search/SearchFragmentBase;

    :cond_1
    return-void
.end method

.method private updateQueryFromIntent(Ljava/lang/String;Z)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/widget/SearchView;->setQueryText(Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/SearchFragment;->setTopFragment(I)V

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/SearchFragment$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/miui/gallery/search/SearchFragment$3;-><init>(Lcom/miui/gallery/search/SearchFragment;Ljava/lang/String;Z)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "search"

    return-object v0
.end method

.method public getSharedElementCallback(Z)Landroid/support/v4/app/SharedElementCallback;
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/search/SearchFragment;->mTransitionHelper:Lcom/miui/gallery/search/transitions/SearchTransitionHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelper;->getSharedElementCallback()Lcom/miui/gallery/search/transitions/SearchSharedElementCallback;

    move-result-object p1

    return-object p1
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 6

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseFragment;->onActivityCreated(Landroid/os/Bundle;)V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    const-string v2, "query"

    invoke-virtual {v1, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v4, "queryHint"

    invoke-virtual {v1, v4}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v5, "enableShortcut"

    invoke-virtual {v1, v5, v3}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v1

    goto :goto_0

    :cond_0
    move-object v4, v2

    const/4 v1, 0x0

    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v1, v4}, Lcom/miui/gallery/search/widget/SearchView;->setQueryText(Ljava/lang/String;)V

    :cond_1
    invoke-direct {p0, v3}, Lcom/miui/gallery/search/SearchFragment;->setTopFragment(I)V

    goto :goto_1

    :cond_2
    invoke-direct {p0, v2, v1}, Lcom/miui/gallery/search/SearchFragment;->updateQueryFromIntent(Ljava/lang/String;Z)V

    :goto_1
    iget-object v1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-static {}, Lcom/miui/gallery/util/IntentUtil;->isSpeechInputSupported()Z

    move-result v4

    invoke-virtual {v1, v4}, Lcom/miui/gallery/search/widget/SearchView;->setVoiceButtonEnabled(Z)V

    const/4 v1, 0x1

    if-eqz p1, :cond_4

    const-string v4, "state_first_creation"

    invoke-virtual {p1, v4, v1}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_3

    goto :goto_2

    :cond_3
    const/4 p1, 0x0

    goto :goto_3

    :cond_4
    :goto_2
    const/4 p1, 0x1

    :goto_3
    const-string v4, "usingSpecialAnimation"

    invoke-virtual {v0, v4, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz p1, :cond_5

    if-eqz v3, :cond_5

    invoke-static {}, Lcom/miui/gallery/search/transitions/SearchTransitionHelperImp;->supportSharedElementTransition()Z

    move-result p1

    if-eqz p1, :cond_5

    iput-boolean v1, p0, Lcom/miui/gallery/search/SearchFragment;->mUseTransition:Z

    iget-object p1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const v1, 0x7f090289

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f100641

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/SearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setTransitionName(Landroid/view/View;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const v1, 0x7f090284

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f100640

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/SearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setTransitionName(Landroid/view/View;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const v1, 0x7f090285

    invoke-virtual {p1, v1}, Lcom/miui/gallery/search/widget/SearchView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const v1, 0x7f100642

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/SearchFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Landroid/support/v4/view/ViewCompat;->setTransitionName(Landroid/view/View;Ljava/lang/String;)V

    iget-object p1, p0, Lcom/miui/gallery/search/SearchFragment;->mTransitionHelper:Lcom/miui/gallery/search/transitions/SearchTransitionHelper;

    invoke-virtual {p1}, Lcom/miui/gallery/search/transitions/SearchTransitionHelper;->configTransition()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/SearchFragment;->getActivity()Landroid/app/Activity;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/app/ActivityCompat;->startPostponedEnterTransition(Landroid/app/Activity;)V

    goto :goto_4

    :cond_5
    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragment;->configSearchView()V

    :goto_4
    invoke-direct {p0, v0}, Lcom/miui/gallery/search/SearchFragment;->getFromFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v2, p1}, Lcom/miui/gallery/search/SearchFragment;->recordQueryArrivedFromIntent(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 6

    const/4 v0, -0x1

    const/16 v1, 0x29

    if-ne p1, v1, :cond_2

    if-ne p2, v0, :cond_2

    if-eqz p3, :cond_2

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    const-string p2, "server_id_of_album"

    invoke-virtual {p1, p2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p2

    const-string v0, "origin_album_name"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    const-string v1, "mark_album_name"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "album_name"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v1, v0

    :cond_0
    invoke-virtual {p3}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p3

    const-string v2, "mark_relation"

    invoke-virtual {p3, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragment;->getQueryText()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lcom/miui/gallery/search/SearchConfig;->get()Lcom/miui/gallery/search/SearchConfig;

    move-result-object v4

    invoke-virtual {v4}, Lcom/miui/gallery/search/SearchConfig;->getSuggestionConfig()Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;

    move-result-object v4

    invoke-virtual {v4, v1, p2, p1}, Lcom/miui/gallery/search/SearchConfig$SuggestionConfig;->addQueryExtra(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v4, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-virtual {v4, v3}, Lcom/miui/gallery/search/widget/SearchView;->setQueryText(Ljava/lang/String;)V

    iget-object v4, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchViewListener:Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;

    iget-object v5, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    invoke-interface {v4, v5, v3}, Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;->onQueryTextSubmit(Landroid/view/View;Ljava/lang/String;)V

    :cond_1
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    const-string v4, "peopleServerID"

    invoke-static {p1}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v3, v4, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "originName"

    invoke-static {p2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "newName"

    invoke-static {v1}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "markName"

    invoke-static {v0}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "queryText"

    invoke-static {v2}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "markRelation"

    invoke-static {p3}, Lcom/miui/gallery/util/StringUtils;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-interface {v3, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "from_guide"

    const-string p2, "suggestion_mark_people"

    invoke-static {p1, p2, v3}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    goto :goto_0

    :cond_2
    const/16 v1, 0x2b

    if-ne p1, v1, :cond_3

    if-ne p2, v0, :cond_3

    invoke-direct {p0, p3}, Lcom/miui/gallery/search/SearchFragment;->extractQueryFromVoiceAssistantResult(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_3

    const/4 p2, 0x0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/SearchFragment;->updateQueryFromIntent(Ljava/lang/String;Z)V

    const-string p2, "from_search"

    const-string p3, "receive_voice_assistant_result"

    const-string v0, "query"

    invoke-static {p2, p3, v0, p1}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->reportEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_0
    return-void
.end method

.method public onBackPressed()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public onDestroy()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onDestroy()V

    const-string v0, "from_search"

    invoke-static {v0}, Lcom/miui/gallery/search/statistics/SearchStatUtils;->onCompleteSerial(Ljava/lang/String;)Ljava/lang/String;

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b013c

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragment;->initTopBar()V

    return-object p1
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 4

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "query"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "enableShortcut"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-direct {p0, v1, v0}, Lcom/miui/gallery/search/SearchFragment;->updateQueryFromIntent(Ljava/lang/String;Z)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/SearchFragment;->getFromFromIntent(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, v1, p1}, Lcom/miui/gallery/search/SearchFragment;->recordQueryArrivedFromIntent(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/SearchView;->setSearchViewListener(Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;)V

    return-void
.end method

.method public onResume()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseFragment;->onResume()V

    iget-boolean v0, p0, Lcom/miui/gallery/search/SearchFragment;->mUseTransition:Z

    if-nez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/SearchFragment$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/search/SearchFragment$2;-><init>(Lcom/miui/gallery/search/SearchFragment;)V

    const-wide/16 v2, 0x64

    invoke-virtual {v0, v1, v2, v3}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_0
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2

    const-string v0, "state_first_creation"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    return-void
.end method

.method public onTransitionEnd()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/SearchFragment;->mUseTransition:Z

    invoke-direct {p0}, Lcom/miui/gallery/search/SearchFragment;->configSearchView()V

    return-void
.end method

.method public onTransitionStart()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/SearchView;->setSearchViewListener(Lcom/miui/gallery/search/widget/SearchView$SearchViewListener;)V

    iget-object v0, p0, Lcom/miui/gallery/search/SearchFragment;->mSearchView:Lcom/miui/gallery/search/widget/SearchView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/SearchView;->setCursorVisible(Z)V

    return-void
.end method

.method public requestIME(Z)V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/search/SearchFragment$5;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/search/SearchFragment$5;-><init>(Lcom/miui/gallery/search/SearchFragment;Z)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
