.class Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;
.super Ljava/lang/Object;
.source "PhoneActionMenuView.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/view/menu/PhoneActionMenuView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverflowMenuViewAnimator"
.end annotation


# instance fields
.field private mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

.field private mCollapseAnimator:Landroid/animation/AnimatorSet;

.field private mExpandAnimator:Landroid/animation/AnimatorSet;

.field final synthetic this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/view/menu/PhoneActionMenuView;Lcom/miui/gallery/view/menu/PhoneActionMenuView$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;-><init>(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)V

    return-void
.end method

.method private setContentViewImportantForAccessibility(Z)V
    .locals 0

    return-void
.end method


# virtual methods
.method public ensureAnimators()V
    .locals 8

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/gallery/view/menu/BottomMenuBarUtils;->findBottomMenuBar(Landroid/view/View;)Lcom/miui/gallery/widget/BottomMenu;

    move-result-object v0

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    const-string v2, "Value"

    const/4 v3, 0x2

    new-array v4, v3, [F

    fill-array-data v4, :array_0

    invoke-static {v1, v2, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-array v2, v3, [Landroid/animation/Animator;

    const/4 v4, 0x0

    aput-object v1, v2, v4

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    invoke-virtual {v1, p0}, Lcom/miui/gallery/widget/BottomMenu;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->show()Landroid/animation/Animator;

    move-result-object v1

    const/4 v5, 0x1

    aput-object v1, v2, v5

    invoke-virtual {v0, v2}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const/high16 v2, 0x10e0000

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v6, v1

    invoke-virtual {v0, v6, v7}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    const-string v6, "Value"

    new-array v7, v3, [F

    fill-array-data v7, :array_1

    invoke-static {v1, v6, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v1

    new-array v3, v3, [Landroid/animation/Animator;

    aput-object v1, v3, v4

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mBottomMenu:Lcom/miui/gallery/widget/BottomMenu;

    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Lcom/miui/gallery/widget/BottomMenu;->getContentMaskAnimator(Landroid/view/View$OnClickListener;)Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;

    move-result-object v1

    invoke-virtual {v1}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->hide()Landroid/animation/Animator;

    move-result-object v1

    aput-object v1, v3, v5

    invoke-virtual {v0, v3}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    new-instance v1, Lmiui/view/animation/CubicEaseOutInterpolator;

    invoke-direct {v1}, Lmiui/view/animation/CubicEaseOutInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    invoke-virtual {v0, p0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iput-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    :cond_0
    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public hide()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->ensureAnimators()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanding:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq p1, v0, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsing:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-eq p1, v0, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne p1, v0, :cond_3

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setValue(F)V

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->setContentViewImportantForAccessibility(Z)V

    goto :goto_1

    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->setValue(F)V

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->setContentViewImportantForAccessibility(Z)V

    :cond_3
    :goto_1
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$100(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$100(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-static {p1, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$202(Lcom/miui/gallery/view/menu/PhoneActionMenuView;Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->setContentViewImportantForAccessibility(Z)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$100(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getMeasuredHeight()I

    move-result v0

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Collapsed:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    invoke-static {p1, v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$202(Lcom/miui/gallery/view/menu/PhoneActionMenuView;Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    const/4 p1, 0x1

    invoke-direct {p0, p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->setContentViewImportantForAccessibility(Z)V

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$400(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {v0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$300(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->postInvalidateOnAnimation()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-static {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->access$200(Lcom/miui/gallery/view/menu/PhoneActionMenuView;)Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    move-result-object p1

    sget-object v0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;->Expanded:Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuState;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->this$0:Lcom/miui/gallery/view/menu/PhoneActionMenuView;

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/PhoneActionMenuView;->getPresenter()Lcom/miui/gallery/view/menu/ActionMenuPresenter;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/view/menu/ActionMenuPresenter;->hideOverflowMenu(Z)Z

    :cond_0
    return-void
.end method

.method public reverse()V
    .locals 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_1

    :try_start_0
    const-string v0, "android.animation.AnimatorSet"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "reverse"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    const-string v1, "PhoneActionMenuView"

    const-string v2, "reverse: "

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    :cond_1
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v0

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->getChildAnimations()Ljava/util/ArrayList;

    move-result-object v0

    :cond_3
    if-nez v0, :cond_4

    return-void

    :cond_4
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/animation/Animator;

    check-cast v1, Landroid/animation/ValueAnimator;

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->reverse()V

    goto :goto_0

    :cond_5
    :goto_1
    return-void
.end method

.method public show()V
    .locals 1

    invoke-virtual {p0}, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->ensureAnimators()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mCollapseAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->cancel()V

    iget-object v0, p0, Lcom/miui/gallery/view/menu/PhoneActionMenuView$OverflowMenuViewAnimator;->mExpandAnimator:Landroid/animation/AnimatorSet;

    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->start()V

    return-void
.end method
