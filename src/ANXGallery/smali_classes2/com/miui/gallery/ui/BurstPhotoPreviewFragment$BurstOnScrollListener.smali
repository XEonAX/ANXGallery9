.class Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "BurstOnScrollListener"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)V

    return-void
.end method

.method private getCurrentPosition(Landroid/support/v7/widget/RecyclerView;)I
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$800(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$800(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    move-result v1

    add-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p1

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getItemCount()I

    move-result v1

    const/4 v2, -0x1

    const v3, 0x7fffffff

    const/4 v4, 0x0

    const/4 v5, -0x1

    :goto_0
    if-ge v4, v1, :cond_2

    invoke-virtual {p1, v4}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->findViewByPosition(I)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_1

    invoke-virtual {v6}, Landroid/view/View;->getLeft()I

    move-result v7

    invoke-virtual {v6}, Landroid/view/View;->getRight()I

    move-result v6

    add-int/2addr v7, v6

    div-int/lit8 v7, v7, 0x2

    sub-int/2addr v7, v0

    invoke-static {v7}, Ljava/lang/Math;->abs(I)I

    move-result v6

    if-ge v6, v3, :cond_0

    move v5, v4

    move v3, v6

    goto :goto_1

    :cond_0
    return v5

    :cond_1
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_2
    return v2
.end method

.method private isScrollPositionValid(I)Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getHeadersCount()I

    move-result v0

    if-lt p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getItemCount()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getFootersCount()I

    move-result v1

    sub-int/2addr v0, v1

    if-gt p1, v0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$602(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Z)Z

    goto :goto_0

    :cond_0
    if-nez p2, :cond_2

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->getCurrentPosition(Landroid/support/v7/widget/RecyclerView;)I

    move-result p1

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->isScrollPositionValid(I)Z

    move-result p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$300(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->smoothScrollToPosition(I)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$700(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    move-result-object p2

    if-eqz p2, :cond_1

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$700(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    move-result-object p2

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getWrappedAdapterPosition(I)I

    move-result p1

    invoke-interface {p2, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;->onScrollToPosition(I)V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p1, v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$602(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Z)Z

    :cond_2
    :goto_0
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->getCurrentPosition(Landroid/support/v7/widget/RecyclerView;)I

    move-result p1

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$700(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$600(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Z

    move-result p2

    if-nez p2, :cond_0

    invoke-direct {p0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->isScrollPositionValid(I)Z

    move-result p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$700(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    move-result-object p2

    iget-object p3, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;->this$0:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;

    invoke-static {p3}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    move-result-object p3

    invoke-virtual {p3, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getWrappedAdapterPosition(I)I

    move-result p1

    invoke-interface {p2, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;->onScrollToPosition(I)V

    :cond_0
    return-void
.end method
