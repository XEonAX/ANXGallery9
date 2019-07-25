.class public Lcom/miui/gallery/ui/CleanerRotateProgressBar;
.super Lcom/miui/gallery/ui/SpaceRotateProgressBar;
.source "CleanerRotateProgressBar.java"


# instance fields
.field private mHasShowEmptyAnim:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lcom/miui/gallery/ui/SpaceRotateProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mHasShowEmptyAnim:Z

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f10028c

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setDescription(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$002(Lcom/miui/gallery/ui/CleanerRotateProgressBar;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mHasShowEmptyAnim:Z

    return p1
.end method


# virtual methods
.method public hideRingCircle(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->disappearRingCircleAnim()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/RotateRingView;->setAlpha(F)V

    :goto_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f10028d

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setDetailDescription(Ljava/lang/String;)V

    return-void
.end method

.method public setNumber(J)V
    .locals 1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZ)V

    return-void
.end method

.method public setNumber(JZ)V
    .locals 2

    if-eqz p3, :cond_0

    const/4 p3, 0x0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setNumber(JZLjava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->cancelAllAnim()V

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->changeNumberWithNoAnim(I)V

    :goto_0
    return-void
.end method

.method public setNumber(JZLjava/lang/Runnable;)V
    .locals 2

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->startRotateRingAnim(Z)V

    const-wide/16 v0, 0x3e8

    div-long/2addr p1, v0

    long-to-int p1, p1

    if-eqz p4, :cond_0

    new-instance p2, Lcom/miui/gallery/ui/CleanerRotateProgressBar$1;

    invoke-direct {p2, p0, p4}, Lcom/miui/gallery/ui/CleanerRotateProgressBar$1;-><init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar;Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    if-eqz p3, :cond_1

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getSpaceNumber()I

    move-result p3

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getSpaceNumber()I

    move-result p4

    sub-int p4, p1, p4

    mul-int/lit8 p4, p4, 0x7

    div-int/lit8 p4, p4, 0xa

    add-int/2addr p3, p4

    new-instance p4, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;

    invoke-direct {p4, p0, p1, p2}, Lcom/miui/gallery/ui/CleanerRotateProgressBar$2;-><init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar;ILandroid/animation/AnimatorListenerAdapter;)V

    invoke-virtual {p0, p3, p4}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->changeNumberWithAnim(ILandroid/animation/AnimatorListenerAdapter;)V

    goto :goto_1

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->changeNumberWithAnim(ILandroid/animation/AnimatorListenerAdapter;)V

    :goto_1
    return-void
.end method

.method public showEmptyAnim()V
    .locals 2

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showEmptyAnim(J)V

    return-void
.end method

.method public showEmptyAnim(J)V
    .locals 2

    iget-boolean v0, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mHasShowEmptyAnim:Z

    if-eqz v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mEmptyValueView:Landroid/widget/ImageView;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mEmptyValueView:Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    const v0, 0x7f0702d0

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->showRingCircle(Z)V

    :cond_0
    return-void

    :cond_1
    invoke-static {}, Lcom/miui/gallery/threadpool/ThreadManager;->getMainHandler()Lcom/android/internal/CompatHandler;

    move-result-object v0

    new-instance v1, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar$3;-><init>(Lcom/miui/gallery/ui/CleanerRotateProgressBar;)V

    invoke-virtual {v0, v1, p1, p2}, Lcom/android/internal/CompatHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public showRingCircle(Z)V
    .locals 1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->appearRingCircleAnim()V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->mRotateRing:Lcom/miui/gallery/widget/RotateRingView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/miui/gallery/widget/RotateRingView;->setAlpha(F)V

    :goto_0
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/CleanerRotateProgressBar;->setDetailDescription(Ljava/lang/String;)V

    return-void
.end method
