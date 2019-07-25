.class public Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;
.super Landroid/widget/BaseAdapter;
.source "StickyGridHeadersListAdapterWrapper.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# instance fields
.field private mDataSetObserver:Landroid/database/DataSetObserver;

.field private mDelegate:Landroid/widget/ListAdapter;


# direct methods
.method public constructor <init>(Landroid/widget/ListAdapter;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;

    invoke-direct {v0, p0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper$1;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;)V

    iput-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDataSetObserver:Landroid/database/DataSetObserver;

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDataSetObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getCountForHeader(I)I
    .locals 0

    const/4 p1, 0x0

    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    :cond_0
    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getNumHeaders()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0, p1, p2, p3}, Landroid/widget/ListAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getViewTypeCount()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersListAdapterWrapper;->mDelegate:Landroid/widget/ListAdapter;

    invoke-interface {v0}, Landroid/widget/ListAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
