.class public Lcom/miui/gallery/ui/AlbumLocalPageFragment;
.super Lcom/miui/gallery/ui/BaseAlbumPageFragment;
.source "AlbumLocalPageFragment.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;

.field private mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

.field private mPendingLoadExtraInfo:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mPendingLoadExtraInfo:Z

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/AlbumLocalPageFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mPendingLoadExtraInfo:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/AlbumLocalPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->startToLoadExtraInfo()V

    return-void
.end method

.method private recordViewAlbum(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumLocalPath(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "album_path"

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "album_attribute"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAttributes(I)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "album_image_count"

    iget-object v2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v2, p1}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->getAlbumCount(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string p1, "album"

    const-string v0, "view_other_album"

    invoke-static {p1, v0, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private startToLoadAlbums()V
    .locals 4

    const-string v0, "AlbumLocalPageFragment"

    const-string v1, "startToLoadAlbums"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mPendingLoadExtraInfo:Z

    return-void
.end method

.method private startToLoadExtraInfo()V
    .locals 4

    const-string v0, "AlbumLocalPageFragment"

    const-string v1, "startToLoadExtraInfo"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method


# virtual methods
.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_local"

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->startToLoadAlbums()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x1

    invoke-virtual {p0, p3}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->setHasOptionsMenu(Z)V

    const/4 p3, 0x0

    const v0, 0x7f0b001b

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090038

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->getRecycler()Landroid/support/v7/widget/RecyclerView;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p2, Lcom/miui/gallery/adapter/AlbumPageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    const v2, 0x7f070255

    const v3, 0x7f0701a3

    invoke-direct {p2, v0, v2, v3, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;-><init>(Landroid/content/Context;IILcom/miui/gallery/widget/DividerTypeProvider;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v0, p3, p3, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;->setItemDividerPadding(Landroid/graphics/Rect;)V

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p2, p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/ui/AlbumLocalPageFragment;Lcom/miui/gallery/ui/AlbumLocalPageFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/ui/AlbumLocalPageFragment$AlbumPagePhotoLoaderCallback;

    iget-object p2, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {p2}, Lcom/miui/gallery/activity/BaseActivity;->getActionBar()Lmiui/app/ActionBar;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v0, 0x7f1004fb

    invoke-virtual {p3, v0}, Lcom/miui/gallery/activity/BaseActivity;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Lmiui/app/ActionBar;->setTitle(Ljava/lang/CharSequence;)V

    return-object p1
.end method

.method public onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z
    .locals 10

    move-object v0, p0

    iget-object v1, v0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    if-eqz v1, :cond_0

    move v1, p3

    invoke-direct {p0, p3}, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->recordViewAlbum(I)V

    iget-object v2, v0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    move/from16 v8, p6

    move/from16 v9, p7

    invoke-virtual/range {v2 .. v9}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->onItemClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJFF)Z

    move-result v1

    return v1

    :cond_0
    const/4 v1, 0x0

    return v1
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/ui/BaseAlbumPageFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/ui/AlbumLocalPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumPageAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumPageAdapter;->updateGalleryCloudSyncableState()V

    return-void
.end method
