.class public abstract Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;
.super Lcom/miui/gallery/picker/PickerFragment;
.source "PickAlbumDetailFragmentBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;,
        Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;,
        Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$AlbumItemCheckListener;
    }
.end annotation


# instance fields
.field protected mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

.field private mPageName:Ljava/lang/String;

.field protected mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

.field private mShouldContainUnique:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/picker/PickerFragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mShouldContainUnique:Z

    iput-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPageName:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->removeInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->pickInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    return-void
.end method

.method private pickInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V
    .locals 1

    invoke-interface {p1, p2}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mShouldContainUnique:Z

    if-nez p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->add(Ljava/lang/String;)Z

    :cond_1
    const-string p1, "picker"

    const-string p2, "pick_event_page"

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPageName:Ljava/lang/String;

    invoke-static {p1, p2, v0}, Lcom/miui/gallery/util/GallerySamplingStatHelper;->recordStringPropertyEvent(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private refreshPickState()V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v2, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v3, v2, Lcom/miui/gallery/ui/Checkable;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    add-int v4, v0, v1

    invoke-virtual {v3, v4}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/database/Cursor;

    invoke-static {v3}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    check-cast v2, Lcom/miui/gallery/ui/Checkable;

    iget-object v4, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v4, v3}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result v3

    invoke-interface {v2, v3}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method private removeInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V
    .locals 0

    invoke-interface {p1, p2}, Lcom/miui/gallery/picker/helper/Picker;->remove(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-boolean p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mShouldContainUnique:Z

    if-nez p1, :cond_1

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {p1, p2}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->remove(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method


# virtual methods
.method protected bindCheckState(Landroid/view/View;Landroid/database/Cursor;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

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

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0, p2}, Lcom/miui/gallery/picker/helper/Picker;->contains(Ljava/lang/String;)Z

    move-result p2

    invoke-interface {p1, p2}, Lcom/miui/gallery/ui/Checkable;->setChecked(Z)V

    return-void
.end method

.method public clear()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/database/Cursor;

    invoke-static {v2}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p0, v3, v2}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->removeInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    iget-object v2, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v2}, Lcom/miui/gallery/picker/helper/Picker;->count()I

    move-result v2

    if-gtz v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->refreshPickState()V

    :cond_2
    return-void
.end method

.method protected copy2Pick()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->getPicker()Lcom/miui/gallery/picker/helper/Picker;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->copyFrom(Lcom/miui/gallery/picker/helper/Picker;)V

    return-void
.end method

.method protected intialSelections()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    new-instance v1, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$1;-><init>(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;)V

    invoke-direct {v0, v1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;-><init>(Lcom/miui/gallery/picker/helper/AdapterHolder;)V

    iput-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    return-void
.end method

.method protected isAllSelected()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->isAllSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected isNoneSelected()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {v0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->isNoneSelected()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/picker/PickerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getFirstVisiblePosition()I

    move-result v0

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsLand:I

    invoke-virtual {p1, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-static {}, Lcom/miui/gallery/Config$ThumbConfig;->get()Lcom/miui/gallery/Config$ThumbConfig;

    move-result-object v1

    iget v1, v1, Lcom/miui/gallery/Config$ThumbConfig;->sMicroThumbColumnsPortrait:I

    invoke-virtual {p1, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setNumColumns(I)V

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->setSelection(I)V

    return-void
.end method

.method protected onPhotoItemClick(Landroid/database/Cursor;)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v0}, Lcom/miui/gallery/picker/helper/Picker;->getMode()Lcom/miui/gallery/picker/helper/Picker$Mode;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/picker/helper/Picker$Mode;->SINGLE:Lcom/miui/gallery/picker/helper/Picker$Mode;

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-static {p1}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Lcom/miui/gallery/picker/helper/Picker;->pick(Ljava/lang/String;)Z

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mActivity:Landroid/app/Activity;

    check-cast p1, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/picker/PickAlbumDetailActivityBase;->setResultCode(I)V

    iget-object p1, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {p1}, Lcom/miui/gallery/picker/helper/Picker;->done()V

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public selectAll()V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mAlbumDetailGridView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getRealAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v3}, Lcom/miui/gallery/picker/helper/Picker;->isFull()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const v3, 0x7f100595

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-interface {v5}, Lcom/miui/gallery/picker/helper/Picker;->capacity()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {v2, v3, v4}, Landroid/app/Activity;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/miui/gallery/util/ToastUtils;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    goto :goto_1

    :cond_0
    invoke-interface {v0, v2}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/database/Cursor;

    invoke-static {v3}, Lcom/miui/gallery/picker/helper/CursorUtils;->getSha1(Landroid/database/Cursor;)Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mPicker:Lcom/miui/gallery/picker/helper/Picker;

    invoke-direct {p0, v4, v3}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->pickInternal(Lcom/miui/gallery/picker/helper/Picker;Ljava/lang/String;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    invoke-direct {p0}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->refreshPickState()V

    :cond_2
    return-void
.end method

.method public setItemStateListener(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mSelections:Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$SelectionHolder;->setItemStateListener(Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase$ItemStateListener;)V

    return-void
.end method

.method public setSelectionCloudNotContainUnique()V
    .locals 1

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/picker/PickAlbumDetailFragmentBase;->mShouldContainUnique:Z

    return-void
.end method
