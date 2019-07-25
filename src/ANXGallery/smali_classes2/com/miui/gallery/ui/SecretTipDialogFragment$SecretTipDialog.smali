.class Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;
.super Landroid/app/Dialog;
.source "SecretTipDialogFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/ui/SecretTipDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SecretTipDialog"
.end annotation


# instance fields
.field private mAnimationCanceled:Z

.field private mAnimatorSet:Landroid/animation/AnimatorSet;

.field private mContentContainer:Landroid/view/View;

.field private mContentPaddingUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

.field private mPositiveBtn:Landroid/widget/Button;

.field private mPositiveListener:Landroid/view/View$OnClickListener;

.field private mPressIndicator:Landroid/view/View;

.field final synthetic this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;


# direct methods
.method public constructor <init>(Lcom/miui/gallery/ui/SecretTipDialogFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-direct {p0, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x0

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimationCanceled:Z

    new-instance p1, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$2;

    invoke-direct {p1, p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$2;-><init>(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)V

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mContentPaddingUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    return-void
.end method

.method static synthetic access$200(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)Z
    .locals 0

    iget-boolean p0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimationCanceled:Z

    return p0
.end method

.method static synthetic access$202(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;Z)Z
    .locals 0

    iput-boolean p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimationCanceled:Z

    return p1
.end method

.method static synthetic access$300(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mContentContainer:Landroid/view/View;

    return-object p0
.end method

.method private loadAnimator()Landroid/animation/AnimatorSet;
    .locals 13

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/4 v1, 0x1

    const v2, 0x7f080003

    invoke-virtual {v0, v2, v1, v1}, Landroid/content/res/Resources;->getFraction(III)F

    move-result v0

    iget-object v2, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPressIndicator:Landroid/view/View;

    const/4 v3, 0x3

    new-array v4, v3, [Landroid/animation/PropertyValuesHolder;

    const-string v5, "scaleX"

    const/4 v6, 0x2

    new-array v7, v6, [F

    const/4 v8, 0x0

    aput v0, v7, v8

    const/high16 v9, 0x3f800000    # 1.0f

    aput v9, v7, v1

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    aput-object v5, v4, v8

    const-string v5, "scaleY"

    new-array v7, v6, [F

    aput v0, v7, v8

    aput v9, v7, v1

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    aput-object v5, v4, v1

    const-string v5, "alpha"

    new-array v7, v6, [F

    fill-array-data v7, :array_0

    invoke-static {v5, v7}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v4}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v2

    new-instance v4, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v4}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v2, v4}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v4, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0a0054

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    iget-object v4, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0a0050

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v4

    int-to-long v4, v4

    invoke-virtual {v2, v4, v5}, Landroid/animation/ObjectAnimator;->setStartDelay(J)V

    iget-object v4, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f060443

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v7, 0x7f060445

    invoke-virtual {v5, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v5

    new-array v7, v6, [I

    aput v5, v7, v8

    aput v4, v7, v1

    invoke-static {v7}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v7

    iget-object v10, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mContentPaddingUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v7, v10}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v10, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v10}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v7, v10}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v10, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v10}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0a0051

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    int-to-long v10, v10

    invoke-virtual {v7, v10, v11}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object v10, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v10}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f0a0056

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v10

    int-to-long v10, v10

    invoke-virtual {v7, v10, v11}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    new-array v10, v6, [I

    aput v4, v10, v8

    aput v5, v10, v1

    invoke-static {v10}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mContentPaddingUpdateListener:Landroid/animation/ValueAnimator$AnimatorUpdateListener;

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    new-instance v5, Lmiui/view/animation/QuadraticEaseInOutInterpolator;

    invoke-direct {v5}, Lmiui/view/animation/QuadraticEaseInOutInterpolator;-><init>()V

    invoke-virtual {v4, v5}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v10, 0x7f0a0052

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-long v10, v5

    invoke-virtual {v4, v10, v11}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v10, 0x7f0a0057

    invoke-virtual {v5, v10}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-long v10, v5

    invoke-virtual {v4, v10, v11}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPressIndicator:Landroid/view/View;

    new-array v10, v3, [Landroid/animation/PropertyValuesHolder;

    const-string v11, "scaleX"

    new-array v12, v6, [F

    aput v9, v12, v8

    aput v0, v12, v1

    invoke-static {v11, v12}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v11

    aput-object v11, v10, v8

    const-string v11, "scaleY"

    new-array v12, v6, [F

    aput v9, v12, v8

    aput v0, v12, v1

    invoke-static {v11, v12}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, v10, v1

    const-string v0, "alpha"

    new-array v9, v6, [F

    fill-array-data v9, :array_1

    invoke-static {v0, v9}, Landroid/animation/PropertyValuesHolder;->ofFloat(Ljava/lang/String;[F)Landroid/animation/PropertyValuesHolder;

    move-result-object v0

    aput-object v0, v10, v6

    invoke-static {v5, v10}, Landroid/animation/ObjectAnimator;->ofPropertyValuesHolder(Ljava/lang/Object;[Landroid/animation/PropertyValuesHolder;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    new-instance v5, Lmiui/view/animation/CubicEaseInOutInterpolator;

    invoke-direct {v5}, Lmiui/view/animation/CubicEaseInOutInterpolator;-><init>()V

    invoke-virtual {v0, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    iget-object v5, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v9, 0x7f0a0055

    invoke-virtual {v5, v9}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v5

    int-to-long v9, v5

    invoke-virtual {v0, v9, v10}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    new-instance v5, Landroid/animation/AnimatorSet;

    invoke-direct {v5}, Landroid/animation/AnimatorSet;-><init>()V

    const/4 v9, 0x4

    new-array v9, v9, [Landroid/animation/Animator;

    aput-object v2, v9, v8

    aput-object v7, v9, v1

    aput-object v4, v9, v6

    aput-object v0, v9, v3

    invoke-virtual {v5, v9}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    return-object v5

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    const v1, 0x7f090224

    if-eq v0, v1, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    invoke-interface {v0, p1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    :cond_1
    :goto_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    invoke-super {p0, p1}, Landroid/app/Dialog;->onCreate(Landroid/os/Bundle;)V

    const p1, 0x7f0b014f

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->setContentView(I)V

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->access$000(Lcom/miui/gallery/ui/SecretTipDialogFragment;)Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    move-result-object p1

    const v0, 0x7f0900af

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mContentContainer:Landroid/view/View;

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-static {p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->access$000(Lcom/miui/gallery/ui/SecretTipDialogFragment;)Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;

    move-result-object p1

    const v0, 0x7f090227

    invoke-virtual {p1, v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPressIndicator:Landroid/view/View;

    const p1, 0x7f090224

    invoke-virtual {p0, p1}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPositiveBtn:Landroid/widget/Button;

    iget-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPositiveBtn:Landroid/widget/Button;

    invoke-virtual {p1, p0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    const/16 v1, 0x50

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->gravity:I

    const/4 v1, -0x1

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    const/4 v1, -0x2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {p1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isStarted()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->pause()V

    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isPaused()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->resume()V

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->startAnimation()V

    :goto_0
    return-void
.end method

.method public setPositiveButtonOnClickListener(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mPositiveListener:Landroid/view/View$OnClickListener;

    return-object p0
.end method

.method public startAnimation()V
    .locals 2

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->this$0:Lcom/miui/gallery/ui/SecretTipDialogFragment;

    invoke-virtual {v0}, Lcom/miui/gallery/ui/SecretTipDialogFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-virtual {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->stopAnimation()V

    iget-boolean v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimationCanceled:Z

    if-eqz v0, :cond_1

    return-void

    :cond_1
    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->loadAnimator()Landroid/animation/AnimatorSet;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    :cond_2
    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    new-instance v1, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;

    invoke-direct {v1, p0}, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog$1;-><init>(Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;)V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public stopAnimation()V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/miui/gallery/ui/SecretTipDialogFragment$SecretTipDialog;->mAnimatorSet:Landroid/animation/AnimatorSet;

    :cond_0
    return-void
.end method
