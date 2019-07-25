.class public Lcom/miui/gallery/video/VideoFrameThumbAdapter;
.super Landroid/support/v7/widget/RecyclerView$Adapter;
.source "VideoFrameThumbAdapter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;,
        Lcom/miui/gallery/video/VideoFrameThumbAdapter$EmptyHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$Adapter<",
        "Landroid/support/v7/widget/RecyclerView$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mDataList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field private mDividerWidth:I

.field private mEmptyViewWidth:I

.field private mItemWidth:I

.field private mScreenWidth:I

.field private mTotalWidth:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$Adapter;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f060567

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const v0, 0x7f06056b

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mItemWidth:I

    iget p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    rem-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_0

    iget p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/VideoFrameThumbAdapter;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mItemWidth:I

    return p0
.end method

.method private getCurrentOffset(Landroid/support/v7/widget/RecyclerView;)I
    .locals 3

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mScreenWidth:I

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getDataListSize()I

    move-result v0

    if-lez v0, :cond_3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getChildCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, v1}, Landroid/support/v7/widget/RecyclerView;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    if-nez v0, :cond_1

    return v1

    :cond_1
    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutParams;->getViewAdapterPosition()I

    move-result v0

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p1

    neg-int p1, p1

    if-lez v0, :cond_2

    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    add-int/lit8 v0, v0, -0x1

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mItemWidth:I

    mul-int v0, v0, v2

    add-int/2addr v1, v0

    add-int/2addr p1, v1

    :cond_2
    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mScreenWidth:I

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p1, v0

    return p1

    :cond_3
    :goto_0
    return v1
.end method

.method private getDataItem(I)Landroid/graphics/Bitmap;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    add-int/lit8 p1, p1, -0x1

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    :goto_0
    return-object p1
.end method

.method private getDataListSize()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method


# virtual methods
.method public configLayoutParams(I)V
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mScreenWidth:I

    if-eq p1, v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mScreenWidth:I

    iget p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mScreenWidth:I

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    sub-int/2addr p1, v0

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    invoke-virtual {p0}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method

.method public getItemCount()I
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getDataListSize()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    return v0
.end method

.method public getItemViewType(I)I
    .locals 2

    const/4 v0, 0x1

    if-eqz p1, :cond_1

    invoke-direct {p0}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getDataListSize()I

    move-result v1

    add-int/2addr v1, v0

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    return v0
.end method

.method public getScrollOffset(Landroid/support/v7/widget/RecyclerView;F)I
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getCurrentOffset(Landroid/support/v7/widget/RecyclerView;)I

    move-result p1

    if-gtz p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mTotalWidth:I

    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    mul-float v0, v0, p2

    iget p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    div-int/lit8 p2, p2, 0x2

    int-to-float p2, p2

    add-float/2addr v0, p2

    iget p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    int-to-float p2, p2

    add-float/2addr v0, p2

    float-to-int p2, v0

    sub-int/2addr p2, p1

    return p2
.end method

.method public getScrollPercent(Landroid/support/v7/widget/RecyclerView;)F
    .locals 4

    invoke-direct {p0, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getCurrentOffset(Landroid/support/v7/widget/RecyclerView;)I

    move-result p1

    const/4 v0, 0x0

    if-gtz p1, :cond_0

    return v0

    :cond_0
    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    sub-int/2addr p1, v1

    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr p1, v1

    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mTotalWidth:I

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    const/high16 v3, 0x3f800000    # 1.0f

    if-le v1, v2, :cond_1

    int-to-float p1, p1

    mul-float p1, p1, v3

    iget v1, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mTotalWidth:I

    iget v2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDividerWidth:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    div-float/2addr p1, v1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    invoke-static {p1, v0}, Ljava/lang/Math;->max(FF)F

    move-result p1

    invoke-static {p1, v3}, Ljava/lang/Math;->min(FF)F

    move-result p1

    return p1
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 1

    invoke-virtual {p0, p2}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getItemViewType(I)I

    move-result v0

    if-nez v0, :cond_0

    check-cast p1, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;

    invoke-direct {p0, p2}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getDataItem(I)Landroid/graphics/Bitmap;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;->setBitmap(Landroid/graphics/Bitmap;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    if-ne v0, p2, :cond_1

    iget-object p1, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    :cond_1
    :goto_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    new-instance p1, Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mContext:Landroid/content/Context;

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mEmptyViewWidth:I

    const/4 v1, -0x1

    invoke-direct {p2, v0, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Lcom/miui/gallery/video/VideoFrameThumbAdapter$EmptyHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter$EmptyHolder;-><init>(Lcom/miui/gallery/video/VideoFrameThumbAdapter;Landroid/view/View;)V

    return-object p2

    :cond_0
    new-instance p2, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;

    invoke-direct {p2, p0, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter$FrameThumbHolder;-><init>(Lcom/miui/gallery/video/VideoFrameThumbAdapter;Landroid/view/View;)V

    return-object p2
.end method

.method public updateDataList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mTotalWidth:I

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mDataList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mItemWidth:I

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    mul-int v0, v0, p1

    iput v0, p0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->mTotalWidth:I

    :cond_1
    invoke-virtual {p0}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->notifyDataSetChanged()V

    return-void
.end method
