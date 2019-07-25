.class Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "StickyHeaderGridAdapterWrapper.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$FillerViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<ADAPTER:",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "TVH;>;VH:",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        "HVH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
        "THVH;>;"
    }
.end annotation


# static fields
.field private static final sExtraPositionTypeMap:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TADAPTER;"
        }
    .end annotation
.end field

.field private mHeaderIndexMap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mPositionMap:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "THVH;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->sExtraPositionTypeMap:Landroid/util/SparseArray;

    sget-object v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->sExtraPositionTypeMap:Landroid/util/SparseArray;

    const/4 v1, -0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    const/high16 v2, -0x80000000

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "TADAPTER;)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    new-instance p2, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$1;-><init>(Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;)V

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    return-void
.end method

.method private isCustomHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    const-string v0, "StickyHeaderGridAdapterWrapper"

    const-string v2, "onViewRecycled NO_POSITION %s"

    invoke-static {v0, v2, p1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return v1

    :cond_0
    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v0

    if-nez v0, :cond_1

    instance-of p1, p1, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$FillerViewHolder;

    if-nez p1, :cond_1

    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method private isReady()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    if-nez v0, :cond_0

    const-string v0, "StickyHeaderGridAdapterWrapper"

    const-string v1, "sticky header adapter shouldn\'t be null"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method


# virtual methods
.method protected decryptPosition(I)I
    .locals 3

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    return p1

    :cond_0
    if-ltz p1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_2
    :goto_0
    const-string v0, "StickyHeaderGridAdapterWrapper"

    const-string v1, "position %d out of bounds"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return p1
.end method

.method protected decryptViewType(I)I
    .locals 1

    const/4 v0, 0x1

    if-ge p1, v0, :cond_0

    return p1

    :cond_0
    sub-int/2addr p1, v0

    return p1
.end method

.method protected encryptPosition(I)I
    .locals 2

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isReady()Z

    move-result v0

    if-nez v0, :cond_0

    return p1

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-ne v1, p1, :cond_1

    return v0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return p1
.end method

.method protected encryptViewType(I)I
    .locals 0

    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method protected generateData()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isReady()Z

    move-result v0

    if-nez v0, :cond_2

    return-void

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result v0

    if-gtz v0, :cond_3

    const-string v0, "StickyHeaderGridAdapterWrapper"

    const-string v1, "header count is invalid"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-lez v0, :cond_7

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v1

    instance-of v2, v1, Landroid/support/v7/widget/GridLayoutManager;

    if-eqz v2, :cond_7

    check-cast v1, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v1}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    :goto_0
    add-int/lit8 v4, v0, -0x1

    if-ge v3, v4, :cond_6

    iget-object v4, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v4, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result v4

    invoke-static {v4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderIndex(I)Z

    move-result v5

    if-nez v5, :cond_4

    goto :goto_2

    :cond_4
    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    add-int/lit8 v5, v3, 0x1

    invoke-interface {v2, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result v2

    if-eq v4, v2, :cond_5

    iget-object v5, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    rem-int/2addr v5, v1

    :goto_1
    add-int/lit8 v5, v5, 0x1

    if-ge v5, v1, :cond_5

    iget-object v6, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v6, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    const/high16 v7, -0x80000000

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_5
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_6
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_7
    return-void
.end method

.method public getHeaderCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result v0

    return v0
.end method

.method public getHeaderId(I)J
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getHeaderIndex(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mHeaderIndexMap:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1
.end method

.method public getHeaderViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderViewType(I)I

    move-result p1

    return p1
.end method

.method public getItemCount()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isReady()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mPositionMap:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getItemId(I)J
    .locals 4

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    int-to-long v2, p1

    sub-long/2addr v0, v2

    return-wide v0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemPositionInterval(I)[I
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getItemPositionInterval(I)[I

    move-result-object p1

    const/4 v0, 0x0

    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v1

    aput v1, p1, v0

    const/4 v0, 0x1

    aget v1, p1, v0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptPosition(I)I

    move-result v1

    aput v1, p1, v0

    return-object p1
.end method

.method public getItemViewType(I)I
    .locals 1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->sExtraPositionTypeMap:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_0
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemViewType(I)I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->encryptViewType(I)I

    move-result p1

    return p1
.end method

.method protected isExtraPosition(I)Z
    .locals 0

    if-gez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onAttachedToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(THVH;I)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->onBindHeaderViewHolder(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    :cond_0
    return-void
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
            "I",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptPosition(I)I

    move-result p2

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isExtraPosition(I)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$Adapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;ILjava/util/List;)V

    :cond_0
    return-void
.end method

.method public onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)THVH;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p1, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->onCreateHeaderViewHolder(Landroid/view/ViewGroup;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->decryptViewType(I)I

    move-result p2

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    new-instance p2, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$FillerViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper$FillerViewHolder;-><init>(Landroid/content/Context;)V

    return-object p2

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onDetachedFromRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method

.method public onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isCustomHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method public onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isCustomHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_0
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isCustomHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_0
    return-void
.end method

.method public onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 1

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->isCustomHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    :cond_0
    return-void
.end method

.method setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "THVH;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->mStickyAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/stickyheader/StickyHeaderGridAdapterWrapper;->generateData()V

    return-void
.end method
