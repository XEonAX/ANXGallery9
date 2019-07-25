.class final Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "StickyHeaderDecoration.java"

# interfaces
.implements Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;,
        Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$ItemDecoration;",
        "Lcom/miui/gallery/widget/recyclerview/transition/TransitionalView;"
    }
.end annotation


# instance fields
.field private mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "TVH;>;"
        }
    .end annotation
.end field

.field private mHeaderBounds:Landroid/util/LongSparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LongSparseArray<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager<",
            "TVH;>;"
        }
    .end annotation
.end field

.field private mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler<",
            "TVH;>;"
        }
    .end annotation
.end field

.field private mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender<",
            "TVH;>;"
        }
    .end annotation
.end field

.field private mHost:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v7/widget/RecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private mItemClickHelper:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;

.field private mTempRect1:Landroid/graphics/Rect;

.field private mTempRect2:Landroid/graphics/Rect;

.field private mTempRect3:Landroid/graphics/Rect;

.field private mVisibility:I


# direct methods
.method constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect2:Landroid/graphics/Rect;

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect3:Landroid/graphics/Rect;

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    new-instance v0, Landroid/util/LongSparseArray;

    invoke-direct {v0}, Landroid/util/LongSparseArray;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;-><init>(Landroid/content/Context;Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mItemClickHelper:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mItemClickHelper:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;

    invoke-direct {v0, p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderMotionEventDispatch;-><init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;)V

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHost:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method private static createHeaderDrawable(Landroid/view/View;Landroid/graphics/Rect;)Landroid/graphics/drawable/Drawable;
    .locals 2

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    move-result p1

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, p1, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p1

    new-instance v0, Landroid/graphics/Canvas;

    invoke-direct {v0, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0, v0}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    new-instance p0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-direct {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;-><init>(Landroid/graphics/Bitmap;)V

    return-object p0
.end method

.method private dispatchOnPreDraw(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;)Z"
        }
    .end annotation

    iget-object v0, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Landroid/view/ViewGroup;

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    iget-object p1, p1, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    check-cast p1, Landroid/view/ViewGroup;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    const/4 v2, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v3}, Landroid/view/ViewTreeObserver;->dispatchOnPreDraw()Z

    move-result v3

    and-int/2addr v2, v3

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    move v1, v2

    :cond_2
    return v1
.end method

