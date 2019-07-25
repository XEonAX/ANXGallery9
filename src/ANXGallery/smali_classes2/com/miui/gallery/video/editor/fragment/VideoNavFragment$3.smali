.class Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$3;
.super Ljava/lang/Object;
.source "VideoNavFragment.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;->onCreateAnimator(IZI)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;


# direct methods
.method constructor <init>(Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;->getView()Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment$3;->this$0:Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;

    invoke-virtual {p1}, Lcom/miui/gallery/video/editor/fragment/VideoNavFragment;->getView()Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
