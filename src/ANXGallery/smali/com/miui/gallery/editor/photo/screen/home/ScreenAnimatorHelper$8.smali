.class Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$8;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScreenAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startMenuAnimator(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$8;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$8;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$100(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;

    move-result-object p1

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$AnimatorViewCallback;->getMenuLayoutView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method
