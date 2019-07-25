.class public abstract Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;
.super Ljava/lang/Object;
.source "StickyHeaderLayoutManager.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private mAnalysisMinHeaderHeight:I

.field protected final mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field protected mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "TVH;>;"
        }
    .end annotation
.end field

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mTempRect1:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect1:Landroid/graphics/Rect;

    const/16 v0, 0xa

    iput v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mAnalysisMinHeaderHeight:I

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-void
.end method


# virtual methods
.method public getHeaderBounds(Landroid/graphics/Rect;Landroid/view/View;Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-static {p2, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect1:Landroid/graphics/Rect;

    invoke-static {p3, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p3}, Landroid/view/View;->getTop()I

    move-result p3

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect1:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->top:I

    sub-int/2addr p3, v1

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v1

    sub-int/2addr p3, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr p3, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-static {v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->getListTop(Landroid/support/v7/widget/RecyclerView;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->top:I

    add-int/2addr v1, v2

    invoke-static {p3, v1}, Ljava/lang/Math;->max(II)I

    move-result p3

    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    add-int/2addr p2, p3

    invoke-virtual {p1, v0, p3, v1, p2}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method

.method public hasDifferentHeader(II)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p1, p2, :cond_0

    return v0

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-static {v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->indexOutOfBounds(Landroid/support/v7/widget/RecyclerView$Adapter;I)Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    return v2

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-static {v1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->indexOutOfBounds(Landroid/support/v7/widget/RecyclerView$Adapter;I)Z

    move-result v1

    if-eqz v1, :cond_2

    return v2

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p1

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p2

    if-eq p1, p2, :cond_3

    const/4 v0, 0x1

    :cond_3
    return v0
.end method

.method public hasStickyHeader(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 5

    invoke-virtual {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->isReady()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result v0

    if-gtz v0, :cond_1

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v2

    invoke-interface {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result v0

    invoke-static {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderIndex(I)Z

    move-result v2

    if-nez v2, :cond_2

    return v1

    :cond_2
    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v2, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderId(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderId(J)Z

    move-result v0

    if-nez v0, :cond_3

    return v1

    :cond_3
    invoke-virtual {p1, v2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getLayoutHeader(J)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect1:Landroid/graphics/Rect;

    invoke-static {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect1:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, v0

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mAnalysisMinHeaderHeight:I

    if-ge p1, v0, :cond_5

    iput p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mAnalysisMinHeaderHeight:I

    goto :goto_0

    :cond_4
    iget p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mAnalysisMinHeaderHeight:I

    const-string v0, "StickyHeaderLayoutManager"

    const-string v2, "holder is null, mAnalysisMinHeaderHeight %d, item top %d"

    iget v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mAnalysisMinHeaderHeight:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget-object v4, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getTop()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0, v2, v3, v4}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_5
    :goto_0
    iget-object v0, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    invoke-static {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object p2, p2, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mTempRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    add-int/2addr v0, p1

    if-gt p2, v0, :cond_6

    const/4 v1, 0x1

    :cond_6
    return v1
.end method

.method protected isReady()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    if-nez v0, :cond_0

    const-string v0, "StickyHeaderLayoutManager"

    const-string v1, "sticky header adapter shouldn\'t\u3000be null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public abstract needOffsetForHeader(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
.end method

.method public setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "TVH;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mStickyHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    return-void
.end method
