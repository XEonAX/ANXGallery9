.class Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;
.super Ljava/lang/Object;
.source "SlideShowHeaderView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 7

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$000(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-virtual {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$100(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$002(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;Z)Z

    iget-object v1, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v1}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$100(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    iget-object v2, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v2}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$200(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Lcom/miui/gallery/widget/SlideShowView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/miui/gallery/widget/SlideShowView;->getMeasuredWidth()I

    move-result v2

    iget-object v3, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v3}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$200(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Lcom/miui/gallery/widget/SlideShowView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/miui/gallery/widget/SlideShowView;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-virtual {v4}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f0604a2

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    new-instance v5, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v6, -0x2

    invoke-direct {v5, v6, v6}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    sub-int/2addr v2, v1

    sub-int/2addr v2, v4

    sub-int/2addr v3, v0

    sub-int/2addr v3, v4

    const/4 v0, 0x0

    invoke-virtual {v5, v2, v3, v0, v0}, Landroid/widget/RelativeLayout$LayoutParams;->setMargins(IIII)V

    iget-object v0, p0, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView$1;->this$0:Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;

    invoke-static {v0}, Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;->access$100(Lcom/miui/gallery/card/ui/detail/SlideShowHeaderView;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_1
    return-void
.end method
