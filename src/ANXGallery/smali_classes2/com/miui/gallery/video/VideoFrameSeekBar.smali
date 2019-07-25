.class public Lcom/miui/gallery/video/VideoFrameSeekBar;
.super Landroid/widget/FrameLayout;
.source "VideoFrameSeekBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;
    }
.end annotation


# instance fields
.field private mContext:Landroid/content/Context;

.field private mOnSeekBarChangeListener:Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

.field private mProgress:F

.field private mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

.field private mRecyclerView:Landroid/support/v7/widget/RecyclerView;

.field private mScrollIdle:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mScrollIdle:Z

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mScrollIdle:Z

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/video/VideoFrameSeekBar;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mScrollIdle:Z

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/video/VideoFrameSeekBar;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mScrollIdle:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/video/VideoFrameSeekBar;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/video/VideoFrameSeekBar;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameThumbAdapter;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    return-object p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/video/VideoFrameSeekBar;)Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    return-object p0
.end method


# virtual methods
.method public getProgress()F
    .locals 1

    iget v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    return v0
.end method

.method protected onFinishInflate()V
    .locals 3

    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    invoke-virtual {p0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->getContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mContext:Landroid/content/Context;

    const v0, 0x7f090342

    invoke-virtual {p0, v0}, Lcom/miui/gallery/video/VideoFrameSeekBar;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/RecyclerView;

    iput-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v0, Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    new-instance v0, Landroid/support/v7/widget/LinearLayoutManager;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mContext:Landroid/content/Context;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2, v2}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/support/v7/widget/RecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->setOverScrollMode(I)V

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    new-instance v1, Lcom/miui/gallery/video/VideoFrameSeekBar$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/video/VideoFrameSeekBar$1;-><init>(Lcom/miui/gallery/video/VideoFrameSeekBar;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->addOnScrollListener(Landroid/support/v7/widget/RecyclerView$OnScrollListener;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    sub-int/2addr p4, p2

    invoke-virtual {p1, p4}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->configLayoutParams(I)V

    :cond_0
    iget p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    invoke-virtual {p0, p1}, Lcom/miui/gallery/video/VideoFrameSeekBar;->setProgress(F)V

    :cond_1
    return-void
.end method

.method public setFrameList(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/graphics/Bitmap;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mScrollIdle:Z

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/RecyclerView;->scrollToPosition(I)V

    const-string v0, "VideoFrameSeekBar"

    const-string v1, "scrollToPosition 0"

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->updateDataList(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public setOnSeekBarChangeListener(Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mOnSeekBarChangeListener:Lcom/miui/gallery/video/VideoFrameSeekBar$OnSeekBarChangeListener;

    return-void
.end method

.method public setProgress(F)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerAdapter:Lcom/miui/gallery/video/VideoFrameThumbAdapter;

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    invoke-virtual {v0, v1, p1}, Lcom/miui/gallery/video/VideoFrameThumbAdapter;->getScrollOffset(Landroid/support/v7/widget/RecyclerView;F)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mRecyclerView:Landroid/support/v7/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Landroid/support/v7/widget/RecyclerView;->scrollBy(II)V

    iput p1, p0, Lcom/miui/gallery/video/VideoFrameSeekBar;->mProgress:F

    :cond_0
    return-void
.end method
