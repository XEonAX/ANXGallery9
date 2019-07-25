.class Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;
.super Landroid/view/animation/AlphaAnimation;
.source "SlideShowView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/widget/SlideShowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "FloatAnimation"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/widget/SlideShowView;


# direct methods
.method constructor <init>(Lcom/miui/gallery/widget/SlideShowView;FFJ)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;->this$0:Lcom/miui/gallery/widget/SlideShowView;

    invoke-direct {p0, p2, p3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    invoke-virtual {p0, p4, p5}, Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;->setDuration(J)V

    new-instance p1, Landroid/view/animation/LinearInterpolator;

    invoke-direct {p1}, Landroid/view/animation/LinearInterpolator;-><init>()V

    invoke-virtual {p0, p1}, Lcom/miui/gallery/widget/SlideShowView$FloatAnimation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    return-void
.end method
