.class Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;
.super Ljava/lang/Object;
.source "FastScroller.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/recyclerview/FastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AnimatorUpdater"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;


# direct methods
.method private constructor <init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;Lcom/miui/gallery/widget/recyclerview/FastScroller$1;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;-><init>(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 5

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float v0, v0, p1

    float-to-int v0, v0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$600(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z

    move-result v1

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$700(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$700(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    :cond_0
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$800(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$800(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_1
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    sub-float v3, v2, p1

    iget-object v4, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v4}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1000(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I

    move-result v4

    int-to-float v4, v4

    mul-float v3, v3, v4

    float-to-int v3, v3

    invoke-static {v1, v3}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$902(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1100(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    iget-object v3, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v3}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$900(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I

    move-result v3

    neg-int v3, v3

    invoke-static {v1, v3}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$902(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I

    :cond_2
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1200(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Z

    move-result v1

    if-eqz v1, :cond_5

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1300(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    if-eqz v1, :cond_3

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1300(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    :cond_3
    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1400(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    if-eqz v1, :cond_4

    iget-object v1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {v1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1400(Lcom/miui/gallery/widget/recyclerview/FastScroller;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    :cond_4
    iget-object v0, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    sub-float/2addr v2, p1

    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1600(Lcom/miui/gallery/widget/recyclerview/FastScroller;)I

    move-result p1

    int-to-float p1, p1

    mul-float v2, v2, p1

    float-to-int p1, v2

    invoke-static {v0, p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$1502(Lcom/miui/gallery/widget/recyclerview/FastScroller;I)I

    :cond_5
    iget-object p1, p0, Lcom/miui/gallery/widget/recyclerview/FastScroller$AnimatorUpdater;->this$0:Lcom/miui/gallery/widget/recyclerview/FastScroller;

    invoke-static {p1}, Lcom/miui/gallery/widget/recyclerview/FastScroller;->access$500(Lcom/miui/gallery/widget/recyclerview/FastScroller;)V

    return-void
.end method
