.class Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "CropFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->showAnimator(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

.field final synthetic val$isShow:Z


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;Z)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    iput-boolean p2, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->val$isShow:Z

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationEnd(Landroid/animation/Animator;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->val$isShow:Z

    if-nez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->access$100(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)Landroid/view/View;

    move-result-object p1

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    invoke-super {p0, p1}, Landroid/animation/AnimatorListenerAdapter;->onAnimationStart(Landroid/animation/Animator;)V

    iget-boolean p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->val$isShow:Z

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->access$100(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    iget-object p1, p0, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment$2;->this$0:Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;

    invoke-static {p1}, Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;->access$100(Lcom/miui/gallery/editor/photo/core/imports/crop/CropFragment;)Landroid/view/View;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method
