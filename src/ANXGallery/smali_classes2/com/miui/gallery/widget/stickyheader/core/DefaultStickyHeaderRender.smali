.class public Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;
.super Ljava/lang/Object;
.source "DefaultStickyHeaderRender.java"

# interfaces
.implements Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<VH:",
        "Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderRender<",
        "TVH;>;"
    }
.end annotation


# instance fields
.field private final mTemp:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;->mTemp:Landroid/graphics/Rect;

    return-void
.end method

.method private initClipRectForHeader(Landroid/graphics/Rect;Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V
    .locals 3

    invoke-static {p3, p1}, Lcom/miui/gallery/widget/stickyheader/core/StickyHeaderUtil;->extractMargins(Landroid/view/View;Landroid/graphics/Rect;)V

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingLeft()I

    move-result p3

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getWidth()I

    move-result v1

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    iget v2, p1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v1, v2

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getHeight()I

    move-result v2

    invoke-virtual {p2}, Landroid/support/v7/widget/RecyclerView;->getPaddingBottom()I

    move-result p2

    sub-int/2addr v2, p2

    invoke-virtual {p1, p3, v0, v1, v2}, Landroid/graphics/Rect;->set(IIII)V

    return-void
.end method


# virtual methods
.method public bridge synthetic draw(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Landroid/support/v7/widget/RecyclerView$ViewHolder;Landroid/graphics/Rect;)V
    .locals 0

    check-cast p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;->draw(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)V

    return-void
.end method

.method public draw(Landroid/support/v7/widget/RecyclerView;Landroid/graphics/Canvas;Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;Landroid/graphics/Rect;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v7/widget/RecyclerView;",
            "Landroid/graphics/Canvas;",
            "TVH;",
            "Landroid/graphics/Rect;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Landroid/graphics/Canvas;->save()I

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getClipToPadding()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;->mTemp:Landroid/graphics/Rect;

    iget-object v1, p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-direct {p0, v0, p1, v1}, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;->initClipRectForHeader(Landroid/graphics/Rect;Landroid/support/v7/widget/RecyclerView;Landroid/view/View;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/stickyheader/core/DefaultStickyHeaderRender;->mTemp:Landroid/graphics/Rect;

    invoke-virtual {p2, p1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/Rect;)Z

    :cond_0
    iget p1, p4, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    iget p4, p4, Landroid/graphics/Rect;->top:I

    int-to-float p4, p4

    invoke-virtual {p2, p1, p4}, Landroid/graphics/Canvas;->translate(FF)V

    iget-object p1, p3, Lcom/miui/gallery/widget/stickyheader/core/HeaderViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p1, p2}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    invoke-virtual {p2}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method
