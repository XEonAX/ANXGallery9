.class public Lcom/miui/gallery/picker/PickHomePageFragment;
.super Lcom/miui/gallery/picker/PickerFragment;
.source "PickHomePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

.field private mHomeGridView:Landroid/widget/GridView;

.field private mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

.field private mHomePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickHomePageFragment;)Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    return-object p0
.end method

.method private refreshPickState()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {v2}, Landroid/widget/GridView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {v2, v1}, Landroid/widget/GridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/miui/gallery/ui/Checkable;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    add-int v4, v0, v1

    invoke-virtual {v3, v4}, Landroid/widget/GridView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/database/Cursor;

    invoke-static {v3}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    check-cast v2, Lcom/miui/gallery/ui/Checkable;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v4, v3}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "picker_home"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
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

    const-string v1, "remove_processing_items"

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

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickHomePageFragment;Lcom/miui/gallery/picker/PickHomePageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickHomePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickHomePageFragment$HomePagePhotoLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setSelection(I)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onCreate(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    new-instance v1, Lcom/miui/gallery/picker/PickerHomePageAdapter;

    iget-object v2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mActivity:Landroid/app/Activity;

    sget-object v3, Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;->SCENE_NONE:Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;

    invoke-direct {v1, v2, v3}, Lcom/miui/gallery/picker/PickerHomePageAdapter;-><init>(Landroid/content/Context;Lcom/miui/gallery/adapter/SyncStateDisplay$DisplayScene;)V

    invoke-direct {p1, v0, v1}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;-><init>(Lcom/miui/gallery/picker/helper/Picker;Landroid/widget/CursorAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/picker/PickerFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 1

    const p3, 0x7f0b0114

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/GridView;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickHomePageFragment;->getGridViewOnItemClickListener()Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object p3

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    const p2, 0x1020004

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/EmptyPage;

    iput-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomeGridView:Landroid/widget/GridView;

    iget-object p3, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    invoke-virtual {p2, p3}, Landroid/widget/GridView;->setEmptyView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mEmptyView:Lcom/miui/gallery/widget/EmptyPage;

    const/16 p3, 0x8

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/EmptyPage;->setVisibility(I)V

    return-object p1
.end method

.method public onPermissionsChecked()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mHomePageAdapter:Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->notifyDataSetChanged()V

    return-void
.end method

.method protected onPhotoItemClick(Landroid/database/Cursor;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-static {p1}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/miui/gallery/picker/PickHomePageFragment;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method protected recordPageByDefault()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public setUserVisibleHint(Z)V
    .locals 0

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->setUserVisibleHint(Z)V

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickHomePageFragment;->isResumed()Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickHomePageFragment;->refreshPickState()V

    :cond_0
    return-void
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
