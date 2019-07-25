.class public Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;
.super Landroid/widget/BaseAdapter;
.source "StickyGridHeadersSimpleAdapterWrapper.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;,
        Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;
    }
.end annotation


# instance fields
.field private mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

.field private mHeaders:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)V
    .locals 2

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    new-instance v0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$DataSetObserverExtension;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$1;)V

    invoke-interface {p1, v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-virtual {p0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->generateHeaderList(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    return-void
.end method

.method static synthetic access$102(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;Ljava/util/List;)Ljava/util/List;
    .locals 0

    iput-object p1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$200(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;)Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;
    .locals 0

    iget-object p0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    return-object p0
.end method


# virtual methods
.method protected generateHeaderList(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;",
            ")",
            "Ljava/util/List<",
            "Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    const/4 v2, 0x0

    :goto_0
    invoke-interface {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getCount()I

    move-result v3

    if-ge v2, v3, :cond_1

    invoke-interface {p1, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getHeaderId(I)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;

    if-nez v5, :cond_0

    new-instance v5, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;

    invoke-direct {v5, p0, v2}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;-><init>(Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;I)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    invoke-virtual {v5}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;->incrementCount()V

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-interface {v0, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v1
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getCount()I

    move-result v0

    return v0
.end method

.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;->getCount()I

    move-result p1

    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;->getRefPosition()I

    move-result p1

    invoke-interface {v0, p1, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    iget-object v1, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;

    invoke-virtual {p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper$HeaderData;->getRefPosition()I

    move-result p1

    invoke-interface {v0, p1, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .locals 2

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getItemId(I)J

    move-result-wide v0

    return-wide v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getItemViewType(I)I

    move-result p1

    return p1
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mHeaders:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0, p1, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public getViewTypeCount()I
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->getViewTypeCount()I

    move-result v0

    return v0
.end method

.method public hasStableIds()Z
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->hasStableIds()Z

    move-result v0

    return v0
.end method

.method public shouldDrawDivider()Z
    .locals 1

    iget-object v0, p0, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapterWrapper;->mDelegate:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;

    invoke-interface {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersSimpleAdapter;->shouldDrawDivider()Z

    move-result v0

    return v0
.end method
