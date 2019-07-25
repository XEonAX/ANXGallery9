.class public Lcom/miui/gallery/ui/RecentDiscoveryFragment;
.super Lcom/miui/gallery/ui/BaseMediaFragment;
.source "RecentDiscoveryFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;
    }
.end annotation


# instance fields
.field protected mAlbumId:J

.field protected mAlbumName:Ljava/lang/String;

.field private mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

.field protected mEmptyView:Landroid/view/View;

.field protected mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field protected mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field protected mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

.field private mOldestDateModified:J

.field private mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;-><init>()V

    const-wide v0, 0x7fffffffffffffffL

    iput-wide v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mOldestDateModified:J

    new-instance v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$2;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mOldestDateModified:J

    return-wide v0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/RecentDiscoveryFragment;J)J
    .locals 0

    iput-wide p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mOldestDateModified:J

    return-wide p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/RecentDiscoveryFragment;Landroid/view/ActionMode;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->doDelete(Landroid/view/ActionMode;)V

    return-void
.end method

.method private doDelete(Landroid/view/ActionMode;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->getCheckedItemIds()[J

    move-result-object v9

    if-eqz v9, :cond_0

    array-length v0, v9

    if-lez v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const-string v2, "RecentDiscoveryFragmentDeleteMediaDialogFragment"

    new-instance v3, Lcom/miui/gallery/ui/RecentDiscoveryFragment$3;

    invoke-direct {v3, p0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$3;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;Landroid/view/ActionMode;)V

    iget-wide v4, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumId:J

    iget-object v6, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getDupType()I

    move-result v7

    const/16 v8, 0x1d

    invoke-static/range {v1 .. v9}, Lcom/miui/gallery/util/MediaAndAlbumOperations;->delete(Landroid/app/Activity;Ljava/lang/String;Lcom/miui/gallery/ui/DeletionTask$OnDeletionCompleteListener;JLjava/lang/String;II[J)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    const v1, 0x7f100302

    invoke-virtual {p0, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    :goto_0
    return-void
.end method

.method private recordOldestOperatedPicture()V
    .locals 5

    iget-wide v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mOldestDateModified:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, v0, v2

    if-gez v4, :cond_0

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    iget-wide v3, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mOldestDateModified:J

    sub-long/2addr v1, v3

    const-wide/32 v3, 0x5265c00

    div-long/2addr v1, v3

    const-string v3, "days_ago"

    invoke-static {v1, v2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v1, "recent_album"

    const-string v2, "recent_album_oldest_operated_picture"

    invoke-static {v1, v2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method private recordPageEnterSource()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/activity/BaseActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    if-eqz v0, :cond_1

    const-string v1, "source"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "source"

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "unknown"

    :goto_0
    invoke-virtual {v1, v2, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "recent_album"

    const-string v2, "recent_album_enter_source"

    invoke-static {v0, v2, v1}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordCountEvent(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    :cond_1
    return-void
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
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    return-void
.end method


# virtual methods
.method protected getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    iget-object v1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mActivity:Lcom/miui/gallery/activity/BaseActivity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    return-object v0
.end method

.method protected getDupType()I
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getUri()Landroid/net/Uri;

    move-result-object v0

    const-string v1, "remove_duplicate_items"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/net/Uri;->getBooleanQueryParameter(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    return v0

    :cond_0
    return v2
.end method

.method protected getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;
    .locals 1

    new-instance v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;)V

    return-object v0
.end method

.method protected getLoader()Landroid/content/Loader;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment$RecentDiscoveryLoaderCallback;-><init>(Lcom/miui/gallery/ui/RecentDiscoveryFragment;Lcom/miui/gallery/ui/RecentDiscoveryFragment$1;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mLoaderCallbacks:Landroid/app/LoaderManager$LoaderCallbacks;

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

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x3

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v1, v2}, Landroid/app/LoaderManager;->getLoader(I)Landroid/content/Loader;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method public getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "album_recent"

    return-object v0
.end method

.method protected getSelection()Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSelectionArgs()[Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method protected getSortOrder()Ljava/lang/String;
    .locals 1

    const-string v0, "dateModified DESC"

    return-object v0
.end method

.method protected getSupportOperationMask()I
    .locals 1

    const/4 v0, -0x1

    return v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 3

    sget-object v0, Lcom/miui/gallery/provider/GalleryContract$RecentDiscoveredMedia;->URI:Landroid/net/Uri;

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const-string v1, "generate_headers"

    const/4 v2, 0x1

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

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onActivityCreated(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v1, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;

    move-result-object v0

    const/4 v2, 0x2

    invoke-virtual {p1, v2, v1, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getLoaderCallback()Landroid/app/LoaderManager$LoaderCallbacks;

    move-result-object v0

    const/4 v2, 0x3

    invoke-virtual {p1, v2, v1, v0}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->updateConfiguration(Landroid/content/res/Configuration;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setSelection(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/ui/BaseMediaFragment;->onCreate(Landroid/os/Bundle;)V

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->recordPageEnterSource()V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->recordOldestOperatedPicture()V

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mRecentDiscoveryAdapter:Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/ui/BaseMediaFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b001d

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const p3, 0x7f10003b

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumName:Ljava/lang/String;

    const-wide/32 p2, 0x7ffffffc

    iput-wide p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mAlbumId:J

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const p2, 0x1020004

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mEmptyView:Landroid/view/View;

    new-instance p2, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-direct {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mEmptyView:Landroid/view/View;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setEmptyView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getAdapter()Lcom/miui/gallery/adapter/RecentDiscoveryAdapter;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    const/4 p3, 0x3

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setChoiceMode(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object p3, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mChoiceModeListener:Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setMultiChoiceModeListener(Lcom/miui/gallery/widget/editwrapper/MultiChoiceModeListener;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    const/4 p3, 0x1

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setHeadersIgnorePadding(Z)V

    const/16 p2, 0x8

    invoke-virtual {p0, p2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->setEmptyViewVisibility(I)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p2

    invoke-direct {p0, p2}, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->updateConfiguration(Landroid/content/res/Configuration;)V

    return-object p1
.end method

.method protected setEmptyViewVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/RecentDiscoveryFragment;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
