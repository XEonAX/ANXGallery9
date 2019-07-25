.class Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "HeaderFooterRecyclerAdapterWrapper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HeaderFooterSpanSizeLookup"
.end annotation


# instance fields
.field private mAdapterWrapper:Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

.field private mSpanCount:I

.field private mWrapped:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;I)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mWrapped:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    iput-object p2, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mAdapterWrapper:Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    iput p3, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mSpanCount:I

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mAdapterWrapper:Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isHeaderPosition(I)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mAdapterWrapper:Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper;->isFooterPosition(I)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mWrapped:Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;->getSpanSize(I)I

    move-result p1

    return p1

    :cond_1
    :goto_0
    iget p1, p0, Lcom/miui/gallery/adapter/HeaderFooterRecyclerAdapterWrapper$HeaderFooterSpanSizeLookup;->mSpanCount:I

    return p1
.end method
