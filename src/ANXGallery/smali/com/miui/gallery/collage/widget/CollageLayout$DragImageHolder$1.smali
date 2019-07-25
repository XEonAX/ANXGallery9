.class Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;
.super Ljava/lang/Object;
.source "CollageLayout.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->resetBitmapWithAnim()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1400(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->setDrawBitmap(Z)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->release()V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->disableDragMode()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1300(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$1;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object p1

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1300(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/animation/ObjectAnimator;

    move-result-object p1

    invoke-virtual {p1}, Landroid/animation/ObjectAnimator;->cancel()V

    :cond_0
    return-void
.end method
