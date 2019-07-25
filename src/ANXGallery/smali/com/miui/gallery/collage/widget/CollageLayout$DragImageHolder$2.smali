.class Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;
.super Ljava/lang/Object;
.source "CollageLayout.java"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->exchangeBitmapWithAnim(Lcom/miui/gallery/collage/widget/CollageImageView;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

.field final synthetic val$dragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;Lcom/miui/gallery/collage/widget/CollageImageView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    iput-object p2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->val$dragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    invoke-virtual {p0, p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->onAnimationEnd(Landroid/animation/Animator;)V

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 3

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1400(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageImageView;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1800(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1900(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$2000(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetDrawData(Landroid/graphics/Bitmap;IZ)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->val$dragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1800(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1900(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v2

    invoke-static {v2}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$2000(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Z

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/miui/gallery/collage/widget/CollageImageView;->resetDrawData(Landroid/graphics/Bitmap;IZ)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$2100(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;

    move-result-object p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    iget-object p1, p1, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->this$0:Lcom/miui/gallery/collage/widget/CollageLayout;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout;->access$2100(Lcom/miui/gallery/collage/widget/CollageLayout;)Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;

    move-result-object p1

    iget-object v0, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v0

    invoke-static {v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1800(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object v1

    invoke-static {v1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->access$1800(Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-interface {p1, v0, v1}, Lcom/miui/gallery/collage/widget/CollageLayout$BitmapExchangeListener;->onBitmapExchange(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1700(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->release()V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-static {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1200(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;)Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;

    move-result-object p1

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragBitmapItem;->release()V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    invoke-virtual {p1}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->disableDragMode()V

    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->val$dragTargetView:Lcom/miui/gallery/collage/widget/CollageImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/miui/gallery/collage/widget/CollageImageView;->setDrawBitmap(Z)V

    iget-object p1, p0, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder$2;->this$1:Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;

    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;->access$1602(Lcom/miui/gallery/collage/widget/CollageLayout$DragImageHolder;Z)Z

    return-void
.end method
