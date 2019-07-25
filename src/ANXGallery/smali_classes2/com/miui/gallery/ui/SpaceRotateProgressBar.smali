.class public Lcom/miui/gallery/ui/SpaceRotateProgressBar;
.super Landroid/widget/FrameLayout;
.source "SpaceRotateProgressBar.java"


# instance fields
.field protected mDescriptionText:Landroid/widget/TextView;

.field protected mDetailDescriptionText:Landroid/widget/TextView;

.field protected mEmptyValueView:Landroid/widget/ImageView;

.field protected mNumberAnimator:Landroid/animation/ObjectAnimator;

.field protected mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

.field protected mRingHeadAnimator:Landroid/animation/ObjectAnimator;

.field protected mRingRotateAnimator:Landroid/animation/ObjectAnimator;

.field protected mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

.field private mSpaceNumber:I

.field protected mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0b0161

    invoke-virtual {p1, p2, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f090321

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDescriptionText:Landroid/widget/TextView;

    const p2, 0x7f090322

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDetailDescriptionText:Landroid/widget/TextView;

    const p2, 0x7f09031f

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/EndTopCornerTextView;

    iput-object p2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;

    const p2, 0x7f090270

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/miui/gallery/widget/RotateRingView;

    iput-object p2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const p2, 0x7f090323

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mEmptyValueView:Landroid/widget/ImageView;

    return-void
.end method


# virtual methods
.method protected final appearRingCircleAnim()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    iget-object v1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/RotateRingView;->getHeadMinAlpha()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/miui/gallery/widget/RotateRingView;->setHeadMaxAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public cancelAllAnim()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    return-void
.end method

.method protected cancelAnimIfRunning(Landroid/animation/Animator;)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/animation/Animator;->removeAllListeners()V

    invoke-virtual {p1}, Landroid/animation/Animator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/animation/Animator;->cancel()V

    :cond_0
    return-void
.end method

.method protected final changeNumberEndStageAnim(ILandroid/animation/AnimatorListenerAdapter;)V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    const/16 v0, 0xb4

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v3, "progress"

    const/4 v4, 0x2

    new-array v5, v4, [I

    iget-object v6, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v6}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v6

    aput v6, v5, v1

    iget-object v6, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v6}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v6

    add-int/2addr v6, v0

    const/4 v0, 0x1

    aput v6, v5, v0

    invoke-static {v2, v3, v5}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v2

    iput-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    iget-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    const-string v2, "spaceNumber"

    new-array v3, v4, [I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->getSpaceNumber()I

    move-result v4

    aput v4, v3, v1

    aput p1, v3, v0

    invoke-static {p0, v2, v3}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v0, 0x3e8

    new-instance p1, Landroid/animation/AnimatorSet;

    invoke-direct {p1}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v2, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    invoke-virtual {p1, v0, v1}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {p1, v2}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    if-eqz p2, :cond_1

    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_1
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->start()V

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->disappearRingHeadAnim(J)V

    return-void
.end method

.method protected final changeNumberWithAnim(ILandroid/animation/AnimatorListenerAdapter;)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    const-string v0, "spaceNumber"

    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->getSpaceNumber()I

    move-result v2

    const/4 v3, 0x0

    aput v2, v1, v3

    const/4 v2, 0x1

    aput p1, v1, v2

    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->getChangeDuration(I)I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    if-eqz p2, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mNumberAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method

.method protected final changeNumberWithNoAnim(I)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->setSpaceNumber(I)V

    return-void
.end method

.method protected final disappearRingCircleAnim()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    new-instance v1, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingAlphaAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method protected final disappearRingHeadAnim(J)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v0}, Lcom/miui/gallery/widget/RotateRingView;->getHeadMaxAlpha()I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v1}, Lcom/miui/gallery/widget/RotateRingView;->getHeadMinAlpha()I

    move-result v1

    if-le v0, v1, :cond_0

    iget-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p0, v2}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->cancelAnimIfRunning(Landroid/animation/Animator;)V

    iget-object v2, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v3, "headMaxAlpha"

    const/4 v4, 0x2

    new-array v4, v4, [I

    const/4 v5, 0x0

    aput v0, v4, v5

    const/4 v0, 0x1

    aput v1, v4, v0

    invoke-static {v2, v3, v4}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    new-instance p2, Lmiui/view/animation/SineEaseOutInterpolator;

    invoke-direct {p2}, Lmiui/view/animation/SineEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, p2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingHeadAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    :cond_0
    return-void
.end method

.method protected getChangeDuration(I)I
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->getSpaceNumber()I

    move-result v0

    sub-int/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    const v0, 0x7a120

    if-ge p1, v0, :cond_0

    const/16 p1, 0x7d0

    return p1

    :cond_0
    const/16 p1, 0xbb8

    return p1
.end method

.method public getSpaceNumber()I
    .locals 1

    iget v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mSpaceNumber:I

    return v0
.end method

.method public isRotating()Z
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public setDescription(Ljava/lang/String;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDescriptionText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setDetailDescription(Ljava/lang/String;)V
    .locals 2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDetailDescriptionText:Landroid/widget/TextView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDetailDescriptionText:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mDetailDescriptionText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_0
    return-void
.end method

.method public setSpaceNumber(I)V
    .locals 7

    iput p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mSpaceNumber:I

    const/16 v0, 0x64

    if-eqz p1, :cond_0

    if-ge p1, v0, :cond_0

    const/16 p1, 0x64

    :cond_0
    const/high16 v0, 0x447a0000    # 1000.0f

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez p1, :cond_1

    const-string v3, "%.1f"

    new-array v4, v2, [Ljava/lang/Object;

    rem-int/lit8 v5, p1, 0x64

    sub-int v5, p1, v5

    int-to-float v5, v5

    div-float/2addr v5, v0

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v5

    aput-object v5, v4, v1

    :goto_0
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    :cond_1
    const-string v3, "%d"

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v1

    goto :goto_0

    :goto_1
    const/16 v4, 0x384

    if-le p1, v4, :cond_2

    div-int/lit16 p1, p1, 0x3e8

    if-lez p1, :cond_2

    const-string v3, "%d"

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v1

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :cond_2
    const v5, 0x7f10046a

    if-le p1, v4, :cond_3

    const-string v3, "%.1f"

    new-array v2, v2, [Ljava/lang/Object;

    int-to-float p1, p1

    div-float/2addr p1, v0

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p1

    aput-object p1, v2, v1

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    const v5, 0x7f100406

    :cond_3
    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;

    invoke-virtual {p1, v3}, Lcom/miui/gallery/widget/EndTopCornerTextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mSpaceNumberView:Lcom/miui/gallery/widget/EndTopCornerTextView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/EndTopCornerTextView;->setCornerText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method protected final startRotateRingAnim(Z)V
    .locals 4

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {p1}, Lcom/miui/gallery/widget/RotateRingView;->setStartRotateStable()V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const-string v0, "progress"

    const/4 v1, 0x2

    new-array v1, v1, [I

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v3

    aput v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    invoke-virtual {v3}, Lcom/miui/gallery/widget/RotateRingView;->getProgress()I

    move-result v3

    add-int/lit16 v3, v3, 0x167

    aput v3, v1, v2

    invoke-static {p1, v0, v1}, Landroid/animation/ObjectAnimator;->ofInt(Ljava/lang/Object;Ljava/lang/String;[I)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const-wide v0, 0x4094d55555555555L    # 1333.3333333333333

    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setRepeatCount(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setRepeatMode(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SpaceRotateProgressBar;->mRingRotateAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->start()V

    return-void
.end method
