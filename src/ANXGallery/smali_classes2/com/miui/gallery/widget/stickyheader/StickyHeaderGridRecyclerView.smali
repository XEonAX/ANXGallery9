.class public Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;
.super Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;
.source "StickyHeaderGridRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager$OnLayoutChangedListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$RecycledViewPoolWrapper;
    }
.end annotation


# instance fields
.field protected mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

.field private mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

.field private mItemLongClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

.field private mItemSpacingDecoration:Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;

.field private mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

.field private mStickyAdapterDelegate:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->init()V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemLongClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    return-object p0
.end method

.method private init()V
    .locals 2

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;-><init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)V

    invoke-super {p0, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$2;-><init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;)V

    invoke-super {p0, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$RecycledViewPoolWrapper;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$RecycledViewPoolWrapper;-><init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView$1;)V

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->setRecycledViewPool(Landroid/support/v7/widget/RecyclerView$RecycledViewPool;)V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderSpacingDecoration;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderSpacingDecoration;-><init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;Z)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemSpacingDecoration:Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemSpacingDecoration:Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method


# virtual methods
.method public findChildViewUnderForExternal(FF)Landroid/view/View;
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->findChildViewUnderForExternal(FF)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    if-eqz p1, :cond_1

    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result p2

    invoke-virtual {v0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result p2

    if-eqz p2, :cond_1

    :cond_0
    const/4 p1, 0x0

    :cond_1
    return-object p1
.end method

.method public findFirstVisibleItemPosition()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    const/4 v2, -0x1

    :goto_0
    if-eq v0, v1, :cond_2

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->getItemCount()I

    move-result v3

    if-ge v0, v3, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    :cond_2
    :goto_1
    return v2
.end method

.method public findLastVisibleItemPosition()I
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    const/4 v1, -0x1

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;->findLastVisibleItemPosition()I

    move-result v0

    const/4 v2, -0x1

    :goto_0
    if-eq v0, v1, :cond_2

    if-le v0, v1, :cond_2

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v2, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v3

    if-nez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 v2, -0x1

    :cond_2
    :goto_1
    return v2
.end method

.method public findViewHolderForAdapterPositionForExternal(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p1

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->findViewHolderForAdapterPositionForExternal(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public getChildAdapterPositionForExternal(Landroid/view/View;)I
    .locals 2

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->getChildAdapterPositionForExternal(Landroid/view/View;)I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    return v0

    :cond_1
    :goto_0
    return v1
.end method

.method public onSpanCountChanged(II)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    :cond_0
    const-string v0, "StickyHeaderGridRecyclerView"

    const-string v1, "span count changed from %d to %d"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public onSpanSizeLookupChanged(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    :cond_0
    const-string v0, "StickyHeaderGridRecyclerView"

    const-string v1, "span size lookup changed from %d to %d"

    invoke-static {v0, v1, p1, p2}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public scrollToPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p1

    :goto_0
    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->scrollToPosition(I)V

    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result p1

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;->scrollToPositionWithOffset(II)V

    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-direct {v0, p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;-><init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mStickyAdapterDelegate:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getStickyHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->getStickyHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->hasStableIds()Z

    move-result p1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->setHasStableIds(Z)V

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public setHorizontalSpacing(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemSpacingDecoration:Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->setHorizontalSpacing(I)V

    return-void
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .locals 1

    instance-of v0, p1, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mLayout:Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager;->setLayoutChangedListener(Lcom/miui/gallery/widget/stickyheader/StickyGridLayoutManager$OnLayoutChangedListener;)V

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "the layout manager must extends StickyGridLayoutManager"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;

    return-void
.end method

.method public setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemLongClickDelegate:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    return-void
.end method

.method public setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mStickyAdapterDelegate:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    :cond_0
    return-void
.end method

.method public setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V
    .locals 1

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mAdapter:Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    :cond_0
    invoke-super {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V

    return-void
.end method

.method public setVerticalSpacing(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridRecyclerView;->mItemSpacingDecoration:Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->setVerticalSpacing(I)V

    return-void
.end method
