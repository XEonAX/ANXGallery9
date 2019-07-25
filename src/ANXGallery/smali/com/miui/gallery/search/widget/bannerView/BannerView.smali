.class public Lcom/miui/gallery/search/widget/bannerView/BannerView;
.super Landroid/widget/ViewAnimator;
.source "BannerView.java"

# interfaces
.implements Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;
.implements Lcom/miui/gallery/search/widget/bannerView/ILoopController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;
    }
.end annotation


# instance fields
.field private mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

.field private mDefaultItemDisplayDuration:I

.field private mIsStarted:Z

.field private mPosition:I

.field private mRunnable:Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;

.field private mShouldStartLoopingWhenAttached:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    invoke-direct {p0, p1, p2}, Landroid/widget/ViewAnimator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 v0, 0xbb8

    iput v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mDefaultItemDisplayDuration:I

    const/4 v0, -0x1

    iput v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mShouldStartLoopingWhenAttached:Z

    new-instance v0, Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;-><init>(Lcom/miui/gallery/search/widget/bannerView/BannerView;Lcom/miui/gallery/search/widget/bannerView/BannerView$1;)V

    iput-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mRunnable:Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->init(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method static synthetic access$100(Lcom/miui/gallery/search/widget/bannerView/BannerView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    return p0
.end method

.method static synthetic access$102(Lcom/miui/gallery/search/widget/bannerView/BannerView;I)I
    .locals 0

    iput p1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    return p1
.end method

.method static synthetic access$200(Lcom/miui/gallery/search/widget/bannerView/BannerView;)I
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getCircledNextPosition()I

    move-result p0

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/search/widget/bannerView/BannerView;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->postDelayed(I)V

    return-void
.end method

.method private getCircledNextPosition()I
    .locals 2

    iget v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    add-int/lit8 v0, v0, 0x1

    iget-object v1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->getCount()I

    move-result v1

    rem-int/2addr v0, v1

    return v0
.end method

.method private init(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->setAnimateFirstView(Z)V

    sget-object v1, Lcom/miui/gallery/R$styleable;->BannerView:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    iget p2, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mDefaultItemDisplayDuration:I

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result p2

    iput p2, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mDefaultItemDisplayDuration:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private postDelayed(I)V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->getItem(I)Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;->getDisplayDuration()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerItemData;->getDisplayDuration()I

    move-result p1

    goto :goto_0

    :cond_0
    iget p1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mDefaultItemDisplayDuration:I

    :goto_0
    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mRunnable:Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;

    int-to-long v1, p1

    invoke-virtual {p0, v0, v1, v2}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method private setupAdapter()V
    .locals 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_0

    invoke-virtual {p0, v1}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->clearAnimation()V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->removeAllViews()V

    iput v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    iget-object v1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->getCount()I

    move-result v1

    if-lez v1, :cond_2

    :goto_1
    const/4 v1, 0x2

    if-ge v0, v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {v1, p0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->getView(Lcom/miui/gallery/search/widget/bannerView/BannerView;)Landroid/view/View;

    move-result-object v1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0, v1, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->addView(Landroid/view/View;I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getCurrentView()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->bindView(Landroid/view/View;I)V

    :cond_2
    return-void
.end method


# virtual methods
.method public getCurrentPosition()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    return v0
.end method

.method public isLooping()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mIsStarted:Z

    return v0
.end method

.method protected onAttachedToWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/ViewAnimator;->onAttachedToWindow()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->isLooping()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mShouldStartLoopingWhenAttached:Z

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->startLoop()V

    :cond_0
    return-void
.end method

.method public onChanged()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->isLooping()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->stopLoop()V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->setupAdapter()V

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->startLoop()V

    :cond_1
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    invoke-super {p0}, Landroid/widget/ViewAnimator;->onDetachedFromWindow()V

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->isLooping()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->stopLoop()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mShouldStartLoopingWhenAttached:Z

    :cond_0
    return-void
.end method

.method public performNext()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getCurrentView()Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getChildCount()I

    move-result v1

    rem-int/2addr v0, v1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->getCircledNextPosition()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->bindView(Landroid/view/View;I)V

    invoke-virtual {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->showNext()V

    return-void
.end method

.method public setAdapter(Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;)V
    .locals 1

    if-eqz p1, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    if-nez v0, :cond_0

    iput-object p1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    iget-object p1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {p1, p0}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->setOnDataChangedListener(Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter$OnDataChangedListener;)V

    invoke-direct {p0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->setupAdapter()V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "you have already set an Adapter"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/lang/RuntimeException;

    const-string v0, "adapter must not be null"

    invoke-direct {p1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public startLoop()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mIsStarted:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mIsStarted:Z

    iget-object v1, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mAdapter:Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;

    invoke-virtual {v1}, Lcom/miui/gallery/search/widget/bannerView/BaseBannerAdapter;->getCount()I

    move-result v1

    if-le v1, v0, :cond_0

    iget v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mPosition:I

    invoke-direct {p0, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->postDelayed(I)V

    :cond_0
    return-void

    :cond_1
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "You must call setContentAdapter() before start"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public stopLoop()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mRunnable:Lcom/miui/gallery/search/widget/bannerView/BannerView$AnimRunnable;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/search/widget/bannerView/BannerView;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/miui/gallery/search/widget/bannerView/BannerView;->mIsStarted:Z

    return-void
.end method
