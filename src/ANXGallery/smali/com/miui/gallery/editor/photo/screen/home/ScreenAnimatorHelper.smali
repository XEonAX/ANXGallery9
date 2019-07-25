.class public Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;
.super Ljava/lang/Object;
.source "ScreenAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;
    }
.end annotation


# instance fields
.field private EDIT_BG_COLOR:I

.field private SHARE_BG_COLOR:I

.field private mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

.field private mAnimatorSets:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/animation/AnimatorSet;",
            ">;"
        }
    .end annotation
.end field

.field private mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

.field private mResources:Landroid/content/res/Resources;

.field public mShareViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

.field public mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

.field private mThumbnailRect:[I


# direct methods
.method public constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;[ILcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mThumbnailRect:[I

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorSets:Ljava/util/ArrayList;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$1;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$1;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mThumbnailAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$2;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    iput-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mShareViewAnimatorCallback:Lcom/miui/gallery/editor/photo/screen/home/ThumbnailAnimatorCallback;

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    iput-object p3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-direct {p0, p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->setThumbnailRect([I)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const p2, 0x7f050123

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->SHARE_BG_COLOR:I

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const p2, 0x7f050120

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getColor(I)I

    move-result p1

    iput p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->EDIT_BG_COLOR:I

    return-void

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method static synthetic access$000(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    return-object p0
.end method

.method static synthetic access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    return-object p0
.end method

.method static synthetic access$200(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V
    .locals 0

    invoke-direct {p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startQuitThumbnailService()V

    return-void
.end method

.method static synthetic access$300(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Landroid/content/res/Resources;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    return-object p0
.end method

.method static synthetic access$400(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)[I
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mThumbnailRect:[I

    return-object p0
.end method

.method static synthetic access$500(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Ljava/util/ArrayList;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorSets:Ljava/util/ArrayList;

    return-object p0
.end method

.method public static synthetic lambda$startEditPageEnterAnimator$61(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;ILandroid/animation/ValueAnimator;)V
    .locals 2

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->isMenuExpand()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    sub-int v1, p2, p1

    invoke-virtual {v0, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getCommonChangeLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    sub-int/2addr p2, p1

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startEditPageExitAnimator$68(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;IIILandroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p4}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/Integer;

    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    move-result p4

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getCommonChangeLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p4}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->isMenuExpand()Z

    move-result v0

    if-eqz v0, :cond_0

    sub-int/2addr p1, p4

    iget-object p4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {p4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuBottomLine()Landroid/support/constraint/Guideline;

    move-result-object p4

    sub-int/2addr p2, p1

    invoke-virtual {p4, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {p2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuTopLine()Landroid/support/constraint/Guideline;

    move-result-object p2

    sub-int/2addr p3, p1

    invoke-virtual {p2, p3}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    :cond_0
    return-void
.end method

.method public static synthetic lambda$startLongCropEditPageEnterAnimator$62(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getScreenEditorBgView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public static synthetic lambda$startMenuAnimator$66(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;ILandroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    add-int/2addr p2, p1

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startMenuAnimator$67(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;ILandroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    sub-int/2addr p2, p1

    invoke-virtual {v0, p2}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageEnterAnimator$57(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageEnterAnimator$58(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageEnterAnimator$59(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getCommonChangeLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageEnterAnimator$60(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getScreenEditorBgView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageExitAnimator$63(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineBegin(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageExitAnimator$64(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method public static synthetic lambda$startSharePageExitAnimator$65(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getCommonChangeLine()Landroid/support/constraint/Guideline;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    return-void
.end method

.method private setThumbnailRect([I)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    if-eqz p1, :cond_0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mThumbnailRect:[I

    aget v2, p1, v0

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private startQuitThumbnailService()V
    .locals 3

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    if-eqz v0, :cond_0

    const-string v0, "ScreenAnimatorHelper"

    const-string v1, "start ScreenShotService."

    invoke-static {v0, v1}, Lcom/miui/gallery/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    const-class v2, Lcom/miui/gallery/editor/photo/screen/home/ScreenShotService;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "quit_thumnail"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method


# virtual methods
.method public release()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorSets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/AnimatorSet;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->cancel()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public varargs setViewsAlpha(F[Landroid/view/View;)V
    .locals 3

    array-length v0, p2

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p2, v1

    invoke-virtual {v2, p1}, Landroid/view/View;->setAlpha(F)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public startEditPageEnterAnimator()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v1, 0x7f0603f3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v2, 0x7f0603f1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    sub-int v1, v0, v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0603ee

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iput v3, v2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->height:I

    const v3, 0x7f0900a9

    iput v3, v2, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v2, 0x2

    new-array v3, v2, [I

    const/4 v4, 0x0

    aput v4, v3, v4

    const/4 v5, 0x1

    aput v0, v3, v5

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    const-wide/16 v6, 0x172

    invoke-virtual {v0, v6, v7}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v3, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v3, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$Gi6eVAPIj3jwNDtWrnTJhInop8A;

    invoke-direct {v3, p0, v1}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$Gi6eVAPIj3jwNDtWrnTJhInop8A;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;I)V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-string v1, "alpha"

    new-array v2, v2, [F

    fill-array-data v2, :array_0

    invoke-static {v1, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getEditTopView()Landroid/view/View;

    move-result-object v2

    new-array v3, v5, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v2, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startEditPageExitAnimator(Landroid/animation/Animator$AnimatorListener;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0603ee

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getCommonChangeLine()Landroid/support/constraint/Guideline;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    const v2, 0x7f0603f3

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    const v3, 0x7f0603f1

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v3

    check-cast v3, Landroid/support/constraint/ConstraintLayout$LayoutParams;

    const v4, 0x7f0900a9

    iput v4, v3, Landroid/support/constraint/ConstraintLayout$LayoutParams;->topToBottom:I

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v4

    invoke-virtual {v4, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v3, 0x2

    new-array v4, v3, [I

    const/4 v5, 0x0

    aput v1, v4, v5

    sub-int v6, v0, v2

    const/4 v7, 0x1

    aput v6, v4, v7

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    const-wide/16 v8, 0xb4

    invoke-virtual {v4, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v6, Lmiui/view/animation/QuarticEaseInInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/QuarticEaseInInterpolator;-><init>()V

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v6, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;

    invoke-direct {v6, p0, v1, v0, v2}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$ahzuG8tb6RCh_Xk8CzTk7NQ5Io4;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;III)V

    invoke-virtual {v4, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v4, p1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-string p1, "alpha"

    new-array v0, v3, [F

    fill-array-data v0, :array_0

    invoke-static {p1, v0}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getEditTopView()Landroid/view/View;

    move-result-object v0

    new-array v1, v7, [Landroid/animation/PropertyValuesHolder;

    aput-object p1, v1, v5

    invoke-static {v0, v1}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v0, 0x172

    invoke-virtual {p1, v0, v1}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v0, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v0, v4}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$10;

    invoke-direct {p1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$10;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public startEnterAnimator()V
    .locals 12

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    const-string v1, "alpha"

    const/4 v2, 0x2

    new-array v3, v2, [F

    fill-array-data v3, :array_0

    invoke-static {v1, v3}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v1

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->isSharePage()Z

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopView()Landroid/view/View;

    move-result-object v3

    goto :goto_0

    :cond_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getEditTopView()Landroid/view/View;

    move-result-object v3

    :goto_0
    const/4 v4, 0x1

    new-array v5, v4, [Landroid/animation/PropertyValuesHolder;

    const/4 v6, 0x0

    aput-object v1, v5, v6

    invoke-static {v3, v5}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v3

    const-wide/16 v7, 0x1f4

    invoke-virtual {v3, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v5, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v5}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v3, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v5}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getScreenEditorBgView()Landroid/view/View;

    move-result-object v5

    new-array v9, v4, [Landroid/animation/PropertyValuesHolder;

    aput-object v1, v9, v6

    invoke-static {v5, v9}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v5

    invoke-virtual {v5, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v9, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v9}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v5, v9}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-string v9, "translationY"

    new-array v10, v2, [F

    iget-object v11, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v11}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v11

    invoke-virtual {v11}, Landroid/view/View;->getHeight()I

    move-result v11

    int-to-float v11, v11

    aput v11, v10, v6

    const/4 v11, 0x0

    aput v11, v10, v4

    invoke-static {v9, v10}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v9

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v10}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v10

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v9, v2, v6

    aput-object v1, v2, v4

    invoke-static {v10, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    const-wide/16 v9, 0x96

    invoke-virtual {v1, v9, v10}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    invoke-virtual {v1, v7, v8}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v2, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$3;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$3;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startLongCropEditPageEnterAnimator()V
    .locals 11

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->configEditModeView()V

    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    invoke-static {v0, v2}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getScreenEditorBgView()Landroid/view/View;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Landroid/animation/PropertyValuesHolder;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    invoke-static {v2, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    const-wide/16 v6, 0x1f4

    invoke-virtual {v2, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v4, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v2, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v4}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getEditTopView()Landroid/view/View;

    move-result-object v4

    new-array v8, v3, [Landroid/animation/PropertyValuesHolder;

    aput-object v0, v8, v5

    invoke-static {v4, v8}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v4

    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v8, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v8}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v4, v8}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    const-string v8, "translationY"

    new-array v9, v1, [F

    iget-object v10, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v10}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v10

    invoke-virtual {v10}, Landroid/view/View;->getHeight()I

    move-result v10

    int-to-float v10, v10

    aput v10, v9, v5

    const/4 v10, 0x0

    aput v10, v9, v3

    invoke-static {v8, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v8

    iget-object v9, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v9}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getBottomLayoutView()Landroid/view/View;

    move-result-object v9

    new-array v10, v1, [Landroid/animation/PropertyValuesHolder;

    aput-object v8, v10, v5

    aput-object v0, v10, v3

    invoke-static {v9, v10}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    const-wide/16 v8, 0xfa

    invoke-virtual {v0, v8, v9}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    invoke-virtual {v0, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v6, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v6}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v6, Lcom/miui/gallery/editor/photo/screen/home/ScreenArgbEvaluator;

    invoke-direct {v6}, Lcom/miui/gallery/editor/photo/screen/home/ScreenArgbEvaluator;-><init>()V

    new-array v1, v1, [Ljava/lang/Object;

    iget v7, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->SHARE_BG_COLOR:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v1, v5

    iget v5, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->EDIT_BG_COLOR:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v3

    invoke-static {v6, v1}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v1

    const-wide/16 v5, 0x172

    invoke-virtual {v1, v5, v6}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v3, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v3, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$YcOJFr9rPw6cOphNLi-2EfrVh3Y;

    invoke-direct {v3, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$YcOJFr9rPw6cOphNLi-2EfrVh3Y;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v1, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v3, Landroid/animation/AnimatorSet;

    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v3, v2}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$6;

    invoke-direct {v0, p0, v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$6;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startMenuAnimator(Z)V
    .locals 6

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0603f3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    const v2, 0x7f0603f1

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    sub-int v2, v1, v0

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuBottomLine()Landroid/support/constraint/Guideline;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v3}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuTopLine()Landroid/support/constraint/Guideline;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/support/constraint/Guideline;->setGuidelineEnd(I)V

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz p1, :cond_0

    new-array p1, v5, [I

    sub-int v1, v0, v2

    aput v1, p1, v4

    aput v0, p1, v3

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$U-qiJo4JXHLq4UX16Iit-CtDp_c;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$U-qiJo4JXHLq4UX16Iit-CtDp_c;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;I)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$8;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$8;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    const-wide/16 v0, 0x10e

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v0, Lmiui/view/animation/QuarticEaseOutInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseOutInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    goto :goto_0

    :cond_0
    new-array p1, v5, [I

    aput v1, p1, v4

    aput v0, p1, v3

    invoke-static {p1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p1

    const-wide/16 v0, 0x78

    invoke-virtual {p1, v0, v1}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v0, Lmiui/view/animation/QuarticEaseInInterpolator;

    invoke-direct {v0}, Lmiui/view/animation/QuarticEaseInInterpolator;-><init>()V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$eRzx9gia21WBAzxvO2gBThsIJa4;

    invoke-direct {v0, p0, v2}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$eRzx9gia21WBAzxvO2gBThsIJa4;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;I)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$9;

    invoke-direct {v0, p0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$9;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {p1, v0}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :goto_0
    return-void
.end method

.method public startSharePageEnterAnimator()V
    .locals 12

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v1}, Lcom/android/internal/WindowCompat;->getTopNotchHeight(Landroid/app/Activity;)I

    move-result v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f060404

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v5, 0x7f0603fe

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f0603dd

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v7, 0x7f06040b

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    add-int/2addr v6, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v7, 0x7f06028e

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    add-int/2addr v6, v1

    iget-object v1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v7, 0x7f0603ee

    invoke-virtual {v1, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v8, 0x7f06040d

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v7

    add-int/2addr v1, v7

    const/16 v7, 0x1c2

    const/4 v8, 0x2

    new-array v9, v8, [I

    aput v6, v9, v2

    const/4 v6, 0x1

    aput v3, v9, v6

    invoke-static {v9}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v3

    int-to-long v9, v7

    invoke-virtual {v3, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v7, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v7}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v3, v7}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v7, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$5QMYAgdpqawlpK7Qmd9blFznuU0;

    invoke-direct {v7, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$5QMYAgdpqawlpK7Qmd9blFznuU0;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v3, v7}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-array v7, v8, [I

    aput v1, v7, v2

    aput v4, v7, v6

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v1

    invoke-virtual {v1, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v4, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v4, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$n6oiD7VPgmQTSdQ2n7JCWTo44a4;

    invoke-direct {v4, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$n6oiD7VPgmQTSdQ2n7JCWTo44a4;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v1, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-array v4, v8, [I

    aput v2, v4, v2

    aput v5, v4, v6

    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    invoke-virtual {v4, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v5, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v5}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v5, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$A1g6uZlV0nT9JI2B81YgEwlqp4A;

    invoke-direct {v5, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$A1g6uZlV0nT9JI2B81YgEwlqp4A;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-string v5, "alpha"

    new-array v7, v8, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    iget-object v7, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v7}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopView()Landroid/view/View;

    move-result-object v7

    new-array v9, v6, [Landroid/animation/PropertyValuesHolder;

    aput-object v5, v9, v2

    invoke-static {v7, v9}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v5

    const-wide/16 v9, 0x172

    invoke-virtual {v5, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v7, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v7}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v5, v7}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v7, Lcom/miui/gallery/editor/photo/screen/home/ScreenArgbEvaluator;

    invoke-direct {v7}, Lcom/miui/gallery/editor/photo/screen/home/ScreenArgbEvaluator;-><init>()V

    new-array v8, v8, [Ljava/lang/Object;

    iget v11, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->EDIT_BG_COLOR:I

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v8, v2

    iget v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->SHARE_BG_COLOR:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v8, v6

    invoke-static {v7, v8}, Landroid/animation/ValueAnimator;->ofObject(Landroid/animation/TypeEvaluator;[Ljava/lang/Object;)Landroid/animation/ValueAnimator;

    move-result-object v2

    invoke-virtual {v2, v9, v10}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v6, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v6, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$tntDmh7P-Wx7DkOkqGj6BRj_OC0;

    invoke-direct {v6, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$tntDmh7P-Wx7DkOkqGj6BRj_OC0;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v2, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v3

    invoke-virtual {v3, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    new-instance v1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$4;

    invoke-direct {v1, p0, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$4;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public startSharePageExitAnimator(Landroid/animation/Animator$AnimatorListener;)V
    .locals 10

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/android/internal/WindowCompat;->isNotch(Landroid/app/Activity;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mActivity:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditorActivity;

    invoke-static {v0}, Lcom/android/internal/WindowCompat;->getTopNotchHeight(Landroid/app/Activity;)I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iget-object v2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v3, 0x7f060404

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v4, 0x7f0603fe

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v5, 0x7f0603dd

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f06040b

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    add-int/2addr v5, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f06028e

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v5, v0

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v6, 0x7f0603ee

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mResources:Landroid/content/res/Resources;

    const v7, 0x7f06040d

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v6

    add-int/2addr v0, v6

    const/16 v6, 0x1c2

    const/4 v7, 0x2

    new-array v8, v7, [I

    aput v2, v8, v1

    const/4 v2, 0x1

    aput v5, v8, v2

    invoke-static {v8}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v5

    int-to-long v8, v6

    invoke-virtual {v5, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v6, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v6}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v6, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$IYbdjUrNSZaZRJJyD9N3E1xOKmk;

    invoke-direct {v6, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$IYbdjUrNSZaZRJJyD9N3E1xOKmk;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v5, v6}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-array v6, v7, [I

    aput v3, v6, v1

    aput v0, v6, v2

    invoke-static {v6}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    invoke-virtual {v0, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v3, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v3}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v3, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$99I80rB_IMUE2kRulq5lisHkBKE;

    invoke-direct {v3, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$99I80rB_IMUE2kRulq5lisHkBKE;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v0, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-array v3, v7, [I

    aput v4, v3, v1

    aput v1, v3, v2

    invoke-static {v3}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v3

    invoke-virtual {v3, v8, v9}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-instance v4, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v4, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$T7PfEp6Lz00UcZwXdE0vikzd2Q0;

    invoke-direct {v4, p0}, Lcom/miui/gallery/editor/photo/screen/home/-$$Lambda$ScreenAnimatorHelper$T7PfEp6Lz00UcZwXdE0vikzd2Q0;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V

    invoke-virtual {v3, v4}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    const-string v4, "alpha"

    new-array v6, v7, [F

    fill-array-data v6, :array_0

    invoke-static {v4, v6}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v4

    iget-object v6, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->mAnimatorViewCallback:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    invoke-interface {v6}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getShareTopView()Landroid/view/View;

    move-result-object v6

    new-array v2, v2, [Landroid/animation/PropertyValuesHolder;

    aput-object v4, v2, v1

    invoke-static {v6, v2}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v2, Lmiui/view/animation/QuarticEaseInOutInterpolator;

    invoke-direct {v2}, Lmiui/view/animation/QuarticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    new-instance v2, Landroid/animation/AnimatorSet;

    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    invoke-virtual {v2, v5}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v4

    invoke-virtual {v4, v0}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    invoke-virtual {v2, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    new-instance p1, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$7;

    invoke-direct {p1, p0, v2}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$7;-><init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V

    invoke-virtual {v2, p1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    return-void

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