.method private drawHeader(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;)V
    .locals 9

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v3}, Landroid/util/LongSparseArray;->size()I

    move-result v3

    if-ge v1, v3, :cond_5

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v3

    iget-object v5, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {v5, v3, v4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getLayoutHeader(J)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v5

    if-nez v5, :cond_0

    const-string v5, "StickyHeaderDecoration"

    const-string v6, "header %s hasn\'t laidout"

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-static {v5, v6, v3}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_3

    :cond_0
    iget-object v6, v5, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v6}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/4 v7, 0x1

    if-nez v6, :cond_1

    const/4 v6, 0x1

    goto :goto_1

    :cond_1
    const/4 v6, 0x0

    :goto_1
    invoke-direct {p0, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->dispatchOnPreDraw(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)Z

    move-result v8

    if-nez v8, :cond_3

    if-nez v6, :cond_2

    goto :goto_2

    :cond_2
    const/4 v7, 0x0

    :cond_3
    :goto_2
    if-nez v7, :cond_4

    iget-object v6, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    iget-object v7, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v7, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;

    invoke-interface {v6, p1, p2, v5, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;->draw(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/graphics/Rect;)V

    goto :goto_3

    :cond_4
    or-int/2addr v2, v6

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_5
    if-eqz v2, :cond_6

    const-string p2, "StickyHeaderDecoration"

    const-string v0, "reschedule drawing"

    invoke-static {p2, v0}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_6
    return-void
.end method

.method private findFirstItemNoBorderingWithHeader(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)Landroid/view/View;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "TVH;",
            "Landroid/graphics/Rect;",
            ")",
            "Landroid/view/View;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-lt v0, v3, :cond_4

    if-ge v1, v3, :cond_0

    goto :goto_2

    :cond_0
    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_3

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {p1, v3}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_1

    goto :goto_1

    :cond_1
    invoke-direct {p0, p1, v3, p2, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->isItemBorderingWithHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)Z

    move-result v4

    if-nez v4, :cond_2

    return-object v3

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    return-object v2

    :cond_4
    :goto_2
    const-string p1, "StickyHeaderDecoration"

    const-string p2, "find next header: child num %d, or data num %d is illegal"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, p3, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v2
.end method

.method private initHeaderBounds(Landroid/graphics/Rect;Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/view/View;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/graphics/Rect;",
            "Landroid/support/v7/widget/RecyclerView;",
            "TVH;",
            "Landroid/view/View;",
            "Z)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v1, p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1, v1, p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->getHeaderBounds(Landroid/graphics/Rect;Landroid/view/View;Landroid/view/View;)V

    if-eqz p5, :cond_1

    invoke-direct {p0, p2, p3, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->findFirstItemNoBorderingWithHeader(Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)Landroid/view/View;

    move-result-object p4

    if-eqz p4, :cond_1

    invoke-virtual {p2, p4}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p5

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    invoke-virtual {p2, p4}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->needOffsetForHeader(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v0, p5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p5

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {v0, p2, p5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getHeaderView(Landroid/support/v7/widget/RecyclerView;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p2

    if-nez p2, :cond_0

    return-void

    :cond_0
    iget-object p5, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    iget-object v1, p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p5, v0, v1, p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->getHeaderBounds(Landroid/graphics/Rect;Landroid/view/View;Landroid/view/View;)V

    iget-object p2, p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect2:Landroid/graphics/Rect;

    invoke-static {p2, p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object p2, p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect3:Landroid/graphics/Rect;

    invoke-static {p2, p3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget p2, p1, Landroid/graphics/Rect;->bottom:I

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect3:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p2, p3

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->top:I

    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect2:Landroid/graphics/Rect;

    iget p4, p4, Landroid/graphics/Rect;->top:I

    sub-int/2addr p3, p4

    if-ge p3, p2, :cond_1

    const/4 p4, 0x0

    sub-int/2addr p3, p2

    invoke-virtual {p1, p4, p3}, Landroid/graphics/Rect;->offset(II)V

    :cond_1
    return-void
.end method

.method private invalidate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    :cond_0
    return-void
.end method

.method private isItemBorderingWithHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Landroid/view/View;",
            "TVH;",
            "Landroid/graphics/Rect;",
            ")Z"
        }
    .end annotation

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p1

    const/4 v0, 0x0

    const/4 v1, -0x1

    if-eq p1, v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v1, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p1

    invoke-virtual {p3}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderIndex()I

    move-result v1

    if-eq p1, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    iget-object p3, p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    invoke-static {p3, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    iget p1, p1, Landroid/support/v7/widget/RecyclerView$LayoutParams;->topMargin:I

    sub-int/2addr p2, p1

    iget p1, p4, Landroid/graphics/Rect;->bottom:I

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p1, p3

    if-gt p2, p1, :cond_1

    const/4 v0, 0x1

    :cond_1
    return v0

    :cond_2
    :goto_0
    return v0
.end method

.method private isReady()Z
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "StickyHeaderDecoration"

    const-string v2, "sticky header adapter mustn\'t be null"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    if-nez v0, :cond_1

    const-string v0, "StickyHeaderDecoration"

    const-string v2, "sticky header layout mustn\'t be null"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    if-nez v0, :cond_2

    const-string v0, "StickyHeaderDecoration"

    const-string v2, "sticky header recycler mustn\'t be null"

    invoke-static {v0, v2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return v1

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    if-nez v0, :cond_3

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;

    invoke-direct {v0}, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method private layoutHeader(Landroid/support/v7/widget/RecyclerView;)V
    .locals 10

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_6

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    invoke-virtual {p1, v6}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v2

    invoke-virtual {p1, v6}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v3

    invoke-virtual {v3}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result v4

    if-eqz v3, :cond_5

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    goto :goto_1

    :cond_0
    iget-object v5, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v7, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {v5, v7, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->hasStickyHeader(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v8

    if-nez v8, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    add-int/lit8 v5, v4, -0x1

    invoke-virtual {v3, v4, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->hasDifferentHeader(II)Z

    move-result v3

    if-eqz v3, :cond_5

    :cond_1
    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v3, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result v2

    invoke-static {v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderIndex(I)Z

    move-result v3

    if-nez v3, :cond_2

    goto :goto_1

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {v3, p1, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getHeaderView(Landroid/support/v7/widget/RecyclerView;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v9

    if-nez v9, :cond_3

    goto :goto_1

    :cond_3
    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v9}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderId()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    if-nez v2, :cond_4

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v9}, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->getHeaderId()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5, v2}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    :cond_4
    move-object v3, v2

    move-object v2, p0

    move-object v4, p1

    move-object v5, v9

    move v7, v8

    invoke-direct/range {v2 .. v7}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->initHeaderBounds(Landroid/graphics/Rect;Landroid/support/v7/widget/RecyclerView;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/view/View;Z)V

    iput-boolean v8, v9, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mIsStickyHeader:Z

    :cond_5
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_6
    return-void
.end method

.method private notifyDataChanged()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private recycleHeader(Landroid/support/v7/widget/RecyclerView;)V
    .locals 9

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v0}, Landroid/util/LongSparseArray;->clone()Landroid/util/LongSparseArray;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->clear()V

    new-instance v1, Landroid/util/LongSparseArray;

    invoke-direct {v1}, Landroid/util/LongSparseArray;-><init>()V

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v4, v2, :cond_4

    invoke-virtual {p1, v4}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p1, v5}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_0

    goto :goto_1

    :cond_0
    iget-object v6, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v6, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result v5

    invoke-static {v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderIndex(I)Z

    move-result v6

    if-nez v6, :cond_1

    goto :goto_1

    :cond_1
    iget-object v6, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {v6, v5}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderId(I)J

    move-result-wide v6

    invoke-static {v6, v7}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderId(J)Z

    move-result v8

    if-nez v8, :cond_2

    goto :goto_1

    :cond_2
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v1, v6, v7, v5}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    invoke-virtual {v0, v6, v7}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Rect;

    if-eqz v5, :cond_3

    iget-object v8, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v8, v6, v7, v5}, Landroid/util/LongSparseArray;->put(JLjava/lang/Object;)V

    :cond_3
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_4
    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getLayoutHeaders()Landroid/util/LongSparseArray;

    move-result-object p1

    :goto_2
    invoke-virtual {p1}, Landroid/util/LongSparseArray;->size()I

    move-result v0

    if-ge v3, v0, :cond_6

    invoke-virtual {p1, v3}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v4

    invoke-virtual {v1, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {p1, v4, v5}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    invoke-virtual {v0, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->recycleHeader(Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;)V

    :cond_5
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_6
    return-void
.end method


# virtual methods
.method findHeaderUnder(FF)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(FF)TVH;"
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v1}, Landroid/util/LongSparseArray;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v1, v0}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v1

    iget-object v3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v3, v1, v2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/Rect;

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Rect;->contains(II)Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {p1, v1, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getLayoutHeader(J)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p1

    return-object p1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method getHeaderAdapter()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "TVH;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    return-object v0
.end method

.method getHeaderBoundsInLayout(J)Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v0, p1, p2}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Rect;

    return-object p1
.end method

.method getHeaderLayoutManager()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager<",
            "TVH;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    return-object v0
.end method

.method getHeaderRender()Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender<",
            "TVH;>;"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    return-object v0
.end method

.method getHeaderVisibility()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    return v0
.end method

.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 1

    iget p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    const/16 v0, 0x8

    if-ne p4, v0, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->isReady()Z

    move-result p4

    if-nez p4, :cond_1

    return-void

    :cond_1
    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderCount()I

    move-result p4

    if-gtz p4, :cond_2

    const-string p1, "StickyHeaderDecoration"

    const-string p2, "getItemOffsets: header count is invalid"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_2
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p2

    if-eqz p2, :cond_7

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p4

    const/4 v0, -0x1

    if-ne p4, v0, :cond_3

    goto :goto_0

    :cond_3
    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    invoke-virtual {p4, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->needOffsetForHeader(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result p4

    if-eqz p4, :cond_6

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    move-result p2

    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-interface {p4, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;->getHeaderIndex(I)I

    move-result p4

    invoke-static {p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->isValidHeaderIndex(I)Z

    move-result v0

    if-nez v0, :cond_4

    const-string p1, "StickyHeaderDecoration"

    const-string p3, "header index of position %d is invalid"

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p1, p3, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_4
    iget-object p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {p2, p3, p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getHeaderView(Landroid/support/v7/widget/RecyclerView;I)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object p2

    if-nez p2, :cond_5

    const-string p1, "StickyHeaderDecoration"

    const-string p2, "generate header view for %d failed"

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p1, p2, p3}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    :cond_5
    iget-object p3, p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    iget-object p4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    invoke-static {p3, p4}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    iget-object p2, p2, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->top:I

    add-int/2addr p2, p3

    iget-object p3, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mTempRect1:Landroid/graphics/Rect;

    iget p3, p3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr p2, p3

    iput p2, p1, Landroid/graphics/Rect;->top:I

    :cond_6
    return-void

    :cond_7
    :goto_0
    const-string p1, "StickyHeaderDecoration"

    const-string p2, "view holder is null or adapter position is invalid"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public getTransitionalItems()Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/miui/gallery/widget/recyclerview/transition/TransitionalItem;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iget v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->recycleHeader(Landroid/support/v7/widget/RecyclerView;)V

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v1, v1, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-direct {p0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->layoutHeader(Landroid/support/v7/widget/RecyclerView;)V

    const/4 v1, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v2}, Landroid/util/LongSparseArray;->size()I

    move-result v2

    if-ge v1, v2, :cond_1

    iget-object v2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v2, v1}, Landroid/util/LongSparseArray;->keyAt(I)J

    move-result-wide v2

    iget-object v4, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    invoke-virtual {v4, v2, v3}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;->getLayoutHeader(J)Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    move-result-object v4

    if-nez v4, :cond_0

    const-string v4, "StickyHeaderDecoration"

    const-string v5, "header %s hasn\'t laidout"

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v4, v5, v2}, Lcom/miui/gallery/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_0
    iget-object v5, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderBounds:Landroid/util/LongSparseArray;

    invoke-virtual {v5, v2, v3}, Landroid/util/LongSparseArray;->get(J)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Rect;

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    new-instance v5, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;

    iget-object v4, v4, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-static {v4, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->createHeaderDrawable(Landroid/view/View;Landroid/graphics/Rect;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {v5, v3, v2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration$HeaderTransitionalItem;-><init>(Landroid/graphics/RectF;Landroid/graphics/drawable/Drawable;)V

    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDraw(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    return-void
.end method

.method public onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 3

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    return-void

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->isReady()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    :cond_1
    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v1

    invoke-virtual {v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v1

    const/4 v2, 0x1

    if-lt v0, v2, :cond_4

    if-ge v1, v2, :cond_2

    goto :goto_0

    :cond_2
    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->recycleHeader(Landroid/support/v7/widget/RecyclerView;)V

    invoke-direct {p0, p2}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->layoutHeader(Landroid/support/v7/widget/RecyclerView;)V

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    if-nez v0, :cond_3

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->onDrawOver(Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    invoke-direct {p0, p2, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->drawHeader(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;)V

    :cond_3
    return-void

    :cond_4
    :goto_0
    const-string p1, "StickyHeaderDecoration"

    const-string p2, "draw over: child num %d, or data num %d is illegal"

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p1, p2, p3, v0}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public setHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mItemClickHelper:Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper;->setHeaderClickListener(Lcom/miui/gallery/widget/stickyheader/core/HeaderItemClickHelper$HeaderClickListener;)V

    return-void
.end method

.method setHeaderVisibility(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    if-eq v0, p2, :cond_2

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    const/16 v1, 0x8

    if-eq v0, v1, :cond_1

    if-ne p2, v1, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->invalidate()V

    goto :goto_1

    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->requestLayout()V

    :goto_1
    iput p2, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mVisibility:I

    :cond_2
    return-void
.end method

.method setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter<",
            "TVH;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    new-instance v0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    iget-object v1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-direct {v0, v1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;-><init>(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRecycler:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRecycler;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->notifyDataChanged()Z

    :cond_0
    return-void
.end method

.method setStickyHeaderLayoutManager(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager<",
            "TVH;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderLayoutManager:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderLayoutManager;->setStickyHeaderAdapter(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderAdapter:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderAdapter;

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->notifyDataChanged()Z

    :cond_1
    return-void
.end method

.method setStickyHeaderRender(Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender<",
            "TVH;>;)V"
        }
    .end annotation

    iput-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->mHeaderRender:Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;

    invoke-direct {p0}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderDecoration;->invalidate()V

    return-void
.end method
