.class public Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
.super Landroid/support/v7/widget/RecyclerView;
.source "GalleryRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/util/photoview/ScrollableView;
.implements Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;,
        Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;
    }
.end annotation


# instance fields
.field private isHideViewCalled:Z

.field private mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

.field protected mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

.field private mEmptyView:Landroid/view/View;

.field private mEnableCustomFastScroller:Z

.field private mFastScrollStyle:I

.field protected mItemClickSupport:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

.field private final mObserver:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;

.field private mOnItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

.field private mOnItemTouchListeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    invoke-direct {p0, p1, p2, p3}, Landroid/support/v7/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->isHideViewCalled:Z

    new-instance v2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;

    invoke-direct {v2, p0, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$1;)V

    iput-object v2, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;

    if-eqz p2, :cond_0

    sget-object v0, Lcom/miui/gallery/R$styleable;->RecyclerView:[I

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x2

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEnableCustomFastScroller:Z

    const/4 p2, 0x3

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mFastScrollStyle:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->initItemClick()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->updateEmptyStatus()V

    return-void
.end method

.method private bringFastScrollerToFront()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->removeItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    const/4 v1, -0x1

    invoke-super {p0, v0, v1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V

    return-void
.end method

.method private openContextMenu(I)Z
    .locals 0

    if-ltz p1, :cond_0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->createContextMenuInfo(I)V

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->showContextMenu()Z

    move-result p1

    return p1
.end method

.method private setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    if-eqz p2, :cond_1

    invoke-super {p0, p1, p3}, Landroid/support/v7/widget/RecyclerView;->swapAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;Z)V

    goto :goto_0

    :cond_1
    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->updateEmptyStatus()V

    return-void
.end method

.method private updateEmptyStatus()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    const/16 v2, 0x8

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-super {p0, v2}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_2

    :cond_2
    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->isHideViewCalled:Z

    if-nez v0, :cond_5

    invoke-super {p0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    goto :goto_2

    :cond_3
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEmptyView:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_4
    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->isHideViewCalled:Z

    if-nez v0, :cond_5

    invoke-super {p0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    :cond_5
    :goto_2
    return-void
.end method


# virtual methods
.method public addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->bringFastScrollerToFront()V

    :cond_0
    return-void
.end method

.method public addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->addOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method protected createContextMenuInfo(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    if-nez v0, :cond_0

    new-instance v0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;

    invoke-direct {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;-><init>(I)V

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    check-cast v0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView$RecyclerContextMenuInfo;->setValues(I)V

    :goto_0
    return-void
.end method

.method public findChildViewUnderForExternal(FF)Landroid/view/View;
    .locals 0

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findChildViewUnder(FF)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public findFirstVisibleItemPosition()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public findLastVisibleItemPosition()I
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$LayoutManager;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, -0x1

    return v0
.end method

.method public findViewHolderForAdapterPositionForExternal(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->findViewHolderForAdapterPosition(I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public getChildAdapterPositionForExternal(Landroid/view/View;)I
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    move-result p1

    return p1
.end method

.method protected getContextMenuInfo()Landroid/view/ContextMenu$ContextMenuInfo;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mContextMenuInfo:Landroid/view/ContextMenu$ContextMenuInfo;

    return-object v0
.end method

.method getItemTouchListenerAt(I)Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, -0x1

    if-le p1, v1, :cond_0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;

    return-object p1

    :cond_0
    new-instance v1, Ljava/lang/IndexOutOfBoundsException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " is an invalid index for size "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method getItemTouchListenerCount()I
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method protected initItemClick()V
    .locals 1

    invoke-static {p0}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->addTo(Landroid/support/v7/widget/RecyclerView;)Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mItemClickSupport:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mItemClickSupport:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-virtual {v0, p0}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V

    return-void
.end method

.method public onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    move-object v3, p1

    move-object v4, p2

    move v5, p3

    move-wide v6, p4

    invoke-interface/range {v2 .. v7}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;->onItemLongClick(Landroid/support/v7/widget/RecyclerView;Landroid/view/View;IJ)Z

    move-result p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-nez p1, :cond_1

    invoke-direct {p0, p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->openContextMenu(I)Z

    move-result p1

    if-eqz p1, :cond_2

    :cond_1
    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->removeOnItemTouchListener(Landroid/support/v7/widget/RecyclerView$OnItemTouchListener;)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemTouchListeners:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public scrollToPosition(I)V
    .locals 0

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    return-void
.end method

.method public scrollToPositionWithOffset(II)V
    .locals 2

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, v0, Landroid/support/v7/widget/LinearLayoutManager;

    if-eqz v1, :cond_0

    check-cast v0, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->scrollToPosition(I)V

    :goto_0
    return-void
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V

    return-void
.end method

.method public setEmptyView(Landroid/view/View;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEmptyView:Landroid/view/View;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/view/View;->getImportantForAccessibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setImportantForAccessibility(I)V

    :cond_0
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->updateEmptyStatus()V

    return-void
.end method

.method public setFastScrollEnabled(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEnableCustomFastScroller:Z

    if-eq v0, p1, :cond_2

    iput-boolean p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mEnableCustomFastScroller:Z

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    if-nez p1, :cond_0

    new-instance p1, Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-direct {p1, p0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;-><init>(Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mFastScrollStyle:I

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setStyle(I)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->attach()V

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->detach()V

    :cond_2
    :goto_0
    return-void
.end method

.method public setFastScrollStyle(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    if-nez v0, :cond_0

    iput p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mFastScrollStyle:I

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mCustomFastScroller:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->setStyle(I)V

    :goto_0
    return-void
.end method

.method public setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mItemClickSupport:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/ItemClickSupport;->setOnItemClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemClickListener;)V

    return-void
.end method

.method public setOnItemLongClickListener(Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->mOnItemLongClickListener:Lcom/miui/gallery/widget/recyclerview/ItemClickSupport$OnItemLongClickListener;

    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->isHideViewCalled:Z

    invoke-super {p0, p1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    return-void
.end method

.method public swapAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;Z)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V

    return-void
.end method

.method public viewToPosition(I)V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->getHeight()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    invoke-virtual {p0, p1, v0}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->scrollToPositionWithOffset(II)V

    return-void
.end method
