.class Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow$1;
.super Ljava/lang/Object;
.source "PaintSizePopupWindow.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;


# direct methods
.method constructor <init>(Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;)V
    .locals 0

    iput-object p1, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow$1;->this$0:Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;

    invoke-virtual {v0}, Lcom/miui/gallery/editor/photo/widgets/PaintSizePopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/view/View;->setAlpha(F)V

    return-void
.end method
