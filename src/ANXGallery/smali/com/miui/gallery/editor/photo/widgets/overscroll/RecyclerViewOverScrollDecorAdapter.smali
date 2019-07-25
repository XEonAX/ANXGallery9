.class public Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;
.super Ljava/lang/Object;
.source "RecyclerViewOverScrollDecorAdapter.java"

# interfaces
.implements Lcom/miui/gallery/editor/photo/widgets/overscroll/IOverScrollInterface$IOverScrollDecoratorAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ItemTouchHelperCallbackWrapper;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplVerticalLayout;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplHorizLayout;,
        Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;
    }
.end annotation


# instance fields
.field protected final mImpl:Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;

.field protected mIsItemTouchInEffect:Z

.field protected final mRecyclerView:Landroid/support/v7/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mIsItemTouchInEffect:Z

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object p1

    instance-of v0, p1, Landroid/support/v7/widget/LinearLayoutManager;

    if-nez v0, :cond_1

    instance-of v1, p1, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    if-eqz v1, :cond_0

    goto :goto_0

    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Recycler views with custom layout managers are not supported by this adapter out of the box.Try implementing and providing an explicit \'impl\' parameter to the other c\'tors, or otherwise create a custom adapter subclass of your own."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    check-cast p1, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/support/v7/widget/LinearLayoutManager;->getOrientation()I

    move-result p1

    goto :goto_1

    :cond_2
    check-cast p1, Landroid/support/v7/widget/StaggeredGridLayoutManager;

    invoke-virtual {p1}, Landroid/support/v7/widget/StaggeredGridLayoutManager;->getOrientation()I

    move-result p1

    :goto_1
    if-nez p1, :cond_3

    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplHorizLayout;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplHorizLayout;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mImpl:Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;

    goto :goto_2

    :cond_3
    new-instance p1, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplVerticalLayout;

    invoke-direct {p1, p0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$ImplVerticalLayout;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;)V

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mImpl:Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;

    :goto_2
    return-void
.end method

.method public constructor <init>(Landroid/support/v7/widget/RecyclerView;Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;-><init>(Landroid/support/v7/widget/RecyclerView;)V

    invoke-virtual {p0, p2}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->setUpTouchHelperCallback(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    return-void
.end method


# virtual methods
.method public getView()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public isInAbsoluteEnd()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mIsItemTouchInEffect:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mImpl:Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;->isInAbsoluteEnd()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isInAbsoluteStart()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mIsItemTouchInEffect:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mImpl:Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$Impl;->isInAbsoluteStart()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method protected setUpTouchHelperCallback(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V
    .locals 2

    new-instance v0, Landroid/support/v7/widget/helper/ItemTouchHelper;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$1;

    invoke-direct {v1, p0, p1}, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter$1;-><init>(Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    invoke-direct {v0, v1}, Landroid/support/v7/widget/helper/ItemTouchHelper;-><init>(Landroid/support/v7/widget/helper/ItemTouchHelper$Callback;)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/overscroll/RecyclerViewOverScrollDecorAdapter;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/helper/ItemTouchHelper;->attachToRecyclerView(Landroid/support/v7/widget/RecyclerView;)V

    return-void
.end method
