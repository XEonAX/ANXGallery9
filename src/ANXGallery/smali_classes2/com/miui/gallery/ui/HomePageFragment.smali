.class public Lcom/miui/gallery/ui/HomePageFragment;
.super Lcom/miui/gallery/ui/BaseMediaFragment;
.source "HomePageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/AIAlbumDisplayHelper$DisplayStatusCallback;
.implements Lcom/miui/gallery/util/OnAppFocusedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;
    }
.end annotation


# static fields
.field public static final PHOTOS_LOADER_PROJECTION:[Ljava/lang/String;

.field public static final PHOTOS_LOADER_URI:Landroid/net/Uri;

.field private static final PHOTOS_PAGE_URI:Landroid/net/Uri;


# instance fields
.field private mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

.field private mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field private mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

.field private mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

.field private mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

.field private mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

.field private mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

.field private mHomePagePhotoLoaderCallback:Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

.field private mHomePageStartHelper:Lcom/miui/gallery/activity/HomePageStartupHelper;

.field private mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

.field private mIsStartupDone:Z

.field private mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

.field private mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

.field private mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

.field private mSearchBarStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

.field private mSearchContainer:Landroid/widget/FrameLayout;

.field private mSearchTextPreview:Landroid/widget/FrameLayout;

.field private mStartCalled:Z

.field mTransitionHelper:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

.field private mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

.field private mWeakVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "generate_headers"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_URI:Landroid/net/Uri;

    sget-object v0, Lcom/miui/gallery/adapter/HomePageAdapter;->PROJECTION:[Ljava/lang/String;

    sput-object v0, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_LOADER_PROJECTION:[Ljava/lang/String;

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Media;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_PAGE_URI:Landroid/net/Uri;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mIsStartupDone:Z

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$4;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$4;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;-><init>(Lcom/miui/gallery/widget/recyclerview/transition/TransitionListener;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mTransitionHelper:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    new-instance v0, Lcom/miui/gallery/ui/HomePageFragment$7;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/HomePageFragment$7;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mWeakVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;

    new-instance v0, Lcom/miui/gallery/ui/HomePageFragment$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/HomePageFragment$8;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/HomePageAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    return-object p0
.end method

.method static synthetic access$100()Landroid/net/Uri;
    .locals 1

    sget-object v0, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_PAGE_URI:Landroid/net/Uri;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/HomePageTopBarController;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/HomePageFragment;)Z
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->needShowMonthViewTip()Z

    move-result p0

    return p0
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->showMonthViewTip()V

    return-void
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/activity/HomePageStartupHelper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageStartHelper:Lcom/miui/gallery/activity/HomePageStartupHelper;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/HomePageFragment;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/HomePageFragment;->onSend(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/ui/TopSearchBarController;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    return-object p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/HomePageFragment;)Ljava/util/ArrayList;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getBurstCheckedItemIds()Ljava/util/ArrayList;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/HomePageFragment;)Landroid/widget/FrameLayout;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/HomePageFragment;FF)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/HomePageFragment;->transit(FF)V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/adapter/MediaMonthAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/HomePageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/HomePageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->inflateEmptyView()V

    return-void
.end method

.method private addSearchContainer()V
    .locals 6

    new-instance v0, Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v2, v0}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f050171

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    const v2, 0x7f090162

    invoke-virtual {v0, v2}, Landroid/widget/FrameLayout;->setId(I)V

    const/4 v0, 0x0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->isSearchCacheStatusOpen(Z)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v2, v3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/high16 v3, 0x421a0000    # 38.5f

    invoke-static {v2, v3}, Lcom/miui/gallery/util/MiscUtil;->dip2px(Landroid/content/Context;F)I

    move-result v2

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/high16 v4, 0x41200000    # 10.0f

    invoke-static {v1, v4}, Lcom/miui/gallery/util/MiscUtil;->dip2px(Landroid/content/Context;F)I

    move-result v1

    iget-object v4, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v5, 0x40ca8f5c    # 6.33f

    invoke-static {v4, v5}, Lcom/miui/gallery/util/MiscUtil;->dip2px(Landroid/content/Context;F)I

    move-result v4

    invoke-virtual {v3, v1, v0, v1, v4}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f050127

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    add-int/2addr v2, v1

    int-to-float v1, v2

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setTranslationY(F)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->addView(Landroid/view/View;)V

    return-void
