.class public Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "GridItemSpacingDecoration.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/support/v7/widget/RecyclerView;",
        ">",
        "Landroid/support/v7/widget/RecyclerView$ItemDecoration;"
    }
.end annotation


# instance fields
.field private mCachedBorders:[I

.field private mCachedOffsets:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "[",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private mHorizontalSpacing:I

.field private final mHost:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mIncludeEdge:Z

.field private mSpanCount:I

.field private mTotalSpace:I

.field private mVerticalSpacing:I


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mIncludeEdge:Z

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHost:Ljava/lang/ref/WeakReference;

    iput-boolean p2, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mIncludeEdge:Z

    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;ZII)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;ZII)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;-><init>(Landroid/support/v7/widget/RecyclerView;Z)V

    iput p3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    iput p4, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    return-void
.end method

.method private cacheOffsets([IILandroid/graphics/Rect;)V
    .locals 2

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->generateOffsetsCacheKey([I)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    if-nez v1, :cond_0

    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Landroid/graphics/Rect;

    if-nez v1, :cond_1

    array-length p1, p1

    new-array v1, p1, [Landroid/graphics/Rect;

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1, p3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    aput-object p1, v1, p2

    return-void
.end method

.method static calculateItemBorders(II)[I
    .locals 6

    add-int/lit8 v0, p0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    aput v1, v0, v1

    div-int v2, p1, p0

    rem-int/2addr p1, p0

    const/4 v3, 0x1

    const/4 v4, 0x0

    :goto_0
    if-gt v3, p0, :cond_1

    add-int/2addr v1, p1

    if-lez v1, :cond_0

    sub-int v5, p0, v1

    if-ge v5, p1, :cond_0

    add-int/lit8 v5, v2, 0x1

    sub-int/2addr v1, p0

    goto :goto_1

    :cond_0
    move v5, v2

    :goto_1
    add-int/2addr v4, v5

    aput v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static generateOffsetsCacheKey([I)Ljava/lang/String;
    .locals 3

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v0

    invoke-interface {v0}, Lmiui/util/Pools$Pool;->acquire()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/StringBuilder;

    const/4 v1, 0x0

    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_1

    aget v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ge v1, v2, :cond_0

    const-string v2, "_"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Lmiui/util/Pools;->getStringBuilderPool()Lmiui/util/Pools$Pool;

    move-result-object v1

    invoke-interface {v1, v0}, Lmiui/util/Pools$Pool;->release(Ljava/lang/Object;)V

    return-object p0
.end method

.method private getCachedOffsets([II)Landroid/graphics/Rect;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->generateOffsetsCacheKey([I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/graphics/Rect;

    if-eqz p1, :cond_0

    array-length v0, p1

    if-le v0, p2, :cond_0

    aget-object p1, p1, p2

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method static getSpanSizeOneGroup(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)[I
    .locals 8

    invoke-virtual {p0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v1

    new-array v2, v1, [I

    invoke-virtual {v0}, Landroid/support/v7/widget/GridLayoutManager;->getSpanSizeLookup()Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-virtual {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v3

    add-int/lit8 v4, v3, 0x1

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p0

    const/4 p1, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    :goto_0
    if-gt v5, v3, :cond_0

    sub-int v7, v3, v5

    sub-int v7, p0, v7

    invoke-virtual {v0, v7}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v7

    aput v7, v2, v5

    aget v7, v2, v5

    add-int/2addr v6, v7

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    move v5, v4

    :goto_1
    if-ge v4, v1, :cond_2

    sub-int v7, v4, v3

    add-int/2addr v7, p0

    invoke-virtual {v0, v7}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result v7

    add-int/2addr v6, v7

    if-le v6, v1, :cond_1

    goto :goto_2

    :cond_1
    aput v7, v2, v4

    add-int/lit8 v5, v5, 0x1

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    :goto_2
    new-array p0, v5, [I

    invoke-static {v2, p1, p0, p1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0
.end method

.method private invalidate()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->invalidateItemDecorations()V

    :cond_0
    return-void
.end method

.method private invalidateCaches()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedBorders:[I

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedOffsets:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 10

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    iget-boolean p4, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mIncludeEdge:Z

    const/4 v0, 0x0

    if-eqz p4, :cond_0

    iget p3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    div-int/lit8 p3, p3, 0x2

    iput p3, p1, Landroid/graphics/Rect;->left:I

    iget p3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    iget p4, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr p3, p4

    iput p3, p1, Landroid/graphics/Rect;->right:I

    goto/16 :goto_3

    :cond_0
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p4

    check-cast p4, Landroid/support/v7/widget/GridLayoutManager;

    invoke-virtual {p4}, Landroid/support/v7/widget/GridLayoutManager;->getSpanCount()I

    move-result v1

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mSpanCount:I

    if-eq v1, v2, :cond_1

    iput v1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mSpanCount:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->invalidateCaches()V

    :cond_1
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v2

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getPaddingStart()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getPaddingEnd()I

    move-result v3

    sub-int/2addr v2, v3

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mTotalSpace:I

    if-eq v3, v2, :cond_2

    iput v2, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mTotalSpace:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->invalidateCaches()V

    :cond_2
    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedBorders:[I

    if-nez v3, :cond_3

    invoke-static {v1, v2}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->calculateItemBorders(II)[I

    move-result-object v3

    iput-object v3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedBorders:[I

    :cond_3
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;

    invoke-virtual {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanIndex()I

    move-result v4

    invoke-virtual {v3}, Landroid/support/v7/widget/GridLayoutManager$LayoutParams;->getSpanSize()I

    move-result v3

    invoke-static {p3, p2}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->getSpanSizeOneGroup(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)[I

    move-result-object p3

    invoke-direct {p0, p3, v4}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->getCachedOffsets([II)Landroid/graphics/Rect;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-virtual {p1, v5}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    goto/16 :goto_3

    :cond_4
    const-string v5, "GridItemSpacingDecoration"

    const-string v6, "calculate offsets"

    invoke-static {v5, v6}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p4}, Landroid/support/v7/widget/GridLayoutManager;->getLayoutDirection()I

    move-result p4

    const/4 v5, 0x1

    if-ne p4, v5, :cond_5

    const/4 p4, 0x1

    goto :goto_0

    :cond_5
    const/4 p4, 0x0

    :goto_0
    array-length v6, p3

    sub-int/2addr v6, v5

    int-to-float v5, v6

    const/high16 v7, 0x3f800000    # 1.0f

    mul-float v5, v5, v7

    iget v8, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    int-to-float v8, v8

    mul-float v5, v5, v8

    array-length v8, p3

    int-to-float v8, v8

    div-float/2addr v5, v8

    int-to-float v8, v3

    mul-float v8, v8, v5

    float-to-int v5, v8

    if-nez v4, :cond_6

    iput v0, p1, Landroid/graphics/Rect;->left:I

    iput v5, p1, Landroid/graphics/Rect;->right:I

    goto :goto_2

    :cond_6
    iget v8, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    mul-int v6, v6, v8

    sub-int/2addr v2, v6

    int-to-float v2, v2

    mul-float v2, v2, v7

    int-to-float v6, v1

    div-float/2addr v2, v6

    iget-object v6, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mCachedBorders:[I

    aget v6, v6, v4

    const/4 v7, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    :goto_1
    if-ge v7, v4, :cond_7

    aget v9, p3, v7

    int-to-float v9, v9

    mul-float v9, v9, v2

    add-float/2addr v8, v9

    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    :cond_7
    int-to-float v2, v6

    sub-float/2addr v2, v8

    add-int/lit8 v6, v4, -0x1

    iget v7, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    mul-int v6, v6, v7

    int-to-float v6, v6

    sub-float/2addr v2, v6

    float-to-int v2, v2

    iget v6, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    sub-int/2addr v6, v2

    iput v6, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v2

    iput v5, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr v3, v4

    if-ne v3, v1, :cond_8

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr v1, v2

    iput v1, p1, Landroid/graphics/Rect;->left:I

    iput v0, p1, Landroid/graphics/Rect;->right:I

    :cond_8
    :goto_2
    if-eqz p4, :cond_9

    iget p4, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    add-int/2addr p4, v1

    iput p4, p1, Landroid/graphics/Rect;->left:I

    iget p4, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr p4, v1

    iput p4, p1, Landroid/graphics/Rect;->right:I

    iget p4, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr p4, v1

    iput p4, p1, Landroid/graphics/Rect;->left:I

    :cond_9
    invoke-direct {p0, p3, v4, p1}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->cacheOffsets([IILandroid/graphics/Rect;)V

    :goto_3
    iget-object p3, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHost:Ljava/lang/ref/WeakReference;

    invoke-virtual {p3}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p0, p3, p2}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->hasHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_a

    goto :goto_4

    :cond_a
    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    div-int/lit8 v0, p2, 0x2

    :goto_4
    iput v0, p1, Landroid/graphics/Rect;->top:I

    iget p2, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    div-int/lit8 p2, p2, 0x2

    iput p2, p1, Landroid/graphics/Rect;->bottom:I

    return-void
.end method

.method protected hasHeader(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Landroid/view/View;",
            ")Z"
        }
    .end annotation

    const/4 p1, 0x0

    return p1
.end method

.method public setHorizontalSpacing(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mHorizontalSpacing:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->invalidate()V

    :cond_0
    return-void
.end method

.method public setVerticalSpacing(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->mVerticalSpacing:I

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GridItemSpacingDecoration;->invalidate()V

    :cond_0
    return-void
.end method
