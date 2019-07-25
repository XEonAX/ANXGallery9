.class public abstract Lcom/miui/gallery/movie/ui/view/BaseMovieView;
.super Landroid/view/ViewGroup;
.source "BaseMovieView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;
    }
.end annotation


# instance fields
.field protected mDisplayView:Landroid/view/View;

.field private mExtraContent:Landroid/view/View;

.field private mHandler:Landroid/os/Handler;

.field private mIVDelete:Landroid/widget/ImageView;

.field private mIvPlay:Landroid/widget/ImageView;

.field private mLoadingView:Landroid/view/View;

.field private mPercent:F

.field private mPlayProgress:Lcom/miui/gallery/movie/ui/view/PlayProgressView;

.field private mPreviewBtn:Landroid/widget/Button;

.field private mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;

.field private mScaledTouchSlop:I

.field private mTVDuration:Landroid/widget/TextView;

.field private mTouchAvailable:Z

.field private mViewWidth:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mViewWidth:F

    new-instance p1, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;-><init>(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mViewWidth:F

    new-instance p1, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;-><init>(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mViewWidth:F

    new-instance p1, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;

    invoke-direct {p1, p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView$1;-><init>(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)V

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$000(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mLoadingView:Landroid/view/View;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTouchAvailable:Z

    return p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)I
    .locals 0

    iget p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mScaledTouchSlop:I

    return p0
.end method

.method static synthetic access$300(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mViewWidth:F

    return p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)F
    .locals 0

    iget p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPercent:F

    return p0
.end method

.method static synthetic access$402(Lcom/miui/gallery/movie/ui/view/BaseMovieView;F)F
    .locals 0

    iput p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPercent:F

    return p1
.end method

.method static synthetic access$500(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;

    return-object p0
.end method

.method public static showView(Landroid/view/View;Z)V
    .locals 0

    if-eqz p0, :cond_1

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const/4 p1, 0x4

    :goto_0
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method protected abstract createDisplayView()Landroid/view/View;
.end method

.method public init()V
    .locals 3

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "layout_inflater"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/LayoutInflater;

    const v1, 0x7f0b00c1

    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->createDisplayView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    const v0, 0x7f09010c

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mExtraContent:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->addView(Landroid/view/View;I)V

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x1

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    iput v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mScaledTouchSlop:I

    const v0, 0x7f090192

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIvPlay:Landroid/widget/ImageView;

    const v0, 0x7f090223

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/miui/gallery/movie/ui/view/PlayProgressView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPlayProgress:Lcom/miui/gallery/movie/ui/view/PlayProgressView;

    const v0, 0x7f090312

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTVDuration:Landroid/widget/TextView;

    const v0, 0x7f09018f

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIVDelete:Landroid/widget/ImageView;

    const v0, 0x7f090229

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPreviewBtn:Landroid/widget/Button;

    const v0, 0x7f090233

    invoke-virtual {p0, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mLoadingView:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    new-instance v1, Lcom/miui/gallery/movie/ui/view/BaseMovieView$2;

    invoke-direct {v1, p0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView$2;-><init>(Lcom/miui/gallery/movie/ui/view/BaseMovieView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    sub-int/2addr p4, p1

    div-int/lit8 p4, p4, 0x2

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    add-int/2addr p1, p4

    iget-object p2, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    sub-int/2addr p5, p2

    int-to-double p2, p5

    const-wide v0, 0x3ff999999999999aL    # 1.6

    invoke-static {p2, p3}, Ljava/lang/Double;->isNaN(D)Z

    div-double/2addr p2, v0

    double-to-int p2, p2

    iget-object p3, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    move-result p3

    add-int/2addr p3, p2

    iget-object p5, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {p5, p4, p2, p1, p3}, Landroid/view/View;->layout(IIII)V

    iget-object p5, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mExtraContent:Landroid/view/View;

    invoke-virtual {p5, p4, p2, p1, p3}, Landroid/view/View;->layout(IIII)V

    :cond_0
    return-void
.end method

.method protected onMeasure(II)V
    .locals 6

    invoke-super {p0, p1, p2}, Landroid/view/ViewGroup;->onMeasure(II)V

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    invoke-static {}, Lcom/miui/gallery/movie/MovieConfig;->getMovieRatio()F

    move-result v0

    int-to-float v1, p1

    int-to-float v2, p2

    div-float v3, v1, v2

    const/high16 v4, -0x40800000    # -1.0f

    invoke-static {v0, v4}, Ljava/lang/Float;->compare(FF)I

    move-result v4

    if-eqz v4, :cond_1

    cmpg-float v3, v3, v0

    if-gez v3, :cond_0

    div-float/2addr v1, v0

    float-to-int v0, v1

    move v1, v0

    move v0, p1

    goto :goto_1

    :cond_0
    mul-float v2, v2, v0

    float-to-int v0, v2

    goto :goto_0

    :cond_1
    move v0, p1

    :goto_0
    move v1, p2

    :goto_1
    iget-object v2, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/view/View;->measure(II)V

    iget-object v2, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mExtraContent:Landroid/view/View;

    invoke-static {v0, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    invoke-static {v1, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    invoke-virtual {v2, v4, v1}, Landroid/view/View;->measure(II)V

    int-to-float v0, v0

    iput v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mViewWidth:F

    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->setMeasuredDimension(II)V

    return-void
.end method

.method public setDeleteClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIVDelete:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIVDelete:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public setDuration(I)V
    .locals 5

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTVDuration:Landroid/widget/TextView;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTVDuration:Landroid/widget/TextView;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "00:%02d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    return-void
.end method

.method public setIvPlayListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIvPlay:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mDisplayView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setPreviewBtnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPreviewBtn:Landroid/widget/Button;

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public setProgressChangeListener(Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mProgressChangeListener:Lcom/miui/gallery/movie/ui/view/BaseMovieView$IProgressChangeListener;

    return-void
.end method

.method public setTouchAvailable(Z)V
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTouchAvailable:Z

    return-void
.end method

.method public showDeleteIcon(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIVDelete:Landroid/widget/ImageView;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    return-void
.end method

.method public showDuration(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mTVDuration:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    return-void
.end method

.method public showExtraContent(Z)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mExtraContent:Landroid/view/View;

    sget-object v1, Landroid/view/View;->ALPHA:Landroid/util/Property;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    if-eqz p1, :cond_0

    const/4 v5, 0x0

    goto :goto_0

    :cond_0
    const/high16 v5, 0x3f800000    # 1.0f

    :goto_0
    const/4 v6, 0x0

    aput v5, v2, v6

    const/4 v5, 0x1

    if-eqz p1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    :goto_1
    aput v3, v2, v5

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    new-instance v0, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-wide/16 v0, 0xdc

    invoke-virtual {p1, v0, v1}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    invoke-virtual {p1}, Landroid/animation/Animator;->start()V

    return-void
.end method

.method public showLoadingView(Z)V
    .locals 3

    const/4 v0, 0x1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    const-wide/16 v1, 0x1f4

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mHandler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    iget-object p1, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mLoadingView:Landroid/view/View;

    const/4 v0, 0x0

    invoke-static {p1, v0}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    :goto_0
    return-void
.end method

.method public showPlayBtn(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mIvPlay:Landroid/widget/ImageView;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    return-void
.end method

.method public showPlayProgress(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPlayProgress:Lcom/miui/gallery/movie/ui/view/PlayProgressView;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    return-void
.end method

.method public showPreviewBtn(Z)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPreviewBtn:Landroid/widget/Button;

    invoke-static {v0, p1}, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->showView(Landroid/view/View;Z)V

    return-void
.end method

.method public updatePlayProgress(F)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/movie/ui/view/BaseMovieView;->mPlayProgress:Lcom/miui/gallery/movie/ui/view/PlayProgressView;

    invoke-virtual {v0, p1}, Lcom/miui/gallery/movie/ui/view/PlayProgressView;->setProgress(F)V

    return-void
.end method
