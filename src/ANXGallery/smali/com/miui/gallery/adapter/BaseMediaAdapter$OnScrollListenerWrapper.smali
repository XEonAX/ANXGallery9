.class Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "BaseMediaAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/adapter/BaseMediaAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "OnScrollListenerWrapper"
.end annotation


# instance fields
.field private final mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V
    .locals 0

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    iput-object p1, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    return-void
.end method


# virtual methods
.method public onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroid/support/v7/widget/RecyclerView;I)V

    :cond_0
    return-void
.end method

.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/adapter/BaseMediaAdapter$OnScrollListenerWrapper;->mWrapped:Landroid/support/v7/widget/RecyclerView$OnScrollListener;

    invoke-virtual {v0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;->onScrolled(Landroid/support/v7/widget/RecyclerView;II)V

    :cond_0
    return-void
.end method
