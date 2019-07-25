.class public Lcom/miui/gallery/widget/HeaderGridView;
.super Landroid/widget/GridView;
.source "HeaderGridView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;,
        Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;
    }
.end annotation


# instance fields
.field private mFooterViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field

.field private mHeaderViewInfos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/miui/gallery/widget/HeaderGridView$FixedViewInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/GridView;-><init>(Landroid/content/Context;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView;->initHeaderGridView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView;->initHeaderGridView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/GridView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {p0}, Lcom/miui/gallery/widget/HeaderGridView;->initHeaderGridView()V

    return-void
.end method

.method private initHeaderGridView()V
    .locals 1

    const/4 v0, 0x0

    invoke-super {p0, v0}, Landroid/widget/GridView;->setClipChildren(Z)V

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/HeaderGridView;->setGravity(I)V

    return-void
.end method


# virtual methods
.method public getFooterViewCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getHeaderViewCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method protected onMeasure(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/widget/GridView;->onMeasure(II)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    if-eqz p1, :cond_0

    instance-of p2, p1, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;

    if-eqz p2, :cond_0

    check-cast p1, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView;->getNumColumns()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->setNumColumns(I)V

    :cond_0
    return-void
.end method

.method public bridge synthetic setAdapter(Landroid/widget/Adapter;)V
    .locals 0

    check-cast p1, Landroid/widget/ListAdapter;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/HeaderGridView;->setAdapter(Landroid/widget/ListAdapter;)V

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-super {p0, p1}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    goto :goto_1

    :cond_1
    :goto_0
    new-instance v0, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;

    iget-object v1, p0, Lcom/miui/gallery/widget/HeaderGridView;->mHeaderViewInfos:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/miui/gallery/widget/HeaderGridView;->mFooterViewInfos:Ljava/util/ArrayList;

    invoke-direct {v0, v1, v2, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Landroid/widget/ListAdapter;)V

    invoke-virtual {p0}, Lcom/miui/gallery/widget/HeaderGridView;->getNumColumns()I

    move-result p1

    const/4 v1, 0x1

    if-le p1, v1, :cond_2

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/HeaderGridView$HeaderViewGridAdapter;->setNumColumns(I)V

    :cond_2
    invoke-super {p0, v0}, Landroid/widget/GridView;->setAdapter(Landroid/widget/ListAdapter;)V

    :goto_1
    return-void
.end method

.method public setClipChildren(Z)V
    .locals 0

    return-void
.end method
