.class public Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;
.super Lcom/miui/gallery/app/Fragment;
.source "BurstPhotoPreviewFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHolder;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;,
        Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

.field private mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

.field private mContentDataSet:Lcom/miui/gallery/model/BaseDataSet;

.field private mDiscard:Landroid/view/View;

.field private mIndicator:Landroid/view/View;

.field private mIsScrolledByOutside:Z

.field private mOnDiscardClickedListener:Landroid/view/View$OnClickListener;

.field private mOnExitListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;

.field private mOnItemScrolledListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

.field private mOnSaveClickedListener:Landroid/view/View$OnClickListener;

.field private mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

.field private mSave:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/miui/gallery/app/Fragment;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIsScrolledByOutside:Z

    new-instance v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$1;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnSaveClickedListener:Landroid/view/View$OnClickListener;

    new-instance v0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$2;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)V

    iput-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnDiscardClickedListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnExitListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    return-object p0
.end method

.method static synthetic access$600(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIsScrolledByOutside:Z

    return p0
.end method

.method static synthetic access$602(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIsScrolledByOutside:Z

    return p1
.end method

.method static synthetic access$700(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnItemScrolledListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    return-object p0
.end method

.method static synthetic access$800(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIndicator:Landroid/view/View;

    return-object p0
.end method


# virtual methods
.method public onInflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const/4 p3, 0x0

    const v0, 0x7f0b0038

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090273

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mSave:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mSave:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnSaveClickedListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f0900dc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mDiscard:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mDiscard:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnDiscardClickedListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p2, 0x7f090178

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIndicator:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIndicator:Landroid/view/View;

    check-cast p2, Lcom/miui/gallery/widget/PagerIndicator;

    const/4 v0, 0x1

    invoke-virtual {p2, p3, v0}, Lcom/miui/gallery/widget/PagerIndicator;->showIndex(II)V

    const p2, 0x7f09022f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p2, p0, v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstScrollControlLinearLayoutManager;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/content/Context;)V

    invoke-virtual {p2, p3}, Landroid/support/v7/widget/LinearLayoutManager;->setOrientation(I)V

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    invoke-virtual {v1, p2}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance v1, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f060063

    invoke-direct {v1, v2, v3, p3}, Lcom/miui/gallery/editor/photo/widgets/recyclerview/SimpleRecyclerView$BlankDivider;-><init>(Landroid/content/res/Resources;II)V

    invoke-virtual {p2, v1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addItemDecoration(Landroid/support/v7/widget/RecyclerView$ItemDecoration;)V

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-direct {p2, p0, p3}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Landroid/content/Context;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mContentDataSet:Lcom/miui/gallery/model/BaseDataSet;

    if-eqz p2, :cond_0

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    iget-object p3, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mContentDataSet:Lcom/miui/gallery/model/BaseDataSet;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->setDateSet(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    invoke-static {}, Lcom/miui/gallery/util/ScreenUtils;->getScreenWidth()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    const v1, 0x7f06006c

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    div-int/lit8 p3, p3, 0x2

    sub-int/2addr p2, p3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object p3

    invoke-virtual {p3}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-virtual {p3, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    sub-int/2addr p2, p3

    new-instance p3, Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p3, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v1, p2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance v1, Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v2, p2, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    invoke-direct {p2, p0, v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;)V

    iput-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    invoke-virtual {p2, v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->addFooterView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->addHeaderView(Landroid/view/View;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object p3, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    new-instance p3, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;

    const/4 v0, 0x0

    invoke-direct {p3, p0, v0}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$BurstOnScrollListener;-><init>(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$1;)V

    invoke-virtual {p2, p3}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-object p1
.end method

.method public scrollToPosition(I)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mIsScrolledByOutside:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mPreviewRecyclerView:Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapterWrapper:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewHeaderFooterWrapper;->getHeadersCount()I

    move-result v1

    add-int/2addr p1, v1

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/recyclerview/GalleryRecyclerView;->smoothScrollToPosition(I)V

    :cond_0
    return-void
.end method

.method public setCheckedItem(IZ)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    invoke-virtual {v0, p1, p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->setSelectDataPosition(IZ)V

    iget-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mSave:Landroid/view/View;

    iget-object p2, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    invoke-virtual {p2}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->getSelectCount()I

    move-result p2

    if-lez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public setDataSet(Lcom/miui/gallery/model/BaseDataSet;)V
    .locals 1

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mContentDataSet:Lcom/miui/gallery/model/BaseDataSet;

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mAdapter:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$PreviewViewAdapter;->setDateSet(Lcom/miui/gallery/model/BaseDataSet;)V

    :cond_0
    return-void
.end method

.method public setOnExitListener(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnExitListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnExitListener;

    return-void
.end method

.method public setOnItemScrolledListener(Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/BurstPhotoPreviewFragment;->mOnItemScrolledListener:Lcom/miui/gallery/ui/BurstPhotoPreviewFragment$OnScrollToPositionListener;

    return-void
.end method