.end method

.method private addTopBar()V
    .locals 6

    new-instance v0, Lcom/miui/gallery/widget/PanelBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/PanelBar;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090163

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/PanelBar;->setId(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0702b5

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/PanelBar;->setBackground(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f06029d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0602a0

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060308

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    const/4 v4, 0x0

    invoke-virtual {v3, v1, v4, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    const/4 v1, 0x3

    const v2, 0x7f090162

    invoke-virtual {v3, v1, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/PanelBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->addView(Landroid/view/View;)V

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setSecondaryContentView(Landroid/view/View;)V

    return-void
.end method

.method private displaySearchBar()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/search/widget/BannerSearchBar;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const v1, 0x7f090161

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setId(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/ui/TopSearchBarController;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const-string v2, "from_home_page"

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/ui/TopSearchBarController;-><init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/widget/BannerSearchBar;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onResume()V

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0}, Lcom/miui/gallery/search/widget/BannerSearchBar;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$9;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$9;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    if-nez v0, :cond_4

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v0, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v2, v3}, Lcom/miui/gallery/util/MiscUtil;->dip2px(Landroid/content/Context;F)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v4, 0x40ca8f5c    # 6.33f

    invoke-static {v3, v4}, Lcom/miui/gallery/util/MiscUtil;->dip2px(Landroid/content/Context;F)I

    move-result v3

    invoke-virtual {v0, v2, v1, v2, v3}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$10;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$10;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getSearchBarAppearAnimation()Landroid/view/animation/AlphaAnimation;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->startAnimation(Landroid/view/animation/Animation;)V

    :goto_0
    return-void
.end method

.method private doOnStart()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mStartCalled:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->updateGalleryCloudSyncableState()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onResume()V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->getInstance()Lcom/miui/gallery/assistant/manager/ImageFeatureManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/assistant/manager/ImageFeatureManager;->triggerNewImageCalculation()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mStartCalled:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getUserVisibleHint()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->onVisibleToUser()V

    :cond_1
    return-void
.end method

.method private doOnStop()V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mStartCalled:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onPause()V

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mStartCalled:Z

    :cond_1
    return-void
.end method

.method private getBurstCheckedItemIds()Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-virtual {v0, v2}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v4, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getBurstItemKeys(I)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method private getSearchBarAppearAnimation()Landroid/view/animation/AlphaAnimation;
    .locals 3

    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    const-wide/16 v1, 0xc8

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;->setDuration(J)V

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$11;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$11;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/animation/AlphaAnimation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    return-object v0
.end method

.method private inflateEmptyView()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0b008d

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/EmptyPage;

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$5;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$5;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/EmptyPage;->setOnActionButtonClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->addView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setEmptyView(Landroid/view/View;)V

    :cond_0
    return-void
.end method

.method private isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private needShowMonthViewTip()Z
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getUserVisibleHint()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/preference/GalleryPreferences$MonthView;->hasShownTip()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method private onSend(Ljava/lang/String;Ljava/lang/String;)V
    .locals 24

    move-object/from16 v12, p0

    iget-object v0, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->getCheckedItemPositions()Landroid/util/SparseBooleanArray;

    move-result-object v13

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    const v2, 0x7fffffff

    const/4 v3, 0x0

    const/4 v4, 0x0

    const v5, 0x7fffffff

    :goto_0
    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v6

    if-ge v4, v6, :cond_1

    invoke-virtual {v13, v4}, Landroid/util/SparseBooleanArray;->keyAt(I)I

    move-result v6

    invoke-virtual {v13, v6}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v7, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v7, v6}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    if-ge v6, v5, :cond_0

    move v5, v6

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-nez v4, :cond_2

    return-void

    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v9, v4, [I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-array v8, v4, [J

    const/4 v4, 0x0

    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v4, v6, :cond_3

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aput v6, v9, v4

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Long;

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    aput-wide v6, v8, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_3
    if-ne v5, v2, :cond_4

    goto :goto_2

    :cond_4
    move v3, v5

    :goto_2
    new-instance v7, Lcom/miui/gallery/model/ImageLoadParams;

    iget-object v0, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemKey(I)J

    move-result-wide v15

    iget-object v0, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getLocalPath(I)Ljava/lang/String;

    move-result-object v17

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/miui/gallery/Config$ThumbConfig;->sMicroTargetSize:Lcom/nostra13/universalimageloader/core/assist/ImageSize;

    iget-object v1, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemDecodeRectF(I)Landroid/graphics/RectF;

    move-result-object v19

    iget-object v1, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getMimeType(I)Ljava/lang/String;

    move-result-object v21

    iget-object v1, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v1, v3}, Lcom/miui/gallery/adapter/HomePageAdapter;->getFileLength(I)J

    move-result-wide v22

    move-object v14, v7

    move-object/from16 v18, v0

    move/from16 v20, v3

    invoke-direct/range {v14 .. v23}, Lcom/miui/gallery/model/ImageLoadParams;-><init>(JLjava/lang/String;Lcom/nostra13/universalimageloader/core/assist/ImageSize;Landroid/graphics/RectF;ILjava/lang/String;J)V

    sget-object v1, Lcom/miui/gallery/ui/HomePageFragment;->PHOTOS_PAGE_URI:Landroid/net/Uri;

    iget-object v0, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/HomePageAdapter;->getItemCount()I

    move-result v4

    const-string v5, "alias_show_in_homepage=1 AND sha1 NOT NULL"

    const/4 v6, 0x0

    const-string v10, "alias_sort_time DESC "

    move-object/from16 v0, p0

    move v2, v3

    move v3, v4

    move-object v4, v5

    move-object v5, v6

    move-object v6, v10

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    invoke-static/range {v0 .. v11}, Lcom/miui/gallery/util/IntentUtil;->gotoPreviewSelectPage(Lcom/miui/gallery/ui/BaseMediaFragment;Landroid/net/Uri;IILjava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lcom/miui/gallery/model/ImageLoadParams;[J[ILjava/lang/String;Ljava/lang/String;)V

    iget-object v0, v12, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->stopActionMode()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "count"

    invoke-virtual {v13}, Landroid/util/SparseBooleanArray;->size()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "home"

    const-string v2, "send"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private onVisibleToUser()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->statHomeEmpty()V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->needShowMonthViewTip()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->showMonthViewTip()V

    :cond_1
    return-void
.end method

.method private registerSearchStatusObserver()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$DisplayStatusCallback;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->getInstance()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->registerAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)Landroid/util/SparseBooleanArray;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/HomePageFragment;->onStatusChanged(Landroid/util/SparseBooleanArray;)V

    return-void
.end method

.method private showMonthViewTip()V
    .locals 3

    new-instance v0, Lcom/miui/gallery/ui/MonthViewTipFragment;

    invoke-direct {v0}, Lcom/miui/gallery/ui/MonthViewTipFragment;-><init>()V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getChildFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const-string v2, "monthViewTip"

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/ui/MonthViewTipFragment;->showAllowingStateLoss(Landroid/app/FragmentManager;Ljava/lang/String;)V

    const/4 v0, 0x1

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$MonthView;->setHasShownTip(Z)V

    return-void
.end method

.method private statHomeEmpty()V
    .locals 3

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    const-string v1, "login"

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "home"

    const-string v2, "home_empty"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private transit(FF)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    const/4 v2, 0x2

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    move-object v0, v1

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    if-eqz v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const/4 v2, 0x1

    move-object v5, v0

    move-object v4, v1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    move-object v5, v0

    move-object v4, v1

    move v6, v2

    :goto_1
    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mTransitionHelper:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    move v7, p1

    move v8, p2

    invoke-virtual/range {v3 .. v8}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->startTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;IFF)V

    return-void
.end method

.method private unregisterSearchStatusObserver()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->getInstance()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->unregisterAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)V

    :cond_0
    return-void
.end method

.method private updateConfiguration(Landroid/content/res/Configuration;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->findFirstVisibleItemPosition()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    check-cast v1, Landroid/support/v7/widget/GridLayoutManager;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x2

    if-ne p1, v2, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    invoke-virtual {v1, p1}, Landroid/support/v7/widget/GridLayoutManager;->setSpanCount(I)V

    :goto_0
    const/4 p1, -0x1

    if-eq v0, p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->scrollToPositionWithOffset(II)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->invalidateItemDecorations()V

    return-void
.end method


# virtual methods
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

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "home"

    return-object v0
.end method

.method public onAppFocused()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onAppFocused()V

    :cond_0
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/HomePageFragment;->updateConfiguration(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public onDataBind()V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mIsStartupDone:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mIsStartupDone:Z

    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/HomePageFragment$6;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/HomePageFragment$6;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/android/internal/CompatHandler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onDestroy()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/HomePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onDestroy()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onDestroy()V

    :cond_1
    invoke-static {}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->getInstance()Lcom/miui/gallery/discovery/DiscoveryMessageManager;

    move-result-object v0

    invoke-static {}, Lcom/miui/gallery/GalleryApp;->sGetAndroidContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/discovery/DiscoveryMessageManager;->markAsReadByTypeAsync(Landroid/content/Context;I)V

    return-void
.end method

.method public onDestroyView()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->unregisterSearchStatusObserver()V

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onDestroyView()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 0

    new-instance p1, Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f040004

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->setAlwaysShowTargetViewDivider(Z)V

    new-instance p1, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    const/4 p3, -0x1

    invoke-direct {p2, p3, p3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setOverScrollMode(I)V

    new-instance p1, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-direct {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    new-instance p1, Lcom/miui/gallery/adapter/HomePageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p1, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;-><init>(Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lcom/miui/gallery/adapter/HomePageAdapter;->setHasStableIds(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    new-instance p2, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridLayoutManager;

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridLayoutManager;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V

    new-instance p1, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p3

    iget p3, p3, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    invoke-direct {p1, p2, p3}, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;-><init>(Landroid/content/Context;I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {p2, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0602a8

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f0602af

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {p3, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setHorizontalSpacing(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setVerticalSpacing(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/HomePageFragment;->updateConfiguration(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object p2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/TwoStageDrawer;->addView(Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    check-cast p1, Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;

    invoke-interface {p1}, Lcom/miui/gallery/activity/HomePageStartupHelper$Attacher;->getStartupHelper()Lcom/miui/gallery/activity/HomePageStartupHelper;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageStartHelper:Lcom/miui/gallery/activity/HomePageStartupHelper;

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageStartHelper:Lcom/miui/gallery/activity/HomePageStartupHelper;

    new-instance p2, Lcom/miui/gallery/ui/HomePageFragment$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/ui/HomePageFragment$1;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {p1, p2}, Lcom/miui/gallery/activity/HomePageStartupHelper;->setDataLoaderListener(Lcom/miui/gallery/activity/HomePageStartupHelper$DataLoadListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->addSearchContainer()V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    return-object p1
.end method

.method public onPause()V
    .locals 2

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onPause()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    :cond_1
    return-void
.end method

.method protected onPhotoPageCreate(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onPhotoPageCreate(Landroid/content/Intent;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->doOnStop()V

    return-void
.end method

.method protected onPhotoPageDestroy(Landroid/content/Intent;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onPhotoPageDestroy(Landroid/content/Intent;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->doOnStart()V

    return-void
.end method

.method public onResume()V
    .locals 4

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->isInActionMode()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onResume()V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/util/SafeBroadcastReceiver;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mWeakVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;

    invoke-direct {v0, v1}, Lcom/miui/gallery/util/SafeBroadcastReceiver;-><init>(Lcom/miui/gallery/util/SafeBroadcastReceiver$WeakReceiver;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mVoiceAssistantReceiver:Lcom/miui/gallery/util/SafeBroadcastReceiver;

    new-instance v2, Landroid/content/IntentFilter;

    const-string v3, "com.miui.gallery.action.VOICE_ASSISTANT_SELECT_SHARE"

    invoke-direct {v2, v3}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    :cond_1
    return-void
.end method

.method public onStart()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onStart()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->doOnStart()V

    return-void
.end method

.method public onStartup()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0702b4

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setContentViewBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setTargetView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setPrimaryContentView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f070284

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setScrollDivider(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setScrollableView(Landroid/view/View;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setDragEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setInitialDrawerState(I)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->addTopBar()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchTextPreview:Landroid/widget/FrameLayout;

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->displaySearchBar()V

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    const v2, 0x7f11000a

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setFastScrollStyle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setFastScrollEnabled(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/adapter/HomePageAdapter;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/miui/gallery/adapter/HomePageAdapter;->generateWrapScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->enableChoiceMode(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;

    new-instance v3, Lcom/miui/gallery/ui/HomePageFragment$2;

    invoke-direct {v3, p0}, Lcom/miui/gallery/ui/HomePageFragment$2;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance v0, Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    iget-object v5, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    const v6, 0x7f090163

    invoke-direct {v0, v3, v5, v6}, Lcom/miui/gallery/ui/HomePageTopBarController;-><init>(Landroid/app/Activity;Lcom/miui/gallery/widget/TwoStageDrawer;I)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mStartCalled:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onAppFocused()V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePageTopBarController:Lcom/miui/gallery/ui/HomePageTopBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/HomePageTopBarController;->onResume()V

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->registerSearchStatusObserver()V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v3, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setFastScrollStyle(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setFastScrollEnabled(Z)V

    new-instance v0, Lcom/miui/gallery/adapter/MediaMonthAdapter;

    invoke-direct {v0}, Lcom/miui/gallery/adapter/MediaMonthAdapter;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthAdapter:Lcom/miui/gallery/adapter/MediaMonthAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/MediaMonthAdapter;->setHasStableIds(Z)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    new-instance v2, Lcom/miui/gallery/ui/HomePageFragment$3;

    invoke-direct {v2, p0}, Lcom/miui/gallery/ui/HomePageFragment$3;-><init>(Lcom/miui/gallery/ui/HomePageFragment;)V

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance v0, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

    invoke-direct {v0, p0, v4}, Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/HomePageFragment;Lcom/miui/gallery/ui/HomePageFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

    invoke-virtual {v0, v1, v4, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v4, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/HomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v2, 0x3

    iget-object v5, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/ui/HomePageFragment$HomePagePhotoLoaderCallback;

    invoke-virtual {v0, v2, v4, v5}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mTransitionHelper:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    iget-object v4, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    invoke-virtual {v0, v2, v4, v3}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->bindTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mTransitionHelper:Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;

    iget-object v2, p0, Lcom/miui/gallery/ui/HomePageFragment;->mMonthView:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;

    iget-object v3, p0, Lcom/miui/gallery/ui/HomePageFragment;->mHomeGridView:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;

    invoke-virtual {v0, v2, v3, v1}, Lcom/miui/gallery/widget/recyclerview/transition/TransitionHelper;->bindTransition(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView;I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/HomePageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/TwoStageDrawer;->setSupportMultiPoint(Z)V

    return-void

    :cond_3
    :goto_0
    return-void
.end method

.method public onStatusChanged(Landroid/util/SparseBooleanArray;)V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_2

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-static {v0}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->setIsSearchCacheStatusOpen(Z)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->displaySearchBar()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    invoke-static {p1}, Lcom/miui/gallery/preference/GalleryPreferences$Search;->setIsSearchCacheStatusOpen(Z)V

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/TopSearchBarController;->onPause()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/HomePageFragment;->mSearchContainer:Landroid/widget/FrameLayout;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setVisibility(I)V

    :cond_2
    :goto_0
    return-void
.end method

.method public onStop()V
    .locals 0

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onStop()V

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->doOnStop()V

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->setUserVisibleHint(Z)V

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/HomePageFragment;->onVisibleToUser()V

    :cond_0
    return-void
.end method
