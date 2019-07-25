.class public Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "PreloadMediaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PreloadMediaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreloadOnScrollListener"
.end annotation


# instance fields
.field private mFirstVisiblePos:I

.field private mLastVisiblePos:I

.field private mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

.field private mScrollState:I


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollState:I

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mFirstVisiblePos:I

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mLastVisiblePos:I

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-void
.end method


# virtual methods
.method public getFirstPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mFirstVisiblePos:I

    return v0
.end method

.method public getLastPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mLastVisiblePos:I

    return v0
.end method

.method public getScrollState()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollState:I

    return v0
.end method

.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    :cond_0
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 3

    invoke-super {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    move-object v0, p1

    check-cast v0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findFirstVisibleItemPosition()I

    move-result v1

    invoke-virtual {v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findLastVisibleItemPosition()I

    move-result v0

    iget v2, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mFirstVisiblePos:I

    if-eq v1, v2, :cond_1

    iget v2, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mFirstVisiblePos:I

    if-le v1, v2, :cond_0

    const/4 v2, 0x0

    goto :goto_0

    :cond_0
    const/4 v2, 0x1

    :goto_0
    iput v2, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollState:I

    :cond_1
    iput v1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mFirstVisiblePos:I

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mLastVisiblePos:I

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapter$PreloadOnScrollListener;->mScrollListener:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    :cond_2
    return-void
.end method
