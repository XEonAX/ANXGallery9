.class public Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;
.super Landroid/widget/RelativeLayout;
.source "SlideShowHeaderView.java"


# instance fields
.field private mIsPlayEnable:Z

.field private mIsPlayIconInited:Z

.field private final mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final mPlayIcon:Landroid/view/View;

.field private mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

.field private final mSlideShowController:Lcom/miui/gallery/card/ui/detail/SlideShowController;

.field private final mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    iput-boolean p2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mIsPlayIconInited:Z

    new-instance p2, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;

    invoke-direct {p2, p0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;-><init>(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)V

    iput-object p2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b015e

    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    const p1, 0x7f0902ad

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/miui/gallery/widget/SlideShowView;

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    const/16 p2, 0xdac

    invoke-virtual {p1, p2}, Lcom/miui/gallery/widget/SlideShowView;->setSlideDuration(I)V

    new-instance p1, Lcom/miui/gallery/card/ui/detail/SlideShowController;

    iget-object p3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-direct {p1, p3, p2}, Lcom/miui/gallery/card/ui/detail/SlideShowController;-><init>(Lcom/miui/gallery/widget/SlideShowView;I)V

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowController:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    const p1, 0x7f090221

    invoke-virtual {p0, p1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object p2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mOnGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mIsPlayIconInited:Z

    return p0
.end method

.method static synthetic access$002(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mIsPlayIconInited:Z

    return p1
.end method

.method static synthetic access$100(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Lcom/miui/gallery/widget/SlideShowView;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    return-object p0
.end method

.method private startPlayIconAlphaAnim(Z)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    const-string v3, "alpha"

    new-array v2, v2, [F

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v4

    aput v4, v2, v1

    const/high16 v1, 0x3f800000    # 1.0f

    aput v1, v2, v0

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    const-string v3, "alpha"

    new-array v2, v2, [F

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    move-result v4

    aput v4, v2, v1

    const/4 v1, 0x0

    aput v1, v2, v0

    invoke-static {p1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x96

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIconAlphaAnim:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method


# virtual methods
.method public getPlayIcon()Landroid/view/View;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    return-object v0
.end method

.method public isPlayEnable()Z
    .locals 1

    iget-boolean v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mIsPlayEnable:Z

    return v0
.end method

.method public pause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowController:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->pause()V

    return-void
.end method

.method public resume()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowController:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->resume()V

    return-void
.end method

.method public setPlayEnable(Z)V
    .locals 2

    iput-boolean p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mIsPlayEnable:Z

    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getAlpha()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_0

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->startPlayIconAlphaAnim(Z)V

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mPlayIcon:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_1

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->startPlayIconAlphaAnim(Z)V

    :cond_1
    :goto_0
    return-void
.end method

.method public setSlideRefreshedListener(Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowView:Lcom/miui/gallery/widget/SlideShowView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/widget/SlideShowView;->setRefreshListener(Lcom/miui/gallery/widget/SlideShowView$OnRefreshedListener;)V

    return-void
.end method

.method public updateMedias(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/miui/gallery/card/model/BaseMedia;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->mSlideShowController:Lcom/miui/gallery/card/ui/detail/SlideShowController;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/card/ui/detail/SlideShowController;->updateMedias(Ljava/util/List;)V

    return-void
.end method
