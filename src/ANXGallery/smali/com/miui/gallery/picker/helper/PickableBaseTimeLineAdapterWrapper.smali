.class public Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;
.super Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;
.source "PickableBaseTimeLineAdapterWrapper.java"

# interfaces
.implements Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# instance fields
.field private mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/picker/helper/Picker;Landroid/widget/CursorAdapter;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/picker/helper/PickableSimpleAdapterWrapper;-><init>(Lcom/miui/gallery/picker/helper/Picker;Landroid/widget/CursorAdapter;)V

    instance-of p1, p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    if-eqz p1, :cond_0

    check-cast p2, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    iput-object p2, p0, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Adapter must be a StickyGridHeadersBaseAdapter"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getCountForHeader(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    invoke-interface {v0, p1}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;->getCountForHeader(I)I

    move-result p1

    return p1
.end method

.method public getDividerView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p1, 0x0

    return-object p1
.end method

.method public getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    invoke-interface {v0, p1, p2, p3}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;->getHeaderView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public getNumHeaders()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/picker/helper/PickableBaseTimeLineAdapterWrapper;->mBaseAdapter:Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;

    invoke-interface {v0}, Lcom/tonicartos/widget/stickygridheaders/StickyGridHeadersBaseAdapter;->getNumHeaders()I

    move-result v0

    return v0
.end method

.method public shouldDrawDivider()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
