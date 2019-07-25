.class Lcom/miui/gallery/search/transitions/ChangeImage$1;
.super Ljava/lang/Object;
.source "ChangeImage.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miui/gallery/search/transitions/ChangeImage;->createAnimator(Landroid/view/ViewGroup;Landroid/transition/TransitionValues;Landroid/transition/TransitionValues;)Landroid/animation/Animator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/search/transitions/ChangeImage;

.field final synthetic val$endDrawable:Landroid/graphics/drawable/Drawable;

.field final synthetic val$startDrawable:Landroid/graphics/drawable/Drawable;

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/miui/gallery/search/transitions/ChangeImage;Landroid/view/View;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->this$0:Lcom/miui/gallery/search/transitions/ChangeImage;

    iput-object p2, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    iput-object p3, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$endDrawable:Landroid/graphics/drawable/Drawable;

    iput-object p4, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$startDrawable:Landroid/graphics/drawable/Drawable;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_3

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    instance-of v0, v0, Landroid/widget/ImageView;

    const-wide/high16 v1, 0x3fe0000000000000L    # 0.5

    if-eqz v0, :cond_1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    float-to-double v3, p1

    cmpl-double p1, v3, v1

    if-lez p1, :cond_0

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$endDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_0
    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    check-cast p1, Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$startDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_1
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    float-to-double v3, p1

    cmpl-double p1, v3, v1

    if-lez p1, :cond_2

    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$endDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_0

    :cond_2
    iget-object p1, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$view:Landroid/view/View;

    iget-object v0, p0, Lcom/miui/gallery/search/transitions/ChangeImage$1;->val$startDrawable:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :cond_3
    :goto_0
    return-void
.end method
