.class Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;
.super Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;
.source "EditableListViewWrapperDeprecated.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CheckStateWithGroup"
.end annotation


# instance fields
.field private mGroupCheckState:Landroid/util/SparseBooleanArray;

.field private mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

.field private mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView;Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;)V
    .locals 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;-><init>(Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$1;)V

    new-instance v0, Landroid/util/SparseBooleanArray;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/util/SparseBooleanArray;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    iput-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    return-void
.end method

.method private setCheckStateInternal(IZZ)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setCheckState(IZ)V

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mStatus:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    sget-object v0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;->CLEAN:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState$Status;

    if-ne p2, v0, :cond_2

    if-eqz p3, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p2, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getGroupIndexByItemIndex(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p3, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getGroupItemStartIndex(I)I

    move-result p3

    move v0, p3

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v1, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getGroupItemsCount(I)I

    move-result v1

    add-int/2addr v1, p3

    if-ge v0, v1, :cond_1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->getCheckState(I)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 p3, 0x0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p3, 0x1

    :goto_1
    if-eq p2, p3, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {p2, p1, p3}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->notifyChanged()V

    :cond_2
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    invoke-super {p0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0}, Landroid/util/SparseBooleanArray;->clear()V

    return-void
.end method

.method public getGroupCheckState(I)Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseBooleanArray;->get(I)Z

    move-result p1

    return p1
.end method

.method public setAllChecked(Z)V
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckState;->setAllChecked(Z)V

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getHeaderNum()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, v0, p1}, Landroid/util/SparseBooleanArray;->put(IZ)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->notifyChanged()V

    return-void
.end method

.method public setCheckState(IZ)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->setCheckStateInternal(IZZ)V

    return-void
.end method

.method public setGroupCheckState(I)Z
    .locals 9

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->getGroupCheckState(I)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mGroupCheckState:Landroid/util/SparseBooleanArray;

    invoke-virtual {v1, p1, v0}, Landroid/util/SparseBooleanArray;->put(IZ)V

    iget-object v1, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v1, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getGroupItemStartIndex(I)I

    move-result v2

    const/4 v3, 0x0

    move v4, v2

    const/4 v5, 0x0

    :goto_0
    invoke-virtual {v1, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getGroupItemsCount(I)I

    move-result v6

    add-int/2addr v6, v2

    if-ge v4, v6, :cond_1

    invoke-direct {p0, v4, v0, v3}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->setCheckStateInternal(IZZ)V

    iget-object v6, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListView:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;

    invoke-virtual {v6, v4}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersGridView;->getChildViewByItemIndex(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_0

    instance-of v7, v6, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    if-eqz v7, :cond_0

    check-cast v6, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;

    invoke-interface {v6}, Lcom/miui/gallery/widget/editwrapper/PickAnimationHelper$BackgroundImageViewable;->getBackgroundImageView()Landroid/widget/ImageView;

    move-result-object v6

    iget-object v7, p0, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$CheckStateWithGroup;->mListAnimationManager:Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;

    add-int/lit8 v8, v5, 0x1

    mul-int/lit8 v5, v5, 0x28

    invoke-virtual {v7, v6, v4, v0, v5}, Lcom/miui/gallery/widget/editwrapper/EditableListViewWrapperDeprecated$AnimationManager;->startScaleItemImageViewAnimation(Landroid/widget/ImageView;IZI)V

    move v5, v8

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method
