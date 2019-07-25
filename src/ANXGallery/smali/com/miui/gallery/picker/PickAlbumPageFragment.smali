.class public Lcom/miui/gallery/picker/PickAlbumPageFragment;
.super Lcom/miui/gallery/picker/PickerFragment;
.source "PickAlbumPageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

.field private mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

.field private mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

.field private mLoadInited:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/adapter/AlbumAdapterBase;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Landroid/net/Uri;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getAlbumQueryUri()Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/picker/PickAlbumPageFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->startToLoadAlbumExtraInfo()V

    return-void
.end method

.method static synthetic access$400(Lcom/miui/gallery/picker/PickAlbumPageFragment;)Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    return-object p0
.end method

.method private getAlbumQueryUri()Landroid/net/Uri;
    .locals 6

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    sget-object v4, Lcom/miui/gallery/picker/helper/Picker$MediaType;->VIDEO:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq v0, v4, :cond_1

    const/4 v2, 0x1

    :cond_1
    sget-object v4, Lcom/miui/gallery/provider/GalleryContract$Album;->URI:Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v5, "join_face"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v2

    const-string v4, "join_video"

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v4, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "join_share"

    const-string v4, "true"

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "join_recent"

    const-string v4, "true"

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "join_favorites"

    const-string v4, "true"

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "remove_duplicate_items"

    const-string v4, "true"

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    const-string v2, "fill_covers"

    const-string v4, "true"

    invoke-virtual {v1, v2, v4}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v1

    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v0, v2, :cond_2

    const-string v0, "media_type"

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    goto :goto_1

    :cond_2
    sget-object v2, Lcom/miui/gallery/picker/helper/Picker$MediaType;->VIDEO:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v0, v2, :cond_3

    const-string v0, "media_type"

    const/4 v2, 0x2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v0, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_3
    :goto_1
    invoke-virtual {v1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private startToLoadAlbumExtraInfo()V
    .locals 4

    const-string v0, "PickAlbumPageFragment"

    const-string v1, "startToLoadAlbumExtraInfo"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-virtual {v0, v3, v2, v1}, Landroid/app/LoaderManager;->restartLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v3, 0x3

    invoke-virtual {v0, v3, v2, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$MediaType;->VIDEO:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x4

    iget-object v3, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/LoaderManager;->destroyLoader(I)V

    return-void
.end method

.method private startToLoadAlbums()V
    .locals 4

    const-string v0, "PickAlbumPageFragment"

    const-string v1, "startToLoadAlbums"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    iput-boolean v2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mLoadInited:Z

    return-void
.end method


# virtual methods
.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "picker_album"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 3

    invoke-super {p0, p1, p2, p3}, Lcom/miui/gallery/picker/PickerFragment;->onActivityResult(IILandroid/content/Intent;)V

    if-nez p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->cancel()V

    return-void

    :cond_0
    const-string p1, "internal_key_updated_selection"

    invoke-virtual {p3, p1}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    if-nez p1, :cond_1

    return-void

    :cond_1
    const-string p3, "PickAlbumPageFragment"

    const-string v0, "Pick result of pre album: %s "

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p3, v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {p3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_3
    const-string v0, "PickAlbumPageFragment"

    const-string v1, "Deleted items in pre album : %s "

    invoke-static {v0, v1, p3}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v1, v0}, Lcom/miui/gallery/picker/helper/Picker;->remove(Ljava/lang/String;)Z

    goto :goto_1

    :cond_4
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5
    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p3}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p3}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    goto :goto_2

    :cond_6
    const/4 p1, -0x1

    if-ne p2, p1, :cond_7

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    :cond_7
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mLoadInited:Z

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b0111

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090038

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    new-instance p2, Lcom/miui/gallery/adapter/AlbumAdapterBase;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p2, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;-><init>(Landroid/app/Activity;)V

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->setInPickMode(Z)V

    new-instance p2, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    const v2, 0x7f070255

    const v3, 0x7f0701a3

    invoke-direct {p2, v0, v2, v3, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;-><init>(Landroid/content/Context;IILcom/miui/gallery/widget/DividerTypeProvider;)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f06001e

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, v0, p3, p3, p3}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/SectionedDividerItemDecoration;->setItemDividerPadding(Landroid/graphics/Rect;)V

    iget-object p3, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {p3, p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumRecyclerView:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;

    invoke-virtual {p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->getRecycler()Landroid/support/v7/widget/RecyclerView;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance v0, Lcom/miui/gallery/picker/PickAlbumPageFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment$1;-><init>(Lcom/miui/gallery/picker/PickAlbumPageFragment;)V

    invoke-virtual {p2, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance p2, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickAlbumPageFragment;Lcom/miui/gallery/picker/PickAlbumPageFragment$1;)V

    iput-object p2, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickAlbumPageFragment$AlbumPagePhotoLoaderCallback;

    return-object p1
.end method

.method protected onPhotoItemClick(Landroid/database/Cursor;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public onStart()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/picker/PickerFragment;->onStart()V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mAlbumPageAdapter:Lcom/miui/gallery/adapter/AlbumAdapterBase;

    invoke-virtual {v0}, Lcom/miui/gallery/adapter/AlbumAdapterBase;->updateGalleryCloudSyncableState()V

    return-void
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->setUserVisibleHint(Z)V

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->getUserVisibleHint()Z

    move-result p1

    if-eqz p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mLoadInited:Z

    if-nez p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumPageFragment;->startToLoadAlbums()V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumPageFragment;->mLoadInited:Z

    :cond_0
    return-void
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
