.class Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScreenAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->startEditPageEnterAnimator()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

.field final synthetic val$animatorSet:Landroid/animation/AnimatorSet;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;Landroid/animation/AnimatorSet;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$500(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;->access$500(Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenAnimatorHelper$5;->val$animatorSet:Landroid/animation/AnimatorSet;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method
