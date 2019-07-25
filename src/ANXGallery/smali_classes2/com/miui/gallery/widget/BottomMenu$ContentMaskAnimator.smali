.class public Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;
.super Ljava/lang/Object;
.source "BottomMenu.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/BottomMenu;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "ContentMaskAnimator"
.end annotation


# instance fields
.field private mHideAnimator:Landroid/animation/ObjectAnimator;

.field private mOnClickListener:Landroid/view/View$OnClickListener;

.field private mShowAnimator:Landroid/animation/ObjectAnimator;

.field final synthetic this$0:Lcom/miui/gallery/widget/BottomMenu;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/BottomMenu;Landroid/view/View$OnClickListener;)V
    .locals 3

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p2

    const-string v0, "alpha"

    const/4 v1, 0x2

    new-array v2, v1, [F

    fill-array-data v2, :array_0

    invoke-static {p2, v0, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    iput-object p2, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mShowAnimator:Landroid/animation/ObjectAnimator;

    iget-object p2, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mShowAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p2, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    const-string p2, "alpha"

    new-array v0, v1, [F

    fill-array-data v0, :array_1

    invoke-static {p1, p2, v0}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    iput-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mHideAnimator:Landroid/animation/ObjectAnimator;

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mHideAnimator:Landroid/animation/ObjectAnimator;

    invoke-virtual {p1, p0}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void

    nop

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

.method synthetic constructor <init>(Lcom/miui/gallery/widget/BottomMenu;Landroid/view/View$OnClickListener;Lcom/miui/gallery/widget/BottomMenu$1;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;-><init>(Lcom/miui/gallery/widget/BottomMenu;Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public hide()Landroid/animation/Animator;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mHideAnimator:Landroid/animation/ObjectAnimator;

    return-object v0
.end method

.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mHideAnimator:Landroid/animation/ObjectAnimator;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$100(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/ActionMenuView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->bringToFront()V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    move-result p1

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$100(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/ActionMenuView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->bringToFront()V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mShowAnimator:Landroid/animation/ObjectAnimator;

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->bringToFront()V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$100(Lcom/miui/gallery/widget/BottomMenu;)Lcom/miui/gallery/view/menu/ActionMenuView;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/view/menu/ActionMenuView;->bringToFront()V

    iget-object p1, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->this$0:Lcom/miui/gallery/widget/BottomMenu;

    invoke-static {p1}, Lcom/miui/gallery/widget/BottomMenu;->access$300(Lcom/miui/gallery/widget/BottomMenu;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mOnClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public show()Landroid/animation/Animator;
    .locals 1

    iget-object v0, p0, Lcom/miui/gallery/widget/BottomMenu$ContentMaskAnimator;->mShowAnimator:Landroid/animation/ObjectAnimator;

    return-object v0
.end method
