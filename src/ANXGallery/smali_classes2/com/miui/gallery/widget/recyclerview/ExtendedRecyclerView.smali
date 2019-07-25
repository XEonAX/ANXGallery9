.class public Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;
.super Landroid/widget/RelativeLayout;
.source "ExtendedRecyclerView.java"

# interfaces
.implements Lcom/miui/gallery/widget/TwoStageDrawer$ScrollableView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;
    }
.end annotation


# instance fields
.field protected mClipToPadding:Z

.field protected mEmpty:Landroid/view/ViewStub;

.field protected mEmptyId:I

.field protected mEmptyView:Landroid/view/View;

.field protected mMainContentId:I

.field protected mManualInflateEmptyView:Z

.field private final mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

.field protected mPadding:I

.field protected mPaddingBottom:I

.field protected mPaddingLeft:I

.field protected mPaddingRight:I

.field protected mPaddingTop:I

.field protected mProgress:Landroid/view/ViewStub;

.field protected mProgressId:I

.field protected mProgressView:Landroid/view/View;

.field protected mRecycler:Landroid/support/v7/widget/RecyclerView;

.field protected mScrollbarStyle:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    new-instance p1, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initAttrs(Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initView()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p3}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;-><init>(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$1;)V

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {p0, p2}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initAttrs(Landroid/util/AttributeSet;)V

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initView()V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->showRecycler()V

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->showEmpty()V

    return-void
.end method

.method private initView()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->isInEditMode()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mMainContentId:I

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f090232

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgressId:I

    invoke-virtual {v1, v2}, Landroid/view/ViewStub;->setLayoutResource(I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgressView:Landroid/view/View;

    const v1, 0x7f0900fc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewStub;

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyId:I

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mManualInflateEmptyView:Z

    if-nez v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyId:I

    invoke-virtual {v1, v2}, Landroid/view/ViewStub;->setLayoutResource(I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    invoke-virtual {v1}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyView:Landroid/view/View;

    :cond_1
    invoke-virtual {p0, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->initRecyclerView(Landroid/view/View;)V

    return-void

    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "layout_main_content must contains empty stub!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_3
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "layout_main_content must contains progress stub!"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView$Adapter;->unregisterAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    :cond_0
    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mObserver:Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView$RecyclerViewDataObserver;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView$Adapter;->registerAdapterDataObserver(Landroid/support/v7/widget/RecyclerView$AdapterDataObserver;)V

    :cond_1
    if-eqz p2, :cond_2

    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p2, p1, p3}, Landroid/support/v7/widget/RecyclerView;->swapAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;Z)V

    goto :goto_0

    :cond_2
    iget-object p2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {p2, p1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    :goto_0
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result p1

    if-lez p1, :cond_3

    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->showRecycler()V

    goto :goto_1

    :cond_3
    invoke-direct {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->showEmpty()V

    :goto_1
    return-void
.end method

.method private setEmptyVisibility(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyView:Landroid/view/View;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    invoke-virtual {v0, p1}, Landroid/view/ViewStub;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method private showEmpty()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setEmptyVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setVisibility(I)V

    return-void
.end method

.method private showRecycler()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setVisibility(I)V

    const/16 v0, 0x8

    invoke-direct {p0, v0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setEmptyVisibility(I)V

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgress:Landroid/view/ViewStub;

    invoke-virtual {v1, v0}, Landroid/view/ViewStub;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    return-void
.end method

.method public canScrollDown()Z
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->canScrollVertically(I)Z

    move-result v0

    return v0
.end method

.method public getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/support/v7/widget/RecyclerView;->getLayoutManager()Landroid/support/v7/widget/RecyclerView$LayoutManager;

    move-result-object v0

    return-object v0
.end method

.method public getRecycler()Landroid/support/v7/widget/RecyclerView;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    return-object v0
.end method

.method public inflateEmptyView()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyView:Landroid/view/View;

    if-nez v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyId:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyId:I

    invoke-virtual {v0, v1}, Landroid/view/ViewStub;->setLayoutResource(I)V

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmpty:Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyView:Landroid/view/View;

    :cond_0
    return-void
.end method

.method protected initAttrs(Landroid/util/AttributeSet;)V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/miui/gallery/R$styleable;->ExtendedRecyclerView:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 v0, 0x4

    const/4 v1, 0x0

    :try_start_0
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mClipToPadding:Z

    const/4 v0, 0x3

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    iput-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mManualInflateEmptyView:Z

    const/4 v0, 0x5

    const/high16 v2, -0x40800000    # -1.0f

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    const/16 v0, 0x9

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingTop:I

    const/4 v0, 0x6

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingBottom:I

    const/4 v0, 0x7

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingLeft:I

    const/16 v0, 0x8

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingRight:I

    const/16 v0, 0xa

    const/4 v2, -0x1

    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    invoke-virtual {p1, v1, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mEmptyId:I

    const/4 v0, 0x2

    const v1, 0x7f0b00a3

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mProgressId:I

    const/4 v0, 0x1

    const v1, 0x7f0b0076

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mMainContentId:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    throw v0
.end method

.method protected initRecyclerView(Landroid/view/View;)V
    .locals 4

    const v0, 0x7f090257

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_3

    instance-of v0, p1, Landroid/support/v7/widget/RecyclerView;

    if-eqz v0, :cond_3

    check-cast p1, Landroid/support/v7/widget/RecyclerView;

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    iget-boolean v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mClipToPadding:Z

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setClipToPadding(Z)V

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    int-to-float p1, p1

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    const/high16 v0, -0x40800000    # -1.0f

    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/miui/gallery/util/Numbers;->equals(Ljava/lang/Number;Ljava/lang/Number;)Z

    move-result p1

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPadding:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingLeft:I

    iget v1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingTop:I

    iget v2, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingRight:I

    iget v3, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mPaddingBottom:I

    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/support/v7/widget/RecyclerView;->setPadding(IIII)V

    :goto_0
    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    const/4 v0, -0x1

    if-eq p1, v0, :cond_2

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    const/high16 v0, 0x1000000

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    if-eqz p1, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    const/high16 v0, 0x3000000

    if-eq p1, v0, :cond_1

    iget p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    const/high16 v0, 0x2000000

    if-ne p1, v0, :cond_2

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    iget v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mScrollbarStyle:I

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/RecyclerView;->setScrollBarStyle(I)V

    :cond_2
    return-void

    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "ExtendedRecyclerView only works with a RecyclerView!"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->setAdapterInternal(Landroid/support/v7/widget/RecyclerView$Adapter;ZZ)V

    return-void
.end method

.method public setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setItemAnimator(Landroid/support/v7/widget/RecyclerView$ItemAnimator;)V

    return-void
.end method

.method public setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    return-void
.end method

.method public smoothScrollToPosition(I)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/ExtendedRecyclerView;->mRecycler:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/RecyclerView;->smoothScrollToPosition(I)V

    return-void
.end method
