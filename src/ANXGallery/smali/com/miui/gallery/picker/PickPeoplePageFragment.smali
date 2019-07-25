.class public Lcom/miui/gallery/picker/PickPeoplePageFragment;
.super Lcom/miui/gallery/picker/PickerFragment;
.source "PickPeoplePageFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;
    }
.end annotation


# instance fields
.field private mIsOnlyPickPeople:Z

.field private mPeopleGridView:Landroid/widget/GridView;

.field private mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

.field private mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

.field private mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerFragment;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Lcom/miui/gallery/adapter/PeoplePageAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickPeoplePageFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mIsOnlyPickPeople:Z

    return p0
.end method


# virtual methods
.method protected getPageName()Ljava/lang/String;
    .locals 1

    const-string v0, "picker_people"

    return-object v0
.end method

.method protected getUri()Landroid/net/Uri;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onActivityCreated(Landroid/os/Bundle;)V

    new-instance p1, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;-><init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;Lcom/miui/gallery/picker/PickPeoplePageFragment$1;)V

    iput-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->getLoaderManager()Landroid/app/LoaderManager;

    move-result-object p1

    iget-object v1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePagePhotoLoaderCallback:Lcom/miui/gallery/picker/PickPeoplePageFragment$PeoplePagePhotoLoaderCallback;

    const/4 v2, 0x1

    invoke-virtual {p1, v2, v0, v1}, Landroid/app/LoaderManager;->initLoader(ILandroid/os/Bundle;Landroid/app/LoaderManager$LoaderCallbacks;)Landroid/content/Loader;

    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    invoke-virtual {v0}, Landroid/widget/GridView;->getFirstVisiblePosition()I

    move-result v0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0026

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickPeoplePageFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0a0025

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    invoke-virtual {p1, v1}, Landroid/widget/GridView;->setNumColumns(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    invoke-virtual {p1, v0}, Landroid/widget/GridView;->setSelection(I)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;->swapCursor(Landroid/database/Cursor;)Landroid/database/Cursor;

    :cond_0
    invoke-super {p0}, Lcom/miui/gallery/picker/PickerFragment;->onDestroy()V

    return-void
.end method

.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2

    const/4 p3, 0x0

    const v0, 0x7f0b00e6

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f09014b

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/GridView;

    iput-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    new-instance v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridView:Landroid/widget/GridView;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;-><init>(Landroid/widget/AbsListView;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance v0, Lcom/miui/gallery/adapter/PeoplePageAdapter;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/miui/gallery/adapter/PeoplePageAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    iget-object v1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeoplePageAdapter:Lcom/miui/gallery/adapter/PeoplePageAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mPeopleGridViewWrapper:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;

    new-instance v1, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickPeoplePageFragment$1;-><init>(Lcom/miui/gallery/picker/PickPeoplePageFragment;)V

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setAreHeadersSticky(Z)V

    return-object p1
.end method

.method protected onPhotoItemClick(Landroid/database/Cursor;)Z
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public setIsPickPeople(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/picker/PickPeoplePageFragment;->mIsOnlyPickPeople:Z

    return-void
.end method

.method protected supportFoldBurstItems()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
