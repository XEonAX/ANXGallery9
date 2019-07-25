.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;
.super Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;
.source "EditableListViewWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckStateWithGroup"
.end annotation


# instance fields
.field private mGroupCheckState:Landroid/util/SparseBooleanArray;

.field private mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

.field private mListView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field private mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$1;)V

    new-instance v0, Landroid/util/SparseBooleanArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    return-void
.end method

.method private setCheckStateInternal(IZZ)V
    .locals 4

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;->setCheckState(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState$Status;

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState$Status;

    if-ne p2, v0, :cond_3

    if-eqz p3, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {p2, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {p3, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getItemPositionInterval(I)[I

    move-result-object p3

    const/4 v0, 0x0

    aget v1, p3, v0

    :goto_0
    const/4 v2, 0x1

    aget v3, p3, v2

    if-gt v1, v3, :cond_2

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getCheckState(I)Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 v0, 0x1

    :goto_1
    if-eq p2, v0, :cond_3

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_3
    return-void
.end method


# virtual methods
.method public bindStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    return-void
.end method

.method public clear()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    return-void
.end method

.method public getGroupCheckState(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    return p1
.end method

.method public setAllChecked(Z)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckState;->setAllChecked(Z)V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setCheckState(IZ)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->setCheckStateInternal(IZZ)V

    return-void
.end method

.method public setGroupCheckState(I)Z
    .locals 8

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object v2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v2, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getItemPositionInterval(I)[I

    move-result-object p1

    const/4 v2, 0x0

    aget v3, p1, v2

    const/4 v4, 0x0

    :goto_0
    aget v5, p1, v1

    if-gt v3, v5, :cond_1

    invoke-direct {p0, v3, v0, v2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->setCheckStateInternal(IZZ)V

    iget-object v5, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v5, v3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findViewHolderForAdapterPositionForExternal(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v5

    if-eqz v5, :cond_0

    iget-object v5, v5, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    if-eqz v5, :cond_0

    instance-of v6, v5, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz v6, :cond_0

    check-cast v5, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {v5}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v5

    iget-object v6, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$CheckStateWithGroup;->mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;

    add-int/lit8 v7, v4, 0x1

    mul-int/lit8 v4, v4, 0x28

    invoke-virtual {v6, v5, v3, v0, v4}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapper$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZI)V

    move v4, v7

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method
