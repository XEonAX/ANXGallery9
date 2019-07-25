.class public Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;
.super Ljava/lang/Object;
.source "PreloadMediaAdapterDeprecated.java"

# interfaces
.implements Landroid/widget/AbsListView$OnScrollListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreloadOnScrollListener"
.end annotation


# instance fields
.field private mFirstVisiblePos:I

.field private mLastVisiblePos:I

.field private mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

.field private mScrollState:I


# direct methods
.method public constructor <init>(Landroid/widget/AbsListView$OnScrollListener;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollState:I

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mLastVisiblePos:I

    iput-object p1, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    return-void
.end method


# virtual methods
.method public getFirstPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    return v0
.end method

.method public getLastPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mLastVisiblePos:I

    return v0
.end method

.method public getScrollState()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollState:I

    return v0
.end method

.method public onScroll(Landroid/widget/AbsListView;III)V
    .locals 2

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    const/4 v1, 0x1

    if-eq p2, v0, :cond_1

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    if-le p2, v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollState:I

    :cond_1
    iput p2, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    iget v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mFirstVisiblePos:I

    add-int/2addr v0, p3

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mLastVisiblePos:I

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2, p3, p4}, Landroid/widget/AbsListView$OnScrollListener;->onScroll(Landroid/widget/AbsListView;III)V

    :cond_2
    return-void
.end method

.method public onScrollStateChanged(Landroid/widget/AbsListView;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/PreloadMediaAdapterDeprecated$PreloadOnScrollListener;->mScrollListener:Landroid/widget/AbsListView$OnScrollListener;

    invoke-interface {v0, p1, p2}, Landroid/widget/AbsListView$OnScrollListener;->onScrollStateChanged(Landroid/widget/AbsListView;I)V

    :cond_0
    return-void
.end method
