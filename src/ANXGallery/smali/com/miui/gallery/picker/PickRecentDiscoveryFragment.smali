.class public Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;
.super Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;
.source "PickRecentDiscoveryFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;,
        Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

.field private mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

.field private mLoaderCallback:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string v0, "recent"

    invoke-direct {p0, v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getSelection()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)[Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getSelectionArgs()[Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Ljava/lang/String;
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getSortOrder()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;)Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    return-object p0
.end method

.method private getSelection()Ljava/lang/String;
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$MediaType;->ALL:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-eq v0, v1, :cond_0

    const-string v0, "serverType=?"

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method private getSelectionArgs()[Ljava/lang/String;
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_0

    new-array v0, v3, [Ljava/lang/String;

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    return-object v0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v0

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMediaType()Lcom/miui/gallery/picker/helper/Picker$MediaType;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$MediaType;->IMAGE:Lcom/miui/gallery/picker/helper/Picker$MediaType;

    if-ne v0, v1, :cond_1

    new-array v0, v3, [Ljava/lang/String;

    const/4 v1, 0x2

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    return-object v0

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getSortOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "dateModified DESC"

    return-object v0
.end method

.method private updateConfiguration(Landroid/content/res/Configuration;)V
    .locals 1

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_0

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbRecentColumnsLand:I

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object p1

    iget p1, p1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbRecentColumnsPortrait:I

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    return-void
.end method


# virtual methods
.method protected bindCheckState(Landroid/view/View;Landroid/database/Cursor;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    const/4 v2, 0x1

    if-ne v0, v1, :cond_1

    instance-of p2, p1, Lcom/miui/gallery/ui/MicroThumbGridItem;

    if-eqz p2, :cond_0

    check-cast p1, Lcom/miui/gallery/ui/MicroThumbGridItem;

    invoke-virtual {p1, v2}, Lcom/miui/gallery/ui/MicroThumbGridItem;->setSimilarMarkEnable(Z)V

    :cond_0
    return-void

    :cond_1
    check-cast p1, Lcom/miui/gallery/ui/Checkable;

    invoke-interface {p1, v2}, Lcom/miui/gallery/ui/Checkable;->setCheckable(Z)V

    invoke-static {p2}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p2}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    return-void
.end method

.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "picker_recent_album"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 4

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "generate_headers"

    const/4 v2, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_processing_items"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mLoaderCallback:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mLoaderCallback:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mLoaderCallback:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$RecentDiscoveryLoaderCallback;

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->updateConfiguration(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setSelection(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;-><init>(Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;Landroid/content/Context;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    iget-object p1, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->setShareAlbums(Landroid/database/Cursor;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b001d

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setHeadersIgnorePadding(Z)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    new-instance p2, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;)V

    iput-object p2, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAlbumItemCheckListener:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->intialSelections()V

    return-object p1
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment;->mAdapter:Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickRecentDiscoveryFragment$PickRecentAlbumTimelineAdapter;->supportFoldBurstItems()Z

    move-result v0

    return v0
.end method
