.class public Lcom/miui/gallery/widget/PagerGridLayout;
.super Landroid/support/v7/widget/GridLayout;
.source "PagerGridLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;,
        Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

.field private mColumnCount:I

.field private mCount:I

.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mItemCount:I

.field private mListener:Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;

.field private mPageCount:I

.field private mPageIndex:I

.field private mRowCount:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/PagerGridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/PagerGridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/GridLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/widget/PagerGridLayout$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/PagerGridLayout$1;-><init>(Lcom/miui/gallery/widget/PagerGridLayout;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mDataSetObserver:Landroid/database/DataSetObserver;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/widget/PagerGridLayout;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    return p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/PagerGridLayout;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/PagerGridLayout;->bindPage(I)V

    return-void
.end method

.method private bindPage(I)V
    .locals 7

    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageCount:I

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mItemCount:I

    mul-int v0, v0, p1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerGridLayout;->getChildCount()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    invoke-virtual {p0, v3}, Lcom/miui/gallery/widget/PagerGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    add-int v5, v0, v3

    iget v6, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mCount:I

    if-lt v5, v6, :cond_0

    const/4 v5, 0x4

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    :cond_0
    invoke-virtual {v4, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v6, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    invoke-virtual {v6, v5, v4}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->bindData(ILandroid/view/View;)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mListener:Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mListener:Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;

    iget v2, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    iget v3, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageCount:I

    iget v4, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageCount:I

    if-ne p1, v4, :cond_2

    const/4 v1, 0x1

    :cond_2
    invoke-interface {v0, v2, v3, v1}, Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;->onPageChanged(IIZ)V

    :cond_3
    return-void
.end method


# virtual methods
.method public changeToNextPage()V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageCount:I

    if-le v0, v1, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->onPageChanged()V

    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/PagerGridLayout;->bindPage(I)V

    return-void
.end method

.method public freshCurrentPage()V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    iget v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mItemCount:I

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerGridLayout;->getChildCount()I

    move-result v1

    :goto_0
    if-ge v0, v1, :cond_2

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/PagerGridLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    invoke-virtual {v3, v2}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->freshView(Landroid/view/View;)V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setAdapter(Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/PagerGridLayout;->setAdapter(Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;I)V

    return-void
.end method

.method public setAdapter(Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;I)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    iget-object v1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    iget-object v0, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/PagerGridLayout;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    invoke-virtual {p1}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->getColumnsCount()I

    move-result v1

    invoke-virtual {p1}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->getRowsCount()I

    move-result v2

    iput v2, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mRowCount:I

    iput v1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mColumnCount:I

    mul-int v3, v1, v2

    iput v3, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mItemCount:I

    invoke-virtual {p1}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->getCount()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mCount:I

    iput p2, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    iget p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mCount:I

    iget p2, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mItemCount:I

    add-int/lit8 p2, p2, -0x1

    add-int/2addr p1, p2

    iget p2, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mItemCount:I

    div-int/2addr p1, p2

    iput p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageCount:I

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v2, :cond_2

    const/4 v3, 0x0

    :goto_1
    if-ge v3, v1, :cond_1

    new-instance v4, Landroid/support/v7/widget/GridLayout$LayoutParams;

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-static {p2, v5}, Landroid/support/v7/widget/GridLayout;->spec(IF)Landroid/support/v7/widget/GridLayout$Spec;

    move-result-object v6

    invoke-static {v3, v5}, Landroid/support/v7/widget/GridLayout;->spec(IF)Landroid/support/v7/widget/GridLayout$Spec;

    move-result-object v5

    invoke-direct {v4, v6, v5}, Landroid/support/v7/widget/GridLayout$LayoutParams;-><init>(Landroid/support/v7/widget/GridLayout$Spec;Landroid/support/v7/widget/GridLayout$Spec;)V

    iget-object v5, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mAdapter:Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;

    invoke-virtual {v5, v0, p0}, Lcom/miui/gallery/widget/PagerGridLayout$BaseAdapter;->getView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {p0, v5, v4}, Lcom/miui/gallery/widget/PagerGridLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    iget p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mPageIndex:I

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/PagerGridLayout;->bindPage(I)V

    return-void
.end method

.method public setOnPageChangedListener(Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/PagerGridLayout;->mListener:Lcom/miui/gallery/widget/PagerGridLayout$OnPageChangedListener;

    return-void
.end method
