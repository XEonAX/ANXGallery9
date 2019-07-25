.class public Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;
.super Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
.source "StickyHeaderRecyclerView.java"


# instance fields
.field protected mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;

.field protected mHeaderLongClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;

.field private mInternalHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

.field protected mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method private ensureHeaderClickListener()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mInternalHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView$1;-><init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mInternalHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    :cond_0
    return-void
.end method

.method private registerOrUnregisterHeaderClickListener()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderLongClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V

    goto :goto_0

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->ensureHeaderClickListener()V

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mInternalHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V

    :goto_0
    return-void
.end method


# virtual methods
.method public getHeaderVisibility()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->getHeaderVisibility()I

    move-result v0

    return v0
.end method

.method public getStickyHeaderAdapter()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->getHeaderAdapter()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    move-result-object v0

    return-object v0
.end method

.method public getStickyHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->getHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    move-result-object v0

    return-object v0
.end method

.method public getStickyHeaderRender()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->getHeaderRender()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    move-result-object v0

    return-object v0
.end method

.method public setHeaderVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0, p0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setHeaderVisibility(Landroid/support/v7/widget/RecyclerView;I)V

    return-void
.end method

.method public setOnHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderClickListener;

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->registerOrUnregisterHeaderClickListener()V

    return-void
.end method

.method public setOnHeaderLongClickListener(Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mHeaderLongClickListener:Lcom/miui/gallery/widget/stickyheader/core/OnHeaderLongClickListener;

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->registerOrUnregisterHeaderClickListener()V

    return-void
.end method

.method public setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    return-void
.end method

.method public setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V

    return-void
.end method

.method public setStickyHeaderRender(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecyclerView;->mStickyHeaderDecoration:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->setStickyHeaderRender(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;)V

    return-void
.end method
