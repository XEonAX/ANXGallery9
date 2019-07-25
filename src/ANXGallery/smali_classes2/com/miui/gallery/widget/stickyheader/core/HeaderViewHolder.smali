.class public Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;
.super Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;
.source "HeaderViewHolder.java"


# instance fields
.field mHeaderId:J

.field mHeaderIndex:I

.field mHeaderViewType:I

.field mIsStickyHeader:Z


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/BaseViewHolder;-><init>(Landroid/view/View;)V

    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderId:J

    const/4 p1, -0x1

    iput p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderIndex:I

    iput p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderViewType:I

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mIsStickyHeader:Z

    return-void
.end method


# virtual methods
.method getHeaderId()J
    .locals 2

    iget-wide v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderId:J

    return-wide v0
.end method

.method getHeaderIndex()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderIndex:I

    return v0
.end method

.method getHeaderViewType()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mHeaderViewType:I

    return v0
.end method

.method isStickyHeader()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->mIsStickyHeader:Z

    return v0
.end method
