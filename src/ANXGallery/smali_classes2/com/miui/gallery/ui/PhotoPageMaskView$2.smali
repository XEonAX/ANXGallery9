.class Lcom/miui/gallery/ui/PhotoPageMaskView$2;
.super Ljava/lang/Object;
.source "PhotoPageMaskView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/ui/PhotoPageMaskView;->setActionBarMaskVisible(ZZ)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/ui/PhotoPageMaskView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 6

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$500(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/high16 v1, 0x437f0000    # 255.0f

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$500(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$600(Lcom/miui/gallery/ui/PhotoPageMaskView;)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, v2

    int-to-float v4, p1

    mul-float v0, v0, v4

    div-float/2addr v0, v1

    float-to-int v0, v0

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v4}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$500(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v4

    iget-object v5, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v5}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v5

    invoke-virtual {v4, v3, v3, v5, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v4, v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$702(Lcom/miui/gallery/ui/PhotoPageMaskView;I)I

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$800(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$800(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$900(Lcom/miui/gallery/ui/PhotoPageMaskView;)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, v2

    int-to-float p1, p1

    mul-float v0, v0, p1

    div-float/2addr v0, v1

    float-to-int p1, v0

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-static {v0}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$800(Lcom/miui/gallery/ui/PhotoPageMaskView;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v1

    sub-int/2addr v1, p1

    iget-object v2, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v2}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getWidth()I

    move-result v2

    iget-object v4, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v4}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v4

    invoke-virtual {v0, v3, v1, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    iget-object v1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->getHeight()I

    move-result v1

    sub-int/2addr v1, p1

    invoke-static {v0, v1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->access$1002(Lcom/miui/gallery/ui/PhotoPageMaskView;I)I

    :cond_1
    iget-object p1, p0, Lcom/miui/gallery/ui/PhotoPageMaskView$2;->this$0:Lcom/miui/gallery/ui/PhotoPageMaskView;

    invoke-virtual {p1}, Lcom/miui/gallery/ui/PhotoPageMaskView;->invalidate()V

    return-void
.end method
