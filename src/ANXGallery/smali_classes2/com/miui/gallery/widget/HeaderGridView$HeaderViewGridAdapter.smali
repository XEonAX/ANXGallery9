.class Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;
.super Landroid/widget/BaseAdapter;
.source "HeaderGridView.java"

# interfaces
.implements Landroid/widget/Filterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/HeaderGridView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderViewGridAdapter"
.end annotation


# static fields
.field static final EMPTY_INFO_LIST:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final mAdapter:Landroid/widget/ListAdapter;

.field mAreAllFixedViewsSelectable:Z

.field private final mDataSetObservable:Landroid/database/DataSetObservable;

.field mFooterViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field mHeaderViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private final mIsFilterable:Z

.field private mLastVisibleItemHeight:I

.field private mNumColumns:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->EMPTY_INFO_LIST:Ljava/util/ArrayList;

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/widget/ListAdapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;",
            "Landroid/widget/ListAdapter;",
            ")V"
        }
    .end annotation

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Landroid/database/DataSetObservable;

    invoke-direct {v0}, Landroid/database/DataSetObservable;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    const/4 v0, 0x1

    iput v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    iput-object p3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    instance-of p3, p3, Landroid/widget/Filterable;

    iput-boolean p3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mIsFilterable:Z

    if-eqz p1, :cond_3

    if-nez p1, :cond_0

    sget-object p1, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->EMPTY_INFO_LIST:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    goto :goto_0

    :cond_0
    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    :goto_0
    if-nez p2, :cond_1

    sget-object p1, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->EMPTY_INFO_LIST:Ljava/util/ArrayList;

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    goto :goto_1

    :cond_1
    iput-object p2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->areAllListInfosSelectable(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->areAllListInfosSelectable(Ljava/util/ArrayList;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_2

    :cond_2
    const/4 v0, 0x0

    :goto_2
    iput-boolean v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAreAllFixedViewsSelectable:Z

    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "headerViewInfos cannot be null"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private areAllListInfosSelectable(Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;)Z"
        }
    .end annotation

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-boolean v0, v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->isSelectable:Z

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method private getAlignedAdapterCount()I
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    add-int/2addr v1, v0

    add-int/lit8 v1, v1, -0x1

    add-int/lit8 v0, v0, -0x1

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int/2addr v0, v2

    sub-int/2addr v1, v0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method

.method private getPlaceholderView(Landroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;
    .locals 0

    if-nez p1, :cond_0

    new-instance p1, Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    :cond_0
    const/4 p2, 0x4

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setMinimumHeight(I)V

    return-object p1
.end method


# virtual methods
.method public areAllItemsEnabled()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    const/4 v1, 0x1

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAreAllFixedViewsSelectable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    return v1
.end method

.method public getCount()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v1

    add-int/2addr v0, v1

    :cond_0
    return v0
.end method

.method public getFilter()Landroid/widget/Filter;
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mIsFilterable:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    check-cast v0, Landroid/widget/Filterable;

    invoke-interface {v0}, Landroid/widget/Filterable;->getFilter()Landroid/widget/Filter;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public getFootersCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getHeadersCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int v0, p1, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int/2addr p1, v1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-object p1, p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->data:Ljava/lang/Object;

    return-object p1

    :cond_0
    return-object v1

    :cond_1
    sub-int/2addr p1, v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    if-ge p1, v2, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1

    :cond_2
    if-ge p1, v0, :cond_3

    return-object v1

    :cond_3
    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v2

    if-ge p1, v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int v0, p1, v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int/2addr p1, v1

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-object p1, p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->data:Ljava/lang/Object;

    return-object p1

    :cond_4
    return-object v1

    :cond_5
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public getItemId(I)J
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    iget-object v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v1, :cond_0

    if-lt p1, v0, :cond_0

    sub-int/2addr p1, v0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    const/4 v1, 0x1

    if-ge p1, v0, :cond_1

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int v2, p1, v2

    if-eqz v2, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v1

    :cond_0
    return v1

    :cond_1
    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v2, :cond_3

    if-lt p1, v0, :cond_3

    sub-int v2, p1, v0

    iget-object v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p1, v2}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1

    :cond_2
    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v3

    if-ge v2, v3, :cond_3

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result p1

    return p1

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v2

    add-int/2addr v0, v2

    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v2

    if-ge p1, v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int/2addr p1, v0

    if-eqz p1, :cond_5

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {p1}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v1

    :cond_4
    return v1

    :cond_5
    const/4 p1, -0x2

    return p1
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    const/4 v1, 0x0

    if-ge p1, v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int v2, p1, v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-object v0, v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->viewContainer:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int/2addr p1, v2

    if-nez p1, :cond_0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-object v0

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-direct {p0, p2, p3, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getPlaceholderView(Landroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_1
    sub-int/2addr p1, v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v2}, Landroid/widget/ListAdapter;->getCount()I

    move-result v2

    if-ge p1, v2, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    iget p3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int/2addr p1, p3

    if-nez p1, :cond_2

    const/4 p1, -0x1

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    const/4 p3, -0x2

    invoke-static {p3, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p3

    invoke-virtual {p2, p1, p3}, Landroid/view/View;->measure(II)V

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mLastVisibleItemHeight:I

    :cond_2
    return-object p2

    :cond_3
    if-ge p1, v0, :cond_4

    iget p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mLastVisibleItemHeight:I

    invoke-direct {p0, p2, p3, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getPlaceholderView(Landroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_4
    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v2

    if-ge p1, v0, :cond_6

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int v2, p1, v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-object v0, v0, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->viewContainer:Landroid/view/ViewGroup;

    iget v2, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int/2addr p1, v2

    if-nez p1, :cond_5

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    return-object v0

    :cond_5
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result p1

    invoke-direct {p0, p2, p3, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getPlaceholderView(Landroid/view/View;Landroid/view/ViewGroup;I)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_6
    new-instance p2, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {p2, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw p2
.end method

.method public getViewTypeCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x2

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isEnabled(I)Z
    .locals 4

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getHeadersCount()I

    move-result v0

    iget v1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v1

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ge p1, v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int v0, p1, v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int/2addr p1, v3

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-boolean p1, p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->isSelectable:Z

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_1
    sub-int/2addr p1, v0

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getAlignedAdapterCount()I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v3, :cond_3

    iget-object v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v3}, Landroid/widget/ListAdapter;->getCount()I

    move-result v3

    if-ge p1, v3, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->isEnabled(I)Z

    move-result p1

    return p1

    :cond_2
    if-ge p1, v0, :cond_3

    return v2

    :cond_3
    sub-int/2addr p1, v0

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->getFootersCount()I

    move-result v0

    iget v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    mul-int v0, v0, v3

    if-ge p1, v0, :cond_5

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    rem-int v0, p1, v0

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mFooterViewInfos:Ljava/util/ArrayList;

    iget v3, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    div-int/2addr p1, v3

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;

    iget-boolean p1, p1, Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;->isSelectable:Z

    if-eqz p1, :cond_4

    goto :goto_1

    :cond_4
    const/4 v1, 0x0

    :goto_1
    return v1

    :cond_5
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    invoke-direct {v0, p1}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(I)V

    throw v0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0}, Landroid/database/DataSetObservable;->notifyChanged()V

    return-void
.end method

.method public registerDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, p1}, Landroid/database/DataSetObservable;->registerObserver(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method

.method public setNumColumns(I)V
    .locals 1

    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    if-eq v0, p1, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mNumColumns:I

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void

    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Number of columns must be 1 or more"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public unregisterDataSetObserver(Landroid/database/DataSetObserver;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mDataSetObservable:Landroid/database/DataSetObservable;

    invoke-virtual {v0, p1}, Landroid/database/DataSetObservable;->unregisterObserver(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->mAdapter:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method
