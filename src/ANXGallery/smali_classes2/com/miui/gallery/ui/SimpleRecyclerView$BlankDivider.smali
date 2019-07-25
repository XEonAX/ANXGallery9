.class public Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;
.super Landroid/support/v7/widget/RecyclerView$ItemDecoration;
.source "SimpleRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SimpleRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "BlankDivider"
.end annotation


# instance fields
.field private mBottom:I

.field private mEnd:I

.field private mHorizonalInterval:I

.field private mStart:I

.field private mTop:I

.field private mVerticalInterval:I


# direct methods
.method public constructor <init>(II)V
    .locals 7

    move-object v0, p0

    move v1, p1

    move v2, p1

    move v3, p1

    move v4, p2

    move v5, p2

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(IIIIII)V

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;-><init>()V

    iput p1, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mStart:I

    iput p2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mEnd:I

    iput p3, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mHorizonalInterval:I

    iput p4, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mTop:I

    iput p5, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mBottom:I

    iput p6, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mVerticalInterval:I

    return-void
.end method

.method public constructor <init>(Landroid/content/res/Resources;II)V
    .locals 1

    const/4 v0, 0x0

    if-nez p2, :cond_0

    const/4 p2, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    :goto_0
    if-nez p3, :cond_1

    goto :goto_1

    :cond_1
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    :goto_1
    invoke-direct {p0, p2, v0}, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;-><init>(II)V

    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V
    .locals 4

    invoke-super {p0, p1, p2, p3, p4}, Landroid/support/v7/widget/RecyclerView$ItemDecoration;->getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/RecyclerView$State;)V

    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p4

    const/4 v0, -0x1

    if-ne p4, v0, :cond_0

    const-string p1, "SimpleRecyclerView"

    const-string p2, "no adapter bound"

    invoke-static {p1, p2}, Lcom/miui/gallery/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    :cond_0
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p4

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-nez p4, :cond_1

    iget v1, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mStart:I

    iget p2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mHorizonalInterval:I

    iget p4, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mTop:I

    iget v2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mVerticalInterval:I

    move v3, v1

    move v1, p4

    move p4, v3

    goto :goto_1

    :cond_1
    invoke-virtual {p3, p2}, Landroid/support/v7/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p2

    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object p4

    invoke-virtual {p4}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p4

    sub-int/2addr p4, v0

    if-ne p2, p4, :cond_2

    iget p2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mEnd:I

    iget v2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mBottom:I

    :goto_0
    const/4 p4, 0x0

    goto :goto_1

    :cond_2
    iget p2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mHorizonalInterval:I

    iget v2, p0, Lcom/miui/gallery/ui/SimpleRecyclerView$BlankDivider;->mVerticalInterval:I

    goto :goto_0

    :goto_1
    invoke-virtual {p3}, Landroid/support/v7/widget/RecyclerView;->getLayoutDirection()I

    move-result p3

    if-ne p3, v0, :cond_3

    invoke-virtual {p1, p2, v1, p4, v2}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_2

    :cond_3
    invoke-virtual {p1, p4, v1, p2, v2}, Landroid/graphics/Rect;->set(IIII)V

    :goto_2
    return-void
.end method
