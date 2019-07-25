.class public Lcom/miui/gallery/ui/AlbumPageFragment;
.super Lcom/miui/gallery/ui/BaseAlbumPageFragment;
.source "AlbumPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/ui/AIAlbumDisplayHelper$DisplayStatusCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlbumPageFragment$SnapshotFunction;,
        Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;,
        Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;,
        Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;
    }
.end annotation


# instance fields
.field private mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

.field private mAlbumPageHeaderController:Lcom/miui/gallery/ui/AlbumPageHeaderController;

.field private mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

.field private mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

.field private mAlbumsPublishSubject:Lio/reactivex/subjects/PublishSubject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/subjects/PublishSubject<",
            "Ljava/util/List<",
            "Lcom/miui/gallery/model/Album;",
            ">;>;"
        }
    .end annotation
.end field

.field private mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

.field private mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

.field private mCreateAlbumButton:Landroid/view/View;

.field private mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

.field private mHasEnterPrivateEntry:Z

.field private mLoaderInitialized:Z

.field private mNewlyCreatedAlbumId:J

.field private mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

.field private mPendingDisplayCreateAlbum:Z

.field private mPrivateEntryTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

.field private mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

.field private mSearchStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

.field private mShowAIAlbum:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    new-instance v0, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;-><init>(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$DisplayStatusCallback;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-static {}, Lio/reactivex/subjects/PublishSubject;->create()Lio/reactivex/subjects/PublishSubject;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumsPublishSubject:Lio/reactivex/subjects/PublishSubject;

    new-instance v0, Lio/reactivex/disposables/CompositeDisposable;

    invoke-direct {v0}, Lio/reactivex/disposables/CompositeDisposable;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    new-instance v0, Lcom/miui/gallery/ui/AlbumPageFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AlbumPageFragment$2;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mPrivateEntryTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    new-instance v0, Lcom/miui/gallery/ui/AlbumPageFragment$3;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AlbumPageFragment$3;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-void
.end method

.method static synthetic access$1000(Lcom/miui/gallery/ui/AlbumPageFragment;)Lio/reactivex/subjects/PublishSubject;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumsPublishSubject:Lio/reactivex/subjects/PublishSubject;

    return-object p0
.end method

.method static synthetic access$1100(Lcom/miui/gallery/ui/AlbumPageFragment;Ljava/util/ArrayList;Landroid/support/v7/util/SortedList;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumPageFragment;->scrollToNewlyCreatedAlbum(Ljava/util/ArrayList;Landroid/support/v7/util/SortedList;)V

    return-void
.end method

.method static synthetic access$1200(Lcom/miui/gallery/ui/AlbumPageFragment;I)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->loaderId2Name(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$1300(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/TwoStageDrawer;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    return-object p0
.end method

.method static synthetic access$1400(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->updateHeaderAlbumUI()V

    return-void
.end method

.method static synthetic access$1500(Lcom/miui/gallery/ui/AlbumPageFragment;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getRecyclerPaddingBottom()I

    move-result p0

    return p0
.end method

.method static synthetic access$1600(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    return-object p0
.end method

.method static synthetic access$1700(Lcom/miui/gallery/ui/AlbumPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    return p0
.end method

.method static synthetic access$1802(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mPendingDisplayCreateAlbum:Z

    return p1
.end method

.method static synthetic access$1902(Lcom/miui/gallery/ui/AlbumPageFragment;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mNewlyCreatedAlbumId:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mOnAlbumCreatedListener:Lcom/miui/gallery/ui/BaseAlbumOperationDialogFragment$OnAlbumOperationDoneListener;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/ui/AlbumPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mHasEnterPrivateEntry:Z

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mHasEnterPrivateEntry:Z

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->enterPrivateEntry()V

    return-void
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Landroid/net/Uri;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->getAlbumQueryUri(Z)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/AlbumPageFragment;Z)Ljava/lang/String;
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/AlbumPageFragment;->getAlbumQuerySelection(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/AlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    return-object p0
.end method

.method static synthetic access$900(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->startToLoadAlbumExtraInfo()V

    return-void
.end method

.method private doEnterPrivateEntry()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-static {v0}, Lcom/miui/account/AccountHelper;->getXiaomiAccount(Landroid/content/Context;)Landroid/accounts/Account;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {p0}, Lcom/miui/gallery/ui/AuthenticatePrivacyPasswordFragment;->startAuthenticatePrivacyPassword(Landroid/app/Fragment;)V

    :cond_0
    return-void
.end method

.method private enterPrivateEntry()V
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string v1, "check_login_and_sync"

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string v1, "cloud_guide_source"

    sget-object v2, Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;->SECRET:Lcom/miui/gallery/util/GalleryIntent$CloudGuideSource;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putSerializable(Ljava/lang/String;Ljava/io/Serializable;)V

    invoke-static {p0, v0}, Lcom/miui/gallery/ui/LoginAndSyncCheckFragment;->checkLoginAndSyncState(Landroid/app/Fragment;Landroid/os/Bundle;)V

    return-void
.end method

.method private getAlbumQuerySelection(Z)Ljava/lang/String;
    .locals 0

    if-eqz p1, :cond_0

    const-string p1, "classification = 1"

    return-object p1

    :cond_0
    const-string p1, "classification = 0"

    return-object p1
.end method

.method private getAlbumQueryUri(Z)Landroid/net/Uri;
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_face"

    const/4 v2, 0x1

    if-nez p1, :cond_0

    iget-boolean v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    if-nez v3, :cond_0

    invoke-static {}, Lcom/miui/gallery/cloud/AccountCache;->getAccount()Landroid/accounts/Account;

    move-result-object v3

    if-eqz v3, :cond_0

    const/4 v3, 0x1

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    :goto_0
    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_video"

    xor-int/lit8 v3, p1, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_share"

    xor-int/lit8 v3, p1, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_recent"

    xor-int/lit8 v3, p1, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "join_favorites"

    xor-int/lit8 v3, p1, 0x1

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "exclude_empty_album"

    const-string v3, "true"

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "fill_covers"

    xor-int/2addr p1, v2

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, p1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    return-object p1
.end method

.method private getRecyclerPaddingBottom()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCreateAlbumButton:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCreateAlbumButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCreateAlbumButton:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f060020

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    add-int/2addr v0, v1

    return v0

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060021

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    return v0
.end method

.method private isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static synthetic lambda$onInflateView$30(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->openDrawer()V

    return-void
.end method

.method public static synthetic lambda$onStatusChanged$31(Lcom/miui/gallery/ui/AlbumPageFragment;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->isDrawerOpen()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->openDrawer()V

    :cond_0
    return-void
.end method

.method private loaderId2Name(I)Ljava/lang/String;
    .locals 0

    packed-switch p1, :pswitch_data_0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :pswitch_0
    const-string p1, "other_album"

    return-object p1

    :pswitch_1
    const-string p1, "people_face_cover"

    return-object p1

    :pswitch_2
    const-string p1, "share_albums"

    return-object p1

    :pswitch_3
    const-string p1, "albums"

    return-object p1

    :pswitch_4
    const-string p1, "albums_snapshot"

    return-object p1

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private onVisibleToUser()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->statAlbumEmpty()V

    :cond_0
    return-void
.end method

.method private scrollToNewlyCreatedAlbum(Ljava/util/ArrayList;Landroid/support/v7/util/SortedList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/model/Album;",
            ">;",
            "Landroid/support/v7/util/SortedList<",
            "Lcom/miui/gallery/model/Album;",
            ">;)V"
        }
    .end annotation

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mPendingDisplayCreateAlbum:Z

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mPendingDisplayCreateAlbum:Z

    if-eqz p1, :cond_1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/model/Album;

    invoke-virtual {v0}, Lcom/miui/gallery/model/Album;->getAlbumId()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mNewlyCreatedAlbumId:J

    cmp-long v5, v1, v3

    if-nez v5, :cond_0

    invoke-virtual {p2, v0}, Landroid/support/v7/util/SortedList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p2, p1}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->smoothScrollToPosition(I)V

    :cond_1
    return-void
.end method

.method private startToLoadAlbumExtraInfo()V
    .locals 4

    const-string v0, "AlbumPageFragment"

    const-string v1, "startToLoadAlbumExtraInfo"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v2, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v3, 0x3

    invoke-virtual {v0, v3, v2, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v3, 0x5

    invoke-virtual {v0, v3, v2, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x4

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    return-void
.end method

.method private startToLoadAlbums()V
    .locals 4

    const-string v0, "AlbumPageFragment"

    const-string v1, "startToLoadAlbums"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mLoaderInitialized:Z

    return-void
.end method

.method private statAlbumEmpty()V
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

    const-string v1, "album"

    const-string v2, "album_empty"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    return-void
.end method

.method private updateHeaderAlbumUI()V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/SyncUtil;->existXiaomiAccount(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageHeaderController:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/AlbumPageHeaderController;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/AlbumPageHeaderController;-><init>(Lcom/miui/gallery/app/Fragment;Landroid/view/ViewGroup;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageHeaderController:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageHeaderController:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/AlbumPageHeaderController;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->addHeaderView(Landroid/view/View;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getHeadersCount()I

    move-result v0

    if-lez v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageHeaderController:Lcom/miui/gallery/ui/AlbumPageHeaderController;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/AlbumPageHeaderController;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->removeHeaderView(Landroid/view/View;)Z

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album"

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_4

    const/16 v1, 0x1d

    if-eq p1, v1, :cond_1

    const/16 v0, 0x24

    if-eq p1, v0, :cond_0

    goto :goto_1

    :cond_0
    const-string v0, "AlbumPageFragment"

    const-string v1, "onActivityResult"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/util/IntentUtil;->enterPrivateAlbum(Landroid/content/Context;)V

    goto :goto_1

    :cond_1
    const-string v1, "check_login_and_sync"

    invoke-virtual {p3, v1, v0}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    if-ne v0, v1, :cond_5

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->doEnterPrivateEntry()V

    goto :goto_1

    :cond_3
    :goto_0
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void

    :cond_4
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mHasEnterPrivateEntry:Z

    :cond_5
    :goto_1
    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onActivityResult(IILandroid/content/Intent;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 11

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mLoaderInitialized:Z

    iget-object p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumsPublishSubject:Lio/reactivex/subjects/PublishSubject;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v1

    invoke-virtual {v0, v1}, Lio/reactivex/subjects/PublishSubject;->observeOn(Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v2

    const-wide/16 v3, 0x15e

    invoke-virtual {v0, v3, v4, v1, v2}, Lio/reactivex/Observable;->delay(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;)Lio/reactivex/Observable;

    move-result-object v5

    sget-object v8, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-static {}, Lcom/miui/gallery/threadpool/GallerySchedulers;->misc()Lio/reactivex/Scheduler;

    move-result-object v9

    const-wide/16 v6, 0xbb8

    const/4 v10, 0x1

    invoke-virtual/range {v5 .. v10}, Lio/reactivex/Observable;->throttleLatest(JLjava/util/concurrent/TimeUnit;Lio/reactivex/Scheduler;Z)Lio/reactivex/Observable;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/AlbumPageFragment$SnapshotFunction;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/miui/gallery/ui/AlbumPageFragment$SnapshotFunction;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment$1;)V

    invoke-virtual {v0, v1}, Lio/reactivex/Observable;->map(Lio/reactivex/functions/Function;)Lio/reactivex/Observable;

    move-result-object v0

    invoke-virtual {v0}, Lio/reactivex/Observable;->subscribe()Lio/reactivex/disposables/Disposable;

    move-result-object v0

    invoke-virtual {p1, v0}, Lio/reactivex/disposables/CompositeDisposable;->add(Lio/reactivex/disposables/Disposable;)Z

    return-void
.end method

.method public onCreateContextMenu(Landroid/view/ContextMenu;Landroid/view/View;Landroid/view/ContextMenu$ContextMenuInfo;)V
    .locals 0

    if-nez p3, :cond_0

    return-void

    :cond_0
    check-cast p3, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;

    iget p2, p3, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;->position:I

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isHeaderPosition(I)Z

    move-result p3

    if-eqz p3, :cond_1

    return-void

    :cond_1
    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->isFooterPosition(I)Z

    move-result p3

    if-eqz p3, :cond_2

    return-void

    :cond_2
    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;->getWrappedAdapterPosition(I)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/AlbumPageFragment;->setContextMenuItems(Landroid/view/ContextMenu;I)V

    return-void
.end method

.method public onDestroy()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCompositeDisposable:Lio/reactivex/disposables/CompositeDisposable;

    invoke-virtual {v0}, Lio/reactivex/disposables/CompositeDisposable;->dispose()V

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onDestroy()V

    return-void
.end method

.method public onDestroyView()V
    .locals 2

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->getInstance()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->unregisterAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)V

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onDestroyView()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b0012

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090038

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->getRecycler()Landroid/support/v7/widget/RecyclerView;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    new-instance v0, Lcom/miui/gallery/ui/AlbumPageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/AlbumPageFragment$1;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    new-instance p2, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-direct {p2, v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;-><init>(Lcom/miui/gallery/adapter/AlbumPageAdapter;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    const v2, 0x7f070255

    const v3, 0x7f0701a3

    invoke-direct {p2, v0, v2, v3, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;-><init>(Landroid/content/Context;IILcom/miui/gallery/widget/DividerTypeProvider;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v0, p3, p3, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;->setItemDividerPadding(Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {v0, p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPageAdapterWrapper:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPageAdapterWrapper;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;Lcom/miui/gallery/ui/AlbumPageFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const p2, 0x7f0900ba

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCreateAlbumButton:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mCreateAlbumButton:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/ui/AlbumPageFragment$OnCreateNewAlbumListener;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;Lcom/miui/gallery/ui/AlbumPageFragment$1;)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    move-object p2, p1

    check-cast p2, Lcom/miui/gallery/widget/TwoStageDrawer;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mPrivateEntryTriggerListener:Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/TwoStageDrawer;->setTriggerListener(Lcom/miui/gallery/widget/TwoStageDrawer$TriggerListener;)V

    const p2, 0x7f09003f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/search/widget/BannerSearchBar;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-static {}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->getInstance()Lcom/miui/gallery/ui/AIAlbumDisplayHelper;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchStatusObserver:Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/ui/AIAlbumDisplayHelper;->registerAIAlbumDisplayStatusObserver(Lcom/miui/gallery/ui/AIAlbumDisplayHelper$WeakReferencedAIAlbumDisplayStatusObserver;)Landroid/util/SparseBooleanArray;

    move-result-object p2

    const/4 v0, 0x2

    invoke-virtual {p2, v0, p3}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    const/4 v0, 0x1

    invoke-virtual {p2, v0, p3}, Landroid/util/SparseBooleanArray;->get(IZ)Z

    move-result p2

    const-string v0, "AlbumPageFragment"

    const-string v1, "Init search bar: %s, ai album: %s"

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iget-boolean v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v0, v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setVisibility(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-nez p2, :cond_0

    new-instance p2, Lcom/miui/gallery/ui/TopSearchBarController;

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const-string v0, "from_album_page"

    invoke-direct {p2, p0, p3, v0}, Lcom/miui/gallery/ui/TopSearchBarController;-><init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/widget/BannerSearchBar;Ljava/lang/String;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mDrawer:Lcom/miui/gallery/widget/TwoStageDrawer;

    new-instance p3, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageFragment$nUfQA-7r8mkRAllOPn5Gb0CT7jE;

    invoke-direct {p3, p0}, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageFragment$nUfQA-7r8mkRAllOPn5Gb0CT7jE;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/TwoStageDrawer;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_1
    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setVisibility(I)V

    :goto_0
    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mUserFirstVisible:Z

    if-eqz p2, :cond_2

    iget-boolean p2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mLoaderInitialized:Z

    if-nez p2, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->startToLoadAlbums()V

    :cond_2
    return-object p1
.end method

.method public onPause()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onPause()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onPause()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onResume()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onStart()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mHasEnterPrivateEntry:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getUserVisibleHint()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->onVisibleToUser()V

    :cond_0
    return-void
.end method

.method public onStatusChanged(Landroid/util/SparseBooleanArray;)V
    .locals 4

    if-nez p1, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_4

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result v0

    const-string v1, "AlbumPageFragment"

    const-string v2, "New search bar status %s"

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-nez v0, :cond_1

    new-instance v0, Lcom/miui/gallery/ui/TopSearchBarController;

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const-string v2, "from_album_page"

    invoke-direct {v0, p0, v1, v2}, Lcom/miui/gallery/ui/TopSearchBarController;-><init>(Lmiui/app/Fragment;Lcom/miui/gallery/search/widget/BannerSearchBar;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onResume()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    new-instance v1, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageFragment$Ex1k6aIa1Bz60DXRKT38-eaDGwo;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/-$$Lambda$AlbumPageFragment$Ex1k6aIa1Bz60DXRKT38-eaDGwo;-><init>(Lcom/miui/gallery/ui/AlbumPageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mSearchBarController:Lcom/miui/gallery/ui/TopSearchBarController;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/TopSearchBarController;->onPause()V

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mBannerSearchBar:Lcom/miui/gallery/search/widget/BannerSearchBar;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/miui/gallery/search/widget/BannerSearchBar;->setVisibility(I)V

    :cond_4
    :goto_0
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->indexOfKey(I)I

    move-result v1

    if-ltz v1, :cond_6

    invoke-virtual {p1, v0}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    const-string p1, "AlbumPageFragment"

    const-string v1, "New ai album status %s"

    iget-boolean v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {p1, v1, v2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mShowAIAlbum:Z

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eqz p1, :cond_5

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/app/LoaderManager;->destroyLoader(I)V

    goto :goto_1

    :cond_5
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v3, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-virtual {p1, v2, v1, v3}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :goto_1
    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/app/LoaderManager;->destroyLoader(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-virtual {p1, v0, v1, v2}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_6
    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->setUserVisibleHint(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_1

    iget-boolean p1, p0, Lcom/miui/gallery/ui/AlbumPageFragment;->mLoaderInitialized:Z

    if-nez p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getLifecycle()Landroid/arch/lifecycle/Lifecycle;

    move-result-object p1

    invoke-virtual {p1}, Landroid/arch/lifecycle/Lifecycle;->getCurrentState()Landroid/arch/lifecycle/Lifecycle$State;

    move-result-object p1

    sget-object v0, Landroid/arch/lifecycle/Lifecycle$State;->CREATED:Landroid/arch/lifecycle/Lifecycle$State;

    invoke-virtual {p1, v0}, Landroid/arch/lifecycle/Lifecycle$State;->isAtLeast(Landroid/arch/lifecycle/Lifecycle$State;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->startToLoadAlbums()V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumPageFragment;->onVisibleToUser()V

    :cond_1
    return-void
.end method
