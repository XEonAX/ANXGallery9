.class public Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "GridLayoutInnerPaddingItemDecoration.java"


# instance fields
.field private final mEdgeMargins:[I

.field private mFullSpanIgnorePadding:Z

.field private final mItemHorizontalPadding:I

.field private final mItemVerticalPadding:I

.field private final mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

.field private mRecycleRect:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(IIIIIIZLandroid/support/v7/widget/GridLayoutManager;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mFullSpanIgnorePadding:Z

    const/4 v1, 0x4

    new-array v1, v1, [I

    aput p1, v1, v0

    const/4 p1, 0x1

    aput p2, v1, p1

    const/4 p1, 0x2

    aput p3, v1, p1

    const/4 p1, 0x3

    aput p4, v1, p1

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mEdgeMargins:[I

    iput p5, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mItemHorizontalPadding:I

    iput p6, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mItemVerticalPadding:I

    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    iput-boolean p7, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mFullSpanIgnorePadding:Z

    iput-object p8, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    return-void
.end method

.method private isLastLine(IIIIILandroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)Z
    .locals 2

    sub-int v0, p5, p4

    const/4 v1, 0x0

    if-ge p1, v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x1

    sub-int/2addr p5, v0

    if-ne p1, p5, :cond_1

    return v0

    :cond_1
    add-int/2addr p2, p3

    add-int/2addr p1, v0

    :goto_0
    if-gt p1, p5, :cond_4

    if-nez p6, :cond_2

    const/4 p3, 0x1

    goto :goto_1

    :cond_2
    invoke-virtual {p6, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result p3

    :goto_1
    add-int/2addr p2, p3

    if-le p2, p4, :cond_3

    return v1

    :cond_3
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_4
    return v0
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 9

    iget-object p4, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v4

    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p4

    check-cast p4, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-virtual {p4}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v2

    invoke-virtual {p4}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v3

    const/4 p4, 0x1

    const/4 v7, 0x0

    if-ne v2, v4, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mFullSpanIgnorePadding:Z

    if-eqz v0, :cond_0

    const/4 v8, 0x1

    goto :goto_0

    :cond_0
    const/4 v8, 0x0

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    if-eqz v8, :cond_1

    :goto_1
    const/4 v1, 0x0

    goto :goto_2

    :cond_1
    if-eqz v3, :cond_2

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mEdgeMargins:[I

    aget v1, v1, v7

    :goto_2
    iput v1, v0, Landroid/graphics/Rect;->left:I

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    if-eqz v8, :cond_3

    const/4 v1, 0x0

    goto :goto_3

    :cond_3
    add-int v1, v3, v2

    if-ge v1, v4, :cond_4

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mItemHorizontalPadding:I

    goto :goto_3

    :cond_4
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mEdgeMargins:[I

    const/4 v5, 0x2

    aget v1, v1, v5

    :goto_3
    iput v1, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v1

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    if-eqz v8, :cond_6

    :cond_5
    const/4 p4, 0x0

    goto :goto_4

    :cond_6
    if-ge v1, v4, :cond_5

    if-ne v3, v1, :cond_5

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mEdgeMargins:[I

    aget p4, v0, p4

    :goto_4
    iput p4, p2, Landroid/graphics/Rect;->top:I

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p2

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v5

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mLayoutManager:Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p2}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSizeLookup()Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    move-result-object v6

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->isLastLine(IIIIILandroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;)Z

    move-result p2

    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    if-eqz v8, :cond_7

    goto :goto_5

    :cond_7
    if-eqz p2, :cond_8

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mEdgeMargins:[I

    const/4 p4, 0x3

    aget v7, p2, p4

    goto :goto_5

    :cond_8
    iget v7, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mItemVerticalPadding:I

    :goto_5
    iput v7, p3, Landroid/graphics/Rect;->bottom:I

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/GridLayoutInnerPaddingItemDecoration;->mRecycleRect:Landroid/graphics/Rect;

    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    return-void
.end method
