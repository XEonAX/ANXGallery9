.class Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ScreenEditViewAnimatorHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->animatorStart(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

.field final synthetic val$callback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    iput-object p2, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->val$callback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_END:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->access$002(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->val$callback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;->onInvalidate()V

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->this$0:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;

    sget-object v0, Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;->ANIMATOR_START:Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    invoke-static {p1, v0}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;->access$002(Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper;Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;)Lcom/miui/gallery/editor/photo/screen/home/AnimatorState;

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$1;->val$callback:Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;

    invoke-interface {p1}, Lcom/miui/gallery/editor/photo/screen/home/ScreenEditViewAnimatorHelper$Callback;->onAnimationStart()V

    return-void
.end method
